
<table border="1" width="100%" cellpadding="0" cellspacing="0">
  <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>��Ȩ���ʵǼ���Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1">��Ȩ���ڹ�˾����</td>   
	<td class="lc2"><input type="text" name="ENTNAME"  size="50" title="��Ȩ���ڹ�˾����" maxlength=70 readonly></td>    
	<td class="lc1">ע���</td>   
	<td class="lc2" ><input type="text" name="REGNO" title="ע���" size="20" maxlength=15 readonly ></td> 
</tr> 
<tr> 
	<td class="lc1">���������������ƣ�</td>   
	<td class="lc2"><input type="text" readonly name="EXPMOR" title="���������������ƣ�"  title="���������������ƣ�" size="50" maxlength=70 disblank>&nbsp;<font color=red>*</font>
	<input type="button" class="button"  name="EXPMOR_SELECT" value="ѡ ��" onClick="framejumpTo('selectTZRALL.jsp','action=1&ID=<%=ID%>')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	</td> 
	<td class="lc1">֤�պ���</td>   
	<td class="lc2"><input type="text" name="EXPMORBLICNO" title="֤�պ���" size="20" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
</tr> 
<tr> 
	<td class="lc1">�����˵绰</td>   
	<td class="lc2"><input type="text"  name="EXPORGTEL" title="�����˵绰"  size="20" maxlength=20 disblank>&nbsp;<font color=red>*</font>
	</td> 
	<td class="lc1">��Ȩ�˵绰</td>   
	<td class="lc2"><input type="text" name="IMPORGTEL" title="��Ȩ�˵绰" size="20" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
</tr> 
<tr> 
	<td class="lc1">��Ȩ�����������ƣ�</td>   
	<td class="lc2"><input type="text" name="IMPMOR" title="��Ȩ�����������ƣ�"  size="50" maxlength=70 disblank>&nbsp;<font color=red>*</font>
			<input type="button" class="button"  name="IMPMOR_SELECT" value="ѡ ��" onClick="framejumpTo('selectCZR.jsp','action=1&PRIPID=<%=PRIPID%>')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	
	</td> 
	
	<td class="lc1">֤�պ���</td>   &nbsp;<font color=red>*</font>
        <td class="lc2"><input type="text" name="IMPMORBLICNO" title="֤�պ���" size="20" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 

</tr> 
<tr>
	<td class="lc1">���ʹ�Ȩ����</td>   
	<td class="lc2" colspan="3">
	<input type="text"  name="EXPSHARAM" title="���ʹ�Ȩ����" size="20" onblur='doblurexpsharam()' maxlength=14 disblank datatype=NUM>��Ԫ/��� &nbsp;<font color=red>*</font></td>  
	
</tr> 
<tr>
	<td class="lc1">������ծȨ����</td>   
	<td class="lc2">
	<input type="text"  name="PRICLASECAM" title="������ծȨ����" size="20" onblur='doblurexpsharam()' maxlength=14 disblank datatype=NUM>��Ԫ&nbsp;<font color=red>*</font></td>  
	<td class="lc1">��ͬ�ĺ�</td>   
	<td class="lc2" colspan="3"><input type="text" name="MORREGNO" title="��ͬ�ĺ�" size="20" maxlength=50 ></td> 
	
</tr> 

<tr>  
	<td class="lc1">����������</td>   
	<td class="lc2" ><select name="EXPMORTYPE" title="����������"  disblank>
	<option value=''>��ѡ�����������</option>
	<%=icms.getSysDmList("EXPMORTYPE")%></select> &nbsp;<font color=red>*</font></td>   
  
	<td class="lc1">��Ȩ����</td>   
	<td class="lc2" ><select name="SHARTYPE" title="��Ȩ����" disblank >
        <option value=''>��ѡ���Ȩ����</option>
	     <option value='1'>��Ԫ</option>
	     <option value='2'>��</option>
	    </select> &nbsp;<font color=red>*</font></td>   
 
</tr> 
<tr>  
	<td class="lc1">�Ǽǻ���</td>   
	<td class="lc2" >
	<select name="REGORG" title="�Ǽǻ���" disblank> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getSysDmList("REGORG")%>
	</select>&nbsp;<font color=red>*</font></td>
	<td class="lc1">��Ȩ������</td>   
	<td class="lc2" ><select name="IMPMORTYPE" title="��Ȩ������" disblank >
	<option value=''>��ѡ����Ȩ������</option>
	<%=icms.getSysDmList("IMPMORTYPE")%></select> &nbsp;<font color=red>*</font></td>   
</tr> 
<tr>    
	<td class="lc1">��ע</td>
	<td class="lc2" colspan="4">
	<textarea rows="2" name="REMARK" cols="70" title="��ע" maxlength=500> </textarea>��������500�֣�
	</td>
	
</tr> 
</table>
<script type='text/javascript' src='<%=request.getContextPath()%>/support/util.js'></script>
<script lang=javascript>
function doblurexpsharam()
{
	var EXPSHARAM = dwr.util.getValue("EXPSHARAM");
	if (fucCheckNUM(EXPSHARAM))
	{
		if (Math.abs(EXPSHARAM)>999999999999)
		{
			alert('���ʹ�Ȩ�����ϵͳ��󾫶ȣ�');
			return false;
		}
	}
	else
	{
		alert('���ʹ�Ȩ����ӦΪ���֣�');
		return false;
	}

	var PRICLASECAM = dwr.util.getValue("PRICLASECAM");
	if (fucCheckNUM(PRICLASECAM))
	{
		if (Math.abs(PRICLASECAM)>999999999999)
		{
			alert('������ծȨ�����ϵͳ��󾫶ȣ�');
			return false;
		}
	}
	else
	{
		alert('������ծȨ����ӦΪ���֣�');
		return false;
	}	
}
	function showTZRXX()
	{	
		var ret=window.showModalDialog('../gqdj/selectTZRALL.jsp?PRIPID=<%=PRIPID%>&ISALL=1','0','scroll=yes;resizable=yes;center=yes;');
		if (ret==null)
		{
			return;
		}
		document.form1.EXPMOR.value=ret[0];

		if (ret[2]!=null && ret[2]!="")
			document.form1.EXPMORBLICNO.value=ret[2];
		else
			document.form1.EXPMORBLICNO.value=ret[3];
	}
	function sblur()
	{
		//var entname=dwr.util.getValue("ENTNAME");
		//var expmor =dwr.util.getValue("EXPMOR");
		//GQDJ_JBXX_ZS.hadBeenExped(entname, expmor, memcheck);
	}
	function memcheck(data) 
	{
		if (data==1)	// �ùɶ��Ѿ����ʣ�δע������
		{
			alert('�ùɶ��Ѿ����ʣ�δע��������');
			//document.form1.btSave.disabled=true;
		}
		else if (data==2)
		{
			alert('�ùɶ�������Ϣ���������Ѵ��ڣ�');
			//document.form1.btSave.disabled=true;
		}
		else
			document.form1.btSave.disabled=false;
	}

	function showCZRXX()
	{	
		window.open('../gqdj/selectCZR.jsp','','Width=800px;Height=600px;scroll=yes;resizable=yes;center=yes;');			
	}
</script>

