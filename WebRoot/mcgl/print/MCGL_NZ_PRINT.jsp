<%@ page contentType="text/html;charset=GBK"%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="/error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@page import="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="MCGL_TZRXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>

<%	
	
	//String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	
	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_SQWT.doSelect();
	String checkBox = "��";
    String selected = "��";
%>
<html>
	<head>
		<link style="text/css" rel="stylesheet" href="css/print.css"/>
		<style>table{border-collapse: collapse;}
</style>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-before: always;}
tr{font-size: 12pt;}
.tr9{font-size: 9pt;}
.tdprint{text-align: left;text-indent: 2;}
</style>
		<%out.print(pageshow.pagesetup_default()); %>
		<title>��ҵ����Ԥ�Ⱥ�׼������</title>
	</head>
	<body onload="pagesetup_default()" style="width:100%;height: 100%;">
	<CENTER>
	<font style="text-align: right; " class="noPrint">
			<input type="button" value="��ӡ������" onclick="window.print();"  class="noPrint">
			<input name=back type="button" value="��   ��" onclick="window.close();"  class="noPrint">
		</font>
			<font color="red" style="font-size: 9pt;" class="noPrint">
				(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE->�ļ�->ҳ�����á��н���ҳü"�͡�ҳ�š����)
			</font>
	</CENTER>
	
	<CENTER>
		<span class="title" >
			��ҵ����Ԥ�Ⱥ�׼������
		</span>
		<br/>
		<font style="text-align: center;font-size:9pt;">ע������ϸ�Ķ��������顶��д˵��������Ҫ����д��</font>
		</CENTER>
		
			<table frame=void width="100%" align="center" bordercolor="#000000">
				<tr>
				<td colspan="4" style="font-size: 14pt;" class="title">
					�� ��ҵ��������Ԥ�Ⱥ�׼
				</td>
				
				</tr>
					<tr>
						<td>
							������ҵ����
						</td>
						<td colspan="3">
							<%=MCGL_JBXX.getENTNAME() %>
						</td>
					</tr>	
					<tr>
						<td rowspan="3">
							��ѡ<br/>��ҵ�ֺ�
						</td>
						<td  colspan="3">
							<font style="float: left">1.</font><%=MCGL_JBXX.getENTNAME1() %>
						</td>
					</tr>	
					<tr>
						<td colspan="3"> 
							<font style="float: left">2.</font><%=MCGL_JBXX.getENTNAME2() %>
						</td>
					</tr>	
					<tr>
						<td colspan="3">
							<font style="float: left">3.</font><%=MCGL_JBXX.getENTNAME3() %>
						</td>
							<tr>
						<td>
							��ҵס����
						</td>
						<td colspan="3">
					 <%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",MCGL_JBXX.getPROVINCE().length()==6?MCGL_JBXX.getPROVINCE():MCGL_JBXX.getPROVINCE()+"00"),"center",6)%>����/��������<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",MCGL_JBXX.getCITY()),"center",6)%>������/��/�����ݣ�<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",MCGL_JBXX.getCOUNTY()),"center",8)%> ��������/��/������/��/����
						</td>
					</tr>
					
						<tr>
						<td>
							ע���ʱ�����
						</td>
						<td>
						<font style="float: right"></font><%=MCGL_JBXX.getREGCAP() %>����Ԫ��
						</td>
						<td>
							��ҵ����
						</td>
						<td>
						<%= icms.getSysDm("ENTTYPE",MCGL_JBXX.getENTTYPE()) %>
						</td>
					</tr>
				<tr>
						<td style="height: 150px;">
							��Ӫ��Χ
						</td>
						<td colspan="3" style="font-size:12px">
					
						<%=MCGL_JBXX.getBUSSCOPE() %>
						
						</td>
					</tr>
			
				<tr>
				 <td> Ͷ���� </td>
				 <td colspan="3" style="border-style:none;border-width:0px;">
				 <table border="0" style="border-style:none;border-width:0px;">
				 <tr>
				 <td>
						����������
					</td>
					<td colspan="2">
						֤�պ���
					</td>
				 </tr>
				 
					<%
					 List tzrxx=MCGL_TZRXX.getList(" WHERE OPENO='"+OPENO+"'");
					 int temp = tzrxx.size();
					for(int i = 0 ;i<tzrxx.size();i++){
					MCGL_TZRXX_SQ bean = (MCGL_TZRXX_SQ)tzrxx.get(i);
					%>
					<tr>
						<td>
						<%=bean.getINV() %>
						</td>
						<td colspan="2">
						<%
						if(bean.getINVTYPE().equals("20") || bean.getINVTYPE().equals("21") || bean.getINVTYPE().equals("22") ||bean.getINVTYPE().equals("35") ||bean.getINVTYPE().equals("36")){
							out.println(bean.getCERNO());
						}else{
							out.println(bean.getBLICNO());
						}
						%>							
						</td>
				   
					</tr>
				
	 <%}
	            if(8-temp>0){
	            
				for(int j=0;j<8-temp;j++){
					out.print("<tr><td></td><td></td></tr>");
				 }
} %> 
				 </table>
				 </td>
				 </tr>
			</table>
			
	<br><p class="PageNext"></p> <br>
	
<table style="width: 100%;" >
				<tr>
				<td colspan="6" style="font-size: 14pt;text-align: center;height:22px;" class="title">
			���Ѻ�׼������Ŀ������Ͷ���˳��⣩
				</td>
				</tr>
				<tr> 
				
				<td colspan="2" style="width:15%;height:22px">�Ѻ�׼����</td>
				
				<td colspan="2" style="width:35%">  </td>
				<td style="width:15%">֪ͨ���ĺ�</td>
				
				<td style="width:35%">  </td>
				</tr>
				<tr> 
				<td colspan="2" style="height:22px;">�������Ŀ</td>
				
				<td colspan="2">ԭ��������</td>
				<td colspan="2">���������</td>
				
				</tr>
				
				<tr>
				<td colspan="2" style="height:22px;"></td><td colspan="2"></td><td colspan="2"></td>
				
			
				</tr>
				<tr>
				<td colspan="2"></td><td colspan="2"></td><td colspan="2"></td>
				
			
				</tr>
				<tr>
				<td colspan="2"></td><td colspan="2"></td><td colspan="2"></td>
				
			
				</tr>
				
						<tr>
				<td colspan="6" style="font-size: 14pt;height:22px;" class="title">
			���Ѻ�׼��������
				</td>
				</tr>
				<tr> 
				
				<td colspan="2" style="height:22px;">�Ѻ�׼����</td>
				
				<td colspan="2">  </td>
				<td>֪ͨ���ĺ�</td>
				
				<td>  </td>
				
				
				</tr>
					<tr> 
				
				<td colspan="2" style="height:22px;">ԭ��Ч��</td>
				
				<td colspan="2">  </td>
				<td height=20>��Ч������</td>
				
				<td nowrap>___��___�� ___�� </td>
				
				
				</tr>
							<tr>
				<td colspan="6" style="font-size: 14pt;heigth:22px" class="title">
			ָ��������߹�ͬί�д�����
				</td>
				</tr>
					<%
					 List sqwt=QYDJ_SQWT.getList(" WHERE OPENO='"+OPENO+"'");
					com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bean = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
					%>
				<tr>
				<td style="width:15%">���徭��������</td>
				<td style="width:18%"><%=bean.getCONSIGNER() %></td>
				<td style="width:15%">���֤������</td>
				<td style="width:18%"><%=bean.getCERNO() %></td>
			    <td style="width:15%">��ϵ�绰</td>
				<td style="width:18%"><%=bean.getTEL()%></td>
				</tr>
				<tr>
				<td>��Ȩ����</td>
				<td colspan="5"> ��<%=bean.getCONFROM() %>��<%=bean.getCONTO() %></td>
				</tr>
				<tr>
				<td colspan="6" style="text-align:left;">
	��ȨȨ��     &nbsp;&nbsp;&nbsp;1.ͬ��<%if("1".equals(bean.getIFLICENSE1())){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(bean.getIFLICENSE1())){out.print(selected);}else{out.print(checkBox);}%> �˶ԵǼǲ����еĸ�ӡ����ǩ��˶������
	<br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.ͬ��<%if("1".equals(bean.getIFLICENSE3())){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(bean.getIFLICENSE3())){out.print(selected);}else{out.print(checkBox);}%> �޸��йر�����д����
	<br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.ͬ��<%if("1".equals(bean.getIFLICENSE2())){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(bean.getIFLICENSE2())){out.print(selected);}else{out.print(checkBox);}%> ����ҵ����Ԥ�Ⱥ�׼֪ͨ�顷��
	
         </td>
         </tr>
         <tr>
         <td colspan="6" style="height:285px;" align="right">
         <p align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ָ�������ί�д����ˡ����徭�������֤����ӡ��ճ������</p>
         </td>
         </tr>
				<tr>
				<td style="height:40px;">
				������<br>ǩ�ֻ����
				</td>
				<td colspan="5" align="right"> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				�� &nbsp;&nbsp; ��  &nbsp;&nbsp;  ��</td>
				</tr>
	</table>

<p class="PageNext"></p>

	<table style="width: 80%;" align="center" style="border-style:none;border-width:0px">
	<tr><td style="line-height:25px;border-style:none;border-width:0px">	
	
	<center>
	<p><strong>��ҵ����Ԥ�Ⱥ�׼��������д˵��</strong></p></center>
<p><strong>ע��</strong>���¡�˵��������д���������ʹ�ã�������Ǽǻ����ṩ��<br/>
1��	������������������������ҵ������Ԥ�Ⱥ�׼���롢������Ŀ������Ͷ���˳��⣩��������������ȡ�<br/>
2��	��Ǽǻ����ύ��������ֻ��д�뱾�������йص���Ŀ��<br/>
3��	������Ӧ���ݡ���ҵ���ƵǼǹ���涨���͡���ҵ���ƵǼǹ���ʵʩ�취���йع涨������ҵ����Ԥ�Ⱥ�׼�����ṩ��ϢӦ��ʵ���Ϸ�����Ч��<br/>
4��	 ����ҵ���͡���Ӧ�������¾�������ѡ����д���������ι�˾���ɷ����޹�˾���ֹ�˾���ǹ�˾��ҵ���ˡ�Ӫҵ��λ����ҵ�Ƿ��˷�֧���������˶�����ҵ���ϻ���ҵ��<br/>
5��	����Ӫ��Χ����ֻ����д����ҵ������ҵ������һ�µ���Ҫҵ����Ŀ��Ӧ���ա����񾭼���ҵ���ࡷ���ұ�׼���йع涨��д��<br/>
6��	������ҵ��������Ԥ�Ⱥ�׼�����Ѻ�׼��ҵ������Ŀ���е������ӳ���Ч���޵ģ�������Ϊȫ��Ͷ���ˡ����У���Ȼ��Ͷ�ʵ��ɱ���ǩ�֣�����Ȼ��Ͷ�ʵļӸǹ��¡�<br/>
7��	��ԭ��׼���Ʋ��������£����Զ��Ѻ�׼������Ŀ���е�������ס����ע���ʱ����𣩵ȣ����Ͷ������Ŀ�ĳ��⡣<br/>
8��	����ҵ����Ԥ�Ⱥ�׼֪ͨ�顷������Ӧ������Ч������ǰһ���������������������ʱӦ�ɻء���ҵ����Ԥ�Ⱥ�׼֪ͨ�顷ԭ����Ͷ�������������ɣ��������롶��ҵ����Ԥ�Ⱥ�׼֪ͨ�顷��Ч�����������£������ڵġ���ҵ����Ԥ�Ⱥ�׼֪ͨ�顷�����ٴ��������ڡ�<br/>
9��	ָ�������ί�д����ˡ����徭����Ӧ��ճ�������֤����ӡ�����ú�ɫ�ֱʻ�ǩ�ֱ�ǩ��ȷ�ϡ���ԭ��һ�¡���<br/>
10��	��Ͷ���ˡ�����Ѻ�׼������Ŀ������Ͷ���˳��⣩����ɼ�����д��ҳ��д��<br/>
11��	�������ύ��������Ӧ��ʹ��A4��ֽ���������ӡ���ɵģ�ʹ�ú�ɫ�ֱʻ�ǩ�ֱ�ǩ���ֹ���д�ģ�ʹ�ú�ɫ�ֱʻ�ǩ�ֱʹ�����д��ǩ��<br/>
	</td></tr></table>
</body></html>
