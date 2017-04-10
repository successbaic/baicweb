package com.macrosoft.icms.util;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class WSDJ_YYHM
{
	String OPENO;
	String YYH;
	String YYSJ;
	String YYSXW;
	String ENTNAME;
	String REGORG;
	String SFYQ;	
	String YYNO;
	String TYPE;
	
	public String getTYPE()
	{
		return doPreProcess(TYPE);
	}

	public void setTYPE( String TYPE)
	{
		this.TYPE=doPreProcess2(convertCode(TYPE));
	}
	
	public String getYYNO()
	{
		return doPreProcess(YYNO);
	}

	public void setYYNO( String YYNO)
	{
		this.YYNO=doPreProcess2(convertCode(YYNO));
	}
	
	public String getSFYQ()
	{
		return doPreProcess(SFYQ);
	}

	public void setSFYQ( String SFYQ)
	{
		this.SFYQ=doPreProcess2(convertCode(SFYQ));
	}
	
	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getYYH()
	{
		return doPreProcess(YYH);
	}

	public void setYYH( String YYH)
	{
		this.YYH=doPreProcess2(convertCode(YYH));
	}

	public String getYYSJ()
	{
		return doPreProcess(YYSJ);
	}

	public void setYYSJ( String YYSJ)
	{
		this.YYSJ=doPreProcess2(convertCode(YYSJ));
	}

	public String getYYSXW()
	{
		return doPreProcess(YYSXW);
	}

	public void setYYSXW( String YYSXW)
	{
		this.YYSXW=doPreProcess2(convertCode(YYSXW));
	}

	public String getENTNAME()
	{
		return doPreProcess(ENTNAME);
	}

	public void setENTNAME( String ENTNAME)
	{
		this.ENTNAME=doPreProcess2(convertCode(ENTNAME));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM WSDJ_YYHM";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	public static void main(String[] agrs){
		WSDJ_YYHM yybm=new WSDJ_YYHM();
		yybm.doYYNO("1","0");
	}
	//判断日期是否大于当前日期
	public boolean checkDateAfterToday(String DATE1){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		Date dt=c.getTime();
		String dqrq=df.format(dt);
		boolean flag=false;
		try{
            Date dt1 = df.parse(DATE1);
            Date dtdqrq = df.parse(dqrq);
            if (dt1.getTime() >= dtdqrq.getTime()) {
            	flag=true;
            }
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
	//是否周末
	/**public String zm_check(String date) throws Exception{
		Calendar c = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dtyyrq = df.parse(date);
		c.setTime(dtyyrq);		
        int w = c.get(Calendar.DAY_OF_WEEK);
        System.out.println("预约星期："+w);
        String info="go";
        DbConnection dbc=new DbConnection();
        //星期六
        if(w==7){
        	ResultSet rs=dbc.executeQuery("SELECT TO_CHAR(RQ,'yyyy-MM-dd')as RQ FROM WSDJ_JJRGZ WHERE TO_CHAR(RQ,'yyyy-MM-dd')='"+date+"' order by rq");
			if(!rs.next()){
				info= "您选择的日期是星期六";
			}
        }
        //星期日
        if(w==1){
        	ResultSet rs=dbc.executeQuery("SELECT TO_CHAR(RQ,'yyyy-MM-dd')as RQ FROM WSDJ_JJRGZ WHERE TO_CHAR(RQ,'yyyy-MM-dd')='"+date+"' order by rq");
			if(!rs.next()){
				info= "您选择的日期是星期日";
			}
        }
        dbc.close(); 
		return info;
	}**/
	public String getJjrREGORG(String REGORG)throws Exception{	
			String info="1";
			GsDbConnection gsdbc=new GsDbConnection();
			ResultSet rs=gsdbc.executeQuery("select solar_date AS RQ from pub_organ_workday where is_workday='0' and ORGAN_ID='"+REGORG+"' ");
			if(rs.next()){
				String jjr=rs.getString("RQ");
				if(!jjr.equals("")){
					info=REGORG;
				}
			}
			gsdbc.close(); 
			return info;
	}
	//是否节假日
	public String jjr_check(String date,String REGORG)throws Exception{
		/**String info="go";
		 DbConnection dbc=new DbConnection();
			ResultSet rs=dbc.executeQuery("SELECT TO_CHAR(RQ,'yyyy-MM-dd')as RQ FROM WSDJ_JJR WHERE TO_CHAR(RQ,'yyyy-MM-dd')='"+date+"' order by rq");
			if(rs.next()){
				String jjr=rs.getString("RQ");
				if(jjr!=null && !jjr.equals("")){
					info="您选择的日期是节假日！"; 
				}			
			}
			dbc.close(); 
			return info;**/
			String info="go";
			REGORG=getJjrREGORG(REGORG);
			GsDbConnection gsdbc=new GsDbConnection();
			ResultSet rs=gsdbc.executeQuery("select solar_date AS RQ from pub_organ_workday where to_date(solar_date,'yyyy-MM-dd')=to_date('"+date+"','yyyy-MM-dd') and is_workday='0' and ORGAN_ID='"+REGORG+"' ORDER BY solar_date");
			if(rs.next()){
				String jjr=rs.getString("RQ");
				if(jjr!=null && !jjr.equals("")){
					info="您选择的日期是非工作日！"; 
				}			
			}
			gsdbc.close(); 
			return info;
	}
	/*public String getMAXBHForRegorg(String REGORG) throws SQLException{
		DbConnection dbc=new DbConnection();
		String maxbh="0";
		ResultSet rs=dbc.executeQuery("SELECT * FROM WSDJ_YYHM_REGORG WHERE REGORG='"+REGORG+"'");
		if(rs.next()){
			maxbh=rs.getString("SWBH");
		}
		if(maxbh==null || maxbh.equals("")){
			maxbh="0";
		}		
		dbc.close();
		return maxbh;
	}*/
	//是否已满
	public String ryym_check(String MAXBH,String REGORG,String NEXTDATA,String YYSXW,String YYTYPE) throws SQLException{
		String info="go";
		WSDJ_YYHM_REGORG yyreg=new WSDJ_YYHM_REGORG();
		yyreg.setREGORG(REGORG);
		yyreg.setTYPE(YYTYPE);
		yyreg.doSelect();
		//最大预约数
		int BH1=yyreg.getBH1();
		int BH2=yyreg.getBH2();
		int BH3=yyreg.getBH3();
		int BH4=yyreg.getBH4();
		int BH5=yyreg.getBH5();
		int BH6=yyreg.getBH6();
		int BH7=yyreg.getBH7();
		
		String sqlSelect="SELECT MAX(to_number(YYH)) AS YYH,YYSXW FROM WSDJ_YYHM WHERE REGORG='"+REGORG+"' AND to_char(YYSJ,'yyyy-MM-dd')='"+NEXTDATA+"' AND TYPE='"+YYTYPE+"' AND YYSXW='"+YYSXW+"' GROUP BY YYSXW";
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;	
		rsSelect=dbc.executeQuery(sqlSelect);		
		boolean sw=false,xw=false;
		String yyh="0";
		while(rsSelect.next())
		{
			yyh=rsSelect.getString("YYH");			
			if(yyh!=null && !yyh.equals("")){	
				if(rsSelect.getString("YYSXW").equals("1")){
				  if(yyh.equals(String.valueOf(BH1))){
					 info="您选择的时间，预约人数已满！";
				  }
			   }else if(rsSelect.getString("YYSXW").equals("2")){
				   if(yyh.equals(String.valueOf(BH2))){
						 info="您选择的时间，预约人数已满！";
					  }
			   }else if(rsSelect.getString("YYSXW").equals("3")){
				   if(yyh.equals(String.valueOf(BH3))){
						 info="您选择的时间，预约人数已满！";
					  }
			   }else if(rsSelect.getString("YYSXW").equals("4")){
				   if(yyh.equals(String.valueOf(BH4))){
						 info="您选择的时间，预约人数已满！";
					  }
			   }else if(rsSelect.getString("YYSXW").equals("5")){
				   if(yyh.equals(String.valueOf(BH5))){
						 info="您选择的时间，预约人数已满！";
					  }
			   }else if(rsSelect.getString("YYSXW").equals("6")){
				   if(yyh.equals(String.valueOf(BH6))){
						 info="您选择的时间，预约人数已满！";
					  }
			   }else if(rsSelect.getString("YYSXW").equals("7")){
				   if(yyh.equals(String.valueOf(BH7))){
						 info="您选择的时间，预约人数已满！";
					  }
			   }
		    }
		}
		/*while(rsSelect.next())
		{
			yyh=rsSelect.getString("YYH");			
			if(yyh!=null && !yyh.equals("")){
				//int dqbh=Integer.parseInt(yyh);
				if(rsSelect.getString("YYSXW").equals("1")){
					if(yyh.equals(MAXBH)){
						sw=true;
					}
				}else if(rsSelect.getString("YYSXW").equals("2")){
					if(yyh.equals(MAXBH)){
						xw=true;
					}
				}
			}
		}
		
		if(sw && xw){
			info="您选择的日期，预约人数已满！";
		}else{
			if(sw){
				if(YYSXW.equals("1")){
					info="您选择的日期，上午预约人数已满！请选择下午！";
				}
			}
			if(xw){
				if(YYSXW.equals("2")){
					info="您选择的日期，上午预约人数已满！请选择上午！";
				}
			}
		}*/
			
		dbc.close();
		return info+"AND"+yyh;
	}
	//获取当天日期
	public String getToday(){
		Calendar c = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dt=c.getTime();
		String dqrq=df.format(dt);
		return dqrq;
	}
	//获取明天日期
	public String getNextDay(){
		Calendar c = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dt=c.getTime();	
		c.add(Calendar.DAY_OF_MONTH, 1);
		dt=c.getTime();
		c.setTime(dt);
		return df.format(dt);
	}
	//日期加一天
	public String getNextDayForThisDay(String thisday) throws Exception{
		//初始化
		Calendar c = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		//放入日期
		Date dt=df.parse(thisday);
		c.setTime(dt);
		
		//日期加一天
		c.add(Calendar.DAY_OF_MONTH, 1);
		dt=c.getTime();
		
		//日期转为格式
		c.setTime(dt);
		return df.format(dt);
	}
	//节假日后第一天
	public String getNextDayAfterJjr(String date,String REGORG) throws Exception{
		
		/*DbConnection dbc=new DbConnection();
		ResultSet rs=dbc.executeQuery("SELECT TO_CHAR(RQ,'yyyy-MM-dd')as RQ FROM WSDJ_JJR WHERE TO_CHAR(RQ,'yyyy-MM-dd')>='"+date+"' order by rq");
		while(rs.next()){
			String jjr=rs.getString("RQ");
			if(jjr!=null && !jjr.equals("")){				
				if(jjr.equals(date)){
					date=getNextDayForThisDay(date);
				}else{
					break;
				}
			}			
		}
		dbc.close();
		return date;*/
		REGORG=getJjrREGORG(REGORG);
		
		GsDbConnection gsdbc=new GsDbConnection();
		
		ResultSet rs=gsdbc.executeQuery("select solar_date AS RQ from pub_organ_workday where to_date(solar_date,'yyyy-MM-dd')>=to_date('"+date+"','yyyy-MM-dd') and is_workday='0' and ORGAN_ID='"+REGORG+"' ORDER BY solar_date");
		while(rs.next()){
			String jjr=rs.getString("RQ");
			if(jjr.length()==8){
				jjr=jjr.substring(0,4)+"-"+jjr.substring(4,6)+"-"+jjr.substring(6,8);
				if(jjr!=null && !jjr.equals("")){				
					if(jjr.equals(date)){
						date=getNextDayForThisDay(date);
					}else{
						break;
					}
				}
			}					
		}
		gsdbc.close();
		return date;
	}
	
	//周末后第一天
	/*public String getNextDayAfterZm(String date) throws Exception{
		Calendar c = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = df.parse(date);
		c.setTime(dt);		
        int w = c.get(Calendar.DAY_OF_WEEK);     
        //星期六
        if(w==7){
        	c.add(Calendar.DAY_OF_MONTH, 2);    		
        }
        //星期日
        if(w==1){
        	c.add(Calendar.DAY_OF_MONTH, 1);    		
        }
        dt=c.getTime();
        c.setTime(dt);
		return df.format(dt);
	}*/
	
	public String getNextDayByMr2(String MAXBH,String date,String sREGORG) throws Exception{
		String info="1";
		String sqlSelect="SELECT MAX(to_number(YYH)) AS YYH,YYSXW FROM WSDJ_YYHM WHERE REGORG='"+sREGORG+"' AND to_char(YYSJ,'yyyy-MM-dd')='"+date+"' GROUP BY YYSXW";
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;	
		rsSelect=dbc.executeQuery(sqlSelect);		
		boolean sw=false,xw=false;
		while(rsSelect.next())
		{
			String yyh=rsSelect.getString("YYH");			
			if(yyh!=null && !yyh.equals("")){
				if(rsSelect.getString("YYSXW").equals("1")){
					if(yyh.equals(MAXBH)){
						sw=true;
					}
				}else if(rsSelect.getString("YYSXW").equals("2")){
					if(yyh.equals(MAXBH)){
						xw=true;
					}
				}
			}
		}
		dbc.close();
		if(sw && xw){
			info="false";
		}else{
			if(sw){
				info="2";
			}
			if(xw){
				info="1";
			}
		}
		return info;
	}
	
	public boolean getNextDayByMr(String MAXBH,String date,String sREGORG,String yytype) throws Exception{
		String sqlSelect="SELECT count(*) AS YYH FROM WSDJ_YYHM WHERE REGORG='"+sREGORG+"' AND to_char(YYSJ,'yyyy-MM-dd')='"+date+"' AND TYPE='"+yytype+"'";
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;	
		rsSelect=dbc.executeQuery(sqlSelect);
		boolean flag=false;
		while(rsSelect.next())
		{
			String yyh=rsSelect.getString("YYH");			
			if(yyh!=null && !yyh.equals("")){
				if(yyh.equals(MAXBH)){
					flag=true;
				}
			}
		}
		dbc.close();
		return flag;
	}
	public String getYYRQ2(String MAXBH,String REGORG) throws Exception{
		String YYRQ=getNextDay();
		//去掉周末
		//YYRQ=getNextDayAfterZm(YYRQ);
		//去掉节假日
		YYRQ=getNextDayAfterJjr(YYRQ,REGORG);
		//是否满人
		String SXW=getNextDayByMr2(MAXBH,YYRQ,REGORG);
		if(SXW.equals("false")){
			YYRQ=getNextDayForThisDay(YYRQ);
			//去掉周末
			//YYRQ=getNextDayAfterZm(YYRQ);
			//去掉节假日
			YYRQ=getNextDayAfterJjr(YYRQ,REGORG);
			//是否满人
			SXW=getNextDayByMr2(MAXBH,YYRQ,REGORG);
			if(SXW.equals("false")){
				YYRQ=getNextDayForThisDay(YYRQ);
				//去掉周末
				//YYRQ=getNextDayAfterZm(YYRQ);
				//去掉节假日
				YYRQ=getNextDayAfterJjr(YYRQ,REGORG);
				//是否满人
				SXW=getNextDayByMr2(MAXBH,YYRQ,REGORG);
				if(SXW.equals("false")){
					YYRQ=getNextDayForThisDay(YYRQ);
					//去掉周末
					//YYRQ=getNextDayAfterZm(YYRQ);
					//去掉节假日
					YYRQ=getNextDayAfterJjr(YYRQ,REGORG);					
				}
			}
		}
		return YYRQ+"AND"+SXW;
	}
	
	public String getYYRQ(String MAXBH,String REGORG,String type) throws Exception{
		String YYRQ=getNextDay();
		//去掉周末
		//YYRQ=getNextDayAfterZm(YYRQ);
		//去掉节假日
		YYRQ=getNextDayAfterJjr(YYRQ,REGORG);
		//是否满人
		boolean SXW=getNextDayByMr(MAXBH,YYRQ,REGORG,type);
		if(SXW==true){
			YYRQ=getNextDayForThisDay(YYRQ);
			//去掉周末
			//YYRQ=getNextDayAfterZm(YYRQ);
			//去掉节假日
			YYRQ=getNextDayAfterJjr(YYRQ,REGORG);
			//是否满人
			SXW=getNextDayByMr(MAXBH,YYRQ,REGORG,type);
			if(SXW==true){
				YYRQ=getNextDayForThisDay(YYRQ);
				//去掉周末
				//YYRQ=getNextDayAfterZm(YYRQ);
				//去掉节假日
				YYRQ=getNextDayAfterJjr(YYRQ,REGORG);
				//是否满人
				SXW=getNextDayByMr(MAXBH,YYRQ,REGORG,type);
				if(SXW==true){
					YYRQ=getNextDayForThisDay(YYRQ);
					//去掉周末
					//YYRQ=getNextDayAfterZm(YYRQ);
					//去掉节假日
					YYRQ=getNextDayAfterJjr(YYRQ,REGORG);					
				}
			}
		}
		return YYRQ;
	}
	
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
	
	public String getMaxBh(String REGORG,String NEXTDATA,String YYSXW) throws SQLException
	{
		String sqlSelect="SELECT MAX(to_number(YYH)) FROM WSDJ_YYHM WHERE REGORG='"+REGORG+"' AND to_char(YYSJ,'yyyy-MM-dd')='"+NEXTDATA+"' AND YYSXW='"+YYSXW+"'";
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;	
		rsSelect=dbc.executeQuery(sqlSelect);
		String maxBh="0";
		if(rsSelect.next())
		{
			maxBh=rsSelect.getString(1);
		}
		dbc.close();
		return maxBh;
	}

	public String doYYNO(String BH,String SXW){
		String YYNO="";
		Random rnd = new Random();
		int num = 100 + rnd.nextInt(900);
		String snum=num+"";
		String snum1=snum.substring(0,1);
		String snum2=snum.substring(1,2);
		String snum3=snum.substring(2,3);
		
		int nBH=Integer.parseInt(BH);
		String BH1="";
		String BH2="";
		nBH=nBH*Integer.parseInt(SXW);
		BH=nBH+"";
		if(nBH<10){
			BH1="0";
			BH2=nBH+"";
		}else if(nBH>=10 && nBH<100){
			BH1=BH.substring(0,1);
			BH2=BH.substring(1,2);
		}else if(nBH>=100){
			BH1=BH.substring(1,2);
			BH2=BH.substring(2,3);
		}		
		YYNO=snum1+BH1+snum2+BH2+snum3;
		
		return YYNO;
	}
	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	OPENO=rsSelect.getString("OPENO");
	YYH=rsSelect.getString("YYH");
	YYSJ=String.valueOf(rsSelect.getDate("YYSJ"));
	YYSXW=rsSelect.getString("YYSXW");
	ENTNAME=rsSelect.getString("ENTNAME");
	REGORG=rsSelect.getString("REGORG");
	SFYQ=rsSelect.getString("SFYQ");
	YYNO=rsSelect.getString("YYNO");
	TYPE=rsSelect.getString("TYPE");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO WSDJ_YYHM(SFYQ,OPENO,YYH,YYSJ,YYSXW,ENTNAME,REGORG,YYNO,TYPE) VALUES("+doPreProcess3(SFYQ)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(YYH)+",to_date("+doPreProcess3(YYSJ)+",'yyyy-mm-dd'),"+ doPreProcess3(YYSXW)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(REGORG)+","+doPreProcess3(YYNO)+","+doPreProcess3(TYPE)+")";
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
		String sqlCount="SELECT COUNT(*) FROM WSDJ_YYHM";
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
		String sqlModify="UPDATE WSDJ_YYHM SET YYNO="+doPreProcess3(YYNO)+",SFYQ="+doPreProcess3(SFYQ)+",OPENO="+ doPreProcess3(OPENO)+",YYH="+ doPreProcess3(YYH)+",YYSJ=to_date("+doPreProcess3(YYSJ)+",'yyyy-mm-dd'),YYSXW="+ doPreProcess3(YYSXW)+",ENTNAME="+ doPreProcess3(ENTNAME)+",REGORG="+ doPreProcess3(REGORG)+",TYPE="+doPreProcess3(TYPE)+"";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}

	public boolean doModifyBySql(String sqlModify) throws SQLException
	{
		DbConnection dbc=new DbConnection();		
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
		String sqlDelete="DELETE FROM WSDJ_YYHM";
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
		String sqlCount="SELECT COUNT(*) FROM WSDJ_YYHM";
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
		String sqlList="SELECT * FROM WSDJ_YYHM";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			WSDJ_YYHM bTable=new WSDJ_YYHM();
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
		String sqlList="SELECT * FROM WSDJ_YYHM";
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
			WSDJ_YYHM bTable=new WSDJ_YYHM();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM WSDJ_YYHM";
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
}
