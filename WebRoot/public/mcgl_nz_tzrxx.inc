<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="lc1">Ͷ��������</td>
	<td class="lc2">
		<!--
		<select size="1" id="INVTYPE" name="INVTYPE"  title="Ͷ��������" disabled="disabled" disblank>
			<option value=''>��ѡ��Ͷ��������</option>
		<%=icms.getSysDmList("INVTYPE")%>
     </select>&nbsp;<font color=red>*</font>
	<img src="<%=request.getContextPath() %>/images/usinghelp.png" style="width:20px;height: 20px;position: relative;top:0px;cursor: pointer;" onclick="showTzrLx('INVTYPE','INVTYPEContent','radio')"/>
	-->
	<select size="1" id="INVTYPE" name="INVTYPE"  title="Ͷ��������" disblank>
			<option value=''>��ѡ��Ͷ��������</option>
		<%if(MCGL_JBXX.getENTTYPE().equals("1151")){ %>		
		<%=icms.getSysDmListLIKERemark("INVTYPE","ZRR")%>
		<%}else{ if(MCGL_JBXX.getENTTYPE().equals("1152")){%>
		<%=icms.getSysDmListLIKERemark("INVTYPE","FZR")%>
		<%}else{ %>
		<%=icms.getSysDmListLIKERemark("INVTYPE",ENTTYPE)%>
		<%}}%>	
     </select>&nbsp;<font color=red>*</font>
	</td>
	<td class="lc1" nowrap="nowrap">����������</td>
	<td class="lc2" colspan="3">
	<input type="text" name="INV" size="60" maxlength="50" disblank title='����������'>&nbsp;<font color=red>*</font></td>
</tr>
<tr style="display:none" id="ZJLX_TR">
<td class="lc1">֤������</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="֤������" style="width:192px;">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select></td>    
	<td class="lc1" >֤������</td>   
	<td class="lc2" colspan='3'><input type="text" size="30" name="CERNO" title="֤������" maxlength=20 ></td> 
   </tr>
   <tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >֤������</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='֤������'>
	<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("BLICTYPE")%></select></td>
	<td class="lc1" >֤�պ���</td>
	<td class="lc2" colspan='3'>
		<input type="text" name="BLICNO" size="30" maxlength="18" title='֤�պ���'></td>
</tr>
<tr>
	<td class="lc1" >Ͷ�ʶ�</td>
	<td class="lc2">
	<input type="text" name="SUBCONAM" size="14" maxlength="14" datatype='NUM' onchange='doblurcongro()' title='Ͷ�ʶ�'>��Ԫ&nbsp;
	</td>
	<td class="lc1" >Ͷ�ʱ���</td>
	<td class="lc2">
	<input type="text" name="CONPROP" size="14" maxlength="14" disabled datatype='NUM' title='Ͷ�ʱ���'> %&nbsp;
</tr>
</table>
<script LANGUAGE="JavaScript">
function doblurcongro()
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	var JB_REGCAP = document.getElementById("JB_REGCAP").value;
	var ret=true;
	if (fucCheckNUM(SUBCONAM))
	{
		if(SUBCONAM<0){
		    alert('Ͷ�ʶ�����Ǹ�ֵ��');
			ret= false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('Ͷ�ʶ��ϵͳ��󾫶ȣ�');
			ret= false;
		}
        if(JB_REGCAP!=null&&JB_REGCAP!=""&&(JB_REGCAP-0)>0){
		   if(SUBCONAM/JB_REGCAP>1){
		      alert('Ͷ�ʶ����ҵ��ע���ʱ���');
			  ret= false;
		   }else{
		      document.getElementById("CONPROP").value=FormatNumber(SUBCONAM/JB_REGCAP*100,2);
		   } 
		}
	}
	else
	{
		alert('Ͷ�ʶ�ӦΪ���֣�');
		ret= false;
	}
	if(!ret){
		document.form1.btSave.disabled=false;
	}
	return ret;
}
</script>