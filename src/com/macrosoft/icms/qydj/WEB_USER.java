package com.macrosoft.icms.qydj;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.*;
import javax.xml.soap.SOAPException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.business.remot.exterior.Authentication.AuthenticationRemotService;
import com.business.remot.exterior.Authentication.AuthenticationRemotServiceService;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class WEB_USER
{
	String LOGINID;
	String USERNAME;
	String PASSWORD;
	String QUESTION;
	String ANSWER;
	String TEL;
	String ADDR;
	String POSTALCODE;
	String EMAIL;
	String CERTYPE;
	String CERNO;
	String REGDATE;
	int LEVE;
	String REMARK;
	Hashtable hQueryString;
	
	String DL;
	String ENTCLASS;
	String ENTTYPE;
	String OPETYPE;
	String ENTNAME;
	String MCID;
	String OPENO;
	String SIGN;
	String XZQH;
	String TYPE;
	
	
	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	public String getXZQH() {
		return XZQH;
	}

	public void setXZQH(String XZQH) {
		this.XZQH = XZQH;
	}
	
	public String getSIGN() {
		return SIGN;
	}

	public void setSIGN(String sign) {
		SIGN = sign;
	}

	public String getOPENO() {
		return OPENO;
	}

	public void setOPENO(String openo) {
		OPENO = openo;
	}

	public String getDL() {
		return DL;
	}

	public void setDL(String dl) {
		DL = dl;
	}

	

	public String getENTCLASS() {
		return ENTCLASS;
	}

	public void setENTCLASS(String entclass) {
		ENTCLASS = entclass;
	}

	public String getENTNAME() {
		return ENTNAME;
	}

	public void setENTNAME(String entname) {
		ENTNAME = entname;
	}

	public String getENTTYPE() {
		return ENTTYPE;
	}

	public void setENTTYPE(String enttype) {
		ENTTYPE = enttype;
	}

	public String getMCID() {
		return MCID;
	}

	public void setMCID(String mcid) {
		MCID = mcid;
	}

	public String getOPETYPE() {
		return OPETYPE;
	}

	public void setOPETYPE(String opetype) {
		OPETYPE = opetype;
	}

	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=convertCode(LOGINID);
	}
	public void setLOGINID1( String LOGINID)
	{
		this.LOGINID=LOGINID;
	}
	public String getUSERNAME()
	{
		return doPreProcess(USERNAME);
	}

	public void setUSERNAME( String USERNAME)
	{
		this.USERNAME=convertCode(USERNAME);
	}

	public String getPASSWORD()
	{
		return doPreProcess(PASSWORD);
	}

	public void setPASSWORD( String PASSWORD)
	{
		this.PASSWORD=convertCode(PASSWORD);
	}

	public String getQUESTION()
	{
		return doPreProcess(QUESTION);
	}

	public void setQUESTION( String QUESTION)
	{
		this.QUESTION=convertCode(QUESTION);
	}

	public String getANSWER()
	{
		return doPreProcess(ANSWER);
	}

	public void setANSWER( String ANSWER)
	{
		this.ANSWER=convertCode(ANSWER);
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=convertCode(TEL);
	}

	public String getADDR()
	{
		return doPreProcess(ADDR);
	}

	public void setADDR( String ADDR)
	{
		this.ADDR=convertCode(ADDR);
	}

	public String getPOSTALCODE()
	{
		return doPreProcess(POSTALCODE);
	}

	public void setPOSTALCODE( String POSTALCODE)
	{
		this.POSTALCODE=convertCode(POSTALCODE);
	}

	public String getEMAIL()
	{
		return doPreProcess(EMAIL);
	}

	public void setEMAIL( String EMAIL)
	{
		this.EMAIL=convertCode(EMAIL);
	}

	public String getCERTYPE()
	{
		return doPreProcess(CERTYPE);
	}

	public void setCERTYPE( String CERTYPE)
	{
		this.CERTYPE=convertCode(CERTYPE);
	}

	public String getCERNO()
	{
		return doPreProcess(CERNO);
	}

	public void setCERNO( String CERNO)
	{
		this.CERNO=convertCode(CERNO);
	}

	public String getREGDATE()
	{
		return REGDATE;
	}

	public void setREGDATE( String REGDATE)
	{
		this.REGDATE=REGDATE ;
	}

	public int getLEVE()
	{
		return LEVE;
	}

	public void setLEVE( int LEVE)
	{
		this.LEVE=LEVE ;
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=convertCode(REMARK);
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

	public void doSelect( DbConnection dbc ) throws SQLException
	{
		ResultSet rsSelect;
		String sqlSelect="SELECT XZQH,LOGINID,USERNAME,PASSWORD,QUESTION,ANSWER,TEL,ADDR,POSTALCODE,EMAIL,CERTYPE,CERNO,to_char("+REGDATE+",'yyyy-mm-dd') as REGDATE,LEVE,REMARK FROM WEB_USER"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";		
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	LOGINID=rsSelect.getString("LOGINID");
	USERNAME=rsSelect.getString("USERNAME");
	PASSWORD=rsSelect.getString("PASSWORD");
	QUESTION=rsSelect.getString("QUESTION");
	ANSWER=rsSelect.getString("ANSWER");
	TEL=rsSelect.getString("TEL");
	ADDR=rsSelect.getString("ADDR");
	POSTALCODE=rsSelect.getString("POSTALCODE");
	EMAIL=rsSelect.getString("EMAIL");
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	REGDATE=rsSelect.getString("REGDATE");
	REGDATE=String.valueOf(rsSelect.getDate("REGDATE"));
	LEVE=rsSelect.getInt("LEVE");
	REMARK=rsSelect.getString("REMARK");
	XZQH=rsSelect.getString("XZQH");
	}

	public boolean doAdd( DbConnection dbc ) throws SQLException
	{
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO WEB_USER(LOGINID,USERNAME,PASSWORD,QUESTION,ANSWER,TEL,ADDR,POSTALCODE,EMAIL,CERTYPE,CERNO,REGDATE,LEVE,REMARK,XZQH) VALUES("+ doPreProcess3(LOGINID)+","+ doPreProcess3(USERNAME)+","+ doPreProcess3(encryptPassword(PASSWORD))+","+ doPreProcess3(QUESTION)+","+ doPreProcess3(ANSWER)+","+ doPreProcess3(TEL)+","+ doPreProcess3(ADDR)+","+ doPreProcess3(POSTALCODE)+","+ doPreProcess3(EMAIL)+","+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+",to_date("+doPreProcess3(REGDATE)+",'yyyy-mm-dd'),"+LEVE+","+ doPreProcess3(REMARK)+","+doPreProcess3(XZQH)+")";
		String sqlCount="SELECT COUNT(*) FROM WEB_USER"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		nRowCount=rsCount.getInt( 1 );

		if (nRowCount>0)		//有相同的数据存在
		{
			if (doModify(dbc))	
				return true;	 
			else	
				return false;	
		}
		else	
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			if (nRowCount>0)	//插入成功
				return true;
			else
				return false;
		}
	}

	public boolean doCount( DbConnection dbc ) throws SQLException
	{
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM WEB_USER"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		nRowCount=rsCount.getInt( 1 );

		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	public boolean doModify( DbConnection dbc ) throws SQLException
	{
		//String sqlModify="UPDATE WEB_USER SET LOGINID='"+doPreProcess(LOGINID)+"',USERNAME='"+doPreProcess(USERNAME)+"',PASSWORD='"+doPreProcess(encryptPassword(PASSWORD))+"',QUESTION='"+doPreProcess(QUESTION)+"',ANSWER='"+doPreProcess(ANSWER)+"',TEL='"+doPreProcess(TEL)+"',ADDR='"+doPreProcess(ADDR)+"',POSTALCODE='"+doPreProcess(POSTALCODE)+"',EMAIL='"+doPreProcess(EMAIL)+"',CERTYPE='"+doPreProcess(CERTYPE)+"',CERNO='"+doPreProcess(CERNO)+"',REGDATE="+doPreProcess2(REGDATE)+",LEVE="+LEVE+",REMARK='"+doPreProcess(REMARK)+"'"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		//带加密-----------2012-02-08改为不加密
		//String sqlModify="UPDATE WEB_USER SET LOGINID="+ doPreProcess3(LOGINID)+",USERNAME="+ doPreProcess3(USERNAME)+",PASSWORD="+ doPreProcess3(encryptPassword(PASSWORD))+",QUESTION="+ doPreProcess3(QUESTION)+",ANSWER="+ doPreProcess3(ANSWER)+",TEL="+ doPreProcess3(TEL)+",ADDR="+ doPreProcess3(ADDR)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",EMAIL="+ doPreProcess3(EMAIL)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",REGDATE=to_date("+doPreProcess3(REGDATE)+",'yyyy-mm-dd'),LEVE="+LEVE+",REMARK="+ doPreProcess3(REMARK)+""+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		//不带加密
		String sqlModify="UPDATE WEB_USER SET LOGINID="+ doPreProcess3(LOGINID)+",USERNAME="+ doPreProcess3(USERNAME)+",QUESTION="+ doPreProcess3(QUESTION)+",ANSWER="+ doPreProcess3(ANSWER)+",TEL="+ doPreProcess3(TEL)+",ADDR="+ doPreProcess3(ADDR)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",EMAIL="+ doPreProcess3(EMAIL)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",REGDATE=to_date("+doPreProcess3(REGDATE)+",'yyyy-mm-dd'),LEVE="+LEVE+",REMARK="+ doPreProcess3(REMARK)+",XZQH="+ doPreProcess3(XZQH)+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		System.out.println("sqlModify="+sqlModify);
		int nRowCount=dbc.executeUpdate( sqlModify );
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	
	public boolean doModifyPwd(DbConnection dbc,String loginid,String password) throws SQLException
	{
		String sqlModify="UPDATE WEB_USER SET PASSWORD="+ doPreProcess3(encryptPassword(password))+" WHERE LOGINID='"+doPreProcess(loginid)+"'";
		System.out.println("pwdModify="+sqlModify);
		int nRowCount=dbc.executeUpdate( sqlModify );
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	
	public boolean doModify(DbConnection dbc,String loginid) throws SQLException
	{
		String sqlModify="UPDATE WEB_USER SET USERNAME="+ doPreProcess3(USERNAME)+",QUESTION="+ doPreProcess3(QUESTION)+",ANSWER="+ doPreProcess3(ANSWER)+",TEL="+ doPreProcess3(TEL)+",ADDR="+ doPreProcess3(ADDR)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",EMAIL="+ doPreProcess3(EMAIL)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",REGDATE=to_date("+doPreProcess3(REGDATE)+",'yyyy-mm-dd'),LEVE="+LEVE+",REMARK="+ doPreProcess3(REMARK)+",XZQH="+ doPreProcess3(XZQH)+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		System.out.println("Modify="+sqlModify);
		int nRowCount=dbc.executeUpdate( sqlModify );
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}

//	public boolean doDelete( DbConnection dbc ) throws SQLException
//	{
//		String sqlDelete="DELETE FROM WEB_USER"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
//		int nRowCount=dbc.executeUpdate( sqlDelete );
//		if (nRowCount>0)
//		{
//			return true;
//		}
//		else
//			return false;
//	}

	public int getListCount( DbConnection dbc,String sqlWhere ) throws SQLException
	{
		String sqlCount="SELECT COUNT(*) FROM WEB_USER";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlCount+=sqlWhere;}
			else {
				sqlCount+=" WHERE "+sqlWhere;}
		}
		ResultSet rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		int nRowCount=rsCount.getInt( 1 );
		rsCount.close();
		rsCount=null;
		return nRowCount;

	}

	public ResultSet getList( DbConnection dbc,String sqlWhere ) throws SQLException
	{
		String sqlList="SELECT * FROM WEB_USER";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		return dbc.executeQuery( sqlList );

	}

	public int getListCount(String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT COUNT(*) FROM WEB_USER";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlCount+=sqlWhere;}
			else {
				sqlCount+=" WHERE "+sqlWhere;}
		}
		ResultSet rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		int nRowCount=rsCount.getInt( 1 );
		dbc.close();
		return nRowCount;

	}

	public ArrayList getList( String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM WEB_USER";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			WEB_USER bTable=new WEB_USER();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public Iterator getItList( String sqlWhere,String startRow ) throws SQLException
	{
		if (SysUtility.isNumeric(startRow))		
			return getList(sqlWhere,Integer.parseInt(startRow)).iterator();
		else		
			return getList(sqlWhere,0).iterator();
	}
	public ArrayList getList( String sqlWhere,String startRow ) throws SQLException
	{
		if (SysUtility.isNumeric(startRow))		
			return getList( sqlWhere,Integer.parseInt(startRow),10);
		else		
			return getList( sqlWhere,0,10);
	}
	public ArrayList getList( String sqlWhere,String startRow,int PageSize ) throws SQLException
	{
		if (SysUtility.isNumeric(startRow))		
			return getList( sqlWhere,Integer.parseInt(startRow),PageSize);
		else		
			return getList( sqlWhere,0,PageSize);
	}
	public ArrayList getList( String sqlWhere,int startRow ) throws SQLException
	{
			return getList( sqlWhere,startRow,10);
	}
	////////reload function getlist
	public ArrayList getList( String sqlWhere,int startRow,int PageSize) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM WEB_USER";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		sqlList+=" AND ROWNUM<="+(startRow+PageSize);//start+pagesize 
		ResultSet rsList=dbc.executeQuery( sqlList);
		//过掉所有已经显示的列
		int	nDispRows=0;
		do
		{
			nDispRows++;
			if (nDispRows>startRow)	break;
		}
		while (rsList.next());
		while(rsList.next()) {
			WEB_USER bTable=new WEB_USER();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM WEB_USER"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		ResultSet rsArr=dbc.executeQuery(sqlArr);
		ArrayList al= new ArrayList();
		String[] ay = null;
		if (rsArr.next()){	
			doSetData( rsArr );
			ResultSetMetaData rsmd = rsArr.getMetaData();
			for (int k=1;k<=rsmd.getColumnCount(); k++)	{
				ay = new String[2];
				ay[0]=rsmd.getColumnName(k);
				if (rsmd.getColumnTypeName(k).equalsIgnoreCase("DATETIME")||rsmd.getColumnTypeName(k).equalsIgnoreCase("DATE"))
					ay[1]=String.valueOf(rsArr.getDate(ay[0]));
				else
					ay[1]=String.valueOf(rsArr.getObject(ay[0]));
				if (!ay[1].trim().equals("null")&&!ay[1].trim().equals(""))
					{ay[1]=SysUtility.pre(ay[1]); al.add(ay);}
			}
		}
		dbc.close();
		return al;

	}
	///////////////user define//////////////////////
/////////////////user class/////////////////////////
/////
	public WEB_USER()
	{
		USERNAME=null;
		LOGINID=null;
		hQueryString=new Hashtable();
	}
	/**	释放所占用的资源 **/
	public void finalize()
	{
		
		System.out.println( "SysUser:"+USERNAME.trim()+"用户退出成功!");
		USERNAME=null;
		LOGINID=null;
		hQueryString=null;
		
	}
		/** 用户登录时所要做的操作 **/
	public void doLogin()
	{
		System.out.println( "SysUser: Message doLogin()... " );
	}

	/** 用户注销时所要做的操作 **/
	public void doLogout()
	{
		System.out.println( "SysUser: Message: doLogout()... " );
	}	
/**
		设置某一页面当前的QueryString，为将来返回做准备
	*/
	public void setQueryString(String sPageName, String sQueryString)
	{
		if (hQueryString.containsKey(sPageName))	//包含指定页面的信息
		{
			hQueryString.remove( sPageName );
		}
		if (sQueryString==null)
		{
			sQueryString="";
		}
		hQueryString.put( sPageName, sQueryString );
	}

	/**
		根据页面的位置，或的原先存储的QueryString
	*/
	public String getQueryString( String sPageName )
	{
		if (hQueryString.containsKey(sPageName))
		{
			return (String)hQueryString.get(sPageName);
		}
		return "";
	}
	public void setQueryString(HttpServletRequest request )
	{
		String QueryString="";
		//if (request.getQueryString()!=null)
		//{
		//	setQueryString(request.getRequestURI(), request.getQueryString());
		//}
		//else
		//{
			Enumeration paramNames = request.getParameterNames();  
			while(paramNames.hasMoreElements())
			{  			
				String paramName = com.macrosoft.icms.system.SysUtility.convertCode((String)paramNames.nextElement()); 
				String[] paramValues = request.getParameterValues(paramName);
				
				for (int i=0;i<paramValues.length;i++ )
				{
					if (paramValues[i]!=null&&!paramValues[i].trim().equals(""))
					{
						QueryString += "&" + paramName + "="+com.macrosoft.icms.system.SysUtility.convertCode(paramValues[i]).trim();
					}
					
				}
			}
			setQueryString(request.getRequestURI(), QueryString);
		//}
		
	}
	/**
		根据传入的页面，生成原先调用该页面的URL
	*/
	public String getReturnPage( String sPageName )
	{
		return sPageName + "?" + getQueryString(sPageName);
	}

	public boolean validatePage( String sCurPage) throws ICMSException
	{
		if (USERNAME==null||USERNAME.trim().equals(""))
			throw new ICMSException( "用户没有登陆或登录时间超时！", "用户没有登陆，没有访问该页的权限！", sCurPage, "/login.jsp" );
		return true;	//允许访问：不在模块列表中的页面
	}
/////////////////////user check///////////////////////////////
/**	功能：检查用户登录信息	参数：dbc-数据库连接 sPass-用户密码	返回：1=登陆成功 -1=没有该用户 -2=密码错误 -3=一般性错误	**/
	public int validateLogin( DbConnection dbc, String sUserName, String sPass) throws SQLException
	{
		ResultSet rsUser;	
		try
		{
			//检验用户是否存在
			rsUser=dbc.executeQuery( "SELECT * FROM WEB_USER WHERE LOGINID='" + sUserName + "'");
			if (rsUser.next())
			{
				//校验用户密码
				if (!validatePassword( rsUser.getString("PASSWORD"), sPass ))			
				{
					return -2;		
				}
				
				doSetData(rsUser);
				TYPE="1";
			}
			else	//没有该用户
			{
				return -1;				
			}
			rsUser.close();
			rsUser=null;


		}
		catch (SQLException e)
		{
			System.out.println( "SysUser Error: " + e.getMessage() );
			return -3;
		}
		return 1;
	}
	
	/**
	 * 
	 * 获取电子执照服务分系统URL
	 * @return
	 * 
	 *//*
	private URL createURL(){
		//#authservice.url=http://10.8.10.151:8080/authenticationService/services/AuthenticationService?wsdl
	String authIp ="";//systemData.getAuthIp();
	String authPort ="";//systemData.getAuthPort();
	String authServiceURL = "http://"+authIp+":"+authPort+"/authenticationService/services/AuthenticationService?wsdl";
		
		System.out.println("-============>"+authServiceURL);

		URL url = null;
		URL baseUrl = null;
		
		baseUrl = AuthenticationRemotServiceService.class
		.getResource(".");
		
		try {
			
			url = new URL(baseUrl,authServiceURL);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
		
	}*/
	
	/**	功能：检查电子执照信息	参数：dbc-数据库连接  pinma-PIN码  cert-执照信息 返回：1=登陆成功 -1=没有该用户 -2=密码错误 -3=一般性错误	**/
	public int validateLogin2( DbConnection dbc, String pinma, String cert) throws SQLException{//暂停使用2016.10.17
		//URL url = createURL();
		AuthenticationRemotServiceService service = new AuthenticationRemotServiceService();
		AuthenticationRemotService auth =service.getAuthenticationRemotServicePort();
		int error = 0;	
		
		/**
		 * 1)	电子营业执照验证: BusinessLicenceCheck(String   licenceEntity, String   sysCode)
		 * 		licenceEntity：电子营业执照，数据格式为BASE64编码格式
		 *		sysCode：当前发起请求业务系统的系统代码ID，通过协商后，统一规划的业务系统代码，必填项
		 */
		int i =auth.businessLicenceCheck(cert, "SAIC_SDGS_370000");
		
		if(i==0){
			System.out.println("验证成功！");
			error = 1;
			templateInfo(pinma,cert);
		}else{
			System.out.println("有效性验证结果"+i);
			error = i;
		}
		
		return error;
	}
	/**	功能：获取电子执照信息	参数：pinma-PIN码  cert-执照信息**/    //暂停使用2016.10.17
	public void templateInfo(String pinma, String cert) throws SQLException{
		//URL url = createURL();
		AuthenticationRemotServiceService service = new AuthenticationRemotServiceService();
		
		AuthenticationRemotService auth =service.getAuthenticationRemotServicePort();
		/**
		 * 5)String  BusinessLicenceGetLicenceInfo(String  licenceEntity,String  sysCode)
		 * 		licenceEntity：电子营业执照，数据格式为BASE64编码格式
		 *			 sysCode：当前发起请求业务系统的系统代码ID，通过协商后，统一规划的业务系统代码，必填项
		 */
		String p5=auth.businessLicenceGetLicenceInfo(cert, "SAIC_SDGS_370000");
		System.out.println("5解析电子营业执照返回解析执照 xml 信息---"+p5);
		
		Document doc=null;
		try {
			doc=DocumentHelper.parseText(p5);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		//将字符串转换为xml
		
		Element rootElt=doc.getRootElement(); //获取根节点
		String errorCode = rootElt.elementTextTrim("errorCode"); 
		if(errorCode.equals("0")){
			System.out.println("获取成功！");
			LOGINID=rootElt.elementTextTrim("attribute17");//注册号
			USERNAME=rootElt.elementTextTrim("attribute18");//名称
			ADDR=rootElt.elementTextTrim("attribute29");//住址
			XZQH=rootElt.elementTextTrim("attribute42");//登记机关
			REGDATE=rootElt.elementTextTrim("attribute33");//成立日期
			TYPE="2";
			
		}else{
			System.out.println("有效性验证结果"+errorCode);
		}
		
		
	}
	//eid登录            //暂停使用2016.10.17
	public int validateLogin3(DbConnection dbc,String name,String idnum,String result,String issuer,String certSn,String issuerSn,String toSignData,String subject) throws SOAPException{
		Eid p=new Eid();
		String code=p.requestBizSignVerifyPKI(name, idnum, "01", issuer, issuerSn, certSn, subject, toSignData, result, "1", "1");
		String re=p.parse(code);
		System.out.println(code);
		if("0".equals(re)||"001001".equals(re)||"001002".equals(re)||"001003".equals(re)||"001004".equals(re)||"001005".equals(re)){
			System.out.println("认证成功！");
			ResultSet rsUser;	
			try
			{
				//检验用户是否存在
				rsUser=dbc.executeQuery( "SELECT * FROM WEB_USER WHERE LOGINID='" + idnum + "'");
				if (rsUser.next())
				{
					doSetData(rsUser);
					TYPE="3";
				}
				else	//没有该用户
				{
					LOGINID=idnum;
					TYPE="3";				
				}
				
				rsUser.close();
				rsUser=null;
				return 1;

			}catch (SQLException e)
			{
				System.out.println( "SysUser Error: " + e.getMessage() );
				return -3;
			}
			
			
			
		}
		return 0;
		
	} 
	
	//eid签名登录 //暂停使用2016.10.17
	public int validateLogin4(String name,String idnum,String result,String issuer,String certSn,String issuerSn,String toSignData,String subject) throws SOAPException{
		Eid p=new Eid();
		String code=p.requestBizSignVerifyPKI(name, idnum, "01", issuer, issuerSn, certSn, subject, toSignData, result, "1", "1");
		String re=p.parse(code);
		System.out.println(code);
		if("0".equals(re)||"001001".equals(re)||"001002".equals(re)||"001003".equals(re)||"001004".equals(re)||"001005".equals(re)){
			System.out.println("认证成功！");
			return 1;
		}
		return 0;
		
	} 
	
	/**	功能：检查用户登录信息	参数：dbc-数据库连接 token 令牌值 	返回：1=登陆成功 -1=没有该用户 -2=密码错误 -3=一般性错误	**/
	public int validateLogin5( DbConnection dbc, String token) throws SQLException
	{
		ResultSet rsUser;	
		try
		{
			//检验用户是否存在
			rsUser=dbc.executeQuery( "SELECT * FROM WEB_USER WHERE LOGINID='" + token + "'");
			if (rsUser.next())
			{
				doSetData(rsUser);
				TYPE="3";
			}
			else	//没有该用户
			{
				LOGINID=token;
				TYPE="3";
				return 1;				
			}
			rsUser.close();
			rsUser=null;


		}
		catch (SQLException e)
		{
			System.out.println( "SysUser Error: " + e.getMessage() );
			return -3;
		}
		return 1;
	}

	
	/**	功能：检查用户登录信息	参数：dbc-数据库连接 token 令牌值 	返回：1=登陆成功 -1=没有该用户 -2=密码错误 -3=一般性错误	
	 * @throws SOAPException 
	 * 
	 */
	public int validateLogin6( DbConnection dbc, String token) throws SQLException, SOAPException
	{
		String tokenXml ="<?xml version='1.0' encoding='UTF-8'?><request><token>"+token+"</token></request>";
		
		EidInfo p=new EidInfo();
		Map<String,String> map =  p.checkToken(tokenXml);
		String idCard = map.get("idCard");
		
		ResultSet rsUser;	
		try
		{
			//检验用户是否存在
			rsUser=dbc.executeQuery( "SELECT * FROM WEB_USER WHERE LOGINID='" + idCard + "'");
			if (rsUser.next())
			{
				doSetData(rsUser);
				TYPE="3";
			}
			else	//没有该用户
			{
				LOGINID=idCard;
				TYPE="3";
				return 1;				
			}
			rsUser.close();
			rsUser=null;


		}
		catch (SQLException e)
		{
			System.out.println( "SysUser Error: " + e.getMessage() );
			return -3;
		}
		return 1;
	}
	
	//校验用户密码
	public boolean validatePassword(String PASSWORD, String sPass )
	{
		//带加密-----------2012-02-08改为不加密
		//if (doPreProcess(PASSWORD).equals(encryptPassword(doPreProcess(sPass))))
		if (doPreProcess(PASSWORD).equals(doPreProcess(sPass)))
		{
			return true;
		}
		else
		{
			return false;
		}
	}	
	/** 修改密码，可以改非当前用户的密码 **/
	public int changePassword( DbConnection dbc, String sENTID, String sOldPass, String sNewPass ) throws SQLException
	{
		ResultSet rsPass=dbc.executeQuery( "SELECT PASSWORD FROM WEB_USER WHERE LOGINID='"+doPreProcess(sENTID)+"'");
		if (rsPass.next())
		{
			PASSWORD=rsPass.getString("PASSWORD");
		}
		else
		{
			return -2 ;///not found this record		
		}
		rsPass.close();
		rsPass=null;
		//数据库中密码是空
		if (!doPreProcess(PASSWORD).equals(doPreProcess(sOldPass)))
		{
			return -1;  //数据库中密码不为空
		}
		else	
		{
			//带加密-----------2012-02-08改为不加密
			//String sEncryptNewPassword=encryptPassword(doPreProcess(sNewPass));
			//不加密
			String sEncryptNewPassword=doPreProcess(sNewPass);
			int nRowCount=dbc.executeUpdate( "UPDATE WEB_USER SET PASSWORD='" + sEncryptNewPassword + "' WHERE LOGINID='"+doPreProcess(sENTID)+"'");
			if (nRowCount>1)
			{
				return -10; //更新不止一条纪录
			}
			else if (nRowCount==1)
			{
				return 1;//成功更改
			}
			else 
			{
				return 0;//没有更改
			}
			
		}
		
	}

	/** 对密码进行加密 **/
	public String encryptPassword(String originalStr) 
	{
		if (originalStr == null || originalStr.equals(""))
		{
			return "";
		}
		else
		{
			md5 m = new md5();
			return m.calcMD5(originalStr);
			//return "";
		}
	}

////////////////////////////
	public String getWebBH(DbConnection dbc,String specS,int iType) throws SQLException
	{
		String bh="";
		ResultSet rs=dbc.executeQuery( "STP_CREATE_WEBBH '"+specS+"',"+String.valueOf(iType));
		if (rs.next())
		{
			bh=rs.getString(1);
		}
		rs.close();
		rs=null;
		return bh;
	
	}
	public String getCurrentDate(){
		return new SimpleDateFormat("yyyy-MM-dd").format(new java.sql.Date(new java.util.Date().getTime()));
	}
	public void validLoginByXn(String sUserName, String sPass) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM WEB_USER WHERE LOGINID='" + sUserName + "'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
}
