<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="MCGL_TZRXX" scope="page"  class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>Ͷ������Ϣ</title>

</head>
<body>
<%@include file="../top.inc"%>
<%	
	String OPENO = Page.getOPENO();//ҵ����
    String pageheader=Page.pageheader(request.getRequestURI());
    String ENTCLASS=Page.getENTCLASS();
    String SIGN=Page.getSIGN();
	out.println(pageheader);
	String OPETYPE = Page.getOPETYPE();
	int colNum=5;
%>
<div style="position:relative;">
<div id="editDiv" style="position:absolute; width:100%; height:200px; top:0px;left:0px;display:none;border-style:solid;border-width:1pt; border-color:blue">
<table width="100%"><tr class="yxsm">
<td align="left" style="font-size:14px;font-weight:bold; ">������Ϣ¼��</td>
<td align="right">
<span onclick="document.getElementById('editDiv').style.display='none'" style="cursor:pointer;font-size:14px;font-weight:bold; ">
�ر�
&nbsp;
</span> </td></tr>
</table>
<IFRAME height="300" width="770px" name="editframe" src="" id="editframe" scrolling="yes" border="0" align='center'  frameborder="0"></IFRAME>
</div></div>

<form name="form1">
<table align="center" width="770px" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;"></td>
<td align="center" width="120px">
&nbsp;
<%if(SIGN.equals("0")){ %>
<a href='#' onclick="framejumpTo('mcgl_tzrxx_do.jsp','action=1&OPENO=<%=OPENO%>');">
<img border=0 src='../images/icon/icon_list_add.gif' alt='����'>
<font style="font-size:14px;">����</font>
</a>
<%} %>
</td></tr></table>


<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
  <tr>
  <%
  if(ENTCLASS.equals("8")){
  %>
    <td class="yxsm" align="center">Ͷ��������������</td>
    <td class="yxsm" align='center'>����</td>	     
    <td class="yxsm"><p align="center">Ͷ�ʶ�</td>
    <td class="yxsm" align="center">Ͷ�ʱ���</td>
  <%
  }else{
  %>
    <td class="yxsm" align="center">Ͷ��������������</td>
    <td class="yxsm" align="center">Ͷ��������</td>
	<td class="yxsm" align="center">֤������</td>
	<td class="yxsm" align="center">֤�պ���</td>
<%} %>    
	<td class="yxsm" align="center">����</td>

  </tr>
<%
        String sql=" WHERE OPENO = '"+OPENO+"'";		
	 	
 	 	ArrayList al=MCGL_TZRXX.getList(sql,request.getParameter("start")); //����ҵ���Ų�ѯ����ҵ���Ͷ�����ļ���Ϣ
		Iterator It=al.iterator();
		int j=0;
		while (It.hasNext()) 		
		{
			j=j+1;
			com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ tb=(com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ)It.next();
%>
 <tr align='center'>
	<%
if(ENTCLASS.equals("8")){
%>
<td><%=tb.getINV() %></td>
<td><%=icms.getSysDm("COUNTRY",tb.getCOUNTRY())%></td>
<td><%=tb.getSUBCONAM() %></td>
<td><%=tb.getCONPROP() %>%</td>
<%
}else{
%>
<td><%=tb.getINV() %></td>
<td align="center">
<%
if(ENTCLASS.equals("6")){
	out.println(icms.getSysDm("MEMTYPE",tb.getINVTYPE()));	
}else{
	out.println(icms.getSysDm("INVTYPE",tb.getINVTYPE()));
}
%>
</td><!-- //Ͷ�������� -->
	
	<%
		if(tb.getINVTYPE().equals("20") || tb.getINVTYPE().equals("35") || tb.getINVTYPE().equals("36") || tb.getINVTYPE().equals("21") || tb.getINVTYPE().equals("22")){
	%>
	<td align="center"><%=icms.getSysDm("CERTYPE",tb.getCERTYPE()) %></td>
	<td align="center"><%=tb.getCERNO() %></td>
	<%		
		}else{
	%>
	<td align="center"><%=icms.getSysDm("BLICTYPE",tb.getBLICTYPE()) %></td>
	<td align="center"><%=tb.getBLICNO() %></td>
	<%			
		}
	%>
<%
}%>
<td>
<%
if(SIGN.equals("1"))
  {
%>
	<a href='#' onclick="framejumpTo('mcgl_tzrxx_do.jsp','action=4&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='../images/icon/icon_edit.gif' alt='�鿴'> �鿴</a> 
<%
  }else{
%>
	<a href='#' onclick="framejumpTo('mcgl_tzrxx_do.jsp','action=2&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='../images/icon/icon_edit.gif' alt='�޸�'> �޸�</a>
	&nbsp;
	<a href='#' onclick="framejumpToC('mcgl_tzrxx_action.jsp','action=3&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>','ȷ��ɾ���ü�¼��?');" ><img border=0 src='../images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> 
<%  
  }
%></td>
  </tr>
<%}%>
<tr><td colspan="<%=colNum%>">
<%

		SysPageShow sp=new SysPageShow(request,MCGL_TZRXX.getListCount(sql));
		out.print(sp.PageNav());	
%>
</td></tr>

</TABLE>
<br/>
<center>
  <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
	<br/>
	���ݲ�ѯ�У���ȴ�...<br/>&nbsp;
  </div>
<div class="subImgs" id="subid" onclick="tzrCheck()">��һҳ</div>
</center>
</form>
<%@include file="../bottom.inc"%>
</body>
</html>		
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");		
	out.print(vf.ValueDefaultScript());
%>
<script type="text/javascript">
var OPENO = "<%=OPENO%>";
var OPETYPE = "<%=OPETYPE%>";
function tzrCheck(){
	$.ajax(
			{
				async:false,//�ύ����ͬ������
				type:"post", 
				data:{"OPENO":OPENO,"OPETYPE":OPETYPE,"ywlx":"mcgl"},
				dataType: "text",
				//method:getGSS,
				//contentType:"application/json",
				url:"tzrCheck.action",
				beforeSend:function (XMLHttpRequest) {
				}, 
				success:function (data, textStatus) {
					if(data != ""){
						alert(data);
					}else{
						document.getElementById("subid").disabled=true;
						document.getElementById("waitdiv").style.display="";
						window.location.href="<%=Page.getNextPage()[0] %>";
					}
				}, 
				complete:function (XMLHttpRequest, textStatus) {
				}, 
				error:function () {
						//���������
					alert("ϵͳ�������Ժ����Ի���ϵ����Ա��");
				}
			}
		);
	}
</script>