package com.business.remot.exterior.Authentication;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.7.18
 * 2016-07-07T15:28:09.905+08:00
 * Generated source version: 2.7.18
 * 
 */
@WebService(targetNamespace = "http://service.exterior.remot.business.com/", name = "AuthenticationRemotService")
@XmlSeeAlso({ObjectFactory.class})
public interface AuthenticationRemotService {

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "businessLicenceVerifySignEx", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceVerifySignEx")
    @WebMethod
    @ResponseWrapper(localName = "businessLicenceVerifySignExResponse", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceVerifySignExResponse")
    public int businessLicenceVerifySignEx(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        java.lang.String arg1,
        @WebParam(name = "arg2", targetNamespace = "")
        java.lang.String arg2,
        @WebParam(name = "arg3", targetNamespace = "")
        java.lang.String arg3
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "test", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.Test")
    @WebMethod
    @ResponseWrapper(localName = "testResponse", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.TestResponse")
    public int test(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "BusinessLicenceGetLicenceInfoByOID", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceGetLicenceInfoByOID")
    @WebMethod(operationName = "BusinessLicenceGetLicenceInfoByOID")
    @ResponseWrapper(localName = "BusinessLicenceGetLicenceInfoByOIDResponse", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceGetLicenceInfoByOIDResponse")
    public java.lang.String businessLicenceGetLicenceInfoByOID(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        java.lang.String arg1,
        @WebParam(name = "arg2", targetNamespace = "")
        java.lang.String arg2
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "BusinessLicenceCheckEx", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceCheckEx")
    @WebMethod(operationName = "BusinessLicenceCheckEx")
    @ResponseWrapper(localName = "BusinessLicenceCheckExResponse", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceCheckExResponse")
    public java.lang.String businessLicenceCheckEx(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        java.lang.String arg1,
        @WebParam(name = "arg2", targetNamespace = "")
        java.lang.String arg2,
        @WebParam(name = "arg3", targetNamespace = "")
        java.lang.String arg3
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "BusinessLicenceGetLicenceInfo", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceGetLicenceInfo")
    @WebMethod(operationName = "BusinessLicenceGetLicenceInfo")
    @ResponseWrapper(localName = "BusinessLicenceGetLicenceInfoResponse", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceGetLicenceInfoResponse")
    public java.lang.String businessLicenceGetLicenceInfo(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        java.lang.String arg1
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "businessLicenceCheck", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceCheck")
    @WebMethod
    @ResponseWrapper(localName = "businessLicenceCheckResponse", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceCheckResponse")
    public int businessLicenceCheck(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        java.lang.String arg1
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "businessLicenceVerifySign", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceVerifySign")
    @WebMethod
    @ResponseWrapper(localName = "businessLicenceVerifySignResponse", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceVerifySignResponse")
    public int businessLicenceVerifySign(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        java.lang.String arg1,
        @WebParam(name = "arg2", targetNamespace = "")
        java.lang.String arg2,
        @WebParam(name = "arg3", targetNamespace = "")
        java.lang.String arg3
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "BusinessLicenceGenRandom", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceGenRandom")
    @WebMethod(operationName = "BusinessLicenceGenRandom")
    @ResponseWrapper(localName = "BusinessLicenceGenRandomResponse", targetNamespace = "http://service.exterior.remot.business.com/", className = "com.business.remot.exterior.service.BusinessLicenceGenRandomResponse")
    public java.lang.String businessLicenceGenRandom(
        @WebParam(name = "arg0", targetNamespace = "")
        int arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        java.lang.String arg1
    );
}
