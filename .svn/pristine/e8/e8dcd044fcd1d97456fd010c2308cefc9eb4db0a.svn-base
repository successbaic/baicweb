package com.macrosoft.icms.qcdzh;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.business.remot.exterior.BusinessShow.BusinessShowService;
import com.business.remot.exterior.BusinessShow.BusinessShowServiceService;
import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;

public class BusinessBA{
	String baNum;
	String type;
	String businessNum;
	String regno;
	String uniscid;
	String llr;
	String tel;
	String storeOl;
	String storeOl_url;
	String entname;
	String openo;
	String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEntname() {
		return entname;
	}
	public void setEntname(String entname) {
		this.entname = entname;
	}
	public String getOpeno() {
		return openo;
	}
	public void setOpeno(String openo) {
		this.openo = openo;
	}
	public String getBaNum() {
		return baNum;
	}
	public void setBaNum(String baNum) {
		this.baNum = baNum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBusinessNum() {
		return businessNum;
	}
	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}
	public String getRegno() {
		return regno;
	}
	public void setRegno(String regno) {
		this.regno = regno;
	}
	public String getUniscid() {
		return uniscid;
	}
	public void setUniscid(String uniscid) {
		this.uniscid = uniscid;
	}
	public String getLlr() {
		return llr;
	}
	public void setLlr(String llr) {
		this.llr = llr;
	}
	public String getStoreOl() {
		return storeOl;
	}
	public void setStoreOl(String storeOl) {
		this.storeOl = storeOl;
	}
	public String getStoreOl_url() {
		return storeOl_url;
	}
	public void setStoreOl_url(String storeOl_url) {
		this.storeOl_url = storeOl_url;
	}
	
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	
	public void doSelectBySql(String sqlSelect) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	
	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM BUSINESS_JBXX_SQ"+" WHERE openo='"+doPreProcess(openo)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	
	public void doSetData( ResultSet rsSelect ) throws SQLException{
		baNum=rsSelect.getString("baNum");
		type=rsSelect.getString("type");
		businessNum=rsSelect.getString("businessNum");
		regno=rsSelect.getString("regno");
		uniscid=rsSelect.getString("uniscid");
		llr=rsSelect.getString("llr");
		tel=rsSelect.getString("tel");
		storeOl=rsSelect.getString("storeOl");
		storeOl_url=rsSelect.getString("storeOl_url");
		openo=rsSelect.getString("openo");
		entname=rsSelect.getString("entname");
		status=rsSelect.getString("status");
		
	}
	
	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO BUSINESS_JBXX_SQ(BANUM,TYPE,BUSINESSNUM,OPENO,ENTNAME,REGNO,UNISCID,LLR,TEL,STOREOL,STOREOL_URL,STATUS) VALUES("+ doPreProcess3(baNum)+","+doPreProcess3(type)+","+ doPreProcess3(businessNum)+","+ doPreProcess3(openo)+","+ doPreProcess3(entname)+","+ doPreProcess3(regno)+","+ doPreProcess3(uniscid)+","+ doPreProcess3(llr)+","+ doPreProcess3(tel)+","+ doPreProcess3(storeOl)+","+ doPreProcess3(storeOl_url)+","+ doPreProcess3(status)+")";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)	//插入成功
				return true;
			else
				return false;
		}
	}

	public boolean doCount() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM BUSINESS_JBXX_SQ"+" WHERE openo='"+doPreProcess(openo)+"'";
		rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		nRowCount=rsCount.getInt( 1 );

		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	public boolean doModify() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE BUSINESS_JBXX_SQ SET BANUM="+doPreProcess3(baNum)+",TYPE="+ doPreProcess3(type)+",BUSINESSNUM="+ doPreProcess3(businessNum)+",openo="+ doPreProcess3(openo)+",ENTNAME="+ doPreProcess3(entname)+",REGNO="+ doPreProcess3(regno)+",UNISCID="+ doPreProcess3(uniscid)+",LLR="+ doPreProcess3(llr)+"TEL="+ doPreProcess3(tel)+",STOREOL="+ doPreProcess3(storeOl)+",STOREOL_URL="+ doPreProcess3(storeOl_url)+",STATUS="+ doPreProcess3(status)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}

	public boolean doDelete() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM BUSINESS_JBXX_SQ"+" WHERE openo='"+doPreProcess(openo)+"'";
		int nRowCount=dbc.executeUpdate( sqlDelete );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	public int getListCount(String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT COUNT(*) FROM BUSINESS_JBXX_SQ";
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
		String sqlList="SELECT * FROM BUSINESS_JBXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			BusinessBA bTable=new BusinessBA();
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
		String sqlList="SELECT * FROM BUSINESS_JBXX_SQ";
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
			BusinessBA bTable=new BusinessBA();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM BUSINESS_JBXX_SQ"+" WHERE openo='"+doPreProcess(openo)+"'";
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
	
	public String businessFiling(Map map){
		String uniscid= (String) map.get("uniscid");
		String regno= (String) map.get("regno");
		String llr= (String) map.get("llr");
		String tel= (String) map.get("tel");
		String storeOl= (String) map.get("storeOl");
		String storeOl_url= (String) map.get("storeOl_url");
		String openo= (String) map.get("openo");
		String inputxml="<?xml version='1.0' encoding='utf-8'?>"+//<!---接收系统根据亮照号进行更新和增加本地库中的备案信息。  ->
				"<licence>"+
					"<firm>"+
						"<attribute908>"+openo+"</attribute908>"+//<!---备案号（openo）  ->
    					"<attribute909>"+0+"</ attribute909>"+//<!---是否公视版=0，私钥版=1-->
    					"<attribute17>"+regno+"</attribute17>"+//<!----注册号与统一信用代码必须有其一--->
    					"<attribute13>"+uniscid+"</attribute13>"+
    					"<attribute901>"+""+"</attribute901>"+//<!—电子营业执照编号非必填->
    					"<attribute603>"+llr+"</attribute603>"+
    					"<attribute604>"+tel+"</attribute604>"+
    						"<firmFiling>"+
    							"<name>"+storeOl+"</ name >"+
    							"<url>"+storeOl_url+"</url>"+
    						"</firmFiling>"+
    				"</firm>"+
    			"</licence>";
		
		String code="";
		String syscode="SYS001";
		
		BusinessShowServiceService service=new BusinessShowServiceService();
		BusinessShowService show=service.getBusinessShowServicePort();
		code=show.businessFiling(inputxml, syscode);//获得xml格式的结果
		
		Document doc=null;
		try {
			doc=DocumentHelper.parseText(code);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		//将字符串转换为xml
		Element rootElt=doc.getRootElement(); //获取根节点
		String errorCode = rootElt.elementTextTrim("errorCode"); //结果代码
		String errorInfo = rootElt.elementTextTrim("errorInfo"); //结果信息
		
		System.out.println(errorCode+" : "+errorInfo+" ; ============>");
		return errorCode;
	}
}