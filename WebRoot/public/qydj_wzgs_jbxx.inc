<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>����Ͷ�ʹ�˾������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1">��ҵ����</td>   
	<td class="lc2" colspan="3">
	<input type="text" name="ENTNAME" READONLY size="55" title="����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   
	<td class="lc1">����</td>
	<td class="lc2">	
	  <input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" size="10" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="����" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="ѡ ��..">					
		<font color=red>*</font>
    </tr>
 <tr>	
	<td class="lc1" nowrap>ס��</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>ס���밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
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
						��¼���ס��Ϊ��<input type="text" name="DOM" id="DOM" disblank style="width:380px" title="ס��" >
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
	<td class="lc2" colspan="3">
	<input type="text" name="TEL" size="15" title="��ϵ�绰" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
	
	<td class="lc1">��������</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
	
</tr>
<tr>	
	<td class="lc1" nowrap="nowrap">��˾����</td>   
	<td class="lc2" colspan="5" >
	<select name="ENTTYPE" disblank title="��˾����">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZGS")%></select>&nbsp;<font color=red>*</font>
</tr>
<tr> 	
 	<td class="lc1" nowrap="nowrap">��������������</td>   
	<td class="lc2" colspan="3">
	<input type="text" name="LEREP" title="����������" size="40" maxlength=50 disblank>&nbsp;<font color=red>*</font></td> 	

	<td class="lc1">������ʽ</td>
	<td class="lc2">
	<select name="INSFORM" title="�ɷ����޹�˾Ӧ�ڡ�������ʽ����ѡ����д���������������ߡ�ļ��������" style="width:100px;" disblank>
	<option value="">��</option><option value='01'>��������</option><option value='07'>ļ������</option>
	</select>	<font color=red >*</font>
	</td>
</tr>
<tr> 
	<td class="lc1">Ͷ���ܶ�</td>   
	<td class="lc2"><input type="text" name="CONGRO" id="CONGRO" title="Ͷ���ܶ�" size="10" maxlength=20 onblur='checkCongro()'>&nbsp;��Ԫ</td> 
	
	<td class="lc1">����</td>
	<td class="lc2" align="center"><input type="text" name="CONGROCUR_TEXT" id="CONGROCUR_TEXT" disabled>
		<input type="hidden" name="CONGROCUR" id="CONGROCUR" title="Ͷ���ܶ����"><input type="button" class="button" onclick="getSelDm('CONGROCUR','CURRENCY','REGCAPCUR')" value="ѡ ��..">							
	</td>
	
    <td class="lc1">������Ԫ</td>   
	<td class="lc2"><input type="text" name="CONGROUSD" id="CONGROUSD" title="Ͷ���ܶ�������Ԫ" size="10" maxlength=20 onblur='checkCongro()'>&nbsp;����Ԫ</td>     
						
</tr>
<tr>
	<td class="lc1">ע���ʱ�</td>   
	<td class="lc2">
	<input type="text" name="REGCAP" size="10" title="ע���ʱ�" maxlength=20 >&nbsp;��Ԫ</td>  	
	
	<td class="lc1">����</td>
	<td class="lc2" align="center"><input type="text" name="REGCAPCUR_TEXT" id="REGCAPCUR_TEXT" disabled>
		<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" title="Ͷ���ܶ����"><input type="button" class="button" onclick="getSelDm('REGCAPCUR','CURRENCY')" value="ѡ ��..">							
	</td>
	
    <td class="lc1">������Ԫ</td>   
	<td class="lc2"><input type="text" name="REGCAPUSD" id="REGCAPUSD" title="Ͷ���ܶ�������Ԫ" size="10" maxlength=20 onblur='checkCongro()'>&nbsp;����Ԫ</td>     	
	
</tr>
<tr>
	<td class="lc1">�Ǽǻ���</td>   
	<td class="lc2" colspan="2"><select name="REGORG" title="�Ǽǻ���" disblank style="width:192px; "> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td>
	<td class="lc1" style="width:80px;"">��Ͻ��λ</td>
	<td class="lc2" colspan="2"><select name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:220px;"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
	<td class="lc1" rowspan="1">��Ӫ��Χ</td>
	<td colspan="5">
		<textarea rows="5" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>		
		<input type="button" class="button" style="height=20px;width=120px;" name="" value="��Ӫ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')"> 		
	</td>
</tr>
<tr> 	
	
    <td class="lc1">Ӫҵ����</td>   
	<td class="lc2" colspan="3">
	����<input type="checkbox" name="checkboxInput" id="check1"  title="Ӫҵ����" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" title="Ӫҵ����" size="10" maxlength=10 >��
		</span><font color=red>*</font>
	</td> 
    
    <td class="lc1" nowrap="nowrap">ִ�ո�����</td>   
	<td class="lc2"><input type="text" name="COPYNUM" title="ִ�ո�����" disblank datatype=INT size="10" maxlength=2 value=1>��
    &nbsp;<font color=red >*</font>&nbsp;
    </td>
    
 </tr>
 <tr>
	<td class="lc2" colspan="8">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵�����к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	</p></td>   
 </tr>
</table>
<script language="javascript">
function checkSub(){
	return true;
}
function checkCongro(){
    var CONGRO =document.getElementById("CONGRO").value;
	if(CONGRO!=null&&CONGRO!="")
	{
	   if (fucCheckNUM(CONGRO))
	    {
		 if (Math.abs(CONGRO)>999999999999)
		  {
			alert('Ͷ���ܶ��ϵͳ��󾫶ȣ�');
			return false;
		  }
	    }else
	    {
		    alert('Ͷ���ܶ�ӦΪ���֣�');
		    return false;
	    }
	}
	return true;
}
function checkDomeRegcap(){
    var DOMEREGCAP = document.getElementById("DOMEREGCAP").value;
    if(DOMEREGCAP!=null&&DOMEREGCAP!=""){
       if(fucCheckNUM(DOMEREGCAP))
	     {
	       if (Math.abs(DOMEREGCAP)>999999999999)
		     {
			    alert('�з�ע���ʱ�����ϵͳ��󾫶ȣ�');
			    return false;
		     }
	     }   
	  else
	     {
	       alert('�з�ע���ʱ�ӦΪ���֣�');
		   return false;
	      }
    }
	return true;
}
function checkDomeRegcapUsd(){

    var DOMEREGCAPUSD = document.getElementById("DOMEREGCAPUSD").value;
    if(DOMEREGCAPUSD!=null&&DOMEREGCAPUSD!=""){
       if(fucCheckNUM(DOMEREGCAPUSD))
	     {
	       if (Math.abs(DOMEREGCAPUSD)>999999999999)
		     {
			    alert('�з�ע���ʱ�������Ԫ����ϵͳ��󾫶ȣ�');
			    return false;
		     }
	     }   
	  else
	     {
	       alert('�з�ע���ʱ�������ԪӦΪ���֣�');
		   return false;
	      }
    }
	return true;
}
function checkDomeRegcapInvrat(){
   //�з�ע���ʱ���ռ����
	var DOMEREGCAPINVRAT = document.getElementById("DOMEREGCAPINVRAT").value;
	if(DOMEREGCAPINVRAT!=null&&DOMEREGCAPINVRAT!=""){
	   if(fucCheckNUM(DOMEREGCAPINVRAT))
	     {
	       if(Math.abs(DOMEREGCAPINVRAT)>100)
	        {
	           alert('�з�ע���ʱ���ռ��������100%��');
		       return false;
	        }
	     }
	   else
	     {
	       alert('�з�ע���ʱ���ռ����ӦΪ���֣�');
	       return false;
	     }
	}
	return true;   
}
function checkForRegcap(){
  //�ⷽע���ʱ�
   var FORREGCAP = document.getElementById("FORREGCAP").value;
   if(FORREGCAP!=null&&FORREGCAP!=""){
      if(fucCheckNUM(FORREGCAP))
	   {
	     if (Math.abs(FORREGCAP)>999999999999)
		  {
			alert('�ⷽע���ʱ�����ϵͳ��󾫶ȣ�');
			return false;
		  }
	   }
	  else
	   {
	     alert('�ⷽע���ʱ�ӦΪ���֣�');
		 return false;
	   }
   }
   return true;

}
function checkForRegcapUsd(){
   //�ⷽע���ʱ�������Ԫ
   var FORREGCAPUSD = document.getElementById("FORREGCAPUSD").value;
   if(FORREGCAPUSD!=null&&FORREGCAPUSD!=""){
      if(fucCheckNUM(FORREGCAPUSD))
	   {
	     if (Math.abs(FORREGCAPUSD)>999999999999)
		  {
			alert('�ⷽע���ʱ�������Ԫ����ϵͳ��󾫶ȣ�');
			return false;
		  }
	   }
	  else
	   {
	     alert('�ⷽע���ʱ�������ԪӦΪ���֣�');
		 return false;
	   }
   }
   return true;
}
function checkForRegcapInvrat(){
    //�ⷽע���ʱ���ռ����
   var FORREGCAPINVRAT = document.getElementById("FORREGCAPINVRAT").value;
   if(FORREGCAPINVRAT!=null&&FORREGCAPINVRAT!=""){
     if(fucCheckNUM(FORREGCAPINVRAT))
	  {
	   if(Math.abs(FORREGCAPINVRAT)>100)
	    {
	      alert('�ⷽע���ʱ���ռ��������100%��');
		  return false;
	    }
	  }
	else
	 {
	   alert('�ⷽע���ʱ���ռ����ӦΪ���֣�');
	   return false;
	 }
   }
   return true;
}
function checkDomeReccap(){
  //�з�ʵ���ʱ�
   var DOMERECCAP = document.getElementById("DOMERECCAP").value;
   if(DOMERECCAP!=null&&DOMERECCAP!=""){
      if(fucCheckNUM(DOMERECCAP))
	  {
	   if (Math.abs(DOMERECCAP)>999999999999)
		{
			alert('�з�ʵ���ʱ�����ϵͳ��󾫶ȣ�');
			return false;
		}
	  }
	 else
	  {
	    alert('�з�ʵ���ʱ�ӦΪ���֣�');
		return false;
	  }
   }
   return true;
}
function checkDomeReccapUsd(){
   //�з�ʵ���ʱ�������Ԫ
   var DOMERECCAPUSD = document.getElementById("DOMERECCAPUSD").value;
   if(DOMERECCAPUSD!=null&&DOMERECCAPUSD!=""){
      if(fucCheckNUM(DOMERECCAPUSD))
	  {
	   if (Math.abs(DOMERECCAPUSD)>999999999999)
		{
			alert('�з�ʵ���ʱ�������Ԫ����ϵͳ��󾫶ȣ�');
			return false;
		}
	  }
	 else
	  {
	    alert('�з�ʵ���ʱ�������ԪӦΪ���֣�');
		return false;
	  }
   }
   return true;
}
function checkDomeReccapConprop(){
   //�з�ʵ���ʱ���ռ����
   var DOMERECCAPCONPROP = document.getElementById("DOMERECCAPCONPROP").value;
   if(DOMERECCAPCONPROP!=null&&DOMERECCAPCONPROP!=""){
      if(fucCheckNUM(DOMERECCAPCONPROP))
	   {
	     if(Math.abs(DOMERECCAPCONPROP)>100)
	      {
	        alert('�з�ʵ���ʱ���ռ��������100%��');
		    return false;
	      }
	   }
	  else
	   {
	     alert('�з�ʵ���ʱ���ռ����ӦΪ���֣�');
	     return false;
	   }
   }
   return true;
}
function checkForReccap(){
   //�ⷽʵ���ʱ�
   var FORRECCAP = document.getElementById("FORRECCAP").value;
   if(FORRECCAP!=null&&FORRECCAP!=""){
      if(fucCheckNUM(FORRECCAP))
	   {
	      if (Math.abs(FORRECCAP)>999999999999)
		   {
			  alert('�ⷽʵ���ʱ�����ϵͳ��󾫶ȣ�');
			  return false;
		   }
	   }
	  else
	   {
	      alert('�ⷽʵ���ʱ�ӦΪ���֣�');
		  return false;
	   }
   }
   return true;
}
function checkForReccapUsd(){
   //�ⷽʵ���ʱ�������Ԫ
   var FORRECCAPUSD = document.getElementById("FORRECCAPUSD").value;
   if(FORRECCAPUSD!=null&&FORRECCAPUSD!=""){
      if(fucCheckNUM(FORRECCAPUSD))
	   {
	      if (Math.abs(FORRECCAPUSD)>999999999999)
		   {
			  alert('�ⷽʵ���ʱ�������Ԫ����ϵͳ��󾫶ȣ�');
			  return false;
		   }
	   }
	  else
	   {
	      alert('�ⷽʵ���ʱ�������ԪӦΪ���֣�');
		  return false;
	   }
   }
   return true;
}
function checkForReccapConprop(){
    //�ⷽʵ���ʱ���ռ����
	var FORRECCAPCONPROP = document.getElementById("FORRECCAPCONPROP").value;
    if(FORRECCAPCONPROP!=null&&FORRECCAPCONPROP!=""){
       if (fucCheckNUM(FORRECCAPCONPROP))
	    {
		  if (Math.abs(FORRECCAPCONPROP)>100)
		   {
			  alert('�ⷽʵ���ʱ���ռ��������100%��');
			  return false;
		   }
	    }
	   else
	    {
		   alert('�ⷽʵ���ʱ���ռ����ӦΪ���֣�');
		   return false;
	    }
    }
    return true;
}	
</script>