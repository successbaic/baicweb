<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<%@ page import="com.macrosoft.icms.util.PDFCreator"%>
<%@ page import="com.macrosoft.icms.util.PDFGszcCreator"%>
<%@ page import="com.macrosoft.icms.util.PDFSqwtsCreator"%>

<jsp:useBean id='UPLOAD_FILE_ELEC' scope='page'
	class='com.macrosoft.icms.util.UPLOAD_FILE_ELEC' />
<jsp:useBean id="IPTimeStamp" scope="page"
	class="com.macrosoft.icms.util.IPTIMESTAMP" />
<%
	String openo = (String)request.getParameter("openo");
    String fileId = (String)request.getParameter("fileId");
    String wjid = (String)request.getParameter("wjid");
    String bh = (String)request.getParameter("bh");//1:��˾�Ǽǣ������������� 3:��˾�³� 10:��ŵ��
   
    String pdfurl ="";
    String fileName="";
	PDFGszcCreator pdfgszccreate = new PDFGszcCreator();
	PDFSqwtsCreator pdfsqwtscreate = new PDFSqwtsCreator();
	PDFCreator pdfcreate = new PDFCreator();
    if("1".equals(bh)){
		pdfurl = pdfcreate.getPdfUrlAndCreatePdf(openo);	
		fileName="��˾�Ǽǣ�������������";
		if(!"".equals(fileId)&&fileId.indexOf("gssqs")==-1){
			fileId = "gssqs_"+fileId;
		}
    }else if("2".equals(bh)){
		pdfurl = pdfsqwtscreate.getPdfUrlAndCreatePdf(openo);	
		fileName="��Ȩί����";
		if(!"".equals(fileId)&&fileId.indexOf("sqwts")==-1){
			fileId = "sqwts_"+fileId;
		}
    }else if("3".equals(bh)){
		pdfurl = pdfgszccreate.getPdfUrlAndCreatePdf(openo);	
		fileName="��˾�³�";
    }else if("10".equals(bh)){
    	pdfurl = pdfgszccreate.getCnsPdfUrlAndCreatePdf(openo);
		fileName="��ŵ��";
    }
	String[] fileIds = pdfurl.split("/");
	if("".equals(fileId)|| fileId==null){
	  for (int i = 0; i < fileIds.length; i++) {
		fileId = fileIds[i];
	   }
	}
	//String fileId = fileIds[fileIds.length-1];
	UPLOAD_FILE_ELEC.setFILENAME(fileName);
	UPLOAD_FILE_ELEC.setOPENO(openo);
	UPLOAD_FILE_ELEC.setWJID(wjid);
	UPLOAD_FILE_ELEC.setFILEID(fileId);
	UPLOAD_FILE_ELEC.setATTACHDATE(IPTimeStamp.getDateComplete2());
	UPLOAD_FILE_ELEC.setWJBH(0);
	//�����ļ���ϣֵ�ַ���
	String FILEDES = UPLOAD_FILE_ELEC.getHash(pdfurl);
	UPLOAD_FILE_ELEC.setFILEDES(FILEDES);
	UPLOAD_FILE_ELEC.setFILEPATH(pdfurl);
	if (UPLOAD_FILE_ELEC.doAdd(wjid)){
%>
<script language="javascript">
alert("�ļ����ɳɹ�");
window.location.href="wsdj_fjxx_list.jsp?OPENO=<%=openo%>";
</script>
<%
 }
%>