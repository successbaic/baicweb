package com.macrosoft.icms.util;

import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;

import com.macrosoft.icms.bean.ONLINE_ORDER_RECODER;
import com.macrosoft.icms.bean.ONLINE_ORDER_RECODER_LS;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsdbc.LsDbConnection;
import com.macrosoft.icms.gsdbc.SJGsDbConnection;
import com.macrosoft.icms.system.SysSystem;

public class DateUtils {

//	根据格式得到日期字符串
	public  static String  getDateStr(Date date,String format){
		String formatStr = "";
		if(format == null || "".equals(format)){
			formatStr = "yyyy-MM-dd";
		}else{
			formatStr = format;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(formatStr);
		return sdf.format(date);
	    
	}
//	得到当前日期
	public static String getTodayStr(String format){
		String formatStr = "";
		if(format == null || "".equals(format)){
			formatStr = "yyyy-MM-dd";
		}else{
			formatStr = format;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(formatStr);
		return sdf.format(new Date());
	}
	//判断时间是否大于当前时间
	public static boolean checkDateAfterToday(String date){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar c = Calendar.getInstance();
		Date dt=c.getTime();
		String dqrq=df.format(dt);
		boolean flag=false;
		try{
            Date dt1 = df.parse(date);
            Date dtdqrq = df.parse(dqrq);
            if (dt1.getTime() >= dtdqrq.getTime()) {
            	flag=true;
            }
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	/**
	 * 判断当前时间是否可以预约
	 * dateYy:日期 timeCut：时间点 icms：预加载的类 regorg:办理机关
	 * @throws SQLException 
	 */
	public static boolean isCanYy(String dateYy,String timeCut,SysSystem icms,String regorg) throws ParseException, SQLException{
//	public static boolean isCanYy(String dateYy,String timeCut,String regorg,String currentUnit,String maxDay) throws ParseException, SQLException{
		String oldDateStr = dateYy + " " + timeCut.substring(6);
		String maxDay =icms.getSysRemark("WSDJ_CFG","YYGZRS");
		String currentUnit = icms.getCurrentUnitLevel();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date oldDate = df.parse(oldDateStr);
		if(oldDate.before(new Date())){
			return false;
		}
		int maxDayInt = Integer.valueOf(maxDay);
		dateYy = dateYy.replaceAll("-", "");
		String sql = 
			"SELECT * FROM (SELECT t.solar_date" +
			"  FROM pub_organ_workday t, pub_organ o" + 
			" WHERE t.is_workday = '1'" + 
			"   AND t.organ_id = o.organ_id" + 
			"   AND t.solar_date >= '"+DateUtils.getTodayStr(null).replaceAll("-", "")+"'" + 
			"   AND o.organ_code = '"+regorg+"' ORDER BY t.solar_date)" + 
			"   WHERE rownum <= "+maxDayInt+"";

		ResultSet rs = null;
		String lastWorkDay = "";
		if("1".equals(currentUnit)){//省局
			LsDbConnection sjDb = new LsDbConnection();
			rs = sjDb.executeQuery(sql);
			while(rs.next()){
				if(dateYy.equals(rs.getString("solar_date"))){
					sjDb.close();
					return true;
				}
			}
		}else if("2".equals(currentUnit)){
			LsDbConnection db = new LsDbConnection();
			rs = db.executeQuery(sql);
			while(rs.next()){
				if(dateYy.equals(rs.getString("solar_date"))){
					db.close();
					return true;
				}
			}
		}
		return false;
	}
	public static void main(String[] args) throws SQLException, IllegalAccessException, InvocationTargetException, InstantiationException, NoSuchMethodException {
		/*
//		System.out.println("sdfsdf");
//		System.out.println(DateUtils.getDateStr(new Date() , null));
//		System.out.println(DateUtils.checkDateAfterToday("2014-05-10 12:23:12"));
//		BeanUtils bc = new BeanUtils();
		String openo = "111";
		ONLINE_ORDER_RECODER recoder = new ONLINE_ORDER_RECODER();
		recoder.setOPENO(openo);
		recoder.doSelect();
		System.out.println(recoder.getENTNAME());
		ONLINE_ORDER_RECODER_LS rels = new ONLINE_ORDER_RECODER_LS();
		//BeanUtils.setProperty(rels, "ENTNAME", recoder);
		//BeanUtils.copyProperties(rels, recoder);
		BeanUtils.copyProperties(rels, recoder);
//		rels = (ONLINE_ORDER_RECODER_LS) BeanUtils.cloneBean(recoder);
		System.out.println(rels.getENTNAME());
		rels.setRECORDERDATE(DateUtils.getDateStr(new Date(), "yyyy-MM-dd HH:mm:ss"));
//		rels.setPRINO("1qsdfasdfasdf");
		rels.doAdd();
		
		boolean isCanYy = false;
		try {
			isCanYy = DateUtils.isCanYy("2014-09-23","20:00-21:00","370202","2","5");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(isCanYy);
		*/
	}
}
