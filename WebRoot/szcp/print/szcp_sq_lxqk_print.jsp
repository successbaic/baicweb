<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<jsp:useBean id="Page" scope="session"class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SZCP_SQ_LXQK_IN_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN" />
<jsp:useBean id="SZCP_SQ_LXQK_IN_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN" />
<jsp:useBean id="SZCP_SQ_LXQK_OUT_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT" />
<jsp:useBean id="SZCP_SQ_LXQK_OUT_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT" />
<jsp:useBean id="SZCP_SQ_LXQK_RATE_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE" />
<jsp:useBean id="SZCP_SQ_LXQK_RATE_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE" />
<jsp:useBean id="SZCP_SXSZ" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" src="<%=request.getContextPath() %>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath() %>/szcp/css/print.css" type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath() %>/szcp/css/NoPrint.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ͬ����</title>
</head>
<body style="margin-top: 0; margin-bottom: 0">
	<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
		id="wb" name="wb" width="0"></OBJECT>
	<%
		String REG_NO = request.getParameter("REG_NO");
		String YEAR = request.getParameter("EVAL_YEAR");
		String CERNO = request.getParameter("CerNO");
		SZCP_SXSZ = SZCP_SXSZ.querySZCP_SXSZ(YEAR);
		String REPORT_YEAR1 = SZCP_SXSZ.getREPORT_YEAR1();
		String REPORT_YEAR2 = SZCP_SXSZ.getREPORT_YEAR2();
		SZCP_SQ_LXQK_IN_LAST = SZCP_SQ_LXQK_IN_LAST.querySZCP_SQ_LXQK_IN(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_IN_NEXT = SZCP_SQ_LXQK_IN_NEXT.querySZCP_SQ_LXQK_IN(REG_NO,YEAR,REPORT_YEAR2);
		SZCP_SQ_LXQK_OUT_LAST = SZCP_SQ_LXQK_OUT_LAST.querySZCP_SQ_LXQK_OUT(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_OUT_NEXT = SZCP_SQ_LXQK_OUT_NEXT.querySZCP_SQ_LXQK_OUT(REG_NO,YEAR,REPORT_YEAR2);
		SZCP_SQ_LXQK_RATE_LAST= SZCP_SQ_LXQK_RATE_LAST.querySZCP_SQ_LXQK_RATE(REG_NO,YEAR,REPORT_YEAR1);
		SZCP_SQ_LXQK_RATE_NEXT= SZCP_SQ_LXQK_RATE_NEXT.querySZCP_SQ_LXQK_RATE(REG_NO,YEAR,REPORT_YEAR2);
	%>
	<!-- form�� -->
	<form name="form1" method="POST" action="szcp_sq_lxqk_action.jsp">
		<input type="hidden" name="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR">
		<input type="hidden" name="REG_NO" value="<%=REG_NO%>" id="REG_NO">
		<input type="hidden" name="REPORT_YEAR1"   value="<%=REPORT_YEAR1%>" id="REPORT_YEAR1">
		<input type="hidden" name="REPORT_YEAR2"   value="<%=REPORT_YEAR2%>" id="REPORT_YEAR2">

		<div style="text-align: right;" class="noprint">
			<input type=button name=button_print value="��ӡ"
				onclick="javascript:print()"> <input type=button
				name=button_show value="��ӡԤ��" onclick="javascript:printpreview();">
		</div>
		<table border="1" width="90%" align="center" bordercolor="#000000">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>��ͬ����״��</center></b><br>
				<br>
			</caption>
			<tr align='center' height=44>
				<td  colspan="3" rowspan="2">��Ŀ/���</td>
				<td  colspan="2"><%=REPORT_YEAR1%>��</td>
				<td  colspan="2"><%=REPORT_YEAR2%>��</td>
			</tr>
			<tr align='center' height=44>
				<td >�����Ժ�ͬ</td>
				<td >֧���Ժ�ͬ</td>
				<td >�����Ժ�ͬ</td>
				<td >֧���Ժ�ͬ</td>
			</tr>
			
<!-- 			<tr height="44">
				<td align='center' height=25 width="40%" colspan="3">�������</td>
				<td align='center'>�����Ժ�ͬ</td>
				<td align='center'>֧���Ժ�ͬ</td>
			</tr> -->

			<tr>
				<td align='center' height=25 width="20%" rowspan="2" colspan="2">�����ͬ����</td>
				<td align="center" height=25 width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align="center" height=25 width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height=25 width="20%" rowspan="2" colspan="2">����:����ǩ���������ͬ</td>
				<td align="center" height=25 width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getLAST_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align="center" height=25 width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getLAST_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height=25 width="20%" rowspan="2" colspan="2">����Ӧ�����к�ͬ</td>
				<td align="center" height=25 width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getPLAN_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getPLAN_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getPLAN_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getPLAN_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align="center" height=25 width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getPLAN_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getPLAN_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getPLAN_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getPLAN_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height=25 width="20%" rowspan="2" colspan="2">����ʵ�����к�ͬ</td>
				<td align="center" height=25 width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getREAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getREAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getREAL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getREAL_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align="center" height=25 width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getREAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getREAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getREAL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getREAL_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height=25 width="20%" rowspan="2" colspan="2">������ͬ</td>
				<td align="center" height=25 width="20%">�������ݣ�</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getCANCEL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getCANCEL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getCANCEL_CONT_QTY()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getCANCEL_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align="center" height=25 width="20%">����Ԫ��</td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_LAST.getCANCEL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_LAST.getCANCEL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_IN_NEXT.getCANCEL_CONT_RMB_W()%></td>
				<td align="center"><%=SZCP_SQ_LXQK_OUT_NEXT.getCANCEL_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height=25 width="20%" rowspan="2" colspan="2">Э������ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCOMP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCOMP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCOMP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCOMP_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCOMP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCOMP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCOMP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCOMP_CONT_RMB_W()%></td>
			</tr>


			<tr>
				<td align='center' height=25 width="20%" rowspan="2" colspan="2">������ʽ�����ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOTHER_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOTHER_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOTHER_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOTHER_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOTHER_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOTHER_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOTHER_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOTHER_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height=25 width="20%" rowspan="2"colspan="2">�����ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCHANGE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCHANGE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCHANGE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCHANGE_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getCHANGE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getCHANGE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getCHANGE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getCHANGE_CONT_RMB_W()%></td>
			</tr>



			<tr>
				<td align='center' height=25 width="20%" rowspan="2" colspan="2">����δ���еĺ�ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOVERDUE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOVERDUE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOVERDUE_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOVERDUE_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getOVERDUE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getOVERDUE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getOVERDUE_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getOVERDUE_CONT_RMB_W()%></td>
			</tr>

			<tr>
				<td rowspan="6" align='center' >����</td>
				<td align='center' height=25 width="20%" rowspan="2">����ΥԼ��ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_OUR_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_OUR_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_OUR_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_OUR_QTY()%></td>
			</tr>


			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_OUR_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_OUR_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_OUR_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_OUR_RMB_W()%></td>
			</tr>

			<tr>
				<td align='center' height=25 width="20%" rowspan="2">�Է�ΥԼ��ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_THEY_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_THEY_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_THEY_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_THEY_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_THEY_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_THEY_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_THEY_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_THEY_RMB_W()%></td>
			</tr>
			<tr>
				<td align='center' height=25 width="20%" rowspan="2">�򲻿ɿ���δ���к�ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_GOD_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_GOD_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_GOD_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_GOD_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getDFT_GOD_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getDFT_GOD_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getDFT_GOD_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getDFT_GOD_RMB_W()%></td>
			</tr>

			<tr align='center' >
				<td rowspan="2" colspan="2">���������ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getLAST_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_DISP_CONT_QTY()%></td>
			</tr>

			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getLAST_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getLAST_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getLAST_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getLAST_DISP_CONT_RMB_W()%></td>
			</tr>

			<tr align='center' >
				<td rowspan="2" style="width: 2%" colspan="2">�ۼ������ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_DISP_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getTOTAL_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getTOTAL_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getTOTAL_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getTOTAL_DISP_CONT_RMB_W()%></td>
			</tr>

			<tr align='center' >
				<td rowspan="2" style="width: 2%" colspan="2">��������ͬ</td>
				<td align='center' height=25 width="20%">�������ݣ�</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getSOLVE_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getSOLVE_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getSOLVE_DISP_CONT_QTY()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getSOLVE_DISP_CONT_QTY()%></td>
			</tr>
			<tr>
				<td align='center' height=25 width="20%">����Ԫ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_LAST.getSOLVE_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_LAST.getSOLVE_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_IN_NEXT.getSOLVE_DISP_CONT_RMB_W()%></td>
				<td align='center'><%=SZCP_SQ_LXQK_OUT_NEXT.getSOLVE_DISP_CONT_RMB_W()%></td>
			</tr>
		</table>
		<br>
		<p class="PageNext">
			<br><br>
		<table border="1" width="90%" align="center" bordercolor="#000000">

	 		<tr align='center' height=44>
				<td  colspan="2" >��Ŀ/���</td>
				<td  ><%=REPORT_YEAR1%>��</td>
				<td  ><%=REPORT_YEAR2%>��</td>
			</tr>
			
			<tr>
				<td align='center' height=44 colspan="2">���������Ժ�ͬʵ����Լ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getRECV_PRFM_QTY_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getRECV_PRFM_QTY_RATE()%> %</td>
			</tr>
			
			<tr>
				<td align='center' height=44 colspan="2">����֧���Ժ�ͬʵ����Լ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getPAY_PRFM_QTY_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getPAY_PRFM_QTY_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">��ĩӦ�տ�ռ�����Ժ�ͬ�ܶ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getRECV_AMT_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getRECV_AMT_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">��ĩӦ����ռ֧���Ժ�ͬ�ܶ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getPAY_AMT_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getPAY_AMT_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">��ͬ������</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getREVOKE_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getREVOKE_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44  colspan="2">Э������ͬ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getCOMP_RQTE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getCOMP_RQTE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">������ʽ�����ͬ��</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getOTHER_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getOTHER_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44  colspan="2">��ͬ�����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getCHANGE_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getCHANGE_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 colspan="2">����δ���еĺ�ͬ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getOVERDUE_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getOVERDUE_RATE()%> %</td>
			</tr>
			
			<tr>
			<td rowspan="3" align='center' >����</td>
				<td align='center' height=44 >����ΥԼ��ͬ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDFT_OUR_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDFT_OUR_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 >�Է�ΥԼ��ͬ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDFT_THEY_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDFT_THEY_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44 >�򲻿ɿ�������δ���к�ͬ����</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getGOD_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getGOD_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44  colspan="2">��ͬ������</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getDISP_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getDISP_RATE()%> %</td>
			</tr>
			<tr>
				<td align='center' height=44  colspan="2">��ͬ��������</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_LAST.getSOLVE_RATE()%> %</td>
				<td align='center'><%=SZCP_SQ_LXQK_RATE_NEXT.getSOLVE_RATE()%> %</td>
			</tr>
		</table>
		<br>
	</form>
	</ body>
</html>