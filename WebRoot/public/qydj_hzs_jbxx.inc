<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="8" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>ũ��רҵ�����������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap">��  ��</td>   
	<td class="lc2" colspan="5">
	<input type="text" name="ENTNAME" READONLY size="70" title="����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
</tr>

<tr>	
	<td class="lc1" nowrap>ס��</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>ס���밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
 		<select name="PROVINCE" title="ʡ" id="PROVINCE" onchange="writeDOM()">
							<%=icms.getSysDmList("PROVINCE")%>
						</select>
						ʡ/ֱϽ��/�������� 
						<select name="CITY" id="CITY" title="��" maxlength=20 onchange="cityChange()">
						<%=ContrInfo.getDiShiOption(icms,XZQH)%>
						</select>����/����/��/�����ݣ�
						<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="��" maxlength=20>
							<!--div id="COUNTYOPT" width='100'></div-->
							<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,QYDJ_JBXX.getCITY())%>
						</select>����/��/�ؼ���/�죩
						 <input type="text" name="TOWN" id="TOWN" title="��" size="20" maxlength=25 onchange="writeDOM()">����/������/��/�ֵ���
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="��" size="23" maxlength=25 onchange="writeDOM()">��·/��/������
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="��" size="10" maxlength=25 onchange="writeDOM()">���ţ� 
 		                <font color=red>*</font>
						<br>
						��¼���ס��Ϊ��<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="ס��" >
 		<font color=red>*</font>
 	</td></tr>
 	
 	
<tr>	
	<td class="lc1" nowrap >������Ӫ��</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>��ҵס�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>									
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
						 <input type="text" name="PROTOWN" id="PROTOWN" title="��" size="20" maxlength=25 onchange="writePROLOC()">����/������/��/�ֵ���
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
	<td class="lc2" colspan="4">
	<input type="text" name="TEL" size="15" title="��ϵ�绰" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
</tr>
<tr>
    <td class="lc1" nowrap="nowrap">��Ա�����ܶ�</td>   
	<td class="lc2"><input type="text" name="REGCAP" id="REGCAP" title="��Ա�����ܶ�" size="15" maxlength=20 onblur='doblurregcap()'>(Ԫ)</td> 
    
    <td class="lc1" nowrap="nowrap">��������������</td>   
	<td class="lc2" colspan="4" ><input type="text" name="LEREP" title="����������" size="20" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr>
	<td class="lc1" >ҵ��Χ</td>
	<td class="lc2" colspan="5">
	<table width="100%" style="border-style:none;">
			<tr>
				<td class="lc2" >
					<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="��Χ" cols="70" maxlength=333></textarea>
				</td>
				<td class="lc2" width="33%">
					<input type="button" class="button" style="height:20px;width:120px;" name="" value="ҵ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')"> 
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
    <td class="lc1" rowspan="2" nowrap>��Ա����</td>
    <td class="lc2" rowspan="2">
    <input type="text" class="cyClass" name="MEMNUM" id="MEMNUM" title="��Ա����" disblank datatype=INT size="10" maxlength=3 onblur=''>&nbsp;<font color=red>*</font>
    </td>
    <td class="lc1" nowrap>ũ���Ա����</td>
    <td class="lc2">
    <input type="text" class="cyClass" name="PEAMEMNUM" id="PEAMEMNUM"  title="ũ���Ա����" disblank datatype=INT size="10" maxlength=3 onblur=''>&nbsp;<font color=red>*</font>
    </td>
    <td class="lc1" nowrap="nowrap" nowrap>��ռ����</td>
    <td class="lc2">
    <input type="text"  name="PEAMEMRATE" id="PEAMEMRATE" readonly="readonly" title="ũ���Ա��ռ����" disblank onblur=''>%&nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1" nowrap>��ҵ����ҵ��λ��<br/>��������Ա����</td>
    <td class="lc2">
    <input type="text" class="cyClass" name="GROMEMNUM" id="GROMEMNUM" title="��ҵ����ҵ��λ����������Ա����" disblank datatype=INT size="10" maxlength=3 onblur=''>&nbsp;<font color=red>*</font>
    </td>
    <td class="lc1" nowrap>��ռ����</td>
    <td class="lc2">
    <input type="text" name="GROMEMRATE" id="GROMEMRATE" readonly="readonly" title="��ҵ����ҵ��λ����������Ա��ռ����" disblank onblur=''>%&nbsp;<font color=red>*</font>
    </td>
</tr>
<tr> 	
	<td class="lc1" nowrap="nowrap">�������Ǽǻ���</td>   
	<td class="lc2" colspan="2"><select id="REGORG" name="REGORG" title="�������Ǽǻ���" disblank style="width:192px; " onchange="loadgss()"> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select>&nbsp;<font color=red>*</font>
	<input type="hidden" name="ENTTYPE" title="��ҵ����" value="9100">
	</td> 	 	

	<%--td class="lc1">��Ͻ��λ</td>   
	<td class="lc2" colspan="2"><select id="OPELOCDISTRICT" name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:220px; " disabled> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getSysDmListByRemark("REGORG","3",XZQH)%>
	</select></td> 
</tr>
<tr--%>	
	<td class="lc1">��Ƭ������</td>   
	<td class="lc2" colspan="5"><select name="LOCALADM" id="LOCALADM" title="��Ƭ������" style="width:220px; "> 
	<option value=''>����ѡ��Ǽǻ���</option>
	</select></td>
	 
</tr> 
</table>
<script type="text/javascript">
function doblurregcap(){
    var REGCAP =document.getElementById("REGCAP").value;
	if(REGCAP!=null&&REGCAP!="")
	{
	   if (fucCheckNUM(REGCAP))
	    {
		 if (Math.abs(REGCAP)>999999999999)
		  {
			alert('��Ա�����ܶ��ϵͳ��󾫶ȣ�');
			return false;
		  }
	    }else
	    {
		    alert('��Ա�����ܶ�ӦΪ���֣�');
		    return false;
	    }
	}
	return true;
}
function doblurmemnum(){
   var MEMNUM =document.getElementById("MEMNUM").value;
	if(MEMNUM!=null&&MEMNUM!="")
	{
	   if (!fucCheckNUM(MEMNUM))
	    {
		    alert('��Ա����ӦΪ���֣�');
		    return false;
	    }
	}
	return true;
}
function doblurpeamemnum(){
   var PEAMEMNUM =document.getElementById("PEAMEMNUM").value;
	if(PEAMEMNUM!=null&&PEAMEMNUM!="")
	{
	   if (!fucCheckNUM(PEAMEMNUM))
	    {
		    alert('ũ���Ա����ӦΪ���֣�');
		    return false;
	    }
	}
	return true;
}
function doblurpeamemrate(){
    var PEAMEMRATE = document.getElementById("PEAMEMRATE").value;
	if(PEAMEMRATE!=null&&PEAMEMRATE!=""){
	   if(fucCheckNUM(PEAMEMRATE))
	     {
	       if(Math.abs(PEAMEMRATE)>100)
	        {
	           alert('ũ���Ա��ռ��������100%��');
		       return false;
	        }
	     }
	   else
	     {
	       alert('ũ���Ա��ռ����ӦΪ���֣�');
	       return false;
	     }
	}
	return true;   
}
function doblurgromemnum(){
    var GROMEMNUM =document.getElementById("GROMEMNUM").value;
	if(GROMEMNUM!=null&&GROMEMNUM!="")
	{
	   if (!fucCheckNUM(GROMEMNUM))
	    {
		    alert('��ҵ����ҵ��λ����������Ա����ӦΪ���֣�');
		    return false;
	    }
	}
	return true;
}
function doblurgromemrate(){
    var GROMEMRATE = document.getElementById("GROMEMRATE").value;
	if(GROMEMRATE!=null&&GROMEMRATE!=""){
	   if(fucCheckNUM(GROMEMRATE))
	     {
	       if(Math.abs(GROMEMRATE)>100)
	        {
	           alert('��ҵ����ҵ��λ����������Ա��ռ��������100%��');
		       return false;
	        }
	     }
	   else
	     {
	       alert('��ҵ����ҵ��λ����������Ա��ռ����ӦΪ���֣�');
	       return false;
	     }
	}
	return true;  
}
</script>