<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_JYXYDao"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="jyxy" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />
<jsp:useBean id="jyxy1" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />
<jsp:useBean id="SZCP_SXSZ" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
	<jsp:useBean id="createHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title></title>
<style>
#printa {
	 background-image: url("../images/ly/next_page.png");
    background-repeat: no-repeat;
    color: #ffffff;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    height: 33px;
    line-height: 35px;
    text-align: center;
    width: 105px;
}
.jyxy a:link {
    color:#ffffff;
    text-decoration:none;
}
.jyxy a:visited {
    color:#ffffff;
    text-decoration:none;
}
.jyxy a:hover {
    color:#ffffff;
    text-decoration:none;
}
.jyxy a:active {
    color:#ffffff;
    text-decoration:none;
}
.jygl,.htgl,.htlx,.jbxx,.shxy,.shry,.xgzs {
	line-height: 30px;
	text-align: center;
	color: #000000;
	font-size: 9pt;
	cursor: pointer;
	width: 81px;
	height: 30px;
	background: transparent url(../images/tab/tabbefore.png) no-repeat;
	/*���ie��֧��background-size*/
	background-size :cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/tab/tabbefore.png',sizingMethod='scale');
	border: 0px solid black;
}

.jyxy {
	width: 81px;
	height: 30px;
	background: transparent url(../images/tab/tabafter.png) no-repeat;
	/*���ie��֧��background-size*/
	background-size :cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/tab/tabafter.png',sizingMethod='scale');
	line-height: 30px;
	text-align: center;
	color: #FFFFFF;
	font-size: 9pt;
	cursor: pointer;
    border: 0px solid black;
}
.jbxx a,.jygl a,.htgl a,.htlx a,.jyxy a,.shxy a,.shry a,.xgzs a{ position:relative; display:inline-block;}
.form1{
	margin: 0px;padding: 0px;
}
</style>
</head>
<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">
	<%@include file="top_szcp.inc"%>
	<%
	String regNo = request.getParameter("REG_NO");
	String year = request.getParameter("EVAL_YEAR");
	String CERNO = request.getParameter("CerNO");
	SZCP_SQ_JYXYDao jyxyDao = new SZCP_SQ_JYXYDao();
	
	SZCP_SXSZ = SZCP_SXSZ.querySZCP_SXSZ(year);
	String REPORT_YEAR1 = SZCP_SXSZ.getREPORT_YEAR1();
	String REPORT_YEAR2 = SZCP_SXSZ.getREPORT_YEAR2();
	jyxy = jyxyDao.querySZCP_SQ_JYXY(regNo,year,REPORT_YEAR1);
	jyxy1 = jyxyDao.querySZCP_SQ_JYXY(regNo,year,REPORT_YEAR2);
%>
	
	<%=createHeaderUtil.createHeader(regNo,year,CERNO,"5","") %>
	<!-- form�� -->
	<form class="form1" name="form1" method="POST" action="szcp_sq_jyxy_action.jsp">
		<input type="hidden" value="<%=regNo %>" name="REGNO" id="REG_NO">
		<input type="hidden" value="<%=year %>" name="EVAL_YEAR"
			id="EVAL_YEAR">
		<input type="hidden" value="<%=REPORT_YEAR1 %>" name="REPORT_YEAR1"
			id="REPORT_YEAR1">
		<input type="hidden" value="<%=REPORT_YEAR2 %>" name="REPORT_YEAR2"
			id="REPORT_YEAR2">


			
		<table border="1" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="yxsm" colspan="4" align="center">
					<p style="font-color: #000080;font-size: 11pt;font-weight: bold;">
						<font color=#000080>��ӪЧ��</font>
					</p>
				</td>
			</tr>

			<tr>
				<td class="lc1">��Ŀ/���</td>
				<td class="lc1"><%=REPORT_YEAR1 %>�꣨%��</td>
				<td class="lc1"><%=REPORT_YEAR2 %>�꣨%��</td>
			</tr>
			<tr>
				<td class="lc1">Ӫҵ����������(%)</td>
				<td class="lc2"><input type="text" name="REVE_GROW_RATE"
					id="REVE_GROW_RATE" size="40" title="Ӫҵ����������(%)" maxlength=9
					value="<%=jyxy.getREVE_GROW_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="REVE_GROW_RATE1"
					id="REVE_GROW_RATE1" size="40" title="Ӫҵ����������(%)" maxlength=9
					value="<%=jyxy1.getREVE_GROW_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">��Ӫҵ��������(%)</td>
				<td class="lc2"><input type="text" name="PRI_GROW_RATE"
					size="40" id="PRI_GROW_RATE" title="��Ӫҵ��������(%)" maxlength=9
					value="<%=jyxy.getPRI_GROW_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="PRI_GROW_RATE1"
					size="40" id="PRI_GROW_RATE1" title="��Ӫҵ��������(%)" maxlength=9
					value="<%=jyxy1.getPRI_GROW_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">���ʲ�������(%)</td>
				<td class="lc2"><input type="text" name="NET_ASSET_RATE"
					id="NET_ASSET_RATE" size="40" title="���ʲ�������(%)" maxlength=9
					value="<%=jyxy.getNET_ASSET_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="NET_ASSET_RATE1"
					id="NET_ASSET_RATE1" size="40" title="���ʲ�������(%)" maxlength=9
					value="<%=jyxy1.getNET_ASSET_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">�ʲ���ծ��(%)</td>
				<td class="lc2"><input type="text" name="DEBT_ASSET_RATE"
					id="DEBT_ASSET_RATE" size="40" title="�ʲ���ծ��(%)" maxlength=9
					value="<%=jyxy.getDEBT_ASSET_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="DEBT_ASSET_RATE1"
					id="DEBT_ASSET_RATE1" size="40" title="�ʲ���ծ��(%)" maxlength=9
					value="<%=jyxy1.getDEBT_ASSET_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">�ٶ�����(%)</td>
				<td class="lc2"><input type="text" name="QUICK_ACT_RATE"
					id="QUICK_ACT_RATE" size="40" title="�ٶ�����(%)" maxlength=9
					value="<%=jyxy.getQUICK_ACT_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="QUICK_ACT_RATE1"
					id="QUICK_ACT_RATE1" size="40" title="�ٶ�����(%)" maxlength=9
					value="<%=jyxy1.getQUICK_ACT_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">Ӧ���˿���ת��(%)</td>
				<td class="lc2"><input type="text" name="RECV_TNOV_RATE"
					id="RECV_TNOV_RATE" size="40" title="Ӧ���˿���ת��(%)" maxlength=9
					value="<%=jyxy.getRECV_TNOV_RATE() %>"/>&nbsp;<font color=red>*</font>
				</td>
				<td class="lc2"><input type="text" name="RECV_TNOV_RATE1"
					id="RECV_TNOV_RATE1" size="40" title="Ӧ���˿���ת��(%)" maxlength=9
					value="<%=jyxy1.getRECV_TNOV_RATE() %>"/>&nbsp;<font color=red>*</font>
				</td>
			</tr>

			<tr>
				<td class="lc1">�����˿�ռӦ���˿����(%)</td>
				<td class="lc2"><input type="text" name="RCV_OVERDUE_RATE"
					id="RCV_OVERDUE_RATE" size="40" title="�����˿�ռӦ���˿����(%)"
					maxlength=9 value="<%=jyxy.getRCV_OVERDUE_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="RCV_OVERDUE_RATE1"
					id="RCV_OVERDUE_RATE1" size="40" title="�����˿�ռӦ���˿����(%)"
					maxlength=9 value="<%=jyxy1.getRCV_OVERDUE_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">�����˿�ռӦ���˿����(%)</td>
				<td class="lc2"><input type="text" name="PAY_OVERDUE_RATE"
					id="PAY_OVERDUE_RATE" size="40" title="�����˿�ռӦ���˿����(%)"
					maxlength=9 value="<%=jyxy.getPAY_OVERDUE_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="PAY_OVERDUE_RATE1"
					id="PAY_OVERDUE_RATE1" size="40" title="�����˿�ռӦ���˿����(%)"
					maxlength=9 value="<%=jyxy1.getPAY_OVERDUE_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

		</table>
		<br>
		<CENTER>
		<div style="display:inline">
		<a id="printa"
			href="print/szcp_sq_jyxy_print.jsp?REG_NO=<%=regNo%>&EVAL_YEAR=<%=year %>"
			target="_blank">��ӡ��ҳ</a></div>
			
			<div class="subImgs" style="display:inline" onclick="checkError()">
				��һ��</div>
		</CENTER>
	</form>
	<%@include file="../bottom.inc"%>
	<script type="text/javascript">
		function checkError() {
			var REVE_GROW_RATE = $("#REVE_GROW_RATE").val();
			if (REVE_GROW_RATE == null || REVE_GROW_RATE == "") {
				alert("������Ӫҵ����������(%) !");
				return;
			} else {
				if (fucCheckNUM(REVE_GROW_RATE) == 0) {
					alert("Ӫҵ����������(%), ���������ָ�ʽ!");
					return;
				}else {
					if(REVE_GROW_RATE.indexOf(".") >= 0) {
						var arr = REVE_GROW_RATE.split(".");
						if(arr[1].length > 4) {
							alert("Ӫҵ����������(%),���Ϊ4λС��");
							return
						}
					}else {
						if(REVE_GROW_RATE.length > 4) {
							alert("Ӫҵ����������(%),�������4λ����");
							return
						}
					}
				}
			}
			
			var REVE_GROW_RATE1 = $("#REVE_GROW_RATE1").val();
			if (REVE_GROW_RATE1 == null || REVE_GROW_RATE1 == "") {
				alert("������Ӫҵ����������(%) !");
				return;
			} else {
				if (fucCheckNUM(REVE_GROW_RATE1) == 0) {
					alert("Ӫҵ����������(%), ���������ָ�ʽ!");
					return;
				}else {
					if(REVE_GROW_RATE1.indexOf(".") >= 0) {
						var arr = REVE_GROW_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("Ӫҵ����������(%),���Ϊ4λС��");
							return
						}
					}else {
						if(REVE_GROW_RATE1.length > 4) {
							alert("Ӫҵ����������(%),�������4λ����");
							return
						}
					}
				}
			}

			var PRI_GROW_RATE = $("#PRI_GROW_RATE").val();
			if (PRI_GROW_RATE == null || PRI_GROW_RATE == "") {
				alert("��������Ӫҵ��������(%) !");
				return;
			} else {
				if (fucCheckNUM(PRI_GROW_RATE) == 0) {
					alert("��Ӫҵ��������(%), ���������ָ�ʽ!");
					return;
				}else {
					if(PRI_GROW_RATE.indexOf(".") >= 0) {
						var arr = PRI_GROW_RATE.split(".");
						if(arr[1].length > 4) {
							alert("��Ӫҵ��������(%),���Ϊ4λС��");
							return
						}
					}else {
						if(PRI_GROW_RATE.length > 4) {
							alert("��Ӫҵ��������(%),�������4λ����");
							return
						}
					}
				}
			}
			
			
			var PRI_GROW_RATE1 = $("#PRI_GROW_RATE1").val();
			if (PRI_GROW_RATE1 == null || PRI_GROW_RATE1 == "") {
				alert("��������Ӫҵ��������(%) !");
				return;
			} else {
				if (fucCheckNUM(PRI_GROW_RATE1) == 0) {
					alert("��Ӫҵ��������(%), ���������ָ�ʽ!");
					return;
				}else {
					if(PRI_GROW_RATE1.indexOf(".") >= 0) {
						var arr = PRI_GROW_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("��Ӫҵ��������(%),���Ϊ4λС��");
							return
						}
					}else {
						if(PRI_GROW_RATE1.length > 4) {
							alert("��Ӫҵ��������(%),�������4λ����");
							return
						}
					}
				}
			}
			
			var NET_ASSET_RATE = $("#NET_ASSET_RATE").val();
			if (NET_ASSET_RATE == null || NET_ASSET_RATE == "") {
				alert("�����뾻�ʲ�������(%) !");
				return;
			} else {
				if (fucCheckNUM(NET_ASSET_RATE) == 0) {
					alert("���ʲ�������(%), ���������ָ�ʽ!");
					return;
				}else {
					if(NET_ASSET_RATE.indexOf(".") >= 0) {
						var arr = NET_ASSET_RATE.split(".");
						if(arr[1].length > 4) {
							alert("���ʲ�������(%),���Ϊ4λС��");
							return
						}
					}else {
						if(NET_ASSET_RATE.length > 4) {
							alert("���ʲ�������(%),�������4λ����");
							return
						}
					}
				}
			}
			
			var NET_ASSET_RATE1 = $("#NET_ASSET_RATE1").val();
			if (NET_ASSET_RATE1 == null || NET_ASSET_RATE1 == "") {
				alert("�����뾻�ʲ�������(%) !");
				return;
			} else {
				if (fucCheckNUM(NET_ASSET_RATE1) == 0) {
					alert("���ʲ�������(%), ���������ָ�ʽ!");
					return;
				}else {
					if(NET_ASSET_RATE1.indexOf(".") >= 0) {
						var arr = NET_ASSET_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("���ʲ�������(%),���Ϊ4λС��");
							return
						}
					}else {
						if(NET_ASSET_RATE1.length > 4) {
							alert("���ʲ�������(%),�������4λ����");
							return
						}
					}
				}
			}

			var DEBT_ASSET_RATE = $("#DEBT_ASSET_RATE").val();
			if (DEBT_ASSET_RATE == null || DEBT_ASSET_RATE == "") {
				alert("�������ʲ���ծ��(%) !");
				return;
			} else {
				if (fucCheckNUM(DEBT_ASSET_RATE) == 0) {
					alert("�ʲ���ծ��(%), ���������ָ�ʽ!");
					return;
				}else {
					if(DEBT_ASSET_RATE.indexOf(".") >= 0) {
						var arr = DEBT_ASSET_RATE.split(".");
						if(arr[1].length > 4) {
							alert("�ʲ���ծ��(%),���Ϊ4λС��");
							return
						}
					}else {
						if(DEBT_ASSET_RATE.length > 4) {
							alert("�ʲ���ծ��(%),�������4λ����");
							return
						}
					}
				}
			}
			
			var DEBT_ASSET_RATE1  = $("#DEBT_ASSET_RATE1").val();
			if (DEBT_ASSET_RATE1 == null || DEBT_ASSET_RATE1 == "") {
				alert("�������ʲ���ծ��(%) !");
				return;
			} else {
				if (fucCheckNUM(DEBT_ASSET_RATE1) == 0) {
					alert("�ʲ���ծ��(%), ���������ָ�ʽ!");
					return;
				}else {
					if(DEBT_ASSET_RATE1.indexOf(".") >= 0) {
						var arr = DEBT_ASSET_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("�ʲ���ծ��(%),���Ϊ4λС��");
							return
						}
					}else {
						if(DEBT_ASSET_RATE1.length > 4) {
							alert("�ʲ���ծ��(%),�������4λ����");
							return
						}
					}
				}
			}
			

			var QUICK_ACT_RATE = $("#QUICK_ACT_RATE").val();
			if (QUICK_ACT_RATE == null || QUICK_ACT_RATE == "") {
				alert("�������ٶ�����(%) !");
				return;
			} else {
				if (fucCheckNUM(QUICK_ACT_RATE) == 0) {
					alert("�ٶ�����(%), ���������ָ�ʽ!");
					return;
				}else {
					if(QUICK_ACT_RATE.indexOf(".") >= 0) {
						var arr = QUICK_ACT_RATE.split(".");
						if(arr[1].length > 4) {
							alert("�ٶ�����(%),���Ϊ4λС��");
							return
						}
					}else {
						if(QUICK_ACT_RATE.length > 4) {
							alert("�ٶ�����(%), �������4λ����");
							return
						}
					}
				}
			}
			
			
			var QUICK_ACT_RATE1 = $("#QUICK_ACT_RATE1").val();
			if (QUICK_ACT_RATE1 == null || QUICK_ACT_RATE1 == "") {
				alert("�������ٶ�����(%) !");
				return;
			} else {
				if (fucCheckNUM(QUICK_ACT_RATE1) == 0) {
					alert("�ٶ�����(%), ���������ָ�ʽ!");
					return;
				}else {
					if(QUICK_ACT_RATE1.indexOf(".") >= 0) {
						var arr = QUICK_ACT_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("�ٶ�����(%),���Ϊ4λС��");
							return
						}
					}else {
						if(QUICK_ACT_RATE1.length > 4) {
							alert("�ٶ�����(%), �������4λ����");
							return
						}
					}
				}
			}
			
			

			var RECV_TNOV_RATE = $("#RECV_TNOV_RATE").val();
			if (RECV_TNOV_RATE == null || RECV_TNOV_RATE == "") {
				alert("������Ӧ���˿���ת��(%) !");
				return;
			} else {
				if (fucCheckNUM(RECV_TNOV_RATE) == 0) {
					alert("�˿���ת��(%), ���������ָ�ʽ!");
					return;
				}else {
					if(RECV_TNOV_RATE.indexOf(".") >= 0) {
						var arr = RECV_TNOV_RATE.split(".");
						if(arr[1].length > 4) {
							alert("�˿���ת��(%),���Ϊ4λС��");
							return
						}
					}else {
						if(RECV_TNOV_RATE.length > 4) {
							alert("�˿���ת��(%), �������4λ����");
							return
						}
					}
				}
			}
			
			var RECV_TNOV_RATE1 = $("#RECV_TNOV_RATE1").val();
			if (RECV_TNOV_RATE1 == null || RECV_TNOV_RATE1 == "") {
				alert("������Ӧ���˿���ת��(%) !");
				return;
			} else {
				if (fucCheckNUM(RECV_TNOV_RATE1) == 0) {
					alert("�˿���ת��(%), ���������ָ�ʽ!");
					return;
				}else {
					if(RECV_TNOV_RATE1.indexOf(".") >= 0) {
						var arr = RECV_TNOV_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("�˿���ת��(%),���Ϊ4λС��");
							return
						}
					}else {
						if(RECV_TNOV_RATE1.length > 4) {
							alert("�˿���ת��(%), �������4λ����");
							return
						}
					}
				}
			}
			

			var RCV_OVERDUE_RATE = $("#RCV_OVERDUE_RATE").val();
			if (RCV_OVERDUE_RATE == null || RCV_OVERDUE_RATE == "") {
				alert("�����������˿�ռӦ���˿����(%) !");
				return;
			} else {
				if (fucCheckNUM(RCV_OVERDUE_RATE) == 0) {
					alert("�����˿�ռӦ���˿����(%), ���������ָ�ʽ!");
					return;
				}else {
					if(RCV_OVERDUE_RATE.indexOf(".") >= 0) {
						var arr = RCV_OVERDUE_RATE.split(".");
						if(arr[1].length > 4) {
							alert("�����˿�ռӦ���˿����(%),���Ϊ4λС��");
							return
						}
					}else {
						if(RCV_OVERDUE_RATE.length > 4) {
							alert("�����˿�ռӦ���˿����(%), �������4λ����");
							return
						}
					}
				}
			}
			
			var RCV_OVERDUE_RATE1 = $("#RCV_OVERDUE_RATE1").val();
			if (RCV_OVERDUE_RATE1 == null || RCV_OVERDUE_RATE1 == "") {
				alert("�����������˿�ռӦ���˿����(%) !");
				return;
			} else {
				if (fucCheckNUM(RCV_OVERDUE_RATE1) == 0) {
					alert("�����˿�ռӦ���˿����(%), ���������ָ�ʽ!");
					return;
				}else {
					if(RCV_OVERDUE_RATE1.indexOf(".") >= 0) {
						var arr = RCV_OVERDUE_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("�����˿�ռӦ���˿����(%),���Ϊ4λС��");
							return
						}
					}else {
						if(RCV_OVERDUE_RATE1.length > 4) {
							alert("�����˿�ռӦ���˿����(%), �������4λ����");
							return
						}
					}
				}
			}

			var PAY_OVERDUE_RATE = $("#PAY_OVERDUE_RATE").val();
			if (PAY_OVERDUE_RATE == null || PAY_OVERDUE_RATE == "") {
				alert("�����������˿�ռӦ���˿����(%) !");
				return;
			} else {
				if (fucCheckNUM(PAY_OVERDUE_RATE) == 0) {
					alert("�����˿�ռӦ���˿����(%), ���������ָ�ʽ!");
					return;
				}else {
					if(PAY_OVERDUE_RATE.indexOf(".") >= 0) {
						var arr = PAY_OVERDUE_RATE.split(".");
						if(arr[1].length > 4) {
							alert("�����˿�ռӦ���˿����(%),���Ϊ4λС��");
							return
						}
					}else {
						if(PAY_OVERDUE_RATE.length > 4) {
							alert("�����˿�ռӦ���˿����(%), �������4λ����");
							return
						}
					}
				}
			}
			
			var PAY_OVERDUE_RATE1 = $("#PAY_OVERDUE_RATE1").val();
			if (PAY_OVERDUE_RATE1 == null || PAY_OVERDUE_RATE1 == "") {
				alert("�����������˿�ռӦ���˿����(%) !");
				return;
			} else {
				if (fucCheckNUM(PAY_OVERDUE_RATE1) == 0) {
					alert("�����˿�ռӦ���˿����(%), ���������ָ�ʽ!");
					return;
				}else {
					if(PAY_OVERDUE_RATE1.indexOf(".") >= 0) {
						var arr = PAY_OVERDUE_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("�����˿�ռӦ���˿����(%),���Ϊ4λС��");
							return
						}
					}else {
						if(PAY_OVERDUE_RATE1.length > 4) {
							alert("�����˿�ռӦ���˿����(%), �������4λ����");
							return
						}
					}
				}
			}
			
			document.form1.submit();
			alert("����ɹ�");
		}
	</script>

</body>
</html>