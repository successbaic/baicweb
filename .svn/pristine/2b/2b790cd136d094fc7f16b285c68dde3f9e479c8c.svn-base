<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="GQDJ_JBXX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ"/>
<jsp:useBean id="GQDJ_BGSX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>

<%	
	String OPENO =GQDJ_JBXX.doPreProcess(request.getParameter("OPENO"));

	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_SQWT.doSelect();

	String checkBox = "□";
    String selected = "√";
	ArrayList list=GQDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String sALTITEM01=checkBox;
	String sALTITEM02=checkBox;
	String sALTITEM03=checkBox;
	String sALTITEM04=checkBox;
	String sALTITEM05=checkBox;
	String OLD_ENTNAME="";
	String NEW_ENTNAME="";	
	
	String OLD_REGNO="";
	String NEW_REGNO="";
	
	String OLD_EXPMOR="";
	String NEW_EXPMOR="";
	
	String OLD_EXPMORBLICNO="";
	String NEW_EXPMORBLICNO="";
	
	String OLD_IMPMOR="";
	String NEW_IMPMOR="";
	
	String OLD_IMPMORBLICNO="";
	String NEW_IMPMORBLICNO="";
	
	String OLD_EXPSHARAM="";
	String NEW_EXPSHARAM="";
	
	String OLD_PRICLASECAM="";
	String NEW_PRICLASECAM="";

	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ bgsx=(com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ)list.get(i);
		if(bgsx.getALTITEM().equals("01")){//名称
			sALTITEM01=selected;
			OLD_ENTNAME=bgsx.getALTBE();
			NEW_ENTNAME=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("02")){//注册号
			sALTITEM02=selected;
			OLD_REGNO=bgsx.getALTBE();
			NEW_REGNO=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("03")){//出质人名称
			sALTITEM03=selected;
			OLD_EXPMOR=bgsx.getALTBE();
			NEW_EXPMOR=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("05")){//出质人证件号码
			sALTITEM03=selected;
			OLD_EXPMORBLICNO=bgsx.getALTBE();
			NEW_EXPMORBLICNO=bgsx.getALTAF();
		}
		
		if(bgsx.getALTITEM().equals("04")){//质权人名称
			sALTITEM04=selected;
			OLD_IMPMOR=bgsx.getALTBE();
			NEW_IMPMOR=bgsx.getALTAF();
		}

		if(bgsx.getALTITEM().equals("06")){//质权人证件号码
			sALTITEM04=selected;
			OLD_IMPMORBLICNO=bgsx.getALTBE();
			NEW_IMPMORBLICNO=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("27")){//被担保金额
			sALTITEM05=selected;
			OLD_EXPSHARAM=bgsx.getALTBE();
			NEW_EXPSHARAM=bgsx.getALTAF();
		}		

	}
%>
<html><head><title>股权出质变更登记申请书</title>
<%out.print(pageshow.pagesetup_default()); %>
</head>
<body onload="pagesetup_default()" style="text-align: center">
<style>table{border-collapse: collapse;}
</style>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-before: always;}
tr{font-size: 12pt;}
.tr9{font-size: 9pt;}
.tdprint{text-align: left;text-indent: 2;}
</style>
<input type="button" value="打印申请书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉"清空)</font>
<table  border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<caption align="center"><b>
	<span style="font-size: 16pt">股权出质变更登记申请书</b><br><br></caption>
  <tr>
    <td align="center" height=30 width="20%" colspan="2">变更事项</td>
    <td align="center" width="40%">原登记内容</td>
    <td align="center" width="40%">申请变更登记内容</td>
  </tr>
  <tr>
    <td rowspan="5">登 <br />
      记<br />
      事<br />
    项</td>
    <td align="left" height="30"><%=sALTITEM01 %></>股权所在公司名称</td>
    <td><%=OLD_ENTNAME %></td>
    <td><%=NEW_ENTNAME %></td>
  </tr>
  <tr>
    <td align="left" height=30><%=sALTITEM02 %>股权所在公司注册号</td>
    <td><%=OLD_REGNO %></td>
    <td><%=NEW_REGNO %></td>
  </tr>
  <tr>
    <td align="left" height=30><%=sALTITEM03 %>出质人姓名（名称）及证照号码：</td>
    <td><%=OLD_EXPMOR %><br><%=OLD_EXPMORBLICNO %></td>
    <td><%=NEW_EXPMOR %><br><%=NEW_EXPMORBLICNO %></td>
  </tr>
  <tr>
    <td align="left" height=30><%=sALTITEM04 %>质权人姓名（名称）
    及证照号码： </td>
    <td><%=OLD_IMPMOR %><br><%=OLD_IMPMORBLICNO %></td>
    <td><%=NEW_IMPMOR %><br><%=NEW_IMPMORBLICNO %></td>
  </tr>
  <tr>
    <td align="left" height=30><%=sALTITEM05 %>出质股权数额	            </td>
    <td><%=OLD_EXPSHARAM %>万元/万股 </td>
    <td><%=NEW_EXPSHARAM %>万元/万股</td>
  </tr>
  <tr>
    <td>申报<br />
    事项</td>
    <td>被担保债权数额	</td>
    <td colspan="2">万元</td>
  </tr>
  <tr>
    <td>申<br />
      请<br />
      人<br />
      声<br />
    明</td>
    <td colspan="3">质权人已对上述股权作必要审查，并自愿接受其作为出质标的。<br />
      申请人申请股权出质登记，已阅知下列内容：<br />
      1.申请人应当对申请材料的真实性、质权合同的合法性有效性负责。<br />
      2.出质股权所在公司为有限责任公司或者股权未在证券登记结算机构登记的股份有限公司。<br />
      3.出质股权应当是依法可以转让的股权，且权能完整，未被人民法院依法冻结。<br />
      4.出质股权所在公司为有限责任公司的，公司应当将股东的姓名或者名称及其出资额向公司登记机关登记；登记事项发生变更的，应当办理变更登记。未经登记或者变更登记的，不得对抗第三人。<br />
      5.股份公司不得接受本公司的股票作为质押权的标的。<br />
      6.公司为他人提供担保，依照公司章程的规定，由董事会或者股东会、股东大会决议；公司章程对担保的总额及单项担保的数额有限额规定的，不得超过规定的限额。公司为公司股东或者实际控制人提供担保的，必须经股东会或者股东大会决议。<br />
    因提交材料实质内容违反法律、行政法规和公司章程的相关规定，产生的经济纠纷和法律责任，由申请人负责。<br /></td>
  </tr>
</table>
<table width="800">
  <tr>
    <td >&nbsp;</td>
    <td align="right" height=50>出质人签字（盖章）</td>
    <td align="right" height=50>质权人签字（盖章）</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" height=46>&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td align="right" height=46>&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
  </tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="../public/gqdj_sqwtsqs.inc" %>
</body>
</html>