<table border="1" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="yxsm" colspan="2" align="center">
			<p style="font-color: #000080; font-size: 11pt; font-weight: bold;">
				<font color=#000080>������Ϣ</font>
			</p></td>
	</tr>
	<tr>
		<td class="lc1" nowrap>������ҵ����</td>
		<td class="lc2"><input type="text" name="ENTNAME" size="60"
			title="��ҵ(����)����" maxlength=50 disblank readonly="readonly">
			&nbsp; <font color=red>*</font></td>
	</tr>
	<tr>
		<td class="lc1" nowrap>��ѡ��ҵ����1</td>
		<td class="lc2"><input type="text" name="ENTNAME1"
			readonly="readonly" size="60" title="��ѡ��ҵ����1" maxlength=50>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>��ѡ��ҵ����2</td>
		<td class="lc2"><input type="text" name="ENTNAME2"
			readonly="readonly" size="60" title="��ѡ��ҵ����2" maxlength=50>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>��ѡ��ҵ����3</td>
		<td class="lc2"><input type="text" name="ENTNAME3"
			readonly="readonly" size="60" title="��ѡ��ҵ����3" maxlength=50>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="lc1" nowrap>��Ӫ��Χ</td>
		<td><textarea rows="8" id="BUSSCOPE" name="BUSSCOPE" title="��Ӫ��Χ"
				disblank cols="70" maxlength=2000></textarea>&nbsp;<font color=red>*</font>

			<input type="button" class="button" style="height=20px;width=120px;"
			name="" value="��Ӫ��Χѡ��..." onClick="getJYFWStr('BUSSCOPE')"
			onMouseOver="this.className='mouseover'"
			onMouseOut="this.className='button'"></td>
	</tr>

	<tr>

		<td class="lc1" nowrap>ע���ʱ�����</td>
		<td class="lc2" nowrap><input type="text" name="REGCAP"
			id="REGCAP" title="ע���ʱ�" size="15" onblur='doblurregcap()'
			maxlength=14 datatype=NUM> &nbsp;&nbsp;&nbsp;����Ԫ��&nbsp;</td>


	</tr>

	<tr>
		<td class="lc1" nowrap>��Ǽǻ���</td>
		<td class="lc2" nowrap><select name="PREREGORG" id="PREREGORG"
			disblank title="��Ǽǻ���" disabled>
				<option value=""></option>
				<%									
					out.println(icms.getBsDjjg(XZQH));
				%>
		</select></td>
	</tr>

	<tr>
		<td class="lc1" nowrap>��ҵ(����)����</td>
		<td class="lc2"><select id="ENTTYPE" name="ENTTYPE" disblank
			title="��ҵ(��������)">
				<option value=""></option>
				<%
					if (ENTCLASS.equals("1")) {
				%>
				<option value='1110'>1110|�������ι�˾(���ж���)</option>
				<option value='1140'>1140|�������ι�˾(���пع�)</option>
				<option value='1152'>1152|�������ι�˾(��Ȼ��Ͷ�ʻ�عɵķ��˶���)</option>
				<option value='1213'>1213|�ɷ����޹�˾(���С����пع�)</option>
				<option value='1223'>1223|�ɷ����޹�˾(�����С����пع�)</option>
				<option value='2110'>2110|�������ι�˾�ֹ�˾(���ж���)</option>
				<option value='2140'>2140|�������ι�˾�ֹ�˾(���пع�)</option>
				<option value='2152'>2152|�������ι�˾�ֹ�˾(��Ȼ��Ͷ�ʻ�عɵķ��˶���)</option>
				<option value='2213'>2213|�ɷ����޹�˾�ֹ�˾(���С����пع�)</option>
				<option value='2223'>2223|�ɷ����޹�˾�ֹ�˾(���пع�)</option>
				<%=icms.getSysDmList("ENTTYPE", "NZYY")%>
				<%=icms.getSysDmList("ENTTYPE", "NZFR")%>
				<%
					} else if (ENTCLASS.equals("2")) {
				%>
				<option value='1120'>1120|�������ι�˾(����Ͷ����ҵͶ��)</option>
				<option value='1121'>1121|�������ι�˾(����Ͷ����ҵ����)</option>
				<option value='1122'>1122|�������ι�˾(����Ͷ����ҵ�����ʺ���)</option>
				<option value='1123'>1123|�������ι�˾(����Ͷ����ҵ���˶���)</option>
				<option value='1130'>1130|�������ι�˾(��Ȼ��Ͷ�ʻ�ع�)</option>
				<option value='1150'>1150|һ���������ι�˾</option>
				<option value='1151'>1151|�������ι�˾(��Ȼ�˶���)</option>
				<option value='1152'>1152|�������ι�˾(��Ȼ��Ͷ�ʻ�عɵķ��˶���)</option>
				<option value='1190'>1190|�����������ι�˾</option>
				<option value='1200'>1200|�ɷ����޹�˾</option>
				<option value='1210'>1210|�ɷ����޹�˾(����)</option>
				<option value='1211'>1211|�ɷ����޹�˾(���С�����Ͷ����ҵͶ��)</option>
				<option value='1212'>1212|�ɷ����޹�˾(���С���Ȼ��Ͷ�ʻ�ع�)</option>
				<option value='1219'>1219|�����ɷ����޹�˾(����)</option>
				<option value='1220'>1220|�ɷ����޹�˾(������)</option>
				<option value='1221'>1221|�ɷ����޹�˾(�����С�����Ͷ����ҵͶ��)</option>
				<option value='1222'>1222|�ɷ����޹�˾(�����С���Ȼ��Ͷ�ʻ�ع�)</option>
				<option value='1229'>1229|�����ɷ����޹�˾(������)</option>
				<option value='2000'>2000|���ʷֹ�˾</option>
				<option value='2100'>2100|�������ι�˾�ֹ�˾</option>
				<option value='2120'>2120|�������ι�˾�ֹ�˾(����Ͷ����ҵͶ��)</option>
				<option value='2121'>2121|�������ι�˾�ֹ�˾(����Ͷ����ҵ����)</option>
				<option value='2122'>2122|�������ι�˾�ֹ�˾(����Ͷ����ҵ�����ʺ���)</option>
				<option value='2123'>2123|�������ι�˾�ֹ�˾(����Ͷ����ҵ���˶���)</option>
				<option value='2130'>2130|�������ι�˾�ֹ�˾(��Ȼ��Ͷ�ʻ�ع�)</option>
				<option value='2150'>2150|һ���������ι�˾�ֹ�˾</option>
				<option value='2151'>2151|�������ι�˾�ֹ�˾(��Ȼ�˶���)</option>
				<option value='2152'>2152|�������ι�˾�ֹ�˾(��Ȼ��Ͷ�ʻ�عɵķ��˶���)</option>
				<option value='2190'>2190|�����������ι�˾�ֹ�˾</option>
				<option value='2200'>2200|�ɷ����޹�˾�ֹ�˾</option>
				<option value='2210'>2210|�ɷ����޹�˾�ֹ�˾(����)</option>
				<option value='2211'>2211|�ɷ����޹�˾�ֹ�˾(���С�����Ͷ����ҵͶ��)</option>
				<option value='2212'>2212|�ɷ����޹�˾�ֹ�˾(���С���Ȼ��Ͷ�ʻ�ع�)</option>
				<option value='2219'>2219|�����ɷ����޹�˾�ֹ�˾(����)</option>
				<option value='2220'>2220|�ɷ����޹�˾�ֹ�˾(������)</option>
				<option value='2221'>2221|�ɷ����޹�˾�ֹ�˾(�����С�����Ͷ����ҵͶ�ʣ�</option>
				<option value='2222'>2222|�ɷ����޹�˾�ֹ�˾(�����С���Ȼ��Ͷ�ʻ�ع�)</option>
				<option value='2229'>2229|�����ɷ����޹�˾�ֹ�˾(������)</option>
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
		</select> &nbsp; <font color=red>*</font></td>

	</tr>
	<tr>
		<td class="lc1" nowrap>��ҵס����</td>
		<td class="lc2"><font color="red">
		˵����</font>��ҵס�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���
		<br />
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
	</tr>

	<tr>
		<td class="lc2" colspan="2">
			<p align="left" style="font-color: #000080; font-size: 9pt;">
				˵�����к�ɫ <font color=red>*</font>��ʾ����ĿΪ�����
			</p></td>
	</tr>
</table>