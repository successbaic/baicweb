<table width="98%" border=1 cellpadding="0" cellspacing="0" align='center'>
<tr>
    <td class="yxsm" colspan="6" align="center">
       <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>�������������ҵ���й����ڴ���������Ӫ�����������Ϣ</font></p>
    </td>
</tr>
<tr>
    <td class="lc1" align="center">�� ��</td>
	<td class="lc2" colspan=5>
	<input type="text" name="ENTNAME" size="45" disblank title='�� ��' maxlength='50'>&nbsp;<font color=red>*</font></td>
</tr>
<tr>	
	<td class="lc1" nowrap>Ӫҵ����</td>   
 	<td class="lc2" colspan="5">
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
 	<td class="lc1" align="center">�绰</td>
	<td class="lc2" colspan=2>
	<input type="text" name="TEL" size="20" disblank title='��ϵ�绰' maxlength='20'>&nbsp;<font color=red>*</font></td>
	    
	<td class="lc1" nowrap="nowrap" align="center">��������</td>
	<td class="lc2" colspan=2><input type="text" name="POSTALCODE" size="20" disblank datatype=int title='��������' maxlength='6'>&nbsp;<font color=red>*</font></td>
</tr>
<tr>
    <td class="lc1" align="center">��ҵ����</td>
    <td class="lc2" colspan=2>
	  	<select size="1" name="ENTTYPE"  datatype=enttype disblank title="��ҵ����">
		<option value=''>��ѡ����ҵ����</option><%=icms.getSysDmList("ENTTYPE","WGJY")%></select>
	&nbsp;<font color=red>*</font>
	</td>
	<td class="lc1" align="center" colspan="1" nowrap="nowrap">���ܲ���</td>
	<td class="lc2" colspan=2><input type="text" disblank name="DEPINCHA" maxlength=50 size="20" title="���ܲ���">&nbsp;<font color=red>*</font></td>

</tr>
<tr>
    <td class="lc1" align="center">��������</td>
	<td class="lc2" colspan="1"><input type="text" disblank name="EXAAUTH" maxlength=50 size="20" title="��������">&nbsp;<font color=red>*</font></td>
    
    <td class="lc1" align="center" width="10%">��׼����</td>
	<td class="lc2"><input type="text" disblank name="SANDATE" size="20" title="��׼����" datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">&nbsp;<font color=red>*</font></td>   
  	<td class="lc1" align="center">������</td>
    <td class="lc2" >
	  	<input type="text" name="LEREP" disblank size="20" title='������' maxlength='10'><font color=red>*</font>
    </td>
	</tr>
<tr>
<td class="lc1" colspan="1" nowrap="nowrap">�ʽ������Ԫ��</td>   
	<td class="lc2" colspan="2" >
	<input type="text" name="REGCAP" disblank size="20" title='�ʽ�����'><font color=red>*</font>
	</td>
<td class="lc1" colspan="1" nowrap="nowrap">����</td>   
	<td class="lc2" colspan="2" >
	<input type="text" name="REGCAPCUR_TEXT" id="REGCAPCUR_TEXT" disabled>
	<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" title="Ͷ���ܶ����"><input type="button" class="button" onclick="getSelDm('REGCAPCUR','CURRENCY')" value="ѡ ��..">
		<font color=red>*</font>
	</td>	
</tr>
<tr>
    <td class="lc1" align="center" nowrap>���й����ھ�Ӫ��Χ</td>
    <td class="lc2" colspan='5' >
        <textarea rows="4" name="BUSSCOPE" cols="70" disblank title='��Ӫ��Χ' maxlength='1000'></textarea>&nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
	<td class="lc1" align="center">�а����̻�Ӫ<br>������Ŀ</td>
	<td class="lc2" colspan=5 >
	<textarea rows="3" name="ITEMOFOPORCPRO" cols="70" disblank title="�а����̻�Ӫ������Ŀ" maxlength=256> </textarea><font color=red>*</font>    
	</td>
</tr>	
<tr>
    <td class="lc1" colspan="1" nowrap="nowrap">�������Ǽǻ���</td>   
	<td class="lc2" colspan="2" ><select name="REGORG" title="�������Ǽǻ���" disblank style="width:192px; "> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>
		<td class="lc1">��Ͻ��λ</td>
	<td class="lc2" colspan="2"><select name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:220px;"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>	
	<td class="lc1" colspan=1 align="center">��Ӫ����</td>
	<td class="lc2" colspan="5">
	����<input type="checkbox" name="checkboxInput" id="check1"  title="Ӫҵ����" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" title="Ӫҵ����" size="10" maxlength=10 >��
		</span><font color=red>*</font>      
    </td>
</tr> 
<tr>
    <td class="lc1" rowspan="3" align="center" nowrap>���(����)<br>��ҵ���</td>
    <td class="lc1" align="center" nowrap="nowrap">��ҵ����</td>
	<td class="lc2" colspan="3"><input type="text" name="FORENTNAME" size="50" disblank title='�����ҵ����' maxlength='50'>&nbsp;<font color=red>*</font></td>
</tr>
<tr>
    <td class="lc1" align="center">����ס��</td>
	<td class="lc2" colspan='4'><input type="text" name="FORENTADD" size="50" disblank title='����ס��' maxlength='50'>&nbsp;<font color=red>*</font></td>  
</tr>
<tr>
    <td class="lc1" width="15%" align="center">������ҵע���<br>��Ӫ��Χ
    <td class="lc2" colspan='4'>
    <textarea rows="4" name="FORENTSCOPE" cols="70" title='���(����)��ҵ���⾭Ӫ��Χ' disblank maxlength='500'></textarea>  &nbsp;<font color=red>*</font>
    </td>
</tr>

<%--tr>
	<td class="lc1" colspan=2 align="center">�а����̻�Ӫ<br>��������</td>
	<td class="lc2" colspan=4 >
	<textarea rows="3" name="CONOFCONTRPRO" cols="70" title="�а����̻�Ӫ��������" maxlength=256> </textarea>
	</td>
</tr--%>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵�����к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����		
</tr>
</TABLE>
<script language="javascript">
function checkSub(){
	//var a=doblurregcap();
	//if(a){
		return true;
	//}else{
	//	return false;
	//}	
}
function doblurregcap(){
  var FORENTCAP=document.getElementById("FORENTCAP").value;
	if(FORENTCAP!=null&&FORENTCAP!="")
	{
	   if (fucCheckNUM(FORENTCAP))
	    {
		   if (Math.abs(FORENTCAP)>999999999999)
		    {
			   alert('������ҵע���ʱ�����ϵͳ��󾫶ȣ�');
			   return false;
		    }
	    }else
	    {
		   alert('������ҵע���ʱ�ӦΪ���֣�');
		   return false;
	    }
	}
	return true;
}
</script>