<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.qydj.Eid"%>
<%@ page import="java.io.StringReader"%>   
<%@ page import="javax.xml.parsers.DocumentBuilder"%>  
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>   
<%@ page import="org.w3c.dom.Document"%>   
<%@ page import="org.w3c.dom.Element"%>   
<%@ page import="org.w3c.dom.Node"%> 
<%@ page import="org.w3c.dom.NodeList"%>   
<%@ page import="org.xml.sax.InputSource"%>  
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.io.IOException"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="UPLOAD_FILE_ELEC" scope="page"  class="com.macrosoft.icms.util.UPLOAD_FILE_ELEC"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
	<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>�ļ�ǩ��ҳ��</title>
</head>
<%
//��¼�û�����
String name=new String(WEB_USER.doPreProcess(request.getParameter("NAME")).getBytes("ISO8859_1"),"GBK");
String idnum=WEB_USER.doPreProcess(request.getParameter("CERNO"));
String openo=WEB_USER.doPreProcess(request.getParameter("OPENO"));
String fileid=WEB_USER.doPreProcess(request.getParameter("FILEID"));
String fpath=WEB_USER.doPreProcess(request.getParameter("FPATH"));
if("".equals(fileid)||fileid==null){
	out.print(SysUtility.setAlertGo("ǩ���ļ�������!","wsdj_fjxx_list.jsp?OPENO="+openo));
	return;
}
String path = fpath+"/"+fileid; //�������ص�·��
String filedata="";
File file = new File(path);	
boolean exist=file.exists(); 	
if(exist)
{
FileInputStream fi = new FileInputStream(file);
long fileSize = file.length();  
byte[] buffer = new byte[(int) fileSize];
int offset = 0;
int numRead = 0;
fi.read(buffer);
fi.close();
// ���ֽ�����Base64����
BASE64Encoder base64 = new BASE64Encoder();
filedata = base64.encode(buffer);
}
%>
<script type="text/javascript">
//ǩ��ԭ��(base64����)
var filedata = '<%=filedata%>';
//������
var reader="";
var serial="";
//�Ӵ�����
var hashdata="";
//ǩ��ֵ
var eid_sign="";
//�䷢�� 
var eid_issuer="";
//�䷢�����к�
var eid_issuersn="";
//֤�����к�
var eid_certSn="";
window.onload = function() {
	//����豸�β�----------------------
     eID.detectDeviceBegin(detectDeviceCallback);
     function detectDeviceCallback(rv, readerSerialList) {
          //���óɹ�
          if (rv == 0) {                  
            for (var i = 0; i < readerSerialList.length; i++) {
              reader = readerSerialList[i][0];
              serial = readerSerialList[i][1];
             }
           }else {
             alert('detectDeviceBegin����ʧ�ܣ�������Ϊ ' + rv + ':' + eID.getMessage(rv));
           }
        }
     //��ֹ����豸�β�---------------------
     eID.detectDeviceEnd(detectDeviceEndCallback);
     function detectDeviceEndCallback(rv) {
         //���óɹ�
         if (rv == 0) {
            // alert('endDetectDevice���óɹ�');
         }
         //����ʧ��
         else {
             alert('endDetectDevice����ʧ�ܣ�������Ϊ ' + rv + ':' + eID.getMessage(rv));
         }
     }
     //�Ӵ�����-----------------------
     eID.hash(hashCallback, reader,filedata, 1, 3);     //filedata  �������ļ��ĵ�base64
     function hashCallback(rv, result, idCarrier, alg) {
         //���óɹ�
         if (rv == 0) {
        	 hashdata=result;
            // alert('hash���óɹ���resultΪ' + result + '��idCarrierΪ' + idCarrier + '��algΪ' + alg);
         }
         //����ʧ��
         else {
             alert('hash����ʧ�ܣ�������Ϊ ' + rv + ':' + eID.getMessage(rv));
         }
     }

   //У��PIN�� 
     eID.verifyPin(verifyPinCallback, reader,0, '111111'); //typeΪ0ʱpin���д���ᵯ������pin�ĵ�����
     function verifyPinCallback(rv) { 
     //���óɹ� 
     if (rv == 0) { 
     //alert('verifyPinCallback���óɹ�'); 
     } 
     //����ʧ�� 
     else { 
     alert('verifyPinCallbackʧ�ܣ�������Ϊ ' + rv + ':' + eID.getMessage(rv)); 
     } 
   } 

      
    //ǩ������---------------------------------
    eID.signNoInputPin(signCallback, reader, hashdata, 1);//hashdataΪbase64λԭ��hash��Ĵ�,1ΪRSA1024�㷨
    function signCallback(rv, result, idCarrier, issuer, subject, certSn, issuerSn, certbase64, alg) {
        //���óɹ�
        if (rv == 0) {
        	//��ȡǩ�����
        	eid_sign= result;
        	eid_issuer=issuer;
        	eid_issuerSn=issuerSn;
        	eid_certSn=certSn;
            //alert('signNoInputPin���óɹ���resultΪ' + result + '��idCarrierΪ' + idCarrier + '��issuerΪ' + issuer + '��subjectΪ' + subject + '��certSnΪ' + certSn + '��issuerSnΪ' + issuerSn + '��certbase64Ϊ' + certbase64 + '��algΪ' + alg);
        	document.form1.result.value=result;
			document.form1.issuer.value=issuer;
			document.form1.certSn.value=certSn;
			document.form1.issuerSn.value=issuerSn;
			document.form1.filedata.value=filedata;
			document.form1.hashdata.value=hashdata;
			form1.submit();
        }
        //����ʧ��
        else {
            alert('signNoInputPinʧ�ܣ�������Ϊ ' + rv + ':' + eID.getMessage(rv));
        }
    }
}   
</script>
</head>
<body>
<form name="form1" METHOD="POST" ACTION="tjwj_sign_action.jsp" target="editframe">
<div style="display:none">
   <input type="hidden" name="result" id ="result"></input>
	<input type="hidden" name="issuer" id ="issuer"></input>
	<input type="hidden" name="certSn" id ="certSn"></input>
	<input type="hidden" name="issuerSn" id ="issuerSn"></input>
	<input type="hidden" name="filedata" id ="filedata"></input>
	<input type="hidden" name="hashdata" id ="hashdata"></input>	
    <input type="hidden" name="openo" value='<%=openo%>'/>
    <input type="hidden" name="fileid" value='<%=fileid%>'/>    	
    <input type="hidden" name="name" value='<%=name%>'/>    	
    <input type="hidden" name="idnum" value='<%=idnum%>'/>    	  
</div>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</body>
</html>