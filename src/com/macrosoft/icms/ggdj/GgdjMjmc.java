package com.macrosoft.icms.ggdj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.qydj.QYDJ_CZXX_SQ;
import com.macrosoft.icms.system.SysUtility;

/**
 * 广告登记媒介名称
 * 
 * @author lihsh
 *
 */
public class GgdjMjmc {
	private Log logger = LogFactory.getLog(GgdjMjmc.class);
	// 主键
	private String id;
	// 主表id
	private String sqxxId;
	// 媒介名称
	private String mediaName;
	// 媒介名称
	private List<String> mediaNameList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSqxxId() {
		return sqxxId;
	}

	public void setSqxxId(String sqxxId) {
		this.sqxxId = sqxxId;
	}

	public List<String> getMediaNameList() {
		return mediaNameList;
	}

	public void setMediaNameList(List<String> mediaNameList) {
		this.mediaNameList = mediaNameList;
	}

	
	public String getMediaName() {
		return mediaName;
	}

	public void setMediaName(String mediaName) {
		this.mediaName = mediaName;
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
		
	/**
	 * 通过主表ID删除
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doDeleteBySqxxId() throws SQLException {
		if (StringUtils.isEmpty(sqxxId)) {
			return true;
		}
		DbConnection dbc = new DbConnection();
		String sqlDelete = "DELETE FROM GGFB_MJMC" + " WHERE SQXXID='" + SysUtility.doPreProcess(sqxxId) + "'";
		int nRowCount = dbc.executeUpdate(sqlDelete);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		} else
			return false;
	}

	/**
	 * 插入数据
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doInsert() throws SQLException {
		if (StringUtils.isEmpty(sqxxId)) {
			return false;
		} else if (this.getMediaNameList() == null || this.getMediaNameList().isEmpty()) {
			return true;
		} else {
			DbConnection dbc = new DbConnection();
			String sql;
			int nRowCount;
			for (int i = 0; i < this.getMediaNameList().size(); i++) {
				sql = "insert into ggfb_mjmc(id,sqxxid,medianame) values ('" + UUID.randomUUID().toString().trim().replaceAll("-", "") + "','"
						+ this.getSqxxId() + "','" + SysUtility.doPreProcess(mediaNameList.get(i)) + "')";
				nRowCount = dbc.executeUpdate(sql);
				if (nRowCount == 0) {
					return false;
				}
			}
			dbc.close();
		}
		return true;

	}
	/**
	 * 查询媒材料信息
	 * @return
	 * @throws SQLException
	 */
	public List<String> queryMediaNameListByMtbId() throws SQLException {
		ArrayList<String> mnList = new ArrayList<String>();
		if (!StringUtils.isEmpty(sqxxId)) {
			DbConnection dbc = new DbConnection();
			ResultSet rsSelect;
			String sql = "SELECT MEDIANAME FROM GGFB_MJMC M WHERE M.SQXXID = '" + sqxxId + "'";
			rsSelect = dbc.executeQuery(sql);
			while (rsSelect.next()) {
				mnList.add(rsSelect.getString("MEDIANAME"));
			}
			dbc.close();
		}
		this.setMediaNameList(mnList);
		return this.getMediaNameList();
	}
	/**
	 * 从正式库查询媒介材料
	 * @return
	 * @throws SQLException
	 */
	public List<String> queryMediaNameListByMtbIdFromDb() throws SQLException {
		ArrayList<String> mnList = new ArrayList<String>();
		if (!StringUtils.isEmpty(sqxxId)) {
			DbConnection dbc = null;
			ResultSet rsSelect = null;			
			try {
				dbc = new DbConnection();
				String sql = "SELECT MEDIANAME FROM GGFB_MJMC_ZS M WHERE M.SQXXID = '" + sqxxId + "'";
				rsSelect = dbc.executeQuery(sql);
				while (rsSelect.next()) {
					mnList.add(rsSelect.getString("MEDIANAME"));
				}
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}finally {
				if(dbc != null) {
					dbc.close();
				}
				if(rsSelect != null) {
					rsSelect.close();
				}
			}
			
		}
		this.setMediaNameList(mnList);
		return this.getMediaNameList();
	}

	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM GGFB_MJMC"+" WHERE  ID="+doPreProcess3(id)+"  and  SQXXID="+doPreProcess3(sqxxId);
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	
	public boolean doModify() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE GGFB_MJMC SET MEDIANAME="+doPreProcess3(mediaName)+" WHERE ID="+doPreProcess3(id)+" and SQXXID="+doPreProcess3(sqxxId);
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	
		{
			return true;
		}
		else
			return false;
	}
	
	
	public boolean doDelete() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM GGFB_MJMC"+" WHERE ID="+doPreProcess3(id)+" and SQXXID="+doPreProcess3(sqxxId);
		int nRowCount=dbc.executeUpdate( sqlDelete );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}
	
	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GGFB_MJMC(ID,SQXXID,MEDIANAME) VALUES("+doPreProcess3(id)+","+doPreProcess3(sqxxId)+","+doPreProcess3(mediaName)+")";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)	
				return true;
			else
				return false;
		}
	}
	public ArrayList getList( String sqlWhere,String startRow ) throws SQLException
	{
		if (SysUtility.isNumeric(startRow))		
			return getList( sqlWhere,Integer.parseInt(startRow),10);
		else		
			return getList( sqlWhere,0,10);
	}
	
	public ArrayList getList( String sqlWhere,int startRow,int PageSize) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM GGFB_MJMC";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		sqlList+=" AND ROWNUM<="+(startRow+PageSize);//start+pagesize 
		ResultSet rsList=dbc.executeQuery( sqlList);
		int	nDispRows=0;
		do
		{
			nDispRows++;
			if (nDispRows>startRow)	break;
		}
		while (rsList.next());
		while(rsList.next()) {
			GgdjMjmc bTable=new GgdjMjmc();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();
		dbc.close();
		return al;

	}
	
	public int getListCount(String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT COUNT(*) FROM GGFB_MJMC";
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
	
	private void doSetData( ResultSet rsSelect ) throws SQLException
	{
		id=rsSelect.getString("ID");
		sqxxId=rsSelect.getString("SQXXID");
		mediaName = rsSelect.getString("MEDIANAME");
	}

}
