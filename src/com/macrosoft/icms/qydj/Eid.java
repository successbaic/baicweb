package com.macrosoft.icms.qydj;

import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.soap.MessageFactory;
import javax.xml.soap.MimeHeaders;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPBodyElement;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.Dispatch;
import javax.xml.ws.Service;
import javax.xml.ws.soap.SOAPBinding;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class Eid {

		// 名字空间
			private static final String targetNamespace = "http://impl.service.eid.puhua.com/";
			// 服务名
			private static final String serName = "ProxyImplService";
			// 端口名
			private static final String pName = "ProxyImplPort";
			
			//private static final String endpointAddress = "http://117.184.199.40:8080/eid_proxy/ProxyImplPort?wsdl";
			//省局网络使用10.48.44.138:8090映射地址117.184.199.40:8080访问
			private static final String endpointAddress = "http://10.48.44.138:8090/eid_proxy/ProxyImplPort?wsdl";
			private Log log = LogFactory.getLog(Eid.class);
			
		private static String genericOpera(final String methodName,Map<String, String> params) throws SOAPException {
			
			QName serviceName = new QName(targetNamespace, serName);
			QName portName = new QName(targetNamespace, pName);
			Service service = Service.create(serviceName);
			service.addPort(portName, SOAPBinding.SOAP11HTTP_BINDING,endpointAddress);
			Dispatch<SOAPMessage> dispatch = service.createDispatch(portName,SOAPMessage.class, Service.Mode.MESSAGE);
			BindingProvider bp = (BindingProvider) dispatch;
			Map<String, Object> rc = bp.getRequestContext();
			rc.put(BindingProvider.SOAPACTION_USE_PROPERTY, Boolean.TRUE);
			rc.put(BindingProvider.SOAPACTION_URI_PROPERTY, methodName);
			MessageFactory factory = ((SOAPBinding) bp.getBinding()).getMessageFactory();
			SOAPMessage request = factory.createMessage();

			MimeHeaders ap = request.getMimeHeaders();
			ap.setHeader("Connection", "close");
			
			SOAPBody body = request.getSOAPBody();
			QName payloadName = new QName(targetNamespace, methodName, "ns1");
			SOAPBodyElement payload = body.addBodyElement(payloadName);
			if (params != null) {
				for (String paraName : params.keySet()) {
					SOAPElement message = payload.addChildElement(paraName);
					message.addTextNode(params.get(paraName));
				}
			}
			SOAPMessage reply = dispatch.invoke(request);
			SOAPBody soapBody = reply.getSOAPBody();
			SOAPBodyElement nextSoapBodyElement = (SOAPBodyElement) soapBody.getChildElements().next();
			SOAPElement soapElement = (SOAPElement) nextSoapBodyElement.getChildElements().next();
			return soapElement.getValue();
		}
		
	///EID的实名认证///
		public String requestBizSignVerifyPKI(String name, String idnum, String idtype,String eid_issuer, String eid_issuersn, String eid_sn,String eid_sc,
				String data_to_sign, String eid_sign,String signType,String hashType) throws SOAPException{
			final String OPER_NAME = "requestBizSignVerifyPKI";
			Map<String,String> map=new HashMap<String,String>();
			map.put("arg0", name);
			map.put("arg1",idnum);
			map.put("arg2", idtype);
			map.put("arg3", data_to_sign);
			map.put("arg4",eid_sign);
			map.put("arg5",signType);
			map.put("arg6", eid_issuer);
			map.put("arg7", eid_issuersn);
			map.put("arg8", eid_sn);
			map.put("arg9", hashType);
		   // initlog();
		    log.info("调用EID的实名认证接口开始时间:" + new  Date());
			String result=genericOpera(OPER_NAME, map);
			log.info("调用EID的实名认证接口结束时间:" + new  Date());
			return result;
		}
	///EID的验签///
		public String eIDVerify(String eid_issuer, String eid_issuersn, String eid_sn,String data_to_sign, String eid_sign,String signType,String hashType) throws SOAPException{
			final String OPER_NAME = "eIDVerify";
			Map<String,String> map=new HashMap<String,String>();
			map.put("arg0", eid_issuer);
			map.put("arg1",eid_issuersn);
			map.put("arg2", eid_sn);
			map.put("arg3", data_to_sign);
			map.put("arg4",eid_sign);
			map.put("arg5",signType);
			map.put("arg6", hashType);
			log.info("调用EID的验签接口开始时间:" + new  Date());
			String result=genericOpera(OPER_NAME, map);
			log.info("调用EID的验签接口结束时间:" + new  Date());
			return result; 
		}
		
		//获取xml格式数据中的code值
		public String parse(String protocolXML) {  
			String code = null;
	        try {   
	             DocumentBuilderFactory factory = DocumentBuilderFactory   
	                     .newInstance();   
	             DocumentBuilder builder = factory.newDocumentBuilder();   
	             Document doc = builder   
	                     .parse(new InputSource(new StringReader(protocolXML)));   
	  
	             NodeList node = doc.getElementsByTagName("result");  
	            if (node != null) {   
	                for (int i = 0; i < node.getLength(); i++) {   
	                	Element element = (Element)node.item(i);  
	                    code = element.getElementsByTagName("code").item(0).getFirstChild().getNodeValue();   
	                 }   
	             }   
	         } catch (Exception e) {   
	             e.printStackTrace();
	         }
			return code;   
	     }   

//		/**
//		 * 初始化日志
//		 */
//	private void initlog() {
//		InputStream is = getClass().getResourceAsStream("/wsdjdb.cfg");
//		Properties dbProps = new Properties();
//		try {
//			dbProps.load(is);
//		} catch (Exception e) {
//			System.err.println("不能读取属性文件. " + "请确保wsdjdb.cfg在CLASSPATH指定的路径中");
//			return;
//		}
//		String logFile = dbProps.getProperty("logfile","Eid.log");
//		try {
//			log = new PrintWriter(new FileWriter(logFile, true), true);
//		} catch (IOException e) {
//			System.err.println("无法打开日志文件: " + logFile);
//			log = new PrintWriter(System.err);
//		}
//	}
		
		//测试
		public static void main(String[] args) throws SOAPException {
			
			Eid p=new Eid();
			String name="张永建";
			String idnum="342422198807163633";
			String idtype="01";
			String eid_issuer="eID MIC2";
			String eid_issuersn="022012";
			String eid_sn="1000000000000351";
			String eid_sc="1JVPSkcZeKYMkPxXlwFldY1OVXBQW6epZR7QuufUKmRk=000";
			String data_to_sign="MjAxNjA3MjYxMzM3NDE6MjAxNjA3MjYxMzM3NDE6ZGF0YQ==";
			String eid_sign="uEUwfxe7q0x6vviW4Y50t6RNnEoafo8zeV11SOriD2wxhgpXOC2TkpXev8pZH8fCTawND6EkV13NiLePdW09UA==";
			String signType="1";
			String hashType="1";
			long start=System.currentTimeMillis();
			String code = p.requestBizSignVerifyPKI(name, idnum, idtype, eid_issuer, eid_issuersn, eid_sn, eid_sc, data_to_sign, eid_sign, signType, hashType);
			System.out.println(p.parse(code));
			String code1 = p.eIDVerify(eid_issuer, eid_issuersn, "1000000000000082", "MjAxNTExMDIxNjE4MDk6MjAxNTExMDIxNjE4MDk6ZGF0YQ==", 
					"0csLckq83aYmXFwKN3DDycUGjzeQBRmR90c1zcpTwiRm+SGeN4uf2z7Wsui6lo1WbhTPxehbh52mrlqB1Ht5aA==", signType, hashType);
			long end = System.currentTimeMillis();
			System.out.println(p.parse(code1));
			System.out.println((end-start)/1000+" 秒"+(end-start)%1000+" 毫秒");
			}
}