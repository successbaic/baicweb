<table border="1" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td class="yxsm" colspan="6" align="center">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>��˾������Ϣ</font>
        </p>
        </td>
      </tr>
<tr>   
	<td class="lc1" nowrap>��ҵ����</td>   
	<td class="lc2" colspan="3" >
	<input type="text" name="ENTNAME" READONLY size="60" title="��ҵ(����)����" maxlength=50 disblank>&nbsp;<font color=red>*</font></td>
	
	<td class="lc1" nowrap>����������</td>   
	<td class="lc2"><input type="text" name="LEREP" title="����������" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 

</tr>

<tr>	
	<td class="lc1" nowrap >ס��</td>   
 	<td class="lc2" colspan="5">
		<font color="red">˵����</font>��ҵס�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>									
						<select name="PROVINCE" id="PROVINCE" title="ʡ" onchange="writeDOM()">
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
	<td class="lc1" nowrap>ע���ʱ�</td>   
	<td class="lc2" nowrap>
	<input type="text" name="REGCAP" id="REGCAP" title="ע���ʱ�" size="15" onblur='doblurregcap()' maxlength=14  datatype=NUM>��Ԫ</td>  
	
	<td class="lc1" nowrap>��ϵ�绰</td>   
	<td class="lc2"><input type="text" name="TEL" title="��ϵ�绰" size="15" maxlength=20 disblank>&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1" nowrap>��������</td>   
	<td class="lc2"><input type="text" name="POSTALCODE" title="��������" datatype=int size="15" maxlength=6 disblank>&nbsp;<font color=red>*</font></td> 
</tr> 

<tr>
	<td class="lc1" nowrap>��Ӫ��Χ</td> 
	<td colspan="5">
		<table width="100%" style="border-style:none;">
			<tr>
				<td class="lc2" >
					<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>
				</td>
				<td class="lc2" width="33%">
					<input type="button" class="button" style="height:20px;width:120px;" name="" value="��Ӫ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')"> 
				</td>
			</tr>
		</table>
	</td>
</tr> 
<tr>  
	<td class="lc1" nowrap>��ҵ(����)����</td>   
	<td class="lc2" colspan="3" ><select id="ENTTYPE" name="ENTTYPE" disblank title="��ҵ(��������)" onchange="cheEnttypeForInsform(this.value)">
	<option value=""></option><%=icms.getSysDmList("ENTTYPE","GS")%></select>&nbsp;<font color=red>*</font>
	<input type="button" class="button"  style="height=20px;width=100px;" name="" value="��ҵ���ͼ���" onclick="javascript:window.open('utils/qylxDesc.jsp','','dialogWidth:900px;dialogHeight:700px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/>
	</td>   
	
	<td class="lc1" nowrap>������ʽ</td>
	<td class="lc2">
	<select id="INSFORM" name="INSFORM">
	<option value="">��</option><option value='01'>��������</option><option value='07'>ļ������</option></select>
	</select>	
	</td>
</tr>
<tr> 	
	<td class="lc1" nowrap>��Ǽǻ���</td>   
	<td class="lc2"><select name="REGORG" title="�������Ǽǻ���" disblank style="width:192px; "> 
	<option value=''>��ѡ��Ǽǻ���</option>
	<%=icms.getBsDjjg(XZQH)%>
	</select>&nbsp;<font color=red>*</font></td> 
	<td class="lc1" >��Ͻ��λ</td>
	<td class="lc2"><select name="OPELOCDISTRICT" title="��Ͻ��λ" style="width:220px;"> 
	<option value=''>��ѡ���Ͻ��λ</option>
	<%=icms.getDjjgListByPcoding(XZQH)%>
	</select></td> 
</tr>
<tr>
	<td class="lc1" nowrap>ִ�ո�����</td>   
	<td class="lc2"><input type="text" name="COPYNUM" title="������" datatype=INT size="10" maxlength=2 value=1 disblank>&nbsp;��<font color=red>*</font></td>
	<td class="lc1">Ӫҵ����</td>   
	<td class="lc2" width="25%">
		����<input type="checkbox" name="checkboxInput" id="check1"  title="Ӫҵ����" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" id="OPDATETO" title="Ӫҵ����" size="10" maxlength=10 >��
		</span><font color=red>*</font>
	</td> 
 </tr>
 <tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">
	˵�����к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����
	&nbsp;
	������дע����������
	<span style="cursor:pointer;color='red'" onclick="if(document.getElementById('span_info').style.display=='none'){document.getElementById('span_info').style.display='';}else{document.getElementById('span_info').style.display='none';}">����</span>
	�鿴
	<span id="span_info" style="display:none">
	<br>
	1���ɷ����޹�˾Ӧ��д������ʽ��������ʽ˵����ļ������1����Ϊ200(��200��)�����Ϲ������й�Ʊ��ļ������2����Ϊ����ļ��������
	<br>
	2��Ӫҵ���ޣ�����д�����ڡ����ߡ�XX�ꡱ����ҵ��Ӫҵ����Ҫ�빫˾�³�����д��Ӫҵ����һ�¡�
	<br>
	</span></p>	
	</td>   
 </tr>
</table>
<script language="javascript">
function checkSub(){
	//var a=doblurregcap();
	//var b=doblurreccap();
	var c=cheForInsform();
	//var d=cheforregcap();
	//var e=cheforreccap();
	if(c){
		return true;
	}else{
		return false;
	}	
}
function cheforregcap(){
   var REGCAP =document.getElementById("REGCAP").value;
   var REGORG =document.getElementById("REGORG").value;
   if(REGCAP!=null&&REGCAP!="")
	{
	   //if(REGCAP<=500&&REGORG=="371300"){
	   //    alert('ע���ʱ�С�ڵ���500��Ԫ�ģ�����Ǽǻ��ء�Ӧѡ����ҵס�����ڵص���(��)���֣̾�');
	   //    return false;
	   //}
	}
   return true;
}
function cheforreccap(){
   //var REGCAP =document.getElementById("REGCAP").value;
   //var RECCAP = document.getElementById("RECCAP").value;
   //if(REGCAP!=null&&REGCAP!=""&&RECCAP!=null&&RECCAP!=""){
   //   if(RECCAP<0.2*REGCAP){
   //     alert('ʵ���ʱ�Ӧ�ò�����ע���ʱ���20%');
  //      return false;
   //   }
   //   if(RECCAP<3){
    //    alert('ʵ���ʱ���������3��Ԫ');
    //    return false;
    //  }
   //}
   return true;
}
function cheForInsform(){
	var enttype=document.getElementById("ENTTYPE").value;
	if(enttype!=""){
		enttype=enttype.substr(0,2);
		if(enttype=="12" && document.getElementById("INSFORM").value==""){
			alert("�ɷ����޹�˾Ӧ��������ʽ��ѡ����д��Ϣ��");
			return false;
		}
	}
	if(!($("#check1").is(":checked")) && $.trim($("#OPDATETO").val()) == ""){
		alert("������Ӫҵ���ޣ�");
		return false;
	};
	return true;
}
function cheEnttypeForInsform(enttype){
	if(enttype==""){
		document.getElementById("INSFORM").disabled=false;
		return;
	}
	enttype=enttype.substr(0,2);
	if(enttype=="12"){	
		document.getElementById("INSFORM").disabled=false;
	}else{
		document.getElementById("INSFORM").value="";
		document.getElementById("INSFORM").disabled=true;
	}
}
function setBusscope()
{
document.form1.BUSSCOPE.value="���ɾ�Ӫ��Ŀ��"+document.form1.ABUITEMCO.value + "һ�㾭Ӫ��Ŀ��"+document.form1.CBUITEM.value;
}
</script>