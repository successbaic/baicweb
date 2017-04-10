<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.qydj.YyzzInfo"%>
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
<%@ page import="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"%>  
<%@ page import="com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS"%>  
<%@page import="com.macrosoft.icms.system.SysUtility"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="UPLOAD_FILE_ELEC" scope="page"  class="com.macrosoft.icms.util.UPLOAD_FILE_ELEC"/>
<jsp:useBean id="QYDJ_RYXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="QYDJ_CZXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String name=new String(WEB_USER.doPreProcess(request.getParameter("name")).getBytes("ISO8859_1"),"GBK");
String idnum=WEB_USER.doPreProcess(request.getParameter("idnum"));
String openo=WEB_USER.doPreProcess(request.getParameter("openo"));
String fileid=WEB_USER.doPreProcess(request.getParameter("fileid"));
String filedes=WEB_USER.doPreProcess(request.getParameter("filedes"));
String sysCode = WEB_USER.doPreProcess(request.getParameter("sysCode"));
String opetype=WEB_USER.doPreProcess(request.getParameter("opetype"));
String frsign=WEB_USER.doPreProcess(request.getParameter("frsign"));
String gdsign = WEB_USER.doPreProcess(request.getParameter("gdsign"));
String dssign=WEB_USER.doPreProcess(request.getParameter("dssign"));

String pripid=Page.getPRIPID();
//String opetype=Page.getOPETYPE();
ArrayList list = null;
ArrayList list1 = null;
ArrayList list2 = null;
QYDJ_CZXX_SQ czxx = new QYDJ_CZXX_SQ();
QYDJ_CZXX_ZS czxx1= new QYDJ_CZXX_ZS();
QYDJ_RYXX_SQ ryxx = new QYDJ_RYXX_SQ();
QYDJ_RYXX_ZS ryxx1 = new QYDJ_RYXX_ZS();
String cerno = null;
String blicno = null;
ArrayList cernolist =new ArrayList();
ArrayList cernolist1 =new ArrayList();

//法人签名
if("1".equals(frsign)&&!"1".equals(gdsign)&&!"1".equals(dssign)){
	if("20".equals(opetype)) {
		list = QYDJ_RYXX_SQ.getList("openo='"+openo+"'  and lerepsign='1'");
		for(int i=0;i<list.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list.get(i);
			cerno = ryxx.getCERNO();
			cernolist.add(cerno);
		}
	}else {
		list = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'  and lerepsign='1'");
		for(int i=0;i<list.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list.get(i);
			cerno = ryxx1.getCERNO();
			cernolist.add(cerno);
		}
	}
}else if("1".equals(gdsign)&&!"1".equals(frsign)&&!"1".equals(dssign)){//股东签名
	if("20".equals(opetype)) {
		list = QYDJ_CZXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list.size();i++) {
			czxx = (QYDJ_CZXX_SQ)list.get(i);			
			blicno= czxx.getBLICNO();
			cerno = czxx.getCERNO();
			if(!"".equals(blicno)){
			cernolist.add(blicno);
			}
			if(!"".equals(cerno)){
			cernolist.add(cerno);
			}
		}
	}else {
		list = QYDJ_CZXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list.size();i++) {
			czxx1 = (QYDJ_CZXX_ZS)list.get(i);
			blicno= czxx1.getBLICNO();
			cerno = czxx1.getCERNO();
			if(!"".equals(blicno)){
				cernolist.add(blicno);
				}
			if(!"".equals(cerno)){
				cernolist.add(cerno);
			}
		}
	}
}else if("1".equals(dssign)&&!"1".equals(frsign)&&!"1".equals(gdsign)){//董事、监事、法人签名
	if("20".equals(opetype)) {
		list = QYDJ_RYXX_SQ.getList("openo='"+openo+"'  and lerepsign='2'");
		for(int i=0;i<list.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list.get(i);
			cerno = ryxx.getCERNO();
			cernolist.add(cerno);
		}
	}else {
		list = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'  and lerepsign='2'");
		for(int i=0;i<list.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list.get(i);
			cerno = ryxx1.getCERNO();
			cernolist.add(cerno);
		}
	}
}else if("1".equals(frsign)&& "1".equals(dssign)&&!"1".equals(gdsign)){//法人+董事等
	if("20".equals(opetype)) {
		list = QYDJ_RYXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list.get(i);
			cerno = ryxx.getCERNO();
			cernolist.add(cerno);
		}
	}else {
		list = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list.get(i);
			cerno = ryxx1.getCERNO();
			cernolist.add(cerno);
		}
	}
}else if("1".equals(frsign)&& "1".equals(gdsign)&&!"1".equals(dssign)){//法人+股东
	if("20".equals(opetype)) {
		list1 = QYDJ_RYXX_SQ.getList("openo='"+openo+"'  and lerepsign='1'");
		for(int i=0;i<list1.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list1.get(i);
			cerno = ryxx.getCERNO();
			cernolist.add(cerno);
		}
		list2 = QYDJ_CZXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list2.size();i++) {
			czxx = (QYDJ_CZXX_SQ)list2.get(i);
			blicno= czxx.getBLICNO();
			cerno = czxx.getCERNO();
			if(!"".equals(blicno)){
				cernolist1.add(blicno);
				}
			if(!"".equals(cerno)){
				cernolist1.add(cerno);
			}
		}
		cernolist1.removeAll(cernolist);
		cernolist.addAll(cernolist1);
	}else {
		list1 = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'  and lerepsign='1'");
		for(int i=0;i<list1.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list1.get(i);
			cerno = ryxx1.getCERNO();
			cernolist.add(cerno);
		}
		list2 = QYDJ_CZXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list2.size();i++) {
			czxx1 = (QYDJ_CZXX_ZS)list2.get(i);
			blicno= czxx1.getBLICNO();
			cerno = czxx1.getCERNO();
			if(!"".equals(blicno)){
				cernolist1.add(blicno);
				}
			if(!"".equals(cerno)){
				cernolist1.add(cerno);
			}
		}
		cernolist1.removeAll(cernolist);
		cernolist.addAll(cernolist1);
	}
}else if("1".equals(dssign)&& "1".equals(gdsign)&&!"1".equals(frsign)){//股东+董事等
	if("20".equals(opetype)) {
		list1 = QYDJ_RYXX_SQ.getList("openo='"+openo+"'  and lerepsign='2'");
		for(int i=0;i<list1.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list1.get(i);
			cerno = ryxx.getCERNO();
			cernolist.add(cerno);
		}
		list2 = QYDJ_CZXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list2.size();i++) {
			czxx = (QYDJ_CZXX_SQ)list2.get(i);
			blicno= czxx.getBLICNO();
			cerno = czxx.getCERNO();
			if(!"".equals(blicno)){
				cernolist1.add(blicno);
				}
			if(!"".equals(cerno)){
				cernolist1.add(cerno);
			}
		}
		cernolist1.removeAll(cernolist);
		cernolist.addAll(cernolist1);
	}else {
		list1 = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'  and lerepsign='2'");
		for(int i=0;i<list1.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list1.get(i);
			cerno = ryxx1.getCERNO();
			cernolist.add(cerno);
		}
		list2 = QYDJ_CZXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list2.size();i++) {
			czxx1 = (QYDJ_CZXX_ZS)list2.get(i);
			blicno= czxx1.getBLICNO();
			cerno = czxx1.getCERNO();
			if(!"".equals(blicno)){
				cernolist1.add(blicno);
				}
			if(!"".equals(cerno)){
				cernolist1.add(cerno);
			}
		}
		cernolist1.removeAll(cernolist);
		cernolist.addAll(cernolist1);
	}
}else if("1".equals(frsign)&& "1".equals(gdsign)&& "1".equals(dssign)){//法人+股东+董事等
	if("20".equals(opetype)) {
		list1 = QYDJ_RYXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list1.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list1.get(i);
			cerno = ryxx.getCERNO();
			cernolist.add(cerno);
		}
		list2 = QYDJ_CZXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list2.size();i++) {
			czxx = (QYDJ_CZXX_SQ)list2.get(i);
			blicno= czxx.getBLICNO();
			cerno = czxx.getCERNO();
			if(!"".equals(blicno)){
				cernolist1.add(blicno);
				}
			if(!"".equals(cerno)){
				cernolist1.add(cerno);
			}
		}
		cernolist1.removeAll(cernolist);
		cernolist.addAll(cernolist1);
	}else {
		list1 = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list1.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list1.get(i);
			cerno = ryxx1.getCERNO();
			cernolist.add(cerno);
		}
		list2 = QYDJ_CZXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list2.size();i++) {
			czxx1 = (QYDJ_CZXX_ZS)list2.get(i);
			blicno= czxx1.getBLICNO();
			cerno = czxx1.getCERNO();
			if(!"".equals(blicno)){
				cernolist1.add(blicno);
				}
			if(!"".equals(cerno)){
				cernolist1.add(cerno);
			}
		}
		cernolist1.removeAll(cernolist);
		cernolist.addAll(cernolist1);
	}
}

Boolean flag = false;
for(int i=0;i<cernolist.size();i++) {
	String cernum = (String)cernolist.get(i);	
	if(idnum.equals(cernum)) {
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
			//out.print(SysUtility.setAlertGo("对不起，该用户已签名!",""));
			%>
			<script language="javascript">
			alert("对不起，该用户已签名!");		
			history.go(-1);			
			</script>
			<% 
		} else {
			//验签
			String resXml ="";
			String code ="";
			if("A0001".equals(sysCode)){
				//eID
				Eid eid=new Eid();
				String result=SysUtility.convertCode(request.getParameter("result").replaceAll("'",""));
				String issuer=SysUtility.convertCode(request.getParameter("issuer").replaceAll("'",""));
				String certSn=SysUtility.convertCode(request.getParameter("certSn").replaceAll("'",""));
				String issuerSn=SysUtility.convertCode(request.getParameter("issuerSn").replaceAll("'",""));
				String toSignData=SysUtility.convertCode(request.getParameter("toSignData").replaceAll("'",""));
				String subject=SysUtility.convertCode(request.getParameter("subject").replaceAll("'",""));	
				String a = eid.eIDVerify(issuer, issuerSn, certSn,toSignData,result, "1", "1");
				code = eid.parse(a); 
			}else if("E0001".equals(sysCode)){
				//电子营业执照
				YyzzInfo p=new YyzzInfo();	
				String ifud=SysUtility.convertCode(request.getParameter("ifud").replaceAll("'",""));
				String mylx=SysUtility.convertCode(request.getParameter("mylx").replaceAll("'",""));
				String zslx=SysUtility.convertCode(request.getParameter("zslx").replaceAll("'",""));
				String hashsf=SysUtility.convertCode(request.getParameter("hashsf").replaceAll("'",""));
				String ztxlh=SysUtility.convertCode(request.getParameter("ztxlh").replaceAll("'",""));
				String sign=SysUtility.convertCode(request.getParameter("sign").replaceAll("'",""));
				String cert=SysUtility.convertCode(request.getParameter("cert").replaceAll("'",""));
				String plainText=SysUtility.convertCode(request.getParameter("plainText").replaceAll("'","")); //原文
				resXml=p.createXml("E0001", cert, plainText, sign);
				code = p.verifySign(resXml);
			}else if("B0001".equals(sysCode)){
				//建行
			   YyzzInfo p=new YyzzInfo();
			   String signdata=SysUtility.convertCode(request.getParameter("signdata").replaceAll("'",""));
			   resXml =p.createXml("B0001", "", filedes, signdata);	
			   code = p.verifySign(resXml);
			}else if("B0005".equals(sysCode)){
				//工行
			   YyzzInfo p=new YyzzInfo();
			   String signdata=SysUtility.convertCode(request.getParameter("signdata").replaceAll("'",""));
			   resXml =p.createXml("B0005", "", filedes, signdata);	
			   code = p.verifySign(resXml);
			}		
			if("0".equals(code)){
				String sql = "update UPLOAD_FILE_ELEC SET REMARKS = REMARKS || '"+name+";'  WHERE FILEID='"+fileid+"' and OPENO='"+openo+"'";
				UPLOAD_FILE_ELEC.doSql(sql);
			  //  out.print(SysUtility.setAlertGo("签名成功!",""));
				%>
				<script language="javascript">
				alert("签名成功!");
				history.go(-1);
				</script>
				<%
			 }else{ 
			   // out.print(SysUtility.setAlertGo("签名失败!",""));
			    %>
			    <script language="javascript">
				alert("签名失败!");
				history.go(-1);
				</script>
				<%
			}	
		}
	}
}
if(!flag) {
	//out.print(SysUtility.setAlertScript("对不起，您不在此文件签名人员范围内!",""));
	%>
	    <script language="javascript">
		alert("对不起，您不在此文件签名人员范围内!");
		history.go(-1);
		</script>
<%
}
%>

