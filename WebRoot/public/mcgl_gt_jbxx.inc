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
			��������
		</td>
		<td class="lc2" colspan="5">
			<input type="text" name="ENTNAME"  size="60"
				title="��������" maxlength=50 disblank readonly="readonly">
			&nbsp;
			<font color=red>*</font>
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			��ѡ����1
		</td>
		<td class="lc2" colspan="5">
			<input type="text" name="ENTNAME1" readonly="readonly" size="60"
				title="��ѡ����1" maxlength=50 >
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			��ѡ����2
		</td>
		<td class="lc2" colspan="5">
			<input type="text" name="ENTNAME2" readonly="readonly" size="60"
				title="��ѡ����2" maxlength=50 >
			&nbsp;
		</td>
	</tr>
	<!--
	<tr>
		<td class="lc1" nowrap>
			��ѡ����3
		</td>
		<td class="lc2" colspan="5">
			<input type="text" name="ENTNAME3" readonly="readonly" size="60"
				title="��ѡ����3" maxlength=50 >
			&nbsp;
		</td>
	</tr>
	-->
	<tr>
		<td class="lc1" colspan="1" rowspan="3" nowrap>
			��Ӫ��
		</td>
		<td class="lc1" colspan="1" nowrap>
			��  	��
		</td>
		<td class="lc2" colspan="4">
			<input type="text" name="OWNERNAME"  size="40"
				title="����" maxlength=50 disblank>
			<font color=red>*</font>
		</td>
	</tr>
	<tr>
		<td class="lc1" colspan="1" nowrap>
			��ϵ�绰
		</td>
		<td class="lc2" colspan="4">
			<input type="text" name="OWNERTEL"  size="40"
					title="��ϵ�绰" maxlength=50 disblank>
				<font color=red>*</font>
		</td>
	</tr>				
	<tr>
		<td class="lc1" colspan="1" nowrap>
			����֤��
		</td>
		<td class="lc2" colspan="4">
			<input type="text" name="CERNO"  size="40" title="����֤��" maxlength=50 disblank>
				<font color=red>*</font>
		</td>
	</tr>				
	<tr>
		<td class="lc1" nowrap>
			��Ӫ��Χ
		</td>
		<td colspan="5">
			
						<textarea rows="5" id="BUSSCOPE" name="BUSSCOPE" title="��Ӫ��Χ" cols="70" maxlength=1500></textarea>
						<input type="button" class="button" style="" name=""
							value="��Ӫ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')">
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			��Ӫ����
		</td>
		<td class="lc2"  colspan="5">
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
 		                <input type="text" name="VILLAGE" id="VILLAGE" title="��" size="23" maxlength=25 onchange="writeDOM()">��·/��/������
 		                <input type="text" name="HOUSENUMBER" id="HOUSENUMBER" title="��" size="10" maxlength=25 onchange="writeDOM()">���ţ� 
						<br>
						��¼��ľ�Ӫ����Ϊ��<input type="text" name="DOM" id="DOM" maxlength="100" disblank style="width:380px;" title="��ҵ���ڵ�"> <font color=red>*</font>
					</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			��Ǽǻ���
		</td>
		<td class="lc2" colspan="5">
			<select name="PREREGORG" id="PREREGORG" disblank title="��Ǽǻ���" disabled>
				<option value=""></option>
				<%out.println(icms.getBsDjjg(XZQH));%>
			</select>
		</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>
			����������
		</td>
		<td class="lc2" colspan="5">
			<select id="LOCALADM" name="LOCALADM" disblank title="����������">
				<option value=""></option>
				<%				
				out.print(icms.getBjgGss(MCGL_JBXX.getPREREGORG()));
				%>
				</select>
			&nbsp;
			<font color=red>*</font>
		</td>

	</tr>

	<tr>
		<td class="lc2" colspan="6">
			<p align="left" style="font-color: #000080; font-size: 9pt;">
				˵�����к�ɫ
				<font color=red>*</font>��ʾ����ĿΪ�����
			</p>
		</td>
	</tr>
</table>
<input type="hidden" name="ENTTYPE" id="ENTTYPE" value="9999">