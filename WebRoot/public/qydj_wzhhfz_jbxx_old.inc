<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="8" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>����Ͷ�ʹ�˾������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap="nowrap" align="center">��֧��������</td>   
	<td class="lc2" colspan="4">
	<input type="text" name="ENTNAME" READONLY size="70" title="��֧��������" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>   

    <td class="lc1" align="center" nowrap="nowrap">��ϵ�绰</td>   
	<td class="lc2" colspan="2">
	<input type="text" name="TEL" size="15" title="��ϵ�绰" maxlength=20 disblank>&nbsp;<font color=red>*</font></td>       
</tr>
<tr>	
	<td class="lc1" align="center">��Ӫ����</td>   
	<td class="lc2" colspan="4"><input type="text" name="DOM" title="��Ӫ����" size="70" maxlength=50 disblank>&nbsp;<font color=red>*</font>
 	</td>
 	
 	<td class="lc1" align="center">��������</td>   
	<td class="lc2" colspan="2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	
</tr>
<tr> 	
 	<td class="lc1" nowrap="nowrap" align="center">������</td>   
	<td class="lc2" colspan="4"><input type="text" name="LEREP" title="������" size="40" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 	

	<td class="lc1" align="center">��ҵ����</td>
	<td class="lc2" colspan="2">
	<input type="text" name="EMPNUM" size="20" title='��ҵ����' datatype='INT' maxlength=10>	
	</td>
</tr>
<%-- 
<tr>
    <td class="lc1" align="center">��Ӫ����</td>
    <td class="lc2" colspan="7">
	�� <input type="text" name="OPFROM" size="20" disblank title='��Ӫ������' maxlength='6'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype='date'> 
	�� <input type="text" name="OPTO" size="20"  title='��Ӫ������' maxlength='6'  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype='date'>        
    </td>
</tr>
--%>
<tr>
   <td class="lc1" rowspan=3 align="center">������ҵ</td>
   <td align="center" width="15%" class="lc1">����</td>
   <td colspan=6><input type="text" name="SUPENTNAME" size="50"  title='������ҵ����' maxlength='50'></td>
</tr>
<tr>
   <td align="center" class="lc1">�Ǽǻ���</td>
   <td colspan=6><input type="text" name="SUPREGORG" size="50"  title='������ҵ�Ǽǻ���' maxlength='50'></td>
</tr>
<tr>
   <td align="center" class="lc1">ע �� ��</td>
   <td colspan=2><input type="text" name="SUPREGNO" size="20" title='������ҵע���' maxlength='15'></td>
   <td align="center" width="15%" class="lc1">��������</td>
   <td colspan=3><input type="text" name="SUPEMAIL" size="29"  datatype="EMAIL" title='������ҵ��������' maxlength='50'></td>
</tr>
<tr>
	<td class="lc1" align="center">��Ӫ��Χ</td>
	<td class="lc2" colspan="7">
	<textarea rows="4" id="BUSSCOPE" name="BUSSCOPE" title="��Ӫ��Χ" cols="100" maxlength=1000></textarea>
	</td>
</tr>
<tr>
    <td class="lc1" align="center">���ɾ�Ӫ��Ŀ</td>
    <td class="lc2" colspan='7'>
        <textarea rows="4" name="ABUITEMCO" cols="100" disblank title='���ɾ�Ӫ��Ŀ' maxlength='2000'></textarea>
    </td>
</tr>
<tr>	
	<td class="lc1" nowrap="nowrap" align="center">��˾����</td>   
	<td class="lc2" colspan="3" >
	<select name="ENTTYPE" disblank title="��˾����" style="width:150px; ">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","WZHHFZ")%></select>&nbsp;<font color=red>*</font>
	</td>
	
	<td class="lc1" align="center" nowrap>�������Ǽǻ���</td>   
	<td class="lc2" colspan="4"><select name="REGORG" title="�������Ǽǻ���" disblank style="width:192px; "> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getSysDmList("REGORG")%>
	</select>&nbsp;<font color=red>*</font></td>  	
 </tr>
 <tr>
	<td class="lc2" colspan="8">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
	<br>
    1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	<br>	
	2����Ӫ��Χ���ܶ�Ϊ�ա���ҵ�ľ�Ӫ��ΧӦ����������������ҵ�����е���ҵ���߾�Ӫ��������Ӫ��Χ����Ӧ�����չ��񾭼���ҵ�����׼���μ���Ӫ��Ŀ������ȡ������֤�����ע��֤����Ч�ڡ�
	<br>
	3�����ɾ�Ӫ��Ŀ��ָ��ҵ������Ǽ�ǰ���ݷ��ɡ��������桢����Ժ����Ӧ�������йز�����׼����Ŀ���μ�ǰ������Ŀ¼����</font></p></td>   
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