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
	/*解决ie不支持background-size*/
	background-size :cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/tab/tabbefore.png',sizingMethod='scale');
	border: 0px solid black;
}

.jyxy {
	width: 81px;
	height: 30px;
	background: transparent url(../images/tab/tabafter.png) no-repeat;
	/*解决ie不支持background-size*/
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
	<!-- form表单 -->
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
						<font color=#000080>经营效益</font>
					</p>
				</td>
			</tr>

			<tr>
				<td class="lc1">项目/年份</td>
				<td class="lc1"><%=REPORT_YEAR1 %>年（%）</td>
				<td class="lc1"><%=REPORT_YEAR2 %>年（%）</td>
			</tr>
			<tr>
				<td class="lc1">营业收入增长率(%)</td>
				<td class="lc2"><input type="text" name="REVE_GROW_RATE"
					id="REVE_GROW_RATE" size="40" title="营业收入增长率(%)" maxlength=9
					value="<%=jyxy.getREVE_GROW_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="REVE_GROW_RATE1"
					id="REVE_GROW_RATE1" size="40" title="营业收入增长率(%)" maxlength=9
					value="<%=jyxy1.getREVE_GROW_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">主营业务利润率(%)</td>
				<td class="lc2"><input type="text" name="PRI_GROW_RATE"
					size="40" id="PRI_GROW_RATE" title="主营业务利润率(%)" maxlength=9
					value="<%=jyxy.getPRI_GROW_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="PRI_GROW_RATE1"
					size="40" id="PRI_GROW_RATE1" title="主营业务利润率(%)" maxlength=9
					value="<%=jyxy1.getPRI_GROW_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">净资产收益率(%)</td>
				<td class="lc2"><input type="text" name="NET_ASSET_RATE"
					id="NET_ASSET_RATE" size="40" title="净资产收益率(%)" maxlength=9
					value="<%=jyxy.getNET_ASSET_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="NET_ASSET_RATE1"
					id="NET_ASSET_RATE1" size="40" title="净资产收益率(%)" maxlength=9
					value="<%=jyxy1.getNET_ASSET_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">资产负债率(%)</td>
				<td class="lc2"><input type="text" name="DEBT_ASSET_RATE"
					id="DEBT_ASSET_RATE" size="40" title="资产负债率(%)" maxlength=9
					value="<%=jyxy.getDEBT_ASSET_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="DEBT_ASSET_RATE1"
					id="DEBT_ASSET_RATE1" size="40" title="资产负债率(%)" maxlength=9
					value="<%=jyxy1.getDEBT_ASSET_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">速动比率(%)</td>
				<td class="lc2"><input type="text" name="QUICK_ACT_RATE"
					id="QUICK_ACT_RATE" size="40" title="速动比率(%)" maxlength=9
					value="<%=jyxy.getQUICK_ACT_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="QUICK_ACT_RATE1"
					id="QUICK_ACT_RATE1" size="40" title="速动比率(%)" maxlength=9
					value="<%=jyxy1.getQUICK_ACT_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">应收账款周转率(%)</td>
				<td class="lc2"><input type="text" name="RECV_TNOV_RATE"
					id="RECV_TNOV_RATE" size="40" title="应收账款周转率(%)" maxlength=9
					value="<%=jyxy.getRECV_TNOV_RATE() %>"/>&nbsp;<font color=red>*</font>
				</td>
				<td class="lc2"><input type="text" name="RECV_TNOV_RATE1"
					id="RECV_TNOV_RATE1" size="40" title="应收账款周转率(%)" maxlength=9
					value="<%=jyxy1.getRECV_TNOV_RATE() %>"/>&nbsp;<font color=red>*</font>
				</td>
			</tr>

			<tr>
				<td class="lc1">逾期账款占应收账款比例(%)</td>
				<td class="lc2"><input type="text" name="RCV_OVERDUE_RATE"
					id="RCV_OVERDUE_RATE" size="40" title="逾期账款占应收账款比例(%)"
					maxlength=9 value="<%=jyxy.getRCV_OVERDUE_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="RCV_OVERDUE_RATE1"
					id="RCV_OVERDUE_RATE1" size="40" title="逾期账款占应收账款比例(%)"
					maxlength=9 value="<%=jyxy1.getRCV_OVERDUE_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

			<tr>
				<td class="lc1">逾期账款占应付账款比例(%)</td>
				<td class="lc2"><input type="text" name="PAY_OVERDUE_RATE"
					id="PAY_OVERDUE_RATE" size="40" title="逾期账款占应付账款比例(%)"
					maxlength=9 value="<%=jyxy.getPAY_OVERDUE_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
				<td class="lc2"><input type="text" name="PAY_OVERDUE_RATE1"
					id="PAY_OVERDUE_RATE1" size="40" title="逾期账款占应付账款比例(%)"
					maxlength=9 value="<%=jyxy1.getPAY_OVERDUE_RATE() %>"></input>&nbsp;<font
					color=red>*</font></td>
			</tr>

		</table>
		<br>
		<CENTER>
		<div style="display:inline">
		<a id="printa"
			href="print/szcp_sq_jyxy_print.jsp?REG_NO=<%=regNo%>&EVAL_YEAR=<%=year %>"
			target="_blank">打印本页</a></div>
			
			<div class="subImgs" style="display:inline" onclick="checkError()">
				下一步</div>
		</CENTER>
	</form>
	<%@include file="../bottom.inc"%>
	<script type="text/javascript">
		function checkError() {
			var REVE_GROW_RATE = $("#REVE_GROW_RATE").val();
			if (REVE_GROW_RATE == null || REVE_GROW_RATE == "") {
				alert("请输入营业收入增长率(%) !");
				return;
			} else {
				if (fucCheckNUM(REVE_GROW_RATE) == 0) {
					alert("营业收入增长率(%), 请输入数字格式!");
					return;
				}else {
					if(REVE_GROW_RATE.indexOf(".") >= 0) {
						var arr = REVE_GROW_RATE.split(".");
						if(arr[1].length > 4) {
							alert("营业收入增长率(%),最多为4位小数");
							return
						}
					}else {
						if(REVE_GROW_RATE.length > 4) {
							alert("营业收入增长率(%),最多输入4位整数");
							return
						}
					}
				}
			}
			
			var REVE_GROW_RATE1 = $("#REVE_GROW_RATE1").val();
			if (REVE_GROW_RATE1 == null || REVE_GROW_RATE1 == "") {
				alert("请输入营业收入增长率(%) !");
				return;
			} else {
				if (fucCheckNUM(REVE_GROW_RATE1) == 0) {
					alert("营业收入增长率(%), 请输入数字格式!");
					return;
				}else {
					if(REVE_GROW_RATE1.indexOf(".") >= 0) {
						var arr = REVE_GROW_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("营业收入增长率(%),最多为4位小数");
							return
						}
					}else {
						if(REVE_GROW_RATE1.length > 4) {
							alert("营业收入增长率(%),最多输入4位整数");
							return
						}
					}
				}
			}

			var PRI_GROW_RATE = $("#PRI_GROW_RATE").val();
			if (PRI_GROW_RATE == null || PRI_GROW_RATE == "") {
				alert("请输入主营业务利润率(%) !");
				return;
			} else {
				if (fucCheckNUM(PRI_GROW_RATE) == 0) {
					alert("主营业务利润率(%), 请输入数字格式!");
					return;
				}else {
					if(PRI_GROW_RATE.indexOf(".") >= 0) {
						var arr = PRI_GROW_RATE.split(".");
						if(arr[1].length > 4) {
							alert("主营业务利润率(%),最多为4位小数");
							return
						}
					}else {
						if(PRI_GROW_RATE.length > 4) {
							alert("主营业务利润率(%),最多输入4位整数");
							return
						}
					}
				}
			}
			
			
			var PRI_GROW_RATE1 = $("#PRI_GROW_RATE1").val();
			if (PRI_GROW_RATE1 == null || PRI_GROW_RATE1 == "") {
				alert("请输入主营业务利润率(%) !");
				return;
			} else {
				if (fucCheckNUM(PRI_GROW_RATE1) == 0) {
					alert("主营业务利润率(%), 请输入数字格式!");
					return;
				}else {
					if(PRI_GROW_RATE1.indexOf(".") >= 0) {
						var arr = PRI_GROW_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("主营业务利润率(%),最多为4位小数");
							return
						}
					}else {
						if(PRI_GROW_RATE1.length > 4) {
							alert("主营业务利润率(%),最多输入4位整数");
							return
						}
					}
				}
			}
			
			var NET_ASSET_RATE = $("#NET_ASSET_RATE").val();
			if (NET_ASSET_RATE == null || NET_ASSET_RATE == "") {
				alert("请输入净资产收益率(%) !");
				return;
			} else {
				if (fucCheckNUM(NET_ASSET_RATE) == 0) {
					alert("净资产收益率(%), 请输入数字格式!");
					return;
				}else {
					if(NET_ASSET_RATE.indexOf(".") >= 0) {
						var arr = NET_ASSET_RATE.split(".");
						if(arr[1].length > 4) {
							alert("净资产收益率(%),最多为4位小数");
							return
						}
					}else {
						if(NET_ASSET_RATE.length > 4) {
							alert("净资产收益率(%),最多输入4位整数");
							return
						}
					}
				}
			}
			
			var NET_ASSET_RATE1 = $("#NET_ASSET_RATE1").val();
			if (NET_ASSET_RATE1 == null || NET_ASSET_RATE1 == "") {
				alert("请输入净资产收益率(%) !");
				return;
			} else {
				if (fucCheckNUM(NET_ASSET_RATE1) == 0) {
					alert("净资产收益率(%), 请输入数字格式!");
					return;
				}else {
					if(NET_ASSET_RATE1.indexOf(".") >= 0) {
						var arr = NET_ASSET_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("净资产收益率(%),最多为4位小数");
							return
						}
					}else {
						if(NET_ASSET_RATE1.length > 4) {
							alert("净资产收益率(%),最多输入4位整数");
							return
						}
					}
				}
			}

			var DEBT_ASSET_RATE = $("#DEBT_ASSET_RATE").val();
			if (DEBT_ASSET_RATE == null || DEBT_ASSET_RATE == "") {
				alert("请输入资产负债率(%) !");
				return;
			} else {
				if (fucCheckNUM(DEBT_ASSET_RATE) == 0) {
					alert("资产负债率(%), 请输入数字格式!");
					return;
				}else {
					if(DEBT_ASSET_RATE.indexOf(".") >= 0) {
						var arr = DEBT_ASSET_RATE.split(".");
						if(arr[1].length > 4) {
							alert("资产负债率(%),最多为4位小数");
							return
						}
					}else {
						if(DEBT_ASSET_RATE.length > 4) {
							alert("资产负债率(%),最多输入4位整数");
							return
						}
					}
				}
			}
			
			var DEBT_ASSET_RATE1  = $("#DEBT_ASSET_RATE1").val();
			if (DEBT_ASSET_RATE1 == null || DEBT_ASSET_RATE1 == "") {
				alert("请输入资产负债率(%) !");
				return;
			} else {
				if (fucCheckNUM(DEBT_ASSET_RATE1) == 0) {
					alert("资产负债率(%), 请输入数字格式!");
					return;
				}else {
					if(DEBT_ASSET_RATE1.indexOf(".") >= 0) {
						var arr = DEBT_ASSET_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("资产负债率(%),最多为4位小数");
							return
						}
					}else {
						if(DEBT_ASSET_RATE1.length > 4) {
							alert("资产负债率(%),最多输入4位整数");
							return
						}
					}
				}
			}
			

			var QUICK_ACT_RATE = $("#QUICK_ACT_RATE").val();
			if (QUICK_ACT_RATE == null || QUICK_ACT_RATE == "") {
				alert("请输入速动比率(%) !");
				return;
			} else {
				if (fucCheckNUM(QUICK_ACT_RATE) == 0) {
					alert("速动比率(%), 请输入数字格式!");
					return;
				}else {
					if(QUICK_ACT_RATE.indexOf(".") >= 0) {
						var arr = QUICK_ACT_RATE.split(".");
						if(arr[1].length > 4) {
							alert("速动比率(%),最多为4位小数");
							return
						}
					}else {
						if(QUICK_ACT_RATE.length > 4) {
							alert("速动比率(%), 最多输入4位整数");
							return
						}
					}
				}
			}
			
			
			var QUICK_ACT_RATE1 = $("#QUICK_ACT_RATE1").val();
			if (QUICK_ACT_RATE1 == null || QUICK_ACT_RATE1 == "") {
				alert("请输入速动比率(%) !");
				return;
			} else {
				if (fucCheckNUM(QUICK_ACT_RATE1) == 0) {
					alert("速动比率(%), 请输入数字格式!");
					return;
				}else {
					if(QUICK_ACT_RATE1.indexOf(".") >= 0) {
						var arr = QUICK_ACT_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("速动比率(%),最多为4位小数");
							return
						}
					}else {
						if(QUICK_ACT_RATE1.length > 4) {
							alert("速动比率(%), 最多输入4位整数");
							return
						}
					}
				}
			}
			
			

			var RECV_TNOV_RATE = $("#RECV_TNOV_RATE").val();
			if (RECV_TNOV_RATE == null || RECV_TNOV_RATE == "") {
				alert("请输入应收账款周转率(%) !");
				return;
			} else {
				if (fucCheckNUM(RECV_TNOV_RATE) == 0) {
					alert("账款周转率(%), 请输入数字格式!");
					return;
				}else {
					if(RECV_TNOV_RATE.indexOf(".") >= 0) {
						var arr = RECV_TNOV_RATE.split(".");
						if(arr[1].length > 4) {
							alert("账款周转率(%),最多为4位小数");
							return
						}
					}else {
						if(RECV_TNOV_RATE.length > 4) {
							alert("账款周转率(%), 最多输入4位整数");
							return
						}
					}
				}
			}
			
			var RECV_TNOV_RATE1 = $("#RECV_TNOV_RATE1").val();
			if (RECV_TNOV_RATE1 == null || RECV_TNOV_RATE1 == "") {
				alert("请输入应收账款周转率(%) !");
				return;
			} else {
				if (fucCheckNUM(RECV_TNOV_RATE1) == 0) {
					alert("账款周转率(%), 请输入数字格式!");
					return;
				}else {
					if(RECV_TNOV_RATE1.indexOf(".") >= 0) {
						var arr = RECV_TNOV_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("账款周转率(%),最多为4位小数");
							return
						}
					}else {
						if(RECV_TNOV_RATE1.length > 4) {
							alert("账款周转率(%), 最多输入4位整数");
							return
						}
					}
				}
			}
			

			var RCV_OVERDUE_RATE = $("#RCV_OVERDUE_RATE").val();
			if (RCV_OVERDUE_RATE == null || RCV_OVERDUE_RATE == "") {
				alert("请输入逾期账款占应收账款比例(%) !");
				return;
			} else {
				if (fucCheckNUM(RCV_OVERDUE_RATE) == 0) {
					alert("逾期账款占应收账款比例(%), 请输入数字格式!");
					return;
				}else {
					if(RCV_OVERDUE_RATE.indexOf(".") >= 0) {
						var arr = RCV_OVERDUE_RATE.split(".");
						if(arr[1].length > 4) {
							alert("逾期账款占应收账款比例(%),最多为4位小数");
							return
						}
					}else {
						if(RCV_OVERDUE_RATE.length > 4) {
							alert("逾期账款占应收账款比例(%), 最多输入4位整数");
							return
						}
					}
				}
			}
			
			var RCV_OVERDUE_RATE1 = $("#RCV_OVERDUE_RATE1").val();
			if (RCV_OVERDUE_RATE1 == null || RCV_OVERDUE_RATE1 == "") {
				alert("请输入逾期账款占应收账款比例(%) !");
				return;
			} else {
				if (fucCheckNUM(RCV_OVERDUE_RATE1) == 0) {
					alert("逾期账款占应收账款比例(%), 请输入数字格式!");
					return;
				}else {
					if(RCV_OVERDUE_RATE1.indexOf(".") >= 0) {
						var arr = RCV_OVERDUE_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("逾期账款占应收账款比例(%),最多为4位小数");
							return
						}
					}else {
						if(RCV_OVERDUE_RATE1.length > 4) {
							alert("逾期账款占应收账款比例(%), 最多输入4位整数");
							return
						}
					}
				}
			}

			var PAY_OVERDUE_RATE = $("#PAY_OVERDUE_RATE").val();
			if (PAY_OVERDUE_RATE == null || PAY_OVERDUE_RATE == "") {
				alert("请输入逾期账款占应付账款比例(%) !");
				return;
			} else {
				if (fucCheckNUM(PAY_OVERDUE_RATE) == 0) {
					alert("逾期账款占应付账款比例(%), 请输入数字格式!");
					return;
				}else {
					if(PAY_OVERDUE_RATE.indexOf(".") >= 0) {
						var arr = PAY_OVERDUE_RATE.split(".");
						if(arr[1].length > 4) {
							alert("逾期账款占应付账款比例(%),最多为4位小数");
							return
						}
					}else {
						if(PAY_OVERDUE_RATE.length > 4) {
							alert("逾期账款占应付账款比例(%), 最多输入4位整数");
							return
						}
					}
				}
			}
			
			var PAY_OVERDUE_RATE1 = $("#PAY_OVERDUE_RATE1").val();
			if (PAY_OVERDUE_RATE1 == null || PAY_OVERDUE_RATE1 == "") {
				alert("请输入逾期账款占应付账款比例(%) !");
				return;
			} else {
				if (fucCheckNUM(PAY_OVERDUE_RATE1) == 0) {
					alert("逾期账款占应付账款比例(%), 请输入数字格式!");
					return;
				}else {
					if(PAY_OVERDUE_RATE1.indexOf(".") >= 0) {
						var arr = PAY_OVERDUE_RATE1.split(".");
						if(arr[1].length > 4) {
							alert("逾期账款占应付账款比例(%),最多为4位小数");
							return
						}
					}else {
						if(PAY_OVERDUE_RATE1.length > 4) {
							alert("逾期账款占应付账款比例(%), 最多输入4位整数");
							return
						}
					}
				}
			}
			
			document.form1.submit();
			alert("保存成功");
		}
	</script>

</body>
</html>