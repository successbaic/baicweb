package com.macrosoft.icms.qydj;

import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;

import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.soap.MessageFactory;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPBodyElement;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.Dispatch;
import javax.xml.ws.Service;
import javax.xml.ws.soap.SOAPBinding;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class EidInfo {
	    //名字空间 
		public static final String targetNamespace = "http://webService.vertify.com/";
		//服务名
		public static final String serName = "WebServiceIService";
		//端口名
		public static final String pName = "WebServiceIPort";
		//服务地址
		//public static final String endpointAddress= "http://117.184.199.40:8899/uniformVerify/services/WebServiceI";
		//省局网络使用10.48.44.138:8899映射地址117.184.199.40:8899访问
		public static final String endpointAddress= "http://10.48.44.138:8899/uniformVerify/services/WebServiceI";

		//方法名
		public static final String OPER_NAME1 = "checkToken";
		//参数名
		public static final String INPUT_NMAE1 = "arg0";
		
		
		public static String requestContext(String requestContent) throws SOAPException {
			QName serviceName = new QName(targetNamespace, serName);
			QName portName = new QName(targetNamespace, pName);
			javax.xml.ws.Service service = Service.create(serviceName);
			service.addPort(portName, SOAPBinding.SOAP11HTTP_BINDING, endpointAddress);
			Dispatch<SOAPMessage> dispatch = service.createDispatch(portName,SOAPMessage.class, Service.Mode.MESSAGE);
			BindingProvider bp = (BindingProvider) dispatch;
			Map<String, Object> rc = bp.getRequestContext();
			rc.put(BindingProvider.SOAPACTION_USE_PROPERTY, Boolean.TRUE);
			rc.put(BindingProvider.SOAPACTION_URI_PROPERTY, OPER_NAME1);
			MessageFactory factory = ((SOAPBinding)bp.getBinding()).getMessageFactory();
			SOAPMessage request = factory.createMessage();
			SOAPBody body = request.getSOAPBody();

			QName payloadName = new QName(targetNamespace, OPER_NAME1, "ns1");
			SOAPBodyElement payload = body.addBodyElement(payloadName);
			SOAPElement message = payload.addChildElement(INPUT_NMAE1);
			message.addTextNode(requestContent);
			SOAPMessage reply = null;

			reply = dispatch.invoke(request);
			SOAPBody soapBody = reply.getSOAPBody();
			SOAPBodyElement nextSoapBodyElement = (SOAPBodyElement)soapBody.getChildElements().next();              
			SOAPElement soapElement = (SOAPElement)nextSoapBodyElement.getChildElements().next();
			System.out.print("8888888888=");

			return soapElement.getValue();  
		}
		
		
		public Map checkToken(String tokenXml) throws SOAPException{
			String resXml=requestContext(tokenXml);
			Map<String,String> map = parse(resXml);

			return map; 
		}
		
		//获取xml格式数据中的code值
		public Map parse(String protocolXML) {  
			Map<String,String> map = new HashMap<String,String>();
			String idCard = null;
			String name=null;
			String typeCode=null;
			String sysCode=null;
			String tragerSn=null;
			String userType=null;
	        try {   
	             DocumentBuilderFactory factory = DocumentBuilderFactory   
	                     .newInstance();   
	             DocumentBuilder builder = factory.newDocumentBuilder();   
	             Document doc = builder   
	                     .parse(new InputSource(new StringReader(protocolXML)));   
	  
	             NodeList node = doc.getElementsByTagName("info");  
	            if (node != null) {   
	                for (int i = 0; i < node.getLength(); i++) {   
	                	Element element = (Element)node.item(i);  
	                	idCard = element.getElementsByTagName("idCard").item(0).getFirstChild().getNodeValue();   
	                	name = element.getElementsByTagName("name").item(0).getFirstChild().getNodeValue();  
	                	typeCode = element.getElementsByTagName("typeCode").item(0).getFirstChild().getNodeValue();  
	                	sysCode = element.getElementsByTagName("sysCode").item(0).getFirstChild().getNodeValue();  
	                	tragerSn = element.getElementsByTagName("tragerSn").item(0).getFirstChild().getNodeValue();  
	                	userType = element.getElementsByTagName("userType").item(0).getFirstChild().getNodeValue();  

	                	map.put("idCard", idCard);
	                	map.put("name", name);
	                	map.put("typeCode", typeCode);
	                	map.put("sysCode", sysCode);
	                	map.put("tragerSn", tragerSn);
	                	map.put("userType", userType);
	                 }   
	             }   
	         } catch (Exception e) {   
	             e.printStackTrace();
	         }
			return map;   
	     } 
		
		public static void main(String[] args) throws SOAPException {
			String requestContent ="<?xml version='1.0' encoding='UTF-8'?><request>" +
			"<token>1477902007088</token></request>";
			String xmlres = requestContext(requestContent);
			System.out.println("xmlres------>>>>>" + xmlres);
			try {
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse(new InputSource(new StringReader(xmlres)));
				Element root = doc.getDocumentElement();
				NodeList books = root.getChildNodes();
				if (books != null) {
					for (int i = 0; i < books.getLength(); i++) {
						Node book = books.item(i);
						System.out.println("节点=" + book.getNodeName() + "\ttext=" + book.getFirstChild().getNodeValue()+"-------"+book.getLastChild().getNodeValue());
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}