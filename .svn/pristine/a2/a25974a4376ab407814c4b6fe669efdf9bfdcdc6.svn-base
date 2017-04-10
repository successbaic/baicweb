package com.macrosoft.icms.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.macrosoft.icms.dbc.DbConnection;

public class ONLINE_ORDER_RECODERS {
	private String regorg;
	private String timeCut;
	private int orderMaxNum;
	private int orderNum;
	public String getRegorg() {
		return regorg;
	}
	public void setRegorg(String regorg) {
		this.regorg = regorg;
	}
	public String getTimeCut() {
		return timeCut;
	}
	public void setTimeCut(String timeCut) {
		this.timeCut = timeCut;
	}
	public int getOrderMaxNum() {
		return orderMaxNum;
	}
	public void setOrderMaxNum(int orderMaxNum) {
		this.orderMaxNum = orderMaxNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public List<ONLINE_ORDER_RECODERS> getOrderNumList(String regorg,String orderDate) throws SQLException{
		DbConnection dbc=new DbConnection();
		List<ONLINE_ORDER_RECODERS> list= new ArrayList<ONLINE_ORDER_RECODERS>();
		String sql = 
			"SELECT t.regorg, t.starttime || '-' || t.endtime AS timeCut,t.ordermaxnum,(" +
			" SELECT COUNT(*) AS orderNum FROM ONLINE_ORDER_RECODER recoder" + 
			" WHERE recoder.regorg = t.regorg" + 
			" AND recoder.starttime = t.starttime" + 
			" AND recoder.endtime = t.endtime" + 
			" AND TO_CHAR(recoder.orderdate,'yyyy-MM-dd') = '"+orderDate+"'" + 
			" GROUP BY recoder.starttime,recoder.endtime,recoder.orderdate" + 
			") AS orderNum" + 
			" FROM online_order_cfg t" + 
			" WHERE t.regorg = '"+regorg+"'" + 
			" AND INSTR(t.businesstype,'1')>0 " +
			" ORDER BY t.starttime";
		ResultSet rs=dbc.executeQuery(sql);
		ONLINE_ORDER_RECODERS bean = null;
		while (rs.next()){
			bean = new ONLINE_ORDER_RECODERS();
			bean.setRegorg(regorg);
			bean.setTimeCut(rs.getString("timeCut"));
			bean.setOrderMaxNum(rs.getInt("ordermaxnum"));
			bean.setOrderNum(rs.getInt("orderNum"));
			list.add(bean);
		}
		dbc.close();
		return list;
	}
	public static void main(String[] args) {
		try {
			List<ONLINE_ORDER_RECODERS> list = new ONLINE_ORDER_RECODERS().getOrderNumList("370200","2014-09-16");
			for(ONLINE_ORDER_RECODERS tt:list){
				System.out.println(tt.getRegorg()+" "+ tt.getTimeCut()+" "+tt.getOrderMaxNum()+" "+tt.getOrderNum());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
