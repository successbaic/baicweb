<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_CZXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>�ϻ��˳�����Ϣ</title>
</head>
<body>
<%@include file="top.inc"%>
<%	
    String OPENO = Page.getOPENO();//ҵ����
    String SIGN=Page.getSIGN();
    String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
%>
<form name="form1">
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
<IFRAME height="380" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align='center'  frameborder="0"></IFRAME>
</div></div>

<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
�ϻ��˳�����Ϣ</td>
<td align="center" width="120px">
<%
if(!SIGN.equals("1")){
%>
&nbsp;
<a href='#' onclick="framejumpTo('qydj_czxx_do.jsp','action=1&OPENO=<%=OPENO%>');">
<img border=0 src='images/icon/icon_list_add.gif' alt='����'>
<font style="font-size:14px;">����</font>
</a><%}%>
</td></tr></table>

<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
  <tr class="yxsm">
    <td align="center">�ϻ������ƻ�����</td>    
    <td align="center">�Ͻɳ��ʶ�</td>
    <%--td align="center">ʵ�ɳ��ʶ� </td--%>
	<td align="center" width="120px">����</td>
  </tr>
<%
        String sql=" WHERE OPENO = '"+OPENO+"'";		
	 	
 	 	ArrayList al=QYDJ_CZXX.getList(sql,request.getParameter("start")); //����ҵ���Ų�ѯ����ҵ��ĳ�������Ϣ
		Iterator It=al.iterator();
		int j=0;
		while (It.hasNext()) 		
		{
			j=j+1;
			com.macrosoft.icms.qydj.QYDJ_CZXX_SQ tb=(com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)It.next();
%>
  <tr>
		<td align="center"><%=tb.getINV()%></td><!-- //�ɶ����������� -->			
		<td align="center"><%=tb.getSUBCONAM()%></td><!-- //�Ͻɳ��ʶ� -->
		<%--td align="center"><%=tb.getACCONAM()%></td><!-- //ʵ�ɳ��ʶ� --%>
	<td>
	<%if(SIGN.equals("1"))
	  {
	%>
		<a href='#' onclick="framejumpTo('qydj_czxx_do.jsp','action=4&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a> 
	<%
	  }else{
	%>
		<a href='#' onclick="framejumpTo('qydj_czxx_do.jsp','action=2&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>');" ><img border=0 src='images/icon/icon_edit.gif' alt='�޸�'> �޸�</a>
		&nbsp;
		<a href='#' onclick="framejumpToC('web/qydj_czxx_action.jsp','action=3&RECID=<%=tb.getRECID()%>&OPENO=<%=tb.getOPENO()%>','ȷ��ɾ���ü�¼��?');" ><img border=0 src='images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> 
	<%  
	  }
	%>
	</td>
  </tr>
<%
		}
%>
<tr><td colspan="4">
<%		
		SysPageShow sp=new SysPageShow(request,QYDJ_CZXX.getListCount(sql));
		out.print(sp.PageNav());	
%>
</td></tr>
</TABLE>
<br/>
<center>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
<br/>���ݲ�ѯ�У���ȴ�...<br/>&nbsp;
</div>
<div class="subImgs" id="subid" onclick="document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';window.location.href='<%=Page.getNextPage()[0] %>'">��һҳ</div>
</center>
<%@include file="bottom.inc"%>
</form>
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