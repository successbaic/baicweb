<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>���(����)��ҵ��פ��������������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">������������</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="ENTNAME" READONLY size="60" title="������������" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

 <tr>	
	<td class="lc1" nowrap>פ�ڳ���</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>פ�ڳ����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
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
						��¼���פ�ڳ���Ϊ��<input type="text" name="DOM" maxlength=100 id="DOM" disblank style="width:380px" title="פ�ڳ���" >
 		<font color=red>*</font>
 	</td></tr>
<tr>
    <td class="lc1">�ʱ�</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="POSTALCODE" title="�ʱ�" datatype=int maxlength=6 disblank>&nbsp;<font color=red>*</font></td>    
    
    <td class="lc1">��ϵ�绰</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="TEL" title="��ϵ�绰" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
</tr>
<tr>
    <td class="lc1">פ������</td>   
	<td class="lc2" colspan="5">
	��<input type="text" id="OPFROM" name="OPFROM" title="Ӫҵ������" size="15" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	��<input type="text" id="OPTO" name="OPTO" title="Ӫҵ������" size="15" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">��ϯ��������</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="LEREP" size="60" title="��ϯ��������" maxlength=25 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

<tr> 	
	<td class="lc1" nowrap="nowrap">�������Ǽǻ���</td>   
	<td class="lc2" colspan="2">
	<select name="REGORG" title="�������Ǽǻ���" disblank style="width:220px; "> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>  	
	<td class="lc1">��Ͻ��λ</td>
	<td class="lc2" colspan="2"><select name="OPELOCDISTRICT" title="��Ͻ��λ" disblank ="true" style="width:180px;"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select>
	&nbsp;<font color=red>*</font>
	</td> 
</tr>
<tr>
   <td class="lc1" nowrap="nowrap">��ҵ����</td>   
	<td class="lc2" colspan="2">
	<select name="ENTTYPE" disblank title="��ҵ����" style="width:220px;" >
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WGDB")%>
	</select>
	&nbsp;
	<font color=red>*</font>
	</td>
</tr>
<tr>
	<td class="lc1" >ҵ��Χ</td>
	<td  class="lc2" colspan="5">
		<textarea rows="5" id="BUSSCOPE" name="BUSSCOPE" title="ҵ��Χ" cols="70" maxlength=1000 readonly="readonly">�����������������������ҵ�йصķ�Ӫ����ҵ����</textarea>
	</td>
</tr>


<tr>
   <td class="lc1">��׼��������</td>
   <td class="lc2" >
   <input type="text" name="EXAAUTH" title="��׼��������" maxlength=50 ></td>      

    <td class="lc1" nowrap>��׼����</td>   
	<td class="lc2" >
	<input type="text" name="SANDATE" title="��׼����" size="20" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">&nbsp;<font color=red>*</font></td>    
    
    <td class="lc1" nowrap>��׼�ĺ�</td>   
	<td class="lc2">
	<input type="text" name="SANDOCNO" title="��׼�ĺ�" maxlength=50 ></td>          
</tr>
<tr>
   <td class="lc1">��������</td>
   <td class="lc2" colspan="3" >
   <input type="text" name="EMAIL" size="60" title="��������" maxlength=50 ></font>
   </td>    
   <td class="lc2" colspan="2" >
   </td>  
</tr>

<tr>
   <td class="lc1" colspan="6"><p align="center" style="font-color: #000080;font-size: 11pt;font-weight: bold;">���(����)��ҵ�������</p></td>
</tr>
<tr>
    <td class="lc1" rowspan="2" nowrap>���(����)��ҵ����</td>
    <td class="lc1" nowrap>����</td>
    <td class="lc2" colspan="4">
      <input type="text" name="FORENTNAME" title="���(����)��ҵ��������" maxlength=50 disblank size="60">&nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1" >����</td>
    <td class="lc2" colspan="4">
    <input type="text" name="FORENTFORNAME" title="���(����)��ҵ��������" maxlength=50 disblank size="60">&nbsp;<font color=red>*</font></td>   
</tr>
<tr>
   <td class="lc1" nowrap>���(����)��ҵ����ס��</td>
   <td class="lc2" colspan="5">
   <input type="text" name="FORENTADD" title="���(����)��ҵ����ס��" maxlength=500 size="60" disblank>&nbsp;<font color=red>*</font></td>      
</tr>
<tr>
   <td class="lc1" nowrap>��������</td>
   <td class="lc2" colspan="5">
   
	��<input type="text" name="FORENTOPFROM" title="������������" size="15" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	��<input type="text" name="FORENTOPTO" title="����������" size="15" maxlength=10 disblank datetype=DATE  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	<font color=red>*</font></td>      
</tr>
<tr>
	 <td class="lc1">��ҵ������ʽ</td>
    <td class="lc2" colspan="2">
      <select name="FORENLIAFOR" title="���(����)��ҵ������ʽ" style="width:192px; ">
			<option value="0">��</option><option value="2">����������ʽ</option><option value="1">����������ʽ</option>
      </select>
    </td>
    <td class="lc1" nowrap="nowrap">��Ȩǩ��������</td>   
	<td class="lc2" colspan="2">
	   <input type="text" name="FORENTAUTSIGN" title="��Ȩǩ��������" maxlength=25 disblank>&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1">�ʱ�(�ʲ�)</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="FORENTCAP" id="FORENTCAP" title="�ʱ�(�ʲ�)" datatype=NUM maxlength=18 disblank onblur="checkForentcap()">����Ԫ&nbsp;<font color=red>*</font></td>    
    
    <td class="lc1">����(����)</td>   
	<td class="lc2" colspan="2">
	  <input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<font color=red>*</font>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="����" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="ѡ ��">					
   </td>
</tr>
<tr>
    <td class="lc1" >��Ӫ��Χ</td>
    <td class="lc2" colspan='4'>
        <textarea rows="4" name="FORENTSCOPE" cols="70" title='���(����)��ҵ��Ӫ��Χ' maxlength='500'  ></textarea>
    </td>
    <td class="lc2" >
		<input type="button" class="button" style="height=20px;width=120px;" name="" value="��Ӫ��Χѡ��..." onClick="getJYFWStr('FORENTSCOPE')" > 
	</td>
</tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
	<br>
    1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>
	2����Ӫ��Χ���ܶ�Ϊ�ա���ҵ�ľ�Ӫ��ΧӦ����������������ҵ�����е���ҵ���߾�Ӫ��������Ӫ��Χ����Ӧ�����չ��񾭼���ҵ�����׼���μ���Ӫ��Ŀ������ȡ������֤�����ע��֤����Ч�ڡ�
 </tr>
</table>
<script language="javascript">
function checkSub(){
	var a=checkForentcap();
	if(a){
		return true;
	}else{
		return false;
	}	
}
function checkForentcap(){
    var FORENTCAP=document.getElementById("FORENTCAP").value;
	if(FORENTCAP!=null&&FORENTCAP!="")
	{
	   if (fucCheckNUM(FORENTCAP))
	    {
		   if (Math.abs(FORENTCAP)>999999999999)
		    {
			   alert('�ʱ�(�ʲ�)����ϵͳ��󾫶ȣ�');
			   return false;
		    }
	    }else
	    {
		   alert('�ʱ�(�ʲ�)ӦΪ���֣�');
		   return false;
	    }
	}
	return true;
}
</script>