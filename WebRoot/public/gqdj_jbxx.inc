
<table border="1" width="100%" cellpadding="0" cellspacing="0">
  <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>股权出质登记信息</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1">股权所在公司名称</td>   
	<td class="lc2"><input type="text" name="ENTNAME"  size="50" title="股权所在公司名称" maxlength=70 readonly></td>    
	<td class="lc1">注册号</td>   
	<td class="lc2" ><input type="text" name="REGNO" title="注册号" size="20" maxlength=15 readonly ></td> 
</tr> 
<tr> 
	<td class="lc1">出质人姓名（名称）</td>   
	<td class="lc2"><input type="text" readonly name="EXPMOR" title="出质人姓名（名称）"  title="出质人姓名（名称）" size="50" maxlength=70 disblank>&nbsp;<font color=red>*</font>
	<input type="button" class="button"  name="EXPMOR_SELECT" value="选 择" onClick="framejumpTo('selectTZRALL.jsp','action=1&ID=<%=ID%>')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	</td> 
	<td class="lc1">证照号码</td>   
	<td class="lc2"><input type="text" name="EXPMORBLICNO" title="证照号码" size="20" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
</tr> 
<tr> 
	<td class="lc1">出质人电话</td>   
	<td class="lc2"><input type="text"  name="EXPORGTEL" title="出质人电话"  size="20" maxlength=20 disblank>&nbsp;<font color=red>*</font>
	</td> 
	<td class="lc1">质权人电话</td>   
	<td class="lc2"><input type="text" name="IMPORGTEL" title="质权人电话" size="20" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
</tr> 
<tr> 
	<td class="lc1">质权人姓名（名称）</td>   
	<td class="lc2"><input type="text" name="IMPMOR" title="质权人姓名（名称）"  size="50" maxlength=70 disblank>&nbsp;<font color=red>*</font>
			<input type="button" class="button"  name="IMPMOR_SELECT" value="选 择" onClick="framejumpTo('selectCZR.jsp','action=1&PRIPID=<%=PRIPID%>')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	
	</td> 
	
	<td class="lc1">证照号码</td>   &nbsp;<font color=red>*</font>
        <td class="lc2"><input type="text" name="IMPMORBLICNO" title="证照号码" size="20" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 

</tr> 
<tr>
	<td class="lc1">出质股权数额</td>   
	<td class="lc2" colspan="3">
	<input type="text"  name="EXPSHARAM" title="出质股权数额" size="20" onblur='doblurexpsharam()' maxlength=14 disblank datatype=NUM>万元/万股 &nbsp;<font color=red>*</font></td>  
	
</tr> 
<tr>
	<td class="lc1">被担保债权数额</td>   
	<td class="lc2">
	<input type="text"  name="PRICLASECAM" title="被担保债权数额" size="20" onblur='doblurexpsharam()' maxlength=14 disblank datatype=NUM>万元&nbsp;<font color=red>*</font></td>  
	<td class="lc1">合同文号</td>   
	<td class="lc2" colspan="3"><input type="text" name="MORREGNO" title="合同文号" size="20" maxlength=50 ></td> 
	
</tr> 

<tr>  
	<td class="lc1">出质人类型</td>   
	<td class="lc2" ><select name="EXPMORTYPE" title="出质人类型"  disblank>
	<option value=''>请选择出质人类型</option>
	<%=icms.getSysDmList("EXPMORTYPE")%></select> &nbsp;<font color=red>*</font></td>   
  
	<td class="lc1">股权类型</td>   
	<td class="lc2" ><select name="SHARTYPE" title="股权类型" disblank >
        <option value=''>请选择股权类型</option>
	     <option value='1'>万元</option>
	     <option value='2'>股</option>
	    </select> &nbsp;<font color=red>*</font></td>   
 
</tr> 
<tr>  
	<td class="lc1">登记机关</td>   
	<td class="lc2" >
	<select name="REGORG" title="登记机关" disblank> 
	<option value=''>请选择登记机关</option>
	<%=icms.getSysDmList("REGORG")%>
	</select>&nbsp;<font color=red>*</font></td>
	<td class="lc1">质权人类型</td>   
	<td class="lc2" ><select name="IMPMORTYPE" title="质权人类型" disblank >
	<option value=''>请选择质权人类型</option>
	<%=icms.getSysDmList("IMPMORTYPE")%></select> &nbsp;<font color=red>*</font></td>   
</tr> 
<tr>    
	<td class="lc1">备注</td>
	<td class="lc2" colspan="4">
	<textarea rows="2" name="REMARK" cols="70" title="备注" maxlength=500> </textarea>（不超过500字）
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
			alert('出质股权数额超过系统最大精度！');
			return false;
		}
	}
	else
	{
		alert('出质股权数额应为数字！');
		return false;
	}

	var PRICLASECAM = dwr.util.getValue("PRICLASECAM");
	if (fucCheckNUM(PRICLASECAM))
	{
		if (Math.abs(PRICLASECAM)>999999999999)
		{
			alert('被担保债权数额超过系统最大精度！');
			return false;
		}
	}
	else
	{
		alert('被担保债权数额应为数字！');
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
		if (data==1)	// 该股东已经出质（未注撤销）
		{
			alert('该股东已经出质（未注撤销）！');
			//document.form1.btSave.disabled=true;
		}
		else if (data==2)
		{
			alert('该股东出质信息在流程中已存在！');
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


