package com.business.remot.exterior.BusinessShow;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * This object contains factory methods for each Java content interface and Java
 * element interface generated in the show package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the
 * Java representation for XML content. The Java representation of XML content
 * can consist of schema derived interfaces and classes representing the binding
 * of schema type definitions, element declarations and model groups. Factory
 * methods for each of these are provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

	private final static QName _BusinessFilingQuery_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessFilingQuery");
	private final static QName _BusinessFilingQueryResponse_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessFilingQueryResponse");
	private final static QName _BusinessLicenceExQueryResponse_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessLicenceExQueryResponse");
	private final static QName _BusinessLicenceExQuery_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessLicenceExQuery");
	private final static QName _BusinessLicenceExSignQuery_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessLicenceExSignQuery");
	private final static QName _BusinessCancelFilingResponse_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessCancelFilingResponse");
	private final static QName _BusinessFilingExResponse_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessFilingExResponse");
	private final static QName _TestResponse_QNAME = new QName(
			"http://service.exterior.remot.business.com/", "testResponse");
	private final static QName _BusinessCancelFiling_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessCancelFiling");
	private final static QName _BusinessLicenceExSignQueryResponse_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessLicenceExSignQueryResponse");
	private final static QName _BusinessFilingResponse_QNAME = new QName(
			"http://service.exterior.remot.business.com/",
			"businessFilingResponse");
	private final static QName _BusinessFiling_QNAME = new QName(
			"http://service.exterior.remot.business.com/", "businessFiling");
	private final static QName _BusinessFilingEx_QNAME = new QName(
			"http://service.exterior.remot.business.com/", "businessFilingEx");
	private final static QName _Test_QNAME = new QName(
			"http://service.exterior.remot.business.com/", "test");

	/**
	 * Create a new ObjectFactory that can be used to create new instances of
	 * schema derived classes for package: show
	 * 
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link BusinessFiling }
	 * 
	 */
	public BusinessFiling createBusinessFiling() {
		return new BusinessFiling();
	}

	/**
	 * Create an instance of {@link BusinessFilingQueryResponse }
	 * 
	 */
	public BusinessFilingQueryResponse createBusinessFilingQueryResponse() {
		return new BusinessFilingQueryResponse();
	}

	/**
	 * Create an instance of {@link BusinessFilingEx }
	 * 
	 */
	public BusinessFilingEx createBusinessFilingEx() {
		return new BusinessFilingEx();
	}

	/**
	 * Create an instance of {@link BusinessLicenceExQuery }
	 * 
	 */
	public BusinessLicenceExQuery createBusinessLicenceExQuery() {
		return new BusinessLicenceExQuery();
	}

	/**
	 * Create an instance of {@link BusinessCancelFiling }
	 * 
	 */
	public BusinessCancelFiling createBusinessCancelFiling() {
		return new BusinessCancelFiling();
	}

	/**
	 * Create an instance of {@link BusinessCancelFilingResponse }
	 * 
	 */
	public BusinessCancelFilingResponse createBusinessCancelFilingResponse() {
		return new BusinessCancelFilingResponse();
	}

	/**
	 * Create an instance of {@link BusinessFilingResponse }
	 * 
	 */
	public BusinessFilingResponse createBusinessFilingResponse() {
		return new BusinessFilingResponse();
	}

	/**
	 * Create an instance of {@link Test }
	 * 
	 */
	public Test createTest() {
		return new Test();
	}

	/**
	 * Create an instance of {@link BusinessLicenceExSignQueryResponse }
	 * 
	 */
	public BusinessLicenceExSignQueryResponse createBusinessLicenceExSignQueryResponse() {
		return new BusinessLicenceExSignQueryResponse();
	}

	/**
	 * Create an instance of {@link BusinessLicenceExQueryResponse }
	 * 
	 */
	public BusinessLicenceExQueryResponse createBusinessLicenceExQueryResponse() {
		return new BusinessLicenceExQueryResponse();
	}

	/**
	 * Create an instance of {@link BusinessFilingQuery }
	 * 
	 */
	public BusinessFilingQuery createBusinessFilingQuery() {
		return new BusinessFilingQuery();
	}

	/**
	 * Create an instance of {@link TestResponse }
	 * 
	 */
	public TestResponse createTestResponse() {
		return new TestResponse();
	}

	/**
	 * Create an instance of {@link BusinessLicenceExSignQuery }
	 * 
	 */
	public BusinessLicenceExSignQuery createBusinessLicenceExSignQuery() {
		return new BusinessLicenceExSignQuery();
	}

	/**
	 * Create an instance of {@link BusinessFilingExResponse }
	 * 
	 */
	public BusinessFilingExResponse createBusinessFilingExResponse() {
		return new BusinessFilingExResponse();
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessFilingQuery }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessFilingQuery")
	public JAXBElement<BusinessFilingQuery> createBusinessFilingQuery(
			BusinessFilingQuery value) {
		return new JAXBElement<BusinessFilingQuery>(_BusinessFilingQuery_QNAME,
				BusinessFilingQuery.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessFilingQueryResponse }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessFilingQueryResponse")
	public JAXBElement<BusinessFilingQueryResponse> createBusinessFilingQueryResponse(
			BusinessFilingQueryResponse value) {
		return new JAXBElement<BusinessFilingQueryResponse>(
				_BusinessFilingQueryResponse_QNAME,
				BusinessFilingQueryResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessLicenceExQueryResponse }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessLicenceExQueryResponse")
	public JAXBElement<BusinessLicenceExQueryResponse> createBusinessLicenceExQueryResponse(
			BusinessLicenceExQueryResponse value) {
		return new JAXBElement<BusinessLicenceExQueryResponse>(
				_BusinessLicenceExQueryResponse_QNAME,
				BusinessLicenceExQueryResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessLicenceExQuery }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessLicenceExQuery")
	public JAXBElement<BusinessLicenceExQuery> createBusinessLicenceExQuery(
			BusinessLicenceExQuery value) {
		return new JAXBElement<BusinessLicenceExQuery>(
				_BusinessLicenceExQuery_QNAME, BusinessLicenceExQuery.class,
				null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessLicenceExSignQuery }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessLicenceExSignQuery")
	public JAXBElement<BusinessLicenceExSignQuery> createBusinessLicenceExSignQuery(
			BusinessLicenceExSignQuery value) {
		return new JAXBElement<BusinessLicenceExSignQuery>(
				_BusinessLicenceExSignQuery_QNAME,
				BusinessLicenceExSignQuery.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessCancelFilingResponse }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessCancelFilingResponse")
	public JAXBElement<BusinessCancelFilingResponse> createBusinessCancelFilingResponse(
			BusinessCancelFilingResponse value) {
		return new JAXBElement<BusinessCancelFilingResponse>(
				_BusinessCancelFilingResponse_QNAME,
				BusinessCancelFilingResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessFilingExResponse }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessFilingExResponse")
	public JAXBElement<BusinessFilingExResponse> createBusinessFilingExResponse(
			BusinessFilingExResponse value) {
		return new JAXBElement<BusinessFilingExResponse>(
				_BusinessFilingExResponse_QNAME,
				BusinessFilingExResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link TestResponse }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "testResponse")
	public JAXBElement<TestResponse> createTestResponse(TestResponse value) {
		return new JAXBElement<TestResponse>(_TestResponse_QNAME,
				TestResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessCancelFiling }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessCancelFiling")
	public JAXBElement<BusinessCancelFiling> createBusinessCancelFiling(
			BusinessCancelFiling value) {
		return new JAXBElement<BusinessCancelFiling>(
				_BusinessCancelFiling_QNAME, BusinessCancelFiling.class, null,
				value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessLicenceExSignQueryResponse }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessLicenceExSignQueryResponse")
	public JAXBElement<BusinessLicenceExSignQueryResponse> createBusinessLicenceExSignQueryResponse(
			BusinessLicenceExSignQueryResponse value) {
		return new JAXBElement<BusinessLicenceExSignQueryResponse>(
				_BusinessLicenceExSignQueryResponse_QNAME,
				BusinessLicenceExSignQueryResponse.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessFilingResponse }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessFilingResponse")
	public JAXBElement<BusinessFilingResponse> createBusinessFilingResponse(
			BusinessFilingResponse value) {
		return new JAXBElement<BusinessFilingResponse>(
				_BusinessFilingResponse_QNAME, BusinessFilingResponse.class,
				null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link BusinessFiling }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessFiling")
	public JAXBElement<BusinessFiling> createBusinessFiling(BusinessFiling value) {
		return new JAXBElement<BusinessFiling>(_BusinessFiling_QNAME,
				BusinessFiling.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link BusinessFilingEx }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "businessFilingEx")
	public JAXBElement<BusinessFilingEx> createBusinessFilingEx(
			BusinessFilingEx value) {
		return new JAXBElement<BusinessFilingEx>(_BusinessFilingEx_QNAME,
				BusinessFilingEx.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link Test }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://service.exterior.remot.business.com/", name = "test")
	public JAXBElement<Test> createTest(Test value) {
		return new JAXBElement<Test>(_Test_QNAME, Test.class, null, value);
	}

}
