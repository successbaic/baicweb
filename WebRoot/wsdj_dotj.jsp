<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"%>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"%>  
<%@ page import="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"%>  
<%@ page import="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"%>  
<%@ page import="com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS"%>
<%@ include file="jspheader.inc"%>
<jsp:useBean id='UPLOAD_FILE_ELEC' scope='page'
	class='com.macrosoft.icms.util.UPLOAD_FILE_ELEC' />
<jsp:useBean id="QYDJ_CZXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%
String pripid=Page.getPRIPID();
String IFELEC=Page.getIFELEC();
String openo = request.getParameter("openo");
Page.setOPENO(openo);	

String OPETYPE=Page.getOPETYPE();
String DL=Page.getDL();
if(DL.equals("1")){
	DL="QYDJ";
	}else if (DL.equals("2")){
		DL="GTDJ";
	}else if (DL.equals("3")){
		DL="HZSDJ";
	}else if (DL.equals("4")){
		DL="HWGG";
	}else if (
		DL.equals("1")){
		DL="DCDY";
}

String ENTTYPE=Page.getENTTYPE();
String wjid="";
String wjsm="";
String gdsign="";
String frsign="";
String dssign="";
String ifsign="";
String tsxx="";
StringBuffer sbts= new StringBuffer();
int flag=0;
String sql="SELECT WJID,WJSM,GDSIGN,FRSIGN,DSSIGN,IFSIGN FROM QCDZ_WSDJ_TBXX WHERE OPETYPE='"+OPETYPE+"' AND DL='"+DL+"' AND XL='"+ENTTYPE+"' AND IFSIGN  IN ('1','3')  ORDER BY BH ";
DbConnection db=new DbConnection();
ResultSet rs=db.executeQuery(sql);
while(rs.next()){
wjid=rs.getString("WJID");
wjsm=rs.getString("WJSM");
gdsign = rs.getString("GDSIGN");
frsign = rs.getString("FRSIGN");
dssign = rs.getString("DSSIGN");
ifsign =  rs.getString("IFSIGN");

//获取法定代表人或股东人员名称-----------------------------------------------------------------------------
ArrayList list = null;
ArrayList list1 = null;
ArrayList list2 = null;
QYDJ_CZXX_SQ czxx = new QYDJ_CZXX_SQ();
QYDJ_CZXX_ZS czxx1= new QYDJ_CZXX_ZS();
QYDJ_RYXX_SQ ryxx = new QYDJ_RYXX_SQ();
QYDJ_RYXX_ZS ryxx1 = new QYDJ_RYXX_ZS();
String name = null;
ArrayList namelist =new ArrayList();
ArrayList namelist1 =new ArrayList();

//法人签名
if("1".equals(frsign)&&!"1".equals(gdsign)&&!"1".equals(dssign)){
	if("20".equals(OPETYPE)) {
		list = QYDJ_RYXX_SQ.getList("openo='"+openo+"'  and lerepsign='1'");
		for(int i=0;i<list.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list.get(i);
			name = ryxx.getNAME();
			namelist.add(name);
		}
	}else {
		list = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'  and lerepsign='1'");
		for(int i=0;i<list.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list.get(i);
			name = ryxx1.getNAME();
			namelist.add(name);
		}
	}
}else if("1".equals(gdsign)&&!"1".equals(frsign)&&!"1".equals(dssign)){//股东签名
	if("20".equals(OPETYPE)) {
		list = QYDJ_CZXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list.size();i++) {
			czxx = (QYDJ_CZXX_SQ)list.get(i);			
			name = czxx.getINV();
			namelist.add(name);
		}
	}else {
		list = QYDJ_CZXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list.size();i++) {
			czxx1 = (QYDJ_CZXX_ZS)list.get(i);
			name = czxx1.getINV();
			namelist.add(name);
		}
	}
}else if("1".equals(dssign)&&!"1".equals(frsign)&&!"1".equals(gdsign)){//董事、监事、法人签名
	if("20".equals(OPETYPE)) {
		list = QYDJ_RYXX_SQ.getList("openo='"+openo+"'  and lerepsign='2'");
		for(int i=0;i<list.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list.get(i);
			name = ryxx.getNAME();
			namelist.add(name);
		}
	}else {
		list = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'  and lerepsign='2'");
		for(int i=0;i<list.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list.get(i);
			name = ryxx1.getNAME();
			namelist.add(name);
		}
	}
}else if("1".equals(frsign)&& "1".equals(dssign)&&!"1".equals(gdsign)){//法人+董事等
	if("20".equals(OPETYPE)) {
		list = QYDJ_RYXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list.get(i);
			name = ryxx.getNAME();
			namelist.add(name);
		}
	}else {
		list = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list.get(i);
			name = ryxx1.getNAME();
			namelist.add(name);
		}
	}
}else if("1".equals(frsign)&& "1".equals(gdsign)&&!"1".equals(dssign)){//法人+股东
	if("20".equals(OPETYPE)) {
		list1 = QYDJ_RYXX_SQ.getList("openo='"+openo+"'  and lerepsign='1'");
		for(int i=0;i<list1.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list1.get(i);
			name = ryxx.getNAME();
			namelist.add(name);
		}
		list2 = QYDJ_CZXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list2.size();i++) {
			czxx = (QYDJ_CZXX_SQ)list2.get(i);
			name = czxx.getINV();
			namelist1.add(name);	
		}
		namelist1.removeAll(namelist);
		namelist.addAll(namelist1);
	}else {
		list1 = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'  and lerepsign='1'");
		for(int i=0;i<list1.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list1.get(i);
			name = ryxx1.getNAME();
			namelist.add(name);
		}
		list2 = QYDJ_CZXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list2.size();i++) {
			czxx1 = (QYDJ_CZXX_ZS)list2.get(i);
			name = czxx1.getINV();
			namelist1.add(name);			
		}
		namelist1.removeAll(namelist);
		namelist.addAll(namelist1);
	}
}else if("1".equals(dssign)&& "1".equals(gdsign)&&!"1".equals(frsign)){//股东+董事等
	if("20".equals(OPETYPE)) {
		list1 = QYDJ_RYXX_SQ.getList("openo='"+openo+"'  and lerepsign='2'");
		for(int i=0;i<list1.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list1.get(i);
			name = ryxx.getNAME();
			namelist.add(name);
		}
		list2 = QYDJ_CZXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list2.size();i++) {
			czxx = (QYDJ_CZXX_SQ)list2.get(i);
			name = czxx.getINV();
			namelist1.add(name);		
		}
		namelist1.removeAll(namelist);
		namelist.addAll(namelist1);
	}else {
		list1 = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'  and lerepsign='2'");
		for(int i=0;i<list1.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list1.get(i);
			name = ryxx1.getNAME();
			namelist.add(name);
		}
		list2 = QYDJ_CZXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list2.size();i++) {
			czxx1 = (QYDJ_CZXX_ZS)list2.get(i);
			name = czxx1.getINV();
			namelist1.add(name);			
		}
		namelist1.removeAll(namelist);
		namelist.addAll(namelist1);
	}
}else if("1".equals(frsign)&& "1".equals(gdsign)&& "1".equals(dssign)){//法人+股东+董事等
	if("20".equals(OPETYPE)) {
		list1 = QYDJ_RYXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list1.size();i++) {
			ryxx = (QYDJ_RYXX_SQ)list1.get(i);
			name = ryxx.getNAME();
			namelist.add(name);
		}
		list2 = QYDJ_CZXX_SQ.getList("openo='"+openo+"'");
		for(int i=0;i<list2.size();i++) {
			czxx = (QYDJ_CZXX_SQ)list2.get(i);
			name = czxx.getINV();
			namelist1.add(name);		
		}
		namelist1.removeAll(namelist);
		namelist.addAll(namelist1);
	}else {
		list1 = QYDJ_RYXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list1.size();i++) {
			ryxx1 = (QYDJ_RYXX_ZS)list1.get(i);
			name = ryxx1.getNAME();
			namelist.add(name);
		}
		list2 = QYDJ_CZXX_ZS.getList("pripid='"+pripid+"'");
		for(int i=0;i<list2.size();i++) {
			czxx1 = (QYDJ_CZXX_ZS)list2.get(i);
			name = czxx1.getINV();
			namelist1.add(name);			
		}
		namelist1.removeAll(namelist);
		namelist.addAll(namelist1);
	}
}

StringBuffer sbuff = new StringBuffer();
for(int i=0;i<namelist.size();i++) {
	String nama = (String)namelist.get(i);
	sbuff.append(nama).append(";");
}
String ryname="";
if(sbuff!=null && sbuff.length()!=0){
   ryname= sbuff.substring(0, sbuff.length()-1).toString();
}
//待签名人员名称数组
String[] rynames = ryname.split(";");
//------------------------------------------------------------------------------

String sqls="SELECT REMARKS,FILEID FROM UPLOAD_FILE_ELEC WHERE WJID='"+wjid+"'  AND OPENO='"+openo+"'";
DbConnection db1=new DbConnection();
ResultSet rs1=db1.executeQuery(sqls);

String signName="";
String fileId = "";
 while(rs1.next()){
	 signName =rs1.getString("REMARKS");
	 fileId =rs1.getString("FILEID");
 }
if(("".equals(signName)||signName==null) && "1".equals(ifsign)){
	flag=1;
	break;
  }
if(("".equals(signName)||signName==null) && "3".equals(ifsign) && !"".equals(fileId)){
	flag=1;
	break;
  }
String str1= "";
if(!"".equals(signName)&& signName!=null)
{
	ArrayList nameLists = new ArrayList();
	//获取已签名人员信息列表
    str1= signName.substring(0, signName.length()-1);
    String[] sign= str1.split(";");
    for(int i=0;i<sign.length;i++){
    	nameLists.add(sign[i]);
    }
    StringBuffer  sbf2= new StringBuffer();
    String str2="";
    //筛选未签名人员信息
    for(int j=0;j<rynames.length;j++){
    	boolean exists= nameLists.contains(rynames[j].toString());
    	if(exists){		
    	}else{
    		 sbf2.append(rynames[j]).append(",");
    		 str2 = sbf2.substring(0, sbf2.length()-1).toString();
    	}
    }
    if(!"".equals(str2) && str2 != null){
		sbts.append(wjsm).append("：【").append(str2).append("】未签名！          　　 ");
	    tsxx= sbts.toString();
    }
  }
System.out.print(tsxx);
}
%>
<html>
<head>
<style type="text/css">
a:link {
	color: #FF0000;
	text-decoration: underline;
}

a:visited {
	color: #AB3C37;
	text-decoration: none;
}

a:hover {
	color: #000000;
	text-decoration: none;
}

a:active {
	color: #FFFFFF;
	text-decoration: none;
}
</style>
<title>网上登记</title>
<script type="text/javascript">
    var ifelec = '<%=IFELEC%>';
    var flag = '<%=flag%>';
    var wjsm = '<%=wjsm%>';
    var tsxx='<%=tsxx%>';
	function goback() {
		window.location.href = "qydj_control.jsp";
	}
	function onBeforeSub() {
		//签名与文件内容是否一致，签名的数量与文件是否一致。begin20160930
		if(ifelec=="1"){
			//验证签名文件有没有签过名
			if(flag==1){
				alert("附件信息【"+wjsm+"】没有进行签名!");
				return;
			}
			//验证签名文件人员是否都签名通过
			if(tsxx != "" && tsxx !=null){
				alert("附件信息签名验证不通过：\r\n"+tsxx);
				return;
			}
		}
		//签名与文件内容是否一致，签名的数量与文件是否一致。end20160930
		var isAgree = $('input:radio[name="isAgree"]:checked').val();
		if (isAgree == "1") {
			if(window.confirm("请确认信息填报准确，提交后数据不能再进行修改。\n\n预审通过后请进入【已办业务查询】中打印申请书。\n\n预审驳回后可以对填写信息进行修改，重新申报。\n\n确定要提交至工商局预审吗？")){
				document.form1.submit();
			}
			
		} else {
			alert("请同意提交的材料真实有效！");
		}
	}
</script>
</head>
<body>
	<%@include file="top.inc"%>
	<%
		StepShow stepShow = new StepShow();
		out.println(stepShow.getStep("4", Page.getDL() + Page.getOPETYPE(),
				Page.getOPENO()));
	%>
	<br />
	<form name="form1" method="post" action="web/wsdj_dotj_action.jsp"
		target="editframe">
		<table width="600px" align="center"
			style="border-color: #A1C3E7; background-color: #F6F9FF;" border="1">
			<tr>
				<%
					QYDJ_YWSB_SQ ywsb = new QYDJ_YWSB_SQ();
					ywsb.setOPENO(Page.getOPENO());
					ywsb.doSelect();
					String smString = "本企业依照企业";
					if ("5".equals(ywsb.getENTCLASS())) {
						smString = "本人依照个体工商户";
					}
					if (isSanZheng) {
				%>
				<td height="120px" valign="top"
					style="line-height: 40px; border: 0px;">
					<center>
						<strong> <font color="red" style="font-size: 20px;">
								说&nbsp;明 </font>
						</strong>
					</center> &nbsp;&nbsp; <%
 	if (Page.getSIGN().equals("1")) {

 			String STATUS = ywsb.getSTATUS();
 			if (STATUS.equals("1")) {
 %> &nbsp;当前业务信息已提交至审批中心，请耐心等待工作人员的预审， <font color="red">预审期间数据不能再进行修改</font>。
					<%
 	} else if (STATUS.equals("2") || STATUS.equals("4")) {
 %> &nbsp;当前业务信息已预审通过，然后携带相关材料，前往审批中心办理业务。
					<%
 	}else if (STATUS.equals("11")) {
 		 %>	当前业务已经办理完结。
			<%
	}
 %> <%
 	} else {
 %> &nbsp;请确认信息填报准确，数据提交至审批中心后，请耐心等待工作人员的预审， <font color="red">预审期间数据不能再进行修改</font>。预审驳回后可以对填写信息进行修改，重新申报！
					<%
 	}
 %>
				</td>

				<%
					} else {
				%>
				<td height="120px" valign="top"
					style="line-height: 40px; border: 0px;">
					<center>
						<strong> <font color="red" style="font-size: 20px;">
								说&nbsp;明 </font>
						</strong>
					</center> &nbsp;&nbsp; <%
 		if (Page.getSIGN().equals("1")) {

 			String STATUS = ywsb.getSTATUS();
 			if (STATUS.equals("1")) {
 %> 当前业务信息已提交至工商局，请耐心等待工商局工作人员的预审， <font color="red">预审期间数据不能再进行修改</font>。预审通过后请进入【已办业务查询】中打印申请书。预审驳回后可以对填写信息进行修改，重新申报！
					<%
 	} else if (STATUS.equals("2") || STATUS.equals("4")) {
 %> 当前业务信息已预审通过，请返回 <a href='content.jsp'> 已办业务查询 </a>，打印申请书及通知书，然后携带相关材料，前往工商局办理业务。
					<%
 	}else if (STATUS.equals("11")) {
 %>	当前业务已经办理完结。
 					<%
 	}
 %> <%
 	} else {
 %> 请确认信息填报准确，数据提交至工商局后，请耐心等待工商局工作人员的预审， <font color="red">预审期间数据不能再进行修改</font>。预审通过后请进入【已办业务查询】中打印申请书。预审驳回后可以对填写信息进行修改，重新申报！
					<%
 	}
 %>
				</td>
				<%
					}
				%>
			</tr>

			<%
				if (!(Page.getSIGN().equals("1"))) {
			%>
			<tr>
				<td height="60px" valign="top"
					style="line-height: 40px; border: 0px;">
					<center>
						<strong> <font color="red" style="font-size: 19px;">
								承诺声明 </font>
						</strong>
					</center>
				</td>
			</tr>
			<tr>
				<td style="border: 0px"><font color="red">&nbsp;&nbsp;<%=smString%>登记相关法律法规，申请相关业务，承诺提交信息真实有效。
				</font></td>
			</tr>
			<tr>
				<td align="center" style="height: 40px;"><input type="radio"
					name="isAgree" value="1" checked="checked"> 同意 <input
					type="radio" name="isAgree" value="0"> 不同意</td>
			</tr>
			<tr>
				<td align="center" height="60px">

					<div style="margin-top: 20px;">
						<div onclick="onBeforeSub();"
							style="float: left; margin-left: 180px; cursor: pointer; width: 114px; height: 34px;">
							<img src="<%=request.getContextPath()%>/images/submit.png"
								style="width: 114px; height: 34px;" /> <font
								style="position: relative; top: -30px; font-family: cursive;">
								提交工商局 </font>
						</div>
						<div onclick="goback();"
							style="float: left; margin-left: 10px; cursor: pointer; width: 114px; height: 34px;">
							<img src="<%=request.getContextPath()%>/images/submit.png"
								style="cursor: pointer;" /> <font
								style="position: relative; top: -30px; left: 0px; font-family: cursive;">
								返回修改 </font>
						</div>
					</div>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<iframe height="0" width="100" name="editframe" src="" id="editframe"
			scrolling="no" border="1" align='center' frameborder="0"></iframe>
		<%@include file="bottom.inc"%>
</body>
</html>
