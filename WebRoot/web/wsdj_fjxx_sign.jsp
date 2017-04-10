<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.qydj.Eid"%>
<%@ page import="java.io.StringReader"%>   
<%@ page import="javax.xml.parsers.DocumentBuilder"%>  
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>   
<%@ page import="org.w3c.dom.Document"%>   
<%@ page import="org.w3c.dom.Element"%>   
<%@ page import="org.w3c.dom.Node"%> 
<%@ page import="org.w3c.dom.NodeList"%>   
<%@ page import="org.xml.sax.InputSource"%>  
<%@ page import="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"%>  
<%@ page import="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"%>  
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="UPLOAD_FILE" scope="page"  class="com.macrosoft.icms.util.UPLOAD_FILE"/>
<jsp:useBean id="QYDJ_RYXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
	<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title></title>
</head>
<body>
<%
	String name=new String(WEB_USER.doPreProcess(request.getParameter("name")).getBytes("ISO8859_1"),"GBK");
	String idnum=WEB_USER.doPreProcess(request.getParameter("cerno"));
	String openo=WEB_USER.doPreProcess(request.getParameter("openo"));
	String fileid=WEB_USER.doPreProcess(request.getParameter("fileid"));
	String pripid=Page.getPRIPID();
	String opetype=Page.getOPETYPE();
	ArrayList list = null;
	
	//验证输入身份号码是否属于法定代表人或股东
 	if("20".equals(opetype)) {
		list = QYDJ_RYXX_SQ.getList("openo='"+openo+"'");
	}else {
		list = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'");
	}
		QYDJ_RYXX_SQ ryxx = new QYDJ_RYXX_SQ();
		QYDJ_RYXX_ZS ryxx1 = new QYDJ_RYXX_ZS();
		Boolean flag = false;
		for(int i=0;i<list.size();i++) {
			String cerno = null;
			if("20".equals(opetype)) {
				ryxx = (QYDJ_RYXX_SQ)list.get(i);
				cerno = ryxx.getCERNO();
			}else {
				ryxx1 = (QYDJ_RYXX_ZS)list.get(i);
				cerno = ryxx1.getCERNO();
			}
			if(idnum.equals(cerno)) {
				flag = true;
				UPLOAD_FILE.setOPENO(openo);
				UPLOAD_FILE.setFILEID(fileid);
				UPLOAD_FILE.doSelect();
				String names = UPLOAD_FILE.getREMARKS();
				if(names.contains(name)) {
					out.print(SysUtility.setAlertScript("对不起，该用户已签名!",""));
				} else {
					int nLoginCode=0;
					Eid p=new Eid();
					String result=SysUtility.convertCode(request.getParameter("result").replaceAll("'",""));
					String issuer=SysUtility.convertCode(request.getParameter("issuer").replaceAll("'",""));
					String certSn=SysUtility.convertCode(request.getParameter("certSn").replaceAll("'",""));
					String issuerSn=SysUtility.convertCode(request.getParameter("issuerSn").replaceAll("'",""));
					String toSignData=SysUtility.convertCode(request.getParameter("toSignData").replaceAll("'",""));
					String subject=SysUtility.convertCode(request.getParameter("subject").replaceAll("'",""));
					//认证
					nLoginCode=WEB_USER.validateLogin4(name, idnum, result, issuer, certSn, issuerSn, toSignData,subject);
					System.out.println(nLoginCode);
					//签名
					if(nLoginCode==1) {
						String code = null;
						String a = p.eIDVerify(issuer, issuerSn, certSn,toSignData,result, "1", "1");
						code = p.parse(a); 
						if("0".equals(code)){
							String sql = "update UPLOAD_FILE SET REMARKS = REMARKS || ' "+name+" ' WHERE FILEID='"+fileid+"' and OPENO='"+openo+"'";
							UPLOAD_FILE.doSql(sql);
					        out.print(SysUtility.setAlertScript("签名成功!","window.parent.close();window.parent.opener.location.reload();"));
					        break;
					     }else{
					     	out.print(SysUtility.setAlertScript("签名失败!",""));
					     }
					}else {
						out.print(SysUtility.setAlertScript("认证失败!",""));
					}
				}
			}
		}
		if(!flag) {
			out.print(SysUtility.setAlertScript("对不起，您输入的证件号码不在法定代表人或股东发起人中!",""));
		}

	/* if(openo.equals("")||fileid.equals(""))
	{
		out.print(SysUtility.setAlertScript("参数错误：访问该页必须指定参数！请不要直接访问该页面！",""));	
	}
	else { */
		
%>

</body>
</html>