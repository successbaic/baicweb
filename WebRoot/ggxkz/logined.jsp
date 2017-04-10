<%@ page errorPage="error.jsp"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="GGGL_USER" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_USER"/>
<%
String name=SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("NAME")));
String pass=SysUtility.doPreProcess(request.getParameter("PASS"));
String insyear=SysUtility.doPreProcess(request.getParameter("INSYEAR"));
boolean bl=false;
if(name.equals("") || pass.equals("") || insyear.equals("")){
	out.print("<script>javascript:alert('请录入相应的用户名或密码');</script>");
	return;
}
else{
String sql="SELECT * FROM GGGL_JYDW_JBXX"+" WHERE INSYEAR='"+insyear+"' and ADBULICNO='"+pass+"' and ADBUENT='"+name+"'";
GGGL_JYDW_JBXX.doSelectBySql(sql);
if(GGGL_JYDW_JBXX.getADBULICNO().equals("")){
	String LICNO=GGGL_JYDW_JBXX.doSelectNw("SELECT LICNO FROM GGJY_JBXX_ZS WHERE LICNO='"+pass+"' AND ADBUENT='"+name+"'","LICNO");
	if(LICNO==null || LICNO.equals("")){
		out.print("<script>javascript:alert('不存在该广告经营单位或信息录入不准确！');</script>");
		return;
	}else{
	//	bl=GGGL_JYDW_JBXX.doModifyBySql("INSERT INTO GGGL_JYDW_JBXX (ADBULICNO,ADBUENT,INSYEAR,DOM,LEREP,POLCODE,TEL,ADTYPE,OPFROM,OPTO,BUSSCOPE,CERDATE,REGORG) SELECT ADBULICNO,AA00003,"+insyear+",AD01057,AD01059,AD01058,AD01060,AD01014,to_date(AD01071,'yyyy-mm-dd'),to_date(AD01072,'yyyy-mm-dd'),AD01064,to_date(AD01017,'yyyy-mm-dd'),AD01034 FROM AD0101 WHERE AD01022='"
		bl=GGGL_JYDW_JBXX.doModifyBySql("INSERT INTO GGGL_JYDW_JBXX (ADBULICNO,ADBUENT,INSYEAR,DOM,LEREP,POLCODE,ADTYPE,OPFROM,OPTO,BUSSCOPE,CERDATE,REGORG) SELECT LICNO,ADBUENT,"+insyear+",OPLOC,NAME,POSTALCODE,ADBUENTTYPE,ADOPFROM,ADOPTO,ADLICBU,APPDATE,REGORG FROM GGJY_JBXX_ZS@GS_LINK WHERE LICNO='"
		+pass+"' AND ADBUENT='"+name+"'");
		if(!bl){
			out.print("<script>javascript:alert('数据导入失败！');</script>");
			return;
		}
	}
	//查询两遍，防止数据导入失败！
	GGGL_JYDW_JBXX.doSelectBySql(sql);
	if(GGGL_JYDW_JBXX.getADBULICNO().equals("")){
		out.print("<script>javascript:alert('不存在该广告经营单位或信息录入不准确！');</script>");
		return;
	}
}
GGGL_USER.setADBUENT(GGGL_JYDW_JBXX.getADBUENT());
GGGL_USER.setADBULICNO(GGGL_JYDW_JBXX.getADBULICNO());
GGGL_USER.setDOM(GGGL_JYDW_JBXX.getDOM());
GGGL_USER.setINSYEAR(GGGL_JYDW_JBXX.getINSYEAR());
GGGL_USER.setLEREP(GGGL_JYDW_JBXX.getLEREP());
session.setAttribute("GGGL_USER",GGGL_USER);
out.print("<script>javascript:parent.location.href='welcome.jsp';</script>");
}
%>