<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>�ϻ���ҵ������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">��ҵ����</td>   
	<td class="lc2" colspan="3" >
	<input type="text" name="ENTNAME" READONLY size="70" title="��ҵ����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>
<tr>	
	<td class="lc1" nowrap>��Ӫ����</td>   
 	<td class="lc2" colspan="3">
		<font color="red">˵����</font>��Ӫ�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
 		<select name="PROVINCE" title="ʡ" id="PROVINCE" onchange="writeDOM()">
						<%=icms.getSysDmList("PROVINCE")%>
						</select>
						ʡ/ֱϽ��/�������� 
						<select name="CITY" id="CITY" title="����/����/��/�����ݣ�" maxlength=20 onchange="cityChange()" disblank>
							<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>
						����/����/��/�����ݣ�
						 <select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="����/��/�ؼ���/�죩 " maxlength=20 disblank>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getCITY())%>
						</select>����/��/�ؼ���/�죩
						 <input type="text" name="TOWN" id="TOWN" title="��" size="23" maxlength=25 onchange="writeDOM()">����/������/��/�ֵ���
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="��" size="23" maxlength=25 onchange="writeDOM()">��·/��/������
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="��" size="10" maxlength=25 onchange="writeDOM()">���ţ� 
 		                <font color=red>*</font>
						<br>
						��¼��ľ�Ӫ����Ϊ��<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="��Ӫ����" >
 		<font color=red>*</font>
 	</td></tr>
 	
 	
<tr>	
	<td class="lc1" nowrap >������Ӫ��</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>������Ӫ���밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>									
						<select name="PROPROVINCE" id="PROPROVINCE" title="ʡ" onchange="writePROLOC()">
						<%=icms.getSysDmList("PROVINCE")%>
						</select>
						ʡ/ֱϽ��/�������� 
						<select name="PROCITY" id="PROCITY" title="����/����/��/�����ݣ�" maxlength=20 onchange="procityChange()" disblank>
							<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>
						����/����/��/�����ݣ�
						 <select name="PROCOUNTY" id="PROCOUNTY" onchange="writePROLOC()" title="����/��/�ؼ���/�죩 " maxlength=20 disblank>
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getPROCITY())%>
						</select>����/��/�ؼ���/�죩
						 <input type="text" name="PROTOWN" id="PROTOWN" title="��" size="23" maxlength=25 onchange="writePROLOC()">����/������/��/�ֵ���
 		                <input type="text" name="PROVILLAGE" id="PROVILLAGE" title="��" size="23" maxlength=25 onchange="writePROLOC()">��·/��/������
 		                <input type="text" name="PROHOUSENUMBER" id="PROHOUSENUMBER" title="��" size="10" maxlength=25 onchange="writePROLOC()">���ţ� 
 		                <font color=red>*</font>
						<br>
						��¼���������Ӫ��Ϊ��<input type="text" name="PROLOC" id="PROLOC" disblank style="width:380px" title="������Ӫ��" >
 		<font color=red>*</font>
 	</td></tr>
 	
<tr>
    <td class="lc1">��������</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 
    
    <td class="lc1">��ϵ�绰</td>   
	<td class="lc2"><input type="text" name="TEL" title="��ϵ�绰" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">ִ������ϻ��˻�ί�ɴ���</td>
    <td class="lc2" colspan="3"><input type="text" name="LEREP" title="ִ������ϻ��˻�ί�ɴ���" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>     
</tr>
<tr> 	
	<td class="lc1">��Ӫ��Χ</td>   
	<td class="lc2" colspan="3">
	<textarea rows="4" name="BUSSCOPE" cols="100" maxlength=2000 title="��Ӫ��Χ">(���Ͼ�Ӫ��Χ�ڷ��漰������ר��רӪ�涨�Ĵ���涨)</textarea> 
	</td>  
</tr> 
<tr>  	 
	<td class="lc1" >��ҵ(����)����</td>   
	<td class="lc2" colspan="5" ><select name="ENTTYPE" disblank title="��ҵ(��������)">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","HHQY")%></select>&nbsp;<font color=red>*</font>
	<!-- <input type="button" class="button"  style="height=20px;width=100px;" name="" value="��ҵ���ͼ���" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/> -->
	</td>   
</tr>
<tr>
    <td class="lc1">�������Ǽǻ���</td>   
	<td class="lc2"><select name="REGORG" title="�������Ǽǻ���" disblank style="width:192px; "> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td> 
	<td class="lc1" style="width:80px;">��Ͻ��λ</td>
	<td class="lc2"><select name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:220px;"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
<td class="lc1">�ϻ�����</td>
	<td class="lc2">   
	<input type="text" name="PARNUM" size="15" disblank maxlength=5  datatype=int title='�ϻ�����'>&nbsp;<font color=red>*</font></td>
    <td class="lc1" nowrap="nowrap">���޺ϻ�����</td>
	<td class="lc2">   
	<input type="text" name="EXENUM" size="15" disblank maxlength=5 title='���޺ϻ�����' datatype='int'>&nbsp;<font color=red>*</font></td>

</tr>
<tr>

	<td class="lc1">��ҵ����</td>
	<td class="lc2">   
	<input type="text" name="EMPNUM" size="15" disblank maxlength=5 title='��ҵ����' datatype='int'>&nbsp;<font color=red>*</font></td>   
    <td class="lc1">�ϻ�����</td>   
	<td class="lc2" colspan="1" >
	����<input type="checkbox" name="checkboxInput" id="check1"  title="Ӫҵ����" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" id="OPDATETO" name="OPDATETO" title="Ӫҵ����" size="10" maxlength=10 >��
		</span><font color=red>*</font>
		</td>      
</tr>
<tr>
    <td class="lc1">�Ͻɳ��ʶ�</td>   
	<td class="lc2">
	<input type="text" name="REGCAP" id="REGCAP" onblur='checkRegcap()' title="�Ͻɳ��ʶ�" size="14" maxlength=14 datatype=NUM>��Ԫ</td> 	 
   
	<td class="lc1">ʵ�ɳ��ʶ�</td>   
	<td class="lc2" >
	<input type="text" name="RECCAP" id="RECCAP" onblur='checkReccap()' title="ʵ�ɳ��ʶ�" size="14" maxlength=14 datatype=NUM>��Ԫ&nbsp;</td>
</tr>
 <tr>
	<td class="lc2" colspan="4">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
	<br>
    1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>	
	2����ҵ�ľ�Ӫ��ΧӦ����������������ҵ�����е���ҵ���߾�Ӫ��������Ӫ��Χ����Ӧ�����չ��񾭼���ҵ�����׼���μ���Ӫ��Ŀ������ȡ������֤�����ע��֤����Ч�ڡ�</p></td>   
 </tr>
</table>
<script language="javascript">
function checkSub(){
	if(!($("#check1").is(":checked")) && $.trim($("#OPDATETO").val()) == ""){
		alert("������Ӫҵ���ޣ�");
		return false;
	};
	return true;
}
function checkRegcap(){
   var REGCAP =document.getElementById("REGCAP").value;
	if(REGCAP!=null&&REGCAP!="")
	{
	   if (fucCheckNUM(REGCAP))
	   {
		 if (Math.abs(REGCAP)>999999999999)
		  {
			alert('�Ͻɳ��ʶ��ϵͳ��󾫶ȣ�');
			return false;
		  }
	    }else
	    {
		   alert('�Ͻɳ��ʶ�ӦΪ���֣�');
		   return false;
	    }
	}
	return true;
}
function checkReccap()
{
	var RECCAP = document.getElementById("RECCAP").value;
	if(RECCAP!=null&&RECCAP!="")
	{
	   if (fucCheckNUM(RECCAP))
	    {
		   if (Math.abs(RECCAP)>999999999999)
		    {
			   alert('ʵ�ɳ��ʶ��ϵͳ��󾫶ȣ�');
			   return false;
		    }
	    }else
	    {
		   alert('ʵ�ɳ��ʶ�ӦΪ���֣�');
		   return false;
	    }
	}
	return true;
}
function setBusscope()
{}
</script>