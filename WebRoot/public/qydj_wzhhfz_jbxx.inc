<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="8" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>���ʺϻ���ҵ��֧����������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">����</td>   
	<td class="lc2" colspan="4">
	<input type="text" name="ENTNAME" READONLY size="60" title="����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

<tr>	
	<td class="lc1" nowrap>Ӫҵ����</td>   
 	<td class="lc2" colspan="4">
		<font color="red">˵����</font>Ӫҵ�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
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
						��¼���Ӫҵ����Ϊ��<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="Ӫҵ����" >
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
	<td class="lc1">��ϵ�绰</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="TEL" title="��ϵ�绰" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>    
 	
 	<td class="lc1">��������</td>   
	<td class="lc2" ><input type="text" name="POSTALCODE" title="��������" datatype=int maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>

<tr>
	<td class="lc1">������</td>   
	<td class="lc2" colspan="2"><input type="text" name="LEREP" title="������" size="30" maxlength=6 disblank>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1">������</td>   
	<td class="lc2"><input type="text" name="COPYNUM" title="���븱����" datatype=INT size="10" maxlength=2 value=1 disblank>&nbsp;<font color=red>*</font></td> 		
</tr>

<tr>
   <td class="lc1" rowspan="3">������ҵ</td>
    <td class="lc1" colspan="2">��ҵע���/ͳһ������ô���</td>
   <td class="lc2" colspan="2">
   	<input type="text" id="SUPREGNO" name="SUPREGNO" title="������ҵע���" size="30" maxlength=18 disblank>&nbsp;<font color=red>*</font>
   </td>
   
</tr>
<tr>
  <td class="lc1">����</td>
   <td class="lc2" colspan="1"><input type="text" id="SUPENTNAME" name="SUPENTNAME" title="������ҵ����" size="50" maxlength=50 disblank>&nbsp;<font color=red>*</font>
   </td>
   <td class="lc1" nowrap="nowrap">�Ǽǻ���</td>
   <td class="lc2">
      <input type="text" id="SUPREGORG" name="SUPREGORG" title="������ҵ�Ǽǻ���" size="30" maxlength=100 disblank>&nbsp;<font color=red>*</font>
   </td>

   
</tr>
<tr>
	<td class="lc1" nowrap="nowrap">��ҵ����</td>   
	<td class="lc2">
	<select name="ECOCHR" id="ECOCHR" disblank title="��ҵ����">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZHH")%></select>&nbsp;<font color=red>*</font>
	</td>
   
	<td class="lc1">������ҵ<br>Ӫҵ����</td>   
	<td class="lc2">
	��<input type="text" id="FORENTOPFROM" name="FORENTOPFROM" title="Ӫҵ������" size="12" maxlength=20 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">&nbsp;<font color=red>*</font>
	��<input type="text" id="FORENTOPTO" name="FORENTOPTO" title="Ӫҵ������" size="12" maxlength=20 datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	</td>    
</tr>
<tr> 	
	<td class="lc1" nowrap="nowrap">�������Ǽǻ���</td>   
	<td class="lc2" colspan="2"><select name="REGORG" title="�������Ǽǻ���" disblank style="width:192px; "> 
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
   <td class="lc1" nowrap="nowrap">��ҵ����</td>   
	<td class="lc2" colspan="3">
	<select name="ENTTYPE" disblank title="��ҵ����">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZHHFZ")%></select>&nbsp;<font color=red>*</font>
	</td>
</tr>

<tr> 
	<td class="lc1">��Ӫ��Χ</td>   
	<td class="lc2" colspan="7">
	   <table width="100%">
	     <tr>  
	      <td rowspan="2" class="lc2" >
	         <textarea rows="5" id="BUSSCOPE" name="BUSSCOPE" title="��Ӫ��Χ" cols="90" maxlength=1000></textarea>	         
	      </td>
	      <td class="lc2" width="20%">
	         <input type="button" class="button" style="height=20px;width=120px;" name="" value="��Ӫ��Ŀѡ��..." onClick="getJYFWStr('BUSSCOPE')" > 
	      </td>
	    </tr>
	  </table>
	</td>
</tr>
<tr>
<td class="lc1" nowrap>���㷽ʽ</td>   
	<td class="lc2" colspan="7">
	<select name="CALCULATIONMETHOD" title="���㷽ʽ" style="width:180px;" disblank> 
	<option value=''>��ѡ����㷽ʽ</option>
	<%=icms.getSysDmList("CALCULATIONMETHOD")%>
	</select>
	&nbsp;<font color=red>*</font>
	</td>
</tr>

</table>
<script language="javascript">
function checkSub(){
	return true;	
}
function checkWorcap(){
   var WORCAP=document.getElementById("WORCAP").value;
	if(WORCAP!=null&&WORCAP!="")
	{
	   if (fucCheckNUM(WORCAP))
	    {
		   if (Math.abs(WORCAP)>999999999999)
		    {
			   alert('Ӫ���ʽ𳬹�ϵͳ��󾫶ȣ�');
			   return false;
		    }
	    }else
	    {
		   alert('Ӫ���ʽ�ӦΪ���֣�');
		   return false;
	    }
	}
	return true;
}
</script>