<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GGGL_JYDW_ZSXX" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_ZSXX"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<%

    String ADBULICNO=Page.getpageKey();
	int INSYEAR=Page.getipageKey();
	String SIGN=Page.getpageKey1();
    String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);		
%>
<html>
<head>
<title>�������ʸ�֤����Ϣ</title>
</head>
<body>
<form name="form1">
<table align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<caption>�ʸ�֤����Ϣ</caption>
<tr class="lc1">
    <td></td>
    <td>����</td>    
    <td>��ѵ����</td>
    <td>֤������</td>
    <td>֤������</td>
    <td>��֤����</td>
<%
	if(SIGN.equals("1")||SIGN.equals("2"))//��Ԥ��Ԥ��ͨ���Ĳ����޸ģ�ֻ�ܲ鿴
	{	
%>
    <td width='8%'>����</td>
<%
	}	
%>
  </tr>
<%
     String sql=" WHERE ADBULICNO = '"+ADBULICNO+"' and INSYEAR="+INSYEAR;			 	
 	 ArrayList al=GGGL_JYDW_ZSXX.getList(sql,request.getParameter("start")); //��������֤��źͼ����Ȳ�ѯ����ص�֤����Ϣ
	 Iterator It=al.iterator(); 	
	for(int i=0;i<al.size();i++)
	{
		com.macrosoft.icms.ggxkz.GGGL_JYDW_ZSXX tb=(com.macrosoft.icms.ggxkz.GGGL_JYDW_ZSXX)al.get(i);
		String lc="";
		String color="";
		if(i%2==0){
			lc="lc2";
			color="#F6F6F6";
		}
%>
 <tr style="cursor:hand" align='center' id="tr<%=i%>" class="<%=lc%>" onclick="changeItem('<%=i%>','<%=tb.getRECID()%>','<%=color%>')">
	<td align="left" width="30px"><input type="checkbox" id="c<%=i%>" style="border-style:none"></td>
	<td align="left"><%=tb.getNAME()%></td>
	<td align="left"><%=tb.getCULDATE()%></td>
	<td align="left"><%=tb.getCERNAME()%></td>
    <td align="left"><%=tb.getCERNO()%></td>
	<td align="left"><%=tb.getISSCARDDATE()%></td>
<%if(SIGN.equals("1"))
  {
%>
    <td align="left"> 
		<a href='#' onclick="framejumpTo('ggxkz_zsxx.jsp','action=4&RECID=<%=tb.getRECID()%>&ADBULICNO=<%=tb.getADBULICNO()%>&INSYEAR=<%=tb.getINSYEAR()%>');" > �鿴</a> 
	</td>
<%
	}
%>
  </tr>
<%}%>
</table>

<%		
		SysPageShow sp=new SysPageShow(request,GGGL_JYDW_ZSXX.getListCount(sql));
		out.print(sp.PageNav());	
%>

  <% 	
	if (!SIGN.equals("1"))
	{
%>
<table width="100%" border="1" align="center" style='border-top-style: none;border-top-width:0px;'>
<tr>
  <td align="center" style='border-top-style: none;border-top-width:0px;'>
<input type="button" name="Submit1" value=" ��  �� "  title="��  ��"  onclick="functionInstance('1')" class="butontType">&nbsp;&nbsp;
<input type="button" name="Submit2" value=" ��  �� "  title="��  ��"  onclick="functionInstance('2')" class="butontType">&nbsp;&nbsp;
<input type="button" name="Submit3" value=" ɾ  �� "  title="ɾ  ��"  onclick="functionInstance('3')" class="butontType">&nbsp;&nbsp;
</td>
  </tr>
<%} %>
</table>
  <input type="hidden" name="selectAllNum" value="<%=al.size()%>">
  <input type="hidden" name=selectRow value="">
  <input type="hidden" name=selectRowRECID value="">
  <input type="hidden" name=lastRow value="">
  <input type="hidden" name=lastRowColor value="">
<br><br>


<IFRAME height="380" width="100%" name="editframe" src="" id="editframe" scrolling="yes" border="0" align='center'  frameborder="0"></IFRAME>
</form>
</body>
</html>
<script type="text/javascript">
 function  functionInstance(id){
 	  var recid=document.all.selectRowRECID.value;
 	  if(id==1){//����
         framejumpTo('ggxkz_zsxx.jsp','action=1&ADBULICNO=<%=ADBULICNO %>&INSYEAR=<%=INSYEAR %>');
 	  }
 	  else if(id==2){ //�޸� 
		if(recid==""){
			alert("��ѡ���¼��");
			return false;
		}
		var cs='action=2&RECID='+recid+'&ADBULICNO=<%=ADBULICNO%>&INSYEAR=<%=INSYEAR %>';
		framejumpTo('ggxkz_zsxx.jsp',cs);	
	  }
	  else if(id==3){ //ɾ��
	    if(recid==""){
			alert("��ѡ���¼��");
		    return false;
		}
	    var cs2='action=3&ADBULICNO=<%=ADBULICNO%>&INSYEAR=<%=INSYEAR %>&RECID='+recid;
	    framejumpToC('ggxkz_zsxx_action.jsp',cs2,'ȷ��ɾ���ü�¼��?');
	  }
  }
  function changeItem(selectnum,recid,color){
	var selectAllNum=document.all.selectAllNum.value;	
	var lastRow=document.all.lastRow.value;	
	var lastRowColor=document.all.lastRowColor.value;
	if(lastRow!=""){
		document.getElementById("c"+lastRow).checked=false;
		document.getElementById("tr"+lastRow).style.backgroundColor=lastRowColor;
	}
	document.getElementById("c"+selectnum).checked=true;
	document.getElementById("tr"+selectnum).style.backgroundColor='#f9ef93';
	
	document.all.lastRow.value=selectnum;
	document.all.lastRowColor.value=color;
	
	document.all.selectRow.value=selectnum;
	document.all.selectRowRECID.value=recid;	
}
</script>
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