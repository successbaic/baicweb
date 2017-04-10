<%@page import="com.macrosoft.icms.util.DesUtil"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"%>
<%@ page import="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"%>
<%@ page import="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"%>
<%@ page import="com.macrosoft.icms.qydj.EidInfo"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.util.PDFCreator"%>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>

<%
	boolean isEIDValited = false;
	boolean istt=false;
	//String openo = "37020021610200002";
	//设置编码格式，解决中文乱码问题
	request.setCharacterEncoding("GBK");
	String openo = request.getParameter("openo");
	if("".equals(openo)||openo==null){
		openo=DesUtil.encrypt(Page.getOPENO()); 
	}
	//openo =Page.getOPENO();
	//openo需要解密
	if(StringUtils.isNotEmpty(openo)){
		openo = DesUtil.decrypt(openo);	
	}
	Page.setOPENO(openo);	
	String name = request.getParameter("name");
	String cerno = request.getParameter("cerno");
	
	String sysCode="";
	String token=request.getParameter("token");
	if(!"".equals(token)&&token!=null){
        String tokenXml ="<?xml version='1.0' encoding='UTF-8'?><request><token>"+token+"</token></request>";		
		EidInfo p=new EidInfo();
		Map map = p.checkToken(tokenXml);
		name = (String)map.get("name");
		cerno = (String)map.get("idCard");
		sysCode= (String)map.get("sysCode");
	}	
	
	//查询业务表，判断查询企业表还是个体表
	QYDJ_YWSB_SQ ywsb = new QYDJ_YWSB_SQ();
	ywsb.setOPENO(openo);
	ywsb.doSelect();
	String entclass = ywsb.getENTCLASS();
	//后续增加根据EID认证的方法
	//boolean ifEIDPassed = 调用EID接口判断是否符合EID
	//根据name和cerno判断是否是该流程业务的人员信息
	if(StringUtils.isNotEmpty(openo)&&StringUtils.isNotEmpty(name)&&StringUtils.isNotEmpty(cerno)){
		if("5".equals(entclass)){//如果是个体户，则确定是否是经营者
			GTDJ_JYZXX_SQ jyzxx = new GTDJ_JYZXX_SQ();
			jyzxx.setOPENO(openo);
			jyzxx.doSelect();
			if(name.equals(jyzxx.getNAME())&&cerno.equals(jyzxx.getCERNO())){//如果是该流程的经营者，则可签名
				isEIDValited = true;
			}
		}else{//如果是企业，则确定是否是法人董监事或者股东
			QYDJ_RYXX_SQ ryxx = new QYDJ_RYXX_SQ();
			QYDJ_CZXX_SQ czxx = new QYDJ_CZXX_SQ();
			List<QYDJ_RYXX_SQ> ryxxs = ryxx.getList(" WHERE OPENO='"+openo+"'");
			List<QYDJ_CZXX_SQ> czxxs = czxx.getList(" WHERE OPENO='"+openo+"'");
			if(ryxxs!=null&&ryxxs.size()>0){//查询是否是法人董监事经理
				for(QYDJ_RYXX_SQ ry : ryxxs){
					if(name.equals(ry.getNAME())&&cerno.equals(ry.getCERNO())){
						isEIDValited = true;
					}
				}
			}
			
			if(!isEIDValited){
				if(czxxs!=null&&czxxs.size()>0){//查询是否是出资人
					for(QYDJ_CZXX_SQ cz : czxxs){
						String czcerno = (String)cz.getCERNO();
						if("".equals(czcerno)|| czcerno == null){
							czcerno=(String)cz.getBLICNO();
						}
						if(name.equals(cz.getINV())&&cerno.equals(czcerno)){
							isEIDValited = true;
						}
					}
				}
			}
			
		}
	}
%>
<%
QYDJ_JBXX_SQ sq = new QYDJ_JBXX_SQ();
sq.setOPENO(openo);
sq.doSelect();
String opettype=sq.getOPETYPE();
String entcode = sq.getENTTYPE();
PDFCreator pdfcreate = new PDFCreator();
String opetypeName="";
if(!"".equals(entcode) && entcode != null){
	opetypeName= pdfcreate.getDmdzByTypeAndCode("ENTTYPE",entcode,"2");		
}else{
	opetypeName = "USUAL";
}
String fpath = PropertiesConfigUtil.getValue("SQS_PATH") + "/"+opetypeName ;
%>
<%
QYDJ_RYXX_SQ qrs = new QYDJ_RYXX_SQ();
List<QYDJ_RYXX_SQ> rys = qrs.getList(" WHERE CERNO='"+cerno+"'");
if(rys!=null&&rys.size()>0){
    for(QYDJ_RYXX_SQ ry : rys){
		if(name.equals(ry.getNAME())&&cerno.equals(ry.getCERNO())&&"99".equals(ry.getCERTYPE())){
			istt = true;
		}
	}
}
%>
<html>
	<head>
		<title>免登陆签名页面</title>
		<link href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet" />
		<link   rel="stylesheet" href="<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.css" />
		<script language="javascript" src="<%=request.getContextPath()%>/eid/eIDPluginHelper.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/support/jquery-1.8.3.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/support/list.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/support/Calendar.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/support/window.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/support/value.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/support/valid.js"></script>
		<script language="javascript" src="<%=request.getContextPath() %>/support/My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/eid/eIDPluginHelper2.0.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/eid/base64.js"></script>
		<script language="javascript" src='<%=request.getContextPath()%>/eid/jquery-1.8.2.js'></script>
		<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.js'></script>
	   	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/eIDUI-common.js'></script>
	    <script type="text/javascript">
	    var sysCode="<%=sysCode%>";
	    if(window.name != "wsdjfjxxedit"){
	        location.reload();
	        window.name = "wsdjfjxxedit";
	    }
	    else{
	        window.name = "";
	    }
	    function valiteLogin(){
				//后续增加EID验证
	    		//cxform.submit();
		    	//var url=urls.slice(0,-18);
		    	var url="<%=icms.getCURRENTURL()%>";
		    	var organCode="<%=icms.getCURRENTUNIT()%>";
		    	document.form1.postURL.value=url+"wsdj_fjxx_edit.jsp";
		    	document.form1.areaCode.value="370000"//organCode;
		    	form1.submit();
	    	}
	    	           

	    	function eIDSign(openo,fileid,filedes,fpath,name,cerno,opetype,frsign,gdsign,dssign){
	    		if(fileid=="" || fileid==null){
	    			alert("无上传文件不能对文件进行签名,请到附件信息列表上传对应文件后签名！");
	    			return;
	    		}
	    		window.location.href="tjwj_sign_edit.jsp?OPENO="+openo+"&FILEID="+fileid+"&FILEDES="+filedes+"&FPATH="+fpath+"&NAME="+name+"&CERNO="+cerno+"&OPETYPE="+opetype+"&SYSCODE="+sysCode+"&FRSIGN="+frsign+"&GDSIGN="+gdsign+"&DSSIGN="+dssign;
	    		//window.open('tjwj_sign_edit.jsp?OPENO='+openo+"&FILEID="+fileid+"&FILEDES="+filedes+"&FPATH="+fpath+"&NAME="+name+"&CERNO="+cerno+"&OPETYPE="+opetype+"&SYSCODE="+sysCode+"&FRSIGN="+frsign+"&GDSIGN="+gdsign+"&DSSIGN="+dssign,"","height=900, width=900, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
              }
	    	

	    	function seeFile(fpath,fileId)
	    	{   
	    		var url = "tjwj_download.jsp?fpath=" + fpath+"&fileId="+fileId;
	    		window.location.href = url;
	    	}  
	    </script>
	</head>
	<body bgcolor="#eefbf7" >
		<%@include file="top_fjxx.inc"%>
		<div id="ElecFjxx" >
			<form name="form1" method="post" action="http://<%=icms.getELECLOGINURL() %>/uniformVerify/login.do">
			<input type="hidden" name="postURL" id="postURL" size=10  />
			<input type="hidden" name="areaCode" id="areaCode" />
			<input type="hidden" name="name" id="name" />
			<input type="hidden" name="cerno" id="cerno" />
			<table align="center" width="100%" cellpadding="0" cellspacing="0" id="fullElecFj">
				<tr>
					<td style="font-size:14px;padding-left: 2px; color:blue;font-weight: bold;line-height: 25px;text-align: left;">
						<table border="1" width="100%" cellspacing='0' cellpadding='0' align="center" style="border-top-width: 0px">
							<tr>
								<input type="hidden" id="openo" name="openo" value="<%=DesUtil.encrypt(openo) %>" />
								<input type="hidden" name="name" id="name"  size="30" />
								<input type="hidden" name="cerno" id="cerno" size="30" />
								<td class="lc1"  style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
                                 &nbsp;请先进行身份认证后完成签名操作：
                                 </td>
                                 <td class="lc1" width="243px">
                                <span class="subImgs" onclick="valiteLogin()">身份认证</span>
                                </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
	
			<table bgcolor="#FFFFFF" align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="table2">
			  <tr class="yxsm">		
			    <td align="center" style="width:50%;">文件名</td>    
			    <td align="center" style="width:10%;">查看附件</td>
			    <td align="center" style="width:10%;">操作</td>
			    <td align="center" style="width:15%;">已签名人员</td>
			  </tr>
			  <%
				if(isEIDValited||istt){
					QYDJ_JBXX_SQ jbxx = new QYDJ_JBXX_SQ();
					GTDJ_JBXX_SQ gtxx = new GTDJ_JBXX_SQ();
					
					String OPETYPE = "";
					String ENTTYPE = "";
					if("5".equals(entclass)){//如果是个体户
						gtxx.setOPENO(openo);
						gtxx.doSelect();
						OPETYPE = gtxx.getOPETYPE();
						ENTTYPE="GT";
					}else{
						jbxx.setOPENO(openo);
						jbxx.doSelect();	
						OPETYPE = jbxx.getOPETYPE();	
						ENTTYPE = PDFCreator.getDmdzByTypeAndCode("ENTTYPE", jbxx.getENTTYPE(), "2");
					}

					String sqls="SELECT * FROM QCDZ_WSDJ_TBXX WHERE OPETYPE='"+OPETYPE+"' AND XL='"+ENTTYPE+"'  ORDER BY BH ";
					DbConnection db=new DbConnection();
					ResultSet rs=db.executeQuery(sqls);
					String wjsm="";
					String wjid="";
					String ifsign="";
					String ifflag="";
					String frsign="";
					String gdsign="";
					String dssign="";
					while(rs.next()){
						wjsm=SysUtility.doPreProcess(rs.getString("WJSM"));
						wjid=rs.getString("WJID");
						ifsign = rs.getString("IFSIGN");
						ifflag = rs.getString("IFFLAG");
						frsign= rs.getString("FRSIGN");
						gdsign = rs.getString("GDSIGN");
						dssign = rs.getString("DSSIGN");
				%>
				<tr class="lc2">
					<td><%=wjsm%></td>
					<td style="text-align:center;">
					<%
						String upsql="SELECT COUNT(*),FILEID,FILENAME,FILEDES,REMARKS  FROM UPLOAD_FILE_ELEC WHERE WJID='"+wjid+"'  AND OPENO = '"+openo+"'  GROUP BY FILEID,FILENAME,FILEDES,REMARKS";
						DbConnection db1=new DbConnection();
						String fileId ="";
						String filename="";
						String filedes="";
						String remarks="";
						ResultSet rs1=db1.executeQuery(upsql);
						int num=0;
						if(rs1.next()){
							fileId = rs1.getString("FILEID");
							filename=rs1.getString("FILENAME");
							filedes=rs1.getString("FILEDES");
							remarks=rs1.getString("REMARKS");
							if(remarks==null){
								remarks="";
							}
							num=rs1.getInt(1);
						}
						if(num==0){
						}else if(num>0){
						%>
                        <a href='#'  onclick="seeFile('<%=fpath %>','<%=fileId %>');" ><img border=0 src='images/icon/icon.gif' alt='查看'>查看</a>
						<% }%>
					</td>
					<td style="text-align:center;">	
					<%
                    if("1".equals(ifsign)){%>
                    <a href='#'  onclick ="eIDSign('<%=openo%>','<%=fileId%>','<%=filedes%>','<%=fpath %>','<%=name%>','<%=cerno%>','<%=opettype%>','<%=frsign%>','<%=gdsign%>','<%=dssign%>')"  value="签名">签名</a>
                       <%}else if("3".equals(ifsign)){%>
                    <a href='#'  onclick ="eIDSign('<%=openo%>','<%=fileId%>','<%=filedes%>','<%=fpath %>','<%=name%>','<%=cerno%>','<%=opettype%>','<%=frsign%>','<%=gdsign%>','<%=dssign%>')"  value="选择性签名">选择性签名</a>
                     <%}%>
					</td>
                    <td style="text-align:center;">	
                    <%=remarks %>
                    </td>
				</tr>
				<%}}%>
			</table>
		</div>
		<br>

		<%@include file="bottom.inc"%>
	</body>
</html>
