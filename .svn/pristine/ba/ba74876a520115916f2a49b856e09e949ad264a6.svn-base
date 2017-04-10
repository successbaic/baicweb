package com.macrosoft.icms.qydj;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.soap.MessageFactory;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPBodyElement;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.Dispatch;
import javax.xml.ws.Service;
import javax.xml.ws.soap.SOAPBinding;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class YyzzInfo {

	 //名字空间 
	public static final String targetNamespace = "http://webService.vertify.com/";
	//服务名
	public static final String serName = "WebServiceIService";
	//端口名
	public static final String pName = "WebServiceIPort";
	//服务地址
	//省局网络使用10.48.44.138:8899映射地址117.184.199.40:8899访问
	public static final String endpointAddress= "http://10.48.44.138:8899/uniformVerify/services/WebServiceI";
	//public static final String endpointAddress= "http://117.184.199.40:8899/uniformVerify/services/WebServiceI";

	//方法名
	public static final String OPER_NAME1 = "verifySign";
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
		return soapElement.getValue();
	}
	
	public String createXml(String verifycode,String certentity,String datatosign,String signdata){
		String xmlStr="";
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = factory.newDocumentBuilder();
			Document doc = dBuilder.newDocument();
			doc.setXmlStandalone(true);
			Element root = doc.createElement("request");
			doc.appendChild(root);
			Element verifyCode = doc.createElement("verifyCode");
			verifyCode.setTextContent(verifycode);
			root.appendChild(verifyCode);
			Element eidIssuer = doc.createElement("eidIssuer");
			eidIssuer.setTextContent("");
			root.appendChild(eidIssuer);
			Element eidIssuersn = doc.createElement("eidIssuersn");
			eidIssuersn.setTextContent("");
			root.appendChild(eidIssuersn);
			Element eidSn = doc.createElement("eidSn");
			eidSn.setTextContent("");
			root.appendChild(eidSn);
			Element certEntity = doc.createElement("certEntity");
			certEntity.setTextContent(certentity);
			root.appendChild(certEntity);
			Element dataToSign = doc.createElement("dataToSign");
			dataToSign.setTextContent(datatosign);
			root.appendChild(dataToSign);
			Element signData = doc.createElement("signData");
			signData.setTextContent(signdata);
			root.appendChild(signData);
			TransformerFactory transFactory = TransformerFactory.newInstance();
			Transformer transformer = transFactory.newTransformer();
			DOMSource domSource = new DOMSource(doc);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			transformer.setOutputProperty(OutputKeys.ENCODING,"UTF-8");
			transformer.transform(domSource, new StreamResult(bos));			
			xmlStr = bos.toString("utf-8");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return xmlStr;
	}
	
	public String verifySign(String Xml) throws SOAPException{
		String resXml=requestContext(Xml);
		String idCard = "";
		try{
			DocumentBuilderFactory factory =DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder=factory.newDocumentBuilder();
			Document document=documentBuilder.parse(new InputSource(new StringReader(resXml)));
			NodeList node = document.getElementsByTagName("response"); 
			if (node != null) {   
                for (int i = 0; i < node.getLength(); i++) {   
                	Element element = (Element)node.item(i);  
                	idCard = element.getElementsByTagName("resCode").item(0).getFirstChild().getNodeValue();
                 }   
             }
		}catch(Exception e){
			e.printStackTrace();
		}
		return idCard;
	}
	
	public static void main(String args[]) throws ParserConfigurationException,
			SAXException, IOException {
		String result = "";// 访问返回结果
		BufferedReader read = null;// 读取访问结果

		try {
			// 创建url
			URL realurl = new URL("http://117.184.199.40:8899/uniformVerify/login.do?postURL=111&areaCode=370000");
			// 打开连接
			URLConnection connection = realurl.openConnection();
			// 设置通用的请求属性
			connection.setRequestProperty("accept", "*/*");
			connection.setRequestProperty("connection", "Keep-Alive");
			connection.setRequestProperty("user-agent",
					"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			// 建立连接
			connection.connect();
			// 获取所有响应头字段
			Map<String, List<String>> map = connection.getHeaderFields();
			// 遍历所有的响应头字段，获取到cookies等
			for (String key : map.keySet()) {
				System.out.println(key + "--->" + map.get(key));
			}
			// 定义 BufferedReader输入流来读取URL的响应
			read = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), "UTF-8"));
			String line;// 循环读取
			while ((line = read.readLine()) != null) {
				result += line;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (read != null) {// 关闭流
				try {
					read.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(result);
	}
	
}
