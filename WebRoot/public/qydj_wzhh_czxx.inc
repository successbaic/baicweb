<table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr> 
	<td class="lc1">�ϻ������ƻ�����</td>   
	<td class="lc2"><input type="text" name="INV"  disblank title="���ϻ��ˡ��Ǹ��˵ģ�����д����������֤�����ͼ�֤�����룻���ϻ��ˡ�����ҵ�ģ�����д��ҵ���ơ�֤�����ͼ�֤�պ���" maxlength=30 size="30%">&nbsp;<font color=red>*</font>	</td> 	 
	
	<td class="lc1">����(����)</td>   
	<td class="lc2">
	   <input type="text" name="COUNTRY_TEXT" id="COUNTRY_TEXT" disabled>
		<input type="hidden" name="COUNTRY" id="COUNTRY" title="����" disblank><input type="button" class="button" onclick="getSelDm('COUNTRY','COUNTRY')" value="ѡ ��..">					
		<font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1">�ϻ�������</td>   
	<td class="lc2"><select size="1" name="INVTYPE" title="�ϻ�������" disblank style="width:192px; " onchange="setInIitem()">
	<option value=''>��ѡ��ϻ�������</option><%=icms.getSysDmList("INVTYPE")%>
	</select>&nbsp;<font color=red>*</font></td>  
    
    <td class='lc1'>�е����η�ʽ</td>
	<td class="lc2">
	<select size="1" name="ONDUTYSTY" title="�е����η�ʽ" disblank>
		<option value=''>--�е����η�ʽ--</option>
		<%=icms.getSysDmList("ONDUTYSTY")%>
	</select><font color=red>*</font>
	</td>
</tr>
<tr>
    <td class="lc1">ס��</td>   
	<td class="lc2" colspan='3'>
	<input type="text" name="DOM" title="ס��" maxlength=50 size="50">	<font color=red>*</font>
	</td> 	 	
</tr>
<tr style="display:none" id="ZJLX_TR">
	<td class="lc1" >֤������</td>   
	<td class="lc2" >
	  <select size="1" name="CERTYPE" title="֤������" style="width:192px;">
	  <option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select><font color=red>*</font></td>    
	<td class="lc1" >֤������</td>   
	<td class="lc2"><input type="text" size="30" name="CERNO" title="֤������" maxlength=20 ><font color=red>*</font></td> 
</tr>
   <tr style="display:none" id="ZZLX_TR">
	<td class="lc1" >֤������</td>
	<td class="lc2">   
	<select size="1" name="BLICTYPE" style="width:192px;" title='֤������'>
	<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("BLICTYPE")%></select><font color=red>*</font></td>
	<td class="lc1" >֤�պ���</td>
	<td class="lc2" >
		<input type="text" name="BLICNO" size="30" maxlength="18" title='֤�պ���'><font color=red>*</font></td>
</tr>
   <tr> 
	<td class="lc1" >�Ͻɳ��ʶ��Ԫ��</td>   
	<td class="lc2" ><input type="text" name="SUBCONAM" id="SUBCONAM" datatype='NUM' title="�Ͻɳ��ʶ�" maxlength=30 size="30%" disblank><font color=red>*</font></td> 
	<td class="lc1" >�Ͻɳ��ʷ�ʽ</td>   
	<td class="lc2">
		<select size="1" name="CONFORM" title="���ʷ�ʽ��д�����ҡ�ʵ�֪ʶ��Ȩ������ʹ��Ȩ������" id="CONFORM" style="width:192px; " disblank>
		<option value=''>��ѡ���Ͻɳ��ʷ�ʽ</option><%=icms.getSysDmList("CONFORM")%>
	    </select><font color=red>*</font>
	</td> 
   </tr> 
   <%--tr> 
	   
    <td class="lc1" >ʵ�ɳ��ʶ��Ԫ��</td>   
	<td class="lc2" ><input type="text" name="ACCONAM" id="ACCONAM" onblur='doblurregcap()' title="ʵ�ɳ��ʶ�"  maxlength=30 size="30%"></td>  	    
  </tr> 
  <tr> 	
	<td class="lc1" >ʵ�ɳ��ʷ�ʽ</td>   
	<td class="lc2" ><select size="1" name="ACCONFORM" title="���ʷ�ʽ��д�����ҡ�ʵ�֪ʶ��Ȩ������ʹ��Ȩ������" style="width:135px; ">
	<option value=''>��ѡ����ʷ�ʽ</option><%=icms.getSysDmList("CONFORM")%></select>
	</td> 
	
	<td class="lc1" >ʵ�ɳ���ʱ��</td>   
	<td class="lc2" ><input type="text" name="ACCONDATE" title="ʵ�ɳ���ʱ��" maxlength=10 datatype=DATE size="20%"  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
	</td>
	
	<td class='lc1'>ִ�кϻ������־</td>
	<td class="lc2">
	<select size="1" name="EXEAFFSIGN" title='ִ�кϻ������־'>
		<option value=''>--ִ�кϻ�����--</option>
		<option value='1'>ִ��</option>
		<option value='2'>��ִ��</option>
	</select>
	</td>
 </tr--%> 
<tr>
    <td class="lc1">����ʱ��</td>   
	<td class="lc2"><input type="text" name="CONDATE" title="����ʱ��" maxlength=10 datatype=DATE size="20%" disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})"><font color=red>*</font>
	</td>
	
	<td class="lc1" >���ʱ�����%��</td>   
	<td class="lc2" ><input type="text" name="SUBCONPROP" title="���ʱ���" maxlength=30 size="30%"></td>    
	
</tr>
 <tr>
    <td class="lc2" colspan='4' align="left"><p align="left" style="font-color: #000080;font-size: 9pt;">ע�⣺1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2�����ϻ��ˡ�����Ȼ�˹ɶ����⼮��Ȼ�ˡ����ȵģ�����д֤�����ͼ�֤�����룻����ģ�����д֤�����ͼ�֤�պ��롣<br>
</p>
    </td>    
</tr>   
</table>
<script>
function doblurregcap()
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	//var REGCAP = document.getElementById("REGCAP").value;
	if (fucCheckNUM(SUBCONAM))
	{
		if(SUBCONAM<0){
		    alert('�Ͻɳ��ʶ�����Ǹ�ֵ��');
			return false;
		}
		if (Math.abs(SUBCONAM)>999999999999)
		{
			alert('�Ͻɳ��ʶ��ϵͳ��󾫶ȣ�');
			return false;
		}
      //  if(REGCAP!=null&&REGCAP!=""&&(REGCAP-0)>0){
	  //     if(SUBCONAM/REGCAP>1){
	  //	       alert('�Ͻɳ��ʶ����ҵ��ע���ʱ���');
	  //		   return false;
	  //	   }else{
	  //	      document.getElementById("CONPROP").value=SUBCONAM/REGCAP*100;
	  //	   } 
	  //	}
	}
	else
	{
		alert('�Ͻɳ��ʶ�ӦΪ���֣�');
		return false;
	}

	var ACCONAM = document.getElementById("ACCONAM").value;
	if (fucCheckNUM(ACCONAM))
	{
		if(ACCONAM<0){
		    alert('ʵ�ɳ��ʶ�����Ǹ�ֵ��');
			return false;
		}
		if (Math.abs(ACCONAM)>999999999999)
		{
			alert('ʵ�ɳ��ʶ��ϵͳ��󾫶ȣ�');
			return false;
		}
		if((ACCONAM-SUBCONAM)>0)
	    {
	        alert('ʵ�ɳ��ʶ�ܴ����Ͻɳ��ʶ');
	        return false;
	    }
	}
	else
	{
		alert('ʵ�ɳ��ʶ�ӦΪ���֣�');
		return false;
	}
}
function chebaldelterm()//���ɸ�����  ʵ��<�Ͻɵ�ʱ�򣬱�����д���ֶ�
{
	var SUBCONAM =document.getElementById("SUBCONAM").value;
	var ACCONAM = document.getElementById("ACCONAM").value;
	var BALDELTERM = document.getElementById("BALDELTERM").value;
	if((ACCONAM-SUBCONAM)<0)
	{
	   if(BALDELTERM==null||BALDELTERM==""){
	      //alert('���ɸ����޲���Ϊ�գ�');
	      //return false;
	   }
	}
}
</script>