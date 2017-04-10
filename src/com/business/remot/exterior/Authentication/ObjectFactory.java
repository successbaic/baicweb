
package com.business.remot.exterior.Authentication;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.business.remot.exterior.service package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _TestResponse_QNAME = new QName("http://service.exterior.remot.business.com/", "testResponse");
    private final static QName _BusinessLicenceCheck_QNAME = new QName("http://service.exterior.remot.business.com/", "businessLicenceCheck");
    private final static QName _BusinessLicenceCheckResponse_QNAME = new QName("http://service.exterior.remot.business.com/", "businessLicenceCheckResponse");
    private final static QName _BusinessLicenceVerifySign_QNAME = new QName("http://service.exterior.remot.business.com/", "businessLicenceVerifySign");
    private final static QName _BusinessLicenceVerifySignResponse_QNAME = new QName("http://service.exterior.remot.business.com/", "businessLicenceVerifySignResponse");
    private final static QName _Test_QNAME = new QName("http://service.exterior.remot.business.com/", "test");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.business.remot.exterior.service
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link BusinessLicenceCheckResponse }
     * 
     */
    public BusinessLicenceCheckResponse createBusinessLicenceCheckResponse() {
        return new BusinessLicenceCheckResponse();
    }

    /**
     * Create an instance of {@link BusinessLicenceVerifySign }
     * 
     */
    public BusinessLicenceVerifySign createBusinessLicenceVerifySign() {
        return new BusinessLicenceVerifySign();
    }

    /**
     * Create an instance of {@link BusinessLicenceVerifySignResponse }
     * 
     */
    public BusinessLicenceVerifySignResponse createBusinessLicenceVerifySignResponse() {
        return new BusinessLicenceVerifySignResponse();
    }

    /**
     * Create an instance of {@link Test }
     * 
     */
    public Test createTest() {
        return new Test();
    }

    /**
     * Create an instance of {@link TestResponse }
     * 
     */
    public TestResponse createTestResponse() {
        return new TestResponse();
    }

    /**
     * Create an instance of {@link BusinessLicenceCheck }
     * 
     */
    public BusinessLicenceCheck createBusinessLicenceCheck() {
        return new BusinessLicenceCheck();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link TestResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "testResponse")
    public JAXBElement<TestResponse> createTestResponse(TestResponse value) {
        return new JAXBElement<TestResponse>(_TestResponse_QNAME, TestResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BusinessLicenceCheck }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessLicenceCheck")
    public JAXBElement<BusinessLicenceCheck> createBusinessLicenceCheck(BusinessLicenceCheck value) {
        return new JAXBElement<BusinessLicenceCheck>(_BusinessLicenceCheck_QNAME, BusinessLicenceCheck.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BusinessLicenceCheckResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessLicenceCheckResponse")
    public JAXBElement<BusinessLicenceCheckResponse> createBusinessLicenceCheckResponse(BusinessLicenceCheckResponse value) {
        return new JAXBElement<BusinessLicenceCheckResponse>(_BusinessLicenceCheckResponse_QNAME, BusinessLicenceCheckResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BusinessLicenceVerifySign }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessLicenceVerifySign")
    public JAXBElement<BusinessLicenceVerifySign> createBusinessLicenceVerifySign(BusinessLicenceVerifySign value) {
        return new JAXBElement<BusinessLicenceVerifySign>(_BusinessLicenceVerifySign_QNAME, BusinessLicenceVerifySign.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BusinessLicenceVerifySignResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessLicenceVerifySignResponse")
    public JAXBElement<BusinessLicenceVerifySignResponse> createBusinessLicenceVerifySignResponse(BusinessLicenceVerifySignResponse value) {
        return new JAXBElement<BusinessLicenceVerifySignResponse>(_BusinessLicenceVerifySignResponse_QNAME, BusinessLicenceVerifySignResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Test }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "test")
    public JAXBElement<Test> createTest(Test value) {
        return new JAXBElement<Test>(_Test_QNAME, Test.class, null, value);
    }

}
