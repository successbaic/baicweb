<table border="1" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td class="yxsm" colspan="6" align="center">
		<p
			style="font-color: #000080; font-size: 11pt; font-weight: bold;">
			<font color=#000080>������Ϣ</font>
		</p>
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		��������ҵ����
	</td>
	<td class="lc2" colspan="3">
		<input type="text" name="ENTNAME" size="60" title="��ҵ(����)����"
			maxlength=50 disblank readonly="readonly">
		&nbsp;
		<font color=red>*</font>
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		��ѡ��ҵ����1
	</td>
	<td class="lc2" colspan="3">
		<input type="text" name="ENTNAME1" readonly="readonly" size="60"
			title="��ѡ��ҵ����1" maxlength=50 >
		&nbsp;
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		��ѡ��ҵ����2
	</td>
	<td class="lc2" colspan="3">
		<input type="text" name="ENTNAME2" readonly="readonly" size="60"
			title="��ѡ��ҵ����2" maxlength=50 >
		&nbsp;
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		��ѡ��ҵ����3
	</td>
	<td class="lc2" colspan="3">
		<input type="text" name="ENTNAME3" readonly="readonly" size="60"
			title="��ѡ��ҵ����3" maxlength=50 >
		&nbsp;
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		�ⶨ��ҵס��
	</td>
	<td class="lc2" colspan="3">
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
						<%=ContrInfo.getBenShiQuXianOption(icms,XZQH,MCGL_JBXX.getCITY())%>
					</select>
					����/��/�ؼ���/�죩 
					<input type="text" name="TOWN" id="TOWN" title="��" size="23" maxlength=25 onchange="writeDOM()">����/������/��/�ֵ��� 
					<input type="text" name="VILLAGE" id="VILLAGE" title="��" size="23" maxlength=25	onchange="writeDOM()">��·/��/������ 
					<input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="��" size="10" maxlength=25 	onchange="writeDOM()">���ţ�
					<br>
						��¼�����ҵ���ڵ�Ϊ��
					<input type="text" name="DOM" id="DOM" disblank maxlength="100" style="width:380px" title="��ҵ���ڵ�">
					<font color=red>*</font></td>
					</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		��Ǽǻ���
	</td>
	<td class="lc2" nowrap colspan="3">
		<select name="PREREGORG" id="PREREGORG" disblank title="��Ǽǻ���" disabled>
			<option value=""></option>
			<%			
			out.println(icms.getBsDjjg(XZQH));%>
		</select>
	</td>
</tr>
<tr>
<td class="lc1">Ͷ���ܶ�</td>
<td class="lc2">
<input style="margin-left: 10px;height: 18px;width: 150px;" type="text" maxlength="14" id="CONGRO" name="CONGRO" title="���" datatype='NUM'> ��Ԫ
</td>
<td class="lc1">����</td>
<td class="lc2">
<input type="text" name="CONGROCUR_TEXT" id="CONGROCUR_TEXT" disabled>
<input type="hidden" name="CONGROCUR" id="CONGROCUR" title="Ͷ���ܶ����" ><input type="button" class="button" onclick="getSelDm('CONGROCUR','CURRENCY')" value="ѡ ��..">					

</td>
</tr>

<tr>
<td class="lc1">ע���ʱ�</td>
<td class="lc2">
<input style="margin-left: 10px;height: 18px;width: 150px;" type="text" id="REGCAP" name="REGCAP" title="���" datatype='NUM' maxlength="14"> ��Ԫ

</td>
<td class="lc1">����</td>
<td class="lc2">
<input type="text" name="REGCAPCUR_TEXT" id="REGCAPCUR_TEXT" disabled>
<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" title="ע���ʱ�����" ><input type="button" class="button" onclick="getSelDm('REGCAPCUR','CURRENCY')" value="ѡ ��..">

</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		��ҵ����
	</td>
	<td class="lc2" colspan="3">
		<select id="ENTTYPE" name="ENTTYPE" disblank title="��ҵ(��������)">
			<option value=""></option>
			<%
				if (ENTCLASS.equals("1")) {
			%>
			<%=icms.getSysDmList("ENTTYPE", "GS")%>
			<%=icms.getSysDmList("ENTTYPE", "FGS")%>
			<%=icms.getSysDmList("ENTTYPE", "NZYY")%>
			<%=icms.getSysDmList("ENTTYPE", "NZFR")%>
			<%
				} else if (ENTCLASS.equals("2")) {
			%>
			<%=icms.getSysDmList("ENTTYPE", "GS")%>
			<%=icms.getSysDmList("ENTTYPE", "FGS")%>
			<%=icms.getSysDmList("ENTTYPE", "GRDZ")%>
			<%=icms.getSysDmList("ENTTYPE", "GRDZFZ")%>
			<%=icms.getSysDmList("ENTTYPE", "HHQY")%>
			<%=icms.getSysDmList("ENTTYPE", "HHQYFZ")%>
			<%
				} else if (ENTCLASS.equals("6")) {
			%>
			<%=icms.getSysDmList("ENTTYPE", "HZS")%>
			<%=icms.getSysDmList("ENTTYPE", "HZSFZ")%>
			<%
				} else if (ENTCLASS.equals("8")) {
			%>
			<%=icms.getSysDmList("ENTTYPE", "WZGS")%>
			<%=icms.getSysDmList("ENTTYPE", "WZFZ")%>
			<%=icms.getSysDmList("ENTTYPE", "WGDB")%>
			<%=icms.getSysDmList("ENTTYPE", "WGJY")%>
			<%=icms.getSysDmList("ENTTYPE", "WZHH")%>
			<%=icms.getSysDmList("ENTTYPE", "WZHHFZ")%>
			<%
				}
			%>
		</select>
		&nbsp;
		<font color=red>*</font>						
	</td>
</tr>
<tr>
	<td class="lc1" nowrap>
		��Ӫ����
	</td>
	<td class="lc2" colspan="3">
		����<input type="checkbox" name="checkboxInput" id="check1"  title="Ӫҵ����" size="15" maxlength=20 onclick="opfyears(this)">
		<span id="year">/
			<input type="text" name="OPDATETO" id="OPDATETO" title="Ӫҵ����" size="10" maxlength=10 >��
		<font color=red>*</font>
	</td>
</tr>			
	<tr>
	<td class="lc1" nowrap>��Ӫ��Χ</td> 
	<td colspan="3">
	<table width="100%" style="border-style:none;">
	<tr>
	<td rowspan="3" class="lc2" >
	<textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="" cols="70" maxlength=2000></textarea>
	</td>
	<td class="lc2" width="33%">
	<input type="button" class="button" style="height=20px;width=120px;" name="" value="��Ӫ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')"  onMouseOver="this.className='mouseover'" onMouseOut="this.className='button'"> 
	</td>
	</tr>
	
	</table>
	</td>

				<tr>
		<td class="lc2" colspan="6">
			<p align="left" style="font-color: #000080; font-size: 9pt;">
				˵�����к�ɫ
				<font color=red>*</font>��ʾ����ĿΪ�����
			</p>
		</td>
	</tr>
</table>