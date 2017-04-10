<table align="center" border="1" width="90%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">个体工商户经营者(港澳居民)登记表</b><br><br></caption>	
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
    <td align="center" rowspan=4 nowrap=nowrap>香港居民<br>身份证件</td>
    <td align="center" height=40 colspan=4>证件名称</td>
    <td align="center">证件号码</td>
    <td align="center">证件有效期</td>
</tr>
<%
	String HCERTYPE=GTDJ_JYZXX.getHCERTYPE();
	
	String HCERNO=GTDJ_JYZXX.getHCERNO();
	String HCERVALPER=GTDJ_JYZXX.getHCERVALPER()+"";
	String MCERTYPE=GTDJ_JYZXX.getMCERTYPE();
	String MCERNO=GTDJ_JYZXX.getMCERNO();
	String MCERVALPER=GTDJ_JYZXX.getMCERVALPER()+"";
%>
<tr>
    <td colspan=4 height=40>1.香港永久性居民身份证</td>	
    <td>
    <%if(HCERTYPE.equals("1")){
		out.print(HCERNO);
	}%>
    </td>
    <td>
    <%if(HCERTYPE.equals("1")){
		out.print(HCERVALPER);
	}%>
    </td>
</tr>
<tr>   
    <td colspan=4 height=80>2.港澳居民来往内地通行证<%if("2".equals(HCERTYPE)){out.print(selected);}else{out.print(checkBox);} %>
    <br>&nbsp;&nbsp;香港特别行政区护照<%if("3".equals(HCERTYPE)){out.print(selected);}else{out.print(checkBox);} %></td>	
    <td>
    <%
		if(HCERTYPE.equals("2") || HCERTYPE.equals("3")){
			out.print(HCERNO);
		}
	%></td>
    <td>
	<%if(HCERTYPE.equals("2") || HCERTYPE.equals("3")){
		out.print(HCERVALPER);
	}%>
	</td>
</tr>
<tr>   
    <td colspan=4>3.香港律师（中国委托公证人）出具，中国法律服务（香港）有限公司确认的身份核证文件</td>	
    <td>
    <%if(HCERTYPE.equals("4")){
		out.print(HCERNO);
	}%>
    </td>
    <td>
    <%if(HCERTYPE.equals("4")){
		out.print(HCERVALPER);
	}%>
    </td>
</tr>

<tr>   
	 <td align="center" rowspan=2 nowrap=nowrap>澳门居民<br>身份证件</td>
    <td colspan=4 height=80>1.澳门永久性居民身份证<%if("1".equals(MCERTYPE)){out.print(selected);}else{out.print(checkBox);} %>
    <br>&nbsp;&nbsp;澳门居民身份证<%if("2".equals(MCERTYPE)){out.print(selected);}else{out.print(checkBox);} %></td>	
    <td>
    <%
    	if(MCERTYPE.equals("1") || MCERTYPE.equals("2")){
    		out.print(MCERNO);
    	}
     %></td>
    <td>
	<%
    	if(MCERTYPE.equals("1") || MCERTYPE.equals("2")){
    		out.print(MCERVALPER);
    	}
     %></td>
</tr>
<tr>   
    <td colspan=4 height=80>2.澳门特别行政区护照<%if("2".equals(MCERTYPE)){out.print(selected);}else{out.print(checkBox);} %>
    <br>&nbsp;&nbsp;澳门特别行政区政府身份证明局出具的身份证明书<%if("3".equals(MCERTYPE)){out.print(selected);}else{out.print(checkBox);} %></td>	
    <td>
    <%
    	if(MCERTYPE.equals("3") || MCERTYPE.equals("4")){
    		out.print(MCERNO);
    	}
     %></td>
    <td>
	<%
    	if(MCERTYPE.equals("3") || MCERTYPE.equals("4")){
    		out.print(MCERVALPER);
    	}
     %></td>
</tr>	
</table>
<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						注：1、住所及联系电话、邮政编码须填写经营者在内地的相关信息；
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2.同一栏中涉及两种以上身份证件的，只须选择提交一种；
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3.在选择的类型 □ 中打√。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4.各类身份证件复印件另附。
					</p>
				</td>
			</TR>
			
		</table>