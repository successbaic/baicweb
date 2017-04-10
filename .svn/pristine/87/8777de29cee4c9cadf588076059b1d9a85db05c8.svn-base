<table align="center" border="1" width="90%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">个体工商户经营者(台湾农民)登记表</b><br><br></caption>	
<tr>
	<td align="center" width="10%"  height=40>姓    名</td>
	<td width="20%"><%=GTDJ_JYZXX.getNAME()%></td>
	<td align="center" width="10%" nowrap=nowrap>性别</td>
	<td width="15%"><%=icms.getSysDm("SEX",GTDJ_JYZXX.getSEX())%></td>
	<td align="center" width="10%" nowrap="nowrap">出生日期</td>
	<td width="20%"><%=GTDJ_JYZXX.getBIRTHDAY()%></td>
	<td align="center" width="15%" rowspan="4">照  片<br>粘贴处</td>
</tr>
<tr>	
	<td align="center" width="10%" height=40>文化程度</td>
	<td><%=icms.getSysDm("LITEDEG",GTDJ_JYZXX.getLITEDEG()) %></td>
	<td align="center" colspan=2>职业状况</td>
	<td colspan=2><%=GTDJ_JYZXX.getOCCSTBEAPP() %></td>
</tr>
<tr>
    <td align="center" height=40>住所</td>	
    <td colspan=5><%=GTDJ_JYZXX.getDOM() %></td>
</tr>
<tr>
    <td align="center" height=40>电子邮箱</td>	
    <td colspan=5><%=GTDJ_JYZXX.getEMAIL() %></td>
</tr>
<tr>
    <td align="center" height=40 colspan=2>邮政编码</td>
    <td colspan=2><%=GTDJ_JYZXX.getPOSTALCODE() %></td>
    <td align="center">联系电话</td>
    <td colspan=2><%=GTDJ_JYZXX.getTEL() %></td>
</tr>
<Tr>
    <td align="center" rowspan=4 nowrap=nowrap>身份证件</td>
    <td align="center" height=40 colspan=4>证件名称</td>
    <td align="center">证件号码</td>
    <td align="center">证件有效期</td>
</tr>
<%
	String TCERTYPE=GTDJ_JYZXX.getTCERTYPE();
	String TCERNO=GTDJ_JYZXX.getTCERNO();
	String TCERVALPER=GTDJ_JYZXX.getTCERVALPER()+"";
	String TCERNAME=GTDJ_JYZXX.getTCERNAME();
	String TCERNUM=GTDJ_JYZXX.getTCERNUM();
%>
<tr>
    <td colspan=4 height=40>1.暂住证</td>	
    <td>
    <%if(TCERTYPE.equals("1")){out.print(TCERNO);}  %>
    </td>
    <td><%if(TCERTYPE.equals("1")){out.print(TCERVALPER);}  %></td>
</tr>
<tr>   
    <td colspan=4 height=40>2.台湾居民来往大陆通行证</td>	
   <td>
    <%if(TCERTYPE.equals("2")){out.print(TCERNO);}  %>
    </td>
    <td><%if(TCERTYPE.equals("2")){out.print(TCERVALPER);}  %></td>
</tr>
<tr>   
    <td colspan=4 height=40>3.台湾居民身份证件</td>	
    <td>
    <%if(TCERTYPE.equals("3")){out.print(TCERNO);}  %>
    </td>
    <td><%if(TCERTYPE.equals("3")){out.print(TCERVALPER);}  %></td>
</tr>
<tr>
    <td align="center" colspan=2 height=40>台湾农民身份证明<br>文件名称</td>
    <td colspan=3><%=TCERNAME %></td>
    <td align="center">文件编号</td>
    <td><%=TCERNUM %></td>
</tr>	
</table>
<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						注：1、住所及联系电话、邮政编码须填写经营者在大陆的相关信息；
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2.申请登记为台湾农民个体工商户的，应当提交台湾农民身份证明文件,包括：加入台湾农业组织证明或台湾农民健康保险证明或台湾农民老年津贴证明等（只需提交一种）；
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3.各类身份证件复印件另附。
					</p>
				</td>
			</TR>
			
		</table>