<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.qydj.YyzzInfo"%>
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
<%@page import="com.macrosoft.icms.system.SysUtility"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="UPLOAD_FILE_ELEC" scope="page"  class="com.macrosoft.icms.util.UPLOAD_FILE_ELEC"/>
<jsp:useBean id="QYDJ_RYXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String name=new String(WEB_USER.doPreProcess(request.getParameter("name")).getBytes("ISO8859_1"),"GBK");
String idnum=WEB_USER.doPreProcess(request.getParameter("idnum"));
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
		UPLOAD_FILE_ELEC.setOPENO(openo);
		UPLOAD_FILE_ELEC.setFILEID(fileid);
		UPLOAD_FILE_ELEC.doSelect();
		String names = UPLOAD_FILE_ELEC.getREMARKS();
		String[] nameStr = names.split(";");
		ArrayList nameList =  new ArrayList();
		for(int j=0;j<nameStr.length;j++){
			nameList.add(nameStr[j]);
		}
		if(nameList.contains(name)) {
			out.print(SysUtility.setAlertGo("对不起，该用户已签名!",""));
			return;
		} else {
			int nLoginCode=0;
			YyzzInfo p=new YyzzInfo();
			
			String ifud=SysUtility.convertCode(request.getParameter("ifud").replaceAll("'",""));
			String mylx=SysUtility.convertCode(request.getParameter("mylx").replaceAll("'",""));
			String zslx=SysUtility.convertCode(request.getParameter("zslx").replaceAll("'",""));
			String hashsf=SysUtility.convertCode(request.getParameter("hashsf").replaceAll("'",""));
			String ztxlh=SysUtility.convertCode(request.getParameter("ztxlh").replaceAll("'",""));
			String sign=SysUtility.convertCode(request.getParameter("sign").replaceAll("'",""));
			String cert=SysUtility.convertCode(request.getParameter("cert").replaceAll("'",""));
			String plainText=SysUtility.convertCode(request.getParameter("plainText").replaceAll("'","")); //原文
			//认证
			//nLoginCode=WEB_USER.validateLogin4(name, idnum, result, issuer, certSn, issuerSn, toSignData,subject);
			//签名
			if(nLoginCode==0) {
			String code = null;
			//验签
			String xml=p.createXml("E0001", cert, plainText, sign);
			code = p.verifySign(xml);
			if("0".equals(code)){
				String sql = "update UPLOAD_FILE_ELEC SET REMARKS = REMARKS || '"+name+";'  WHERE FILEID='"+fileid+"' and OPENO='"+openo+"'";
				UPLOAD_FILE_ELEC.doSql(sql);
			    out.print(SysUtility.setAlertGo("签名成功!",""));
			    ///break;
			 }else{
			    out.print(SysUtility.setAlertGo("签名失败!",""));
			    return;
			}	
		  }else {
			out.print(SysUtility.setAlertScript("认证失败!",""));
			return;
		  }
		}
	}
}
if(!flag) {
	out.print(SysUtility.setAlertScript("对不起，您输入的证件号码不在法定代表人或股东发起人中!",""));
}
%>
<script type="text/javascript"> 
window.location.href="wsdj_fjxx_edit.jsp?openo=<%=openo%>";
</script>
