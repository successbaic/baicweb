<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="GGGL_USER" scope="session" class="com.macrosoft.icms.ggxkz.GGGL_USER"/>
<%
	String ADBULICNO=GGGL_USER.getADBULICNO();
	int INSYEAR=GGGL_USER.getINSYEAR();
	
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();
	if(GGGL_JYDW_JBXX.getTEL().equals("")
	||GGGL_JYDW_JBXX.getPOLCODE().equals("")
	||GGGL_JYDW_JBXX.getDOM().equals("")
	||GGGL_JYDW_JBXX.getDECDATE().equals("")){
		out.print("<script>javascript:alert('请填写并保存封面信息！');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_HDSX WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('核对事项页面尚未填写！');</script>");
		return;
	}

//	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_ZSXX WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
//		out.print("<script>javascript:alert('资格证书页面尚未填写！');</script>");
//		return;
//	}

	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_JYQK WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('经营信息页面尚未填写！');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_JYDW_GLZD WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('管理制度页面尚未填写！');</script>");
		return;
	}
	
	if(!GGGL_JYDW_JBXX.doCountBySql("SELECT COUNT(*) FROM GGGL_GGJY WHERE PRIPID='"+ADBULICNO+"' AND ANCHEYEAR="+INSYEAR)){
		out.print("<script>javascript:alert('广告统计信息页面尚未填写！');</script>");
		return;
	}
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
      ip=request.getHeader("x-forwarded-for");
    }
    if(ip==null ) ip="";
	String sql="UPDATE GGGL_JYDW_JBXX SET ANCHETYPE='1',TIMESTAMP=sysdate,JQIP='"+ip+"' WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR;
	boolean bl=GGGL_JYDW_JBXX.doModifyBySql(sql);
	if(!bl){
		out.print("<script>javascript:alert('信息提交失败！');</script>");
	}else{
		out.print("<script>javascript:alert('信息提交成功，请等待预审结果！');parent.window.location.href='welcome.jsp';</script>");
	}
%>
