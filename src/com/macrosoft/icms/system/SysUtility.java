package com.macrosoft.icms.system;
import com.macrosoft.icms.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
import java.sql.*;
import javax.servlet.http.*;
//日期计算导入的包
import java.util.*;
import java.util.Date;
import java.text.SimpleDateFormat;


public class SysUtility
{
	static public String pre(String p)
	{
		String x=doPreProcess(p).trim();
		x=x.replaceAll("[\\n\\r]"," "); 
		x=x.replaceAll("[\"]"," "); 
		return x;
	} 

	//**********************公用静态函数***************************//
	///////////////////////////////////////
	//汉字接收转换
	static public String convertCode(String strvalue)
	{
		String newStr=null;
		try
		{
			if (strvalue==null)
			{
				return null;
			}
			else
			{
				strvalue=strvalue.replaceAll("[\\n\\r]","");
				//newStr=new String(strvalue.getBytes("ISO8859-1"),"GBK");
				newStr=new String(strvalue);
				return newStr;
			}
		}
		catch(Exception e)
		{
			return null;
		}
	}
	static public String replace(String strvalue)
	{		
		try
		{
			if (strvalue==null)
			{
				return null;
			}
			else
			{
				strvalue=strvalue.replaceAll("'","");
				strvalue= strvalue.trim();
				//strvalue=strvalue.replaceAll("=","");
				//strvalue=strvalue.replaceAll(">","");
				//strvalue=strvalue.replaceAll("<","");
				return strvalue;
			}
		}
		catch(Exception e)
		{
			return null;
		}
	}

	// 对给定字符进行 URL 编码
	public String encode(String strvalue) 
	{
		String newStr=null;
		try
		{
			if (strvalue==null)
			{
				return null;
			}
			else
			{
				newStr=java.net.URLEncoder.encode(strvalue);
				//newStr=new String(strvalue);
				return newStr;
			}
		}
		catch(Exception e)
		{
			return null;
		}
	} 

	// 对给定字符进行 URL 解码
	public String decode(String strvalue) 
	{
		String newStr=null;
		try
		{
			if (strvalue==null)
			{
				return null;
			}
			else
			{
				newStr=java.net.URLDecoder.decode(strvalue);
				return newStr;
			}
		}
		catch(Exception e)
		{
			return null;
		}	
	} 

	//把数字转换成大写
	public static String changeNUM(String str)
	{
//		String dw[]={"零","壹","贰","叁","肆","伍","陆","柒","捌","玖"};
		String dw[]={"○","一","二","三","四","五","六","七","八","九","十"}; 
		if (str.substring(0,1).equals("0")) {
			str = str.substring(1,str.length());
		}
		String str1="";
		int sTemp=0;
		int i=0;
		for (i=0;i<str.length() ;i++ )
		{
			sTemp = Integer.parseInt(str.substring(i,i+1));
			str1 = str1+dw[sTemp];
		}
		if (str.length()==2)
		{
			if (str1.substring(0,1).equals("一"))
			{
				str1 = "十"+str1.substring(1,2);
				if (str1.substring(1,2).equals("○"))
				{
					str1 = str1.substring(0,1);
				}
			}
			else
			{
				str1 = str1.substring(0,1)+"十"+str1.substring(1,2);
				if (str1.substring(2,3).equals("○"))
				{
					str1 = str1.substring(0,2);
				}
			}
		}
		return str1;
	}
	//对字串进行预处理 if =null return ''
	//用于在表格中显示不会显示NULL
	public static String doPreProcess( String sValue )
	{
		if (sValue==null)
		{
			return "";
		}
		else
		{
			if (sValue.compareTo("null")==0)
			{
				return "";
			}
			else
				return replace(sValue).trim();
		}
	}
	//对字串进行预处理, if ="" return null
	//用于生成SQL语句时处理所得到的日期型数据，如果不输入的数据，则向SQL语句中插入null
	public static String doPreProcess2( String sValue )
	{
		
		if (sValue==null || sValue.trim().equals(""))
		{
			return null;
		}
		else
			return replace(sValue) ;
	}
	//更新数据库的时候，如果为空，全部为设为null
	public static String doPreProcess3( String sValue )
	{
		if (sValue==null || sValue.equalsIgnoreCase("null"))
		{
			return null;
		}
		else
			return "'"+replace(sValue)+"'";
	}

	/**
		Name : getStringByLength
		Function:	从给定的字符串中截取制定的长度字串，并返回
		Parameter:	sStr－给定的字符串
					nLength－要截取字符串的长度
	**/
	public static String getStringByLength( String sStr, int nLength )
	{
		if (sStr==null)
		{
			sStr="";
		}
		else
			sStr=sStr.trim();
		if (sStr.length()<=nLength)
		{
			return sStr;
		}
		else
		{
			return new String(sStr.substring( 0, nLength-2 ) + "…" );
		}
	}
	public static boolean isNumeric(String str)
	{
		if (str==null)
		{
			return false;
		}
		for (int i = str.length();--i>=0;){   
		if (!Character.isDigit(str.charAt(i)))
			{
				return false;
			}
		}
		return true;
	}

	/**
		Name:	parseInt( String sInt )
		Parameter:	String sInt-要解析的字符串
		Function:	从给定的字符串中取得整数值
		Return：	字串为空－0
					字串格式不对－0
					其他，返回相应值
	**/
	public static int parseInt( String sInt )
	{
		int nReturn;

		if (sInt==null)
		{
			nReturn=0;
		}
		else
		{
			try
			{
				nReturn=Integer.parseInt( sInt );
			}
			catch (NumberFormatException e)
			{
				nReturn=0;
			}
		}
		return nReturn;
	}

	/**
	在originalStr把所有oldStr替换成newStr
	@Param originalStr String 替换前的字符串
	@Param oldStr 要替换的老字符串
	@Param newStr 替换成的字符串
	@Param return 替换后的字符串
	**/
	public static String replace( String originalStr0, String oldStr, String newStr )
	{
		String originalStr=originalStr0;
		if (originalStr==null)
		{
			return null;
		}
		if (oldStr==null || newStr==null)
		{
			return originalStr;
		}
		originalStr=originalStr + oldStr;
		String returnStr="";
		int nStart=0, nLastStart=0;
		int nLength=originalStr.length();

		while (nStart<nLength && nStart!=-1)
		{
			nStart=originalStr.indexOf( oldStr, nStart );
			if (nStart!=-1)
			{
				returnStr=returnStr + originalStr.substring( nLastStart, nStart )+newStr;
			}
			else
				break;
			nStart=nStart+oldStr.length();
			nLastStart=nStart;
		}
		return returnStr.substring( 0, returnStr.length()-newStr.length() );
	}	

	/** 根据传入的SQL语句生成关于代码表选项的下拉框 **/
	public static String getSelected( com.macrosoft.icms.dbc.DbConnection dbc, String sqlSelect ) throws SQLException
	{
		ResultSet rsSelect;
		String sOptions="";
		String sDM;
		rsSelect=dbc.executeQuery( sqlSelect );
		while( rsSelect.next() )
		{
			sDM=rsSelect.getString(1);
			sOptions+="<option value='" + sDM + "'>" + sDM+"|" + rsSelect.getString(2) + "</option>" + "\n";
		}
		rsSelect.close();
		rsSelect=null;
		return sOptions;
	}	

	public static String getSelected2( com.macrosoft.icms.dbc.DbConnection dbc, String sqlSelect ) throws SQLException
	{
		ResultSet rsSelect;
		String sOptions="";
		String sDM;
		rsSelect=dbc.executeQuery( sqlSelect );
		while( rsSelect.next() )
		{
			sDM=rsSelect.getString(1);
			sOptions+="<option value='" + sDM + "' TEL='"+doPreProcess(rsSelect.getString(3))+"'>" + doPreProcess(rsSelect.getString(2)) + "</option>" + "\n";
		}
		rsSelect.close();
		rsSelect=null;
		return sOptions;
	}	

	
	/** 根据传入的SQL语句生成关于代码表选项的下拉框 **/
	public static String getSelected( String sqlSelect ) throws SQLException
	{
		ResultSet rsSelect;
		String sOptions="";
		String sDM;
		DbConnection dbc=new DbConnection();
		rsSelect=dbc.executeQuery( sqlSelect );
		while( rsSelect.next() )
		{
			sDM=rsSelect.getObject(1).toString().trim();
			sOptions+="<option value='" + sDM + "'>" + sDM+"|" + rsSelect.getObject(2).toString().trim() + "</option>" + "\n";
		}
		rsSelect.close();
		rsSelect=null;
		dbc.close();
		return sOptions;
	}	
	public static String getListData(String[] paramValues)
	{			
		String sValue="";
		if (paramValues==null)
		{
			return "";
		}
		for (int i=0;i<paramValues.length;i++ )
		{
			if (paramValues[i]!=null&&!paramValues[i].trim().equals(""))
			{
				if (!sValue.equals(""))
				{
					sValue = sValue + ",";
				}
				sValue +=(paramValues[i]).trim();
			}			
		}
		return sValue;
	}
	//set alert and go
	public static String setAlertGo(String salert,String gopage)
	{
			String str="<script language='javascript'>";
			str+="alert('"+salert+"');";
			str+="window.location.href='"+gopage+"';";
			str+="</script>";
			return str;
	}
	public static String setAlertScript(String salert,String Sscript)
	{
			String str="<script language='javascript'>";
			str+="alert('"+salert+"');";
			str+=Sscript;
			str+="</script>";
			return str;
	}
//********************************************
//  名称：getCalDate()
//  用途:日期计算方法
//	input:
//		参数1  待处理日期 String
//		参数2 加减年数 int
//		参数3 加减月数 int
//		参数4 加减日数 int
//	output:
//	   计算后的日期 String
//********************************************
	public static String getCalDate(String Fraedate ,int Year,int Month,int Day)
	{
		Date AdsumTime = null;   
		GregorianCalendar gc = new GregorianCalendar();	
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
		try   
		{   
			AdsumTime = sf.parse(Fraedate);   
		}   
		catch(Exception e)
		{
			System.out.println( "getSectTime Error- Exception: " + e );
		}
		gc.setTime(AdsumTime);	
		gc.add(Calendar.YEAR,Year);
		gc.add(Calendar.MONTH,Month);
		gc.add(Calendar.DAY_OF_MONTH,Day);
		gc.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DATE));		
		return sf.format(gc.getTime());
 
	}
	////处理DQBH=370200&ZCH=3702001800001&QYLB=1&字符串	 
	public static String getParameter( String sParameter,String sKey )
	{
		String ss="";
		StringTokenizer s=new StringTokenizer( sParameter, "&" );
		while (s.hasMoreTokens())
		{
			StringTokenizer s0=new StringTokenizer( s.nextToken(),"=" );
			if (s0.nextToken().equals(sKey))
			{
				ss=s0.nextToken();
			}			
		}
		return ss;
	}
	///create between sql////////////////////////////////////////
	public static String getSqlBetween(String colName,String a1,String a2)
	{
		String sql="";
		if (a1!=null&&!a1.equals(""))
		{
			if (isNumeric(a1))
			{
				sql+=" AND "+colName+">="+a1;
			}
			else
			{
				sql+=" AND "+colName+">=TO_DATE('"+a1+"','YYYY-MM-DD')";
			}
		}
		if (a2!=null&&!a2.equals(""))
		{
			if (isNumeric(a2))
			{
				sql+=" AND "+colName+"<="+a2;
			}
			else
			{
				sql+=" AND "+colName+"<=TO_DATE('"+a2+"','YYYY-MM-DD')";
			}
		}
		return sql;
	}
	///////////////////////////////////
	public static String getSqlFilter(HttpServletRequest request, String[][] sStr)
	{
		String sqlfilter="";
		String sArg="";
		if (sStr==null)
		{
			return sqlfilter;
		}
		for (int i=0;i<sStr.length;i++)
		{
		
			String[] paramValues = request.getParameterValues(sStr[i][0]);
			if (paramValues==null)
			{					
				continue;
			}
			if (paramValues.length!=1)
			{			
				String sqlIn="";
				int k=1;
				for (int j=0;j<paramValues.length;j++ )	
				{	
					sArg=SysUtility.convertCode(SysUtility.doPreProcess(paramValues[j]));					
					if ((sArg!=null)&&!sArg.trim().equals(""))
					{	//filter 字符
						if (k>1)
						{
							sqlIn+=" OR ";
						}
						sArg=sArg.replace('"','\0');
						sArg=sArg.replace('\'','\0');
						sArg=sArg.replace('%','\0');
						sArg=sArg.replace('=','\0');
						sArg=sArg.replace('>','\0');
						sArg=sArg.replace('<','\0');
						if (sStr[i][1].trim().equals("1"))
						{
							sqlIn+=sStr[i][0]+" = '"+sArg+"'";
						}
						else if (sStr[i][1].trim().equals("0"))				
						{
							sqlIn+=sStr[i][0]+" LIKE '%"+sArg+"%'";
						}
						
						k++;
					}
				}
				if (!sqlIn.trim().equals(""))
				{
					sqlfilter+=" AND ("+sqlIn+") ";
				}
				
			}
			else
			{
				sArg=SysUtility.convertCode(SysUtility.doPreProcess(paramValues[0]));				
				if ((sArg!=null)&&!sArg.trim().equals(""))
				{
					//filter 字符
					sArg=sArg.replace('"','\0');
					sArg=sArg.replace('\'','\0');
					sArg=sArg.replace('%','\0');
					sArg=sArg.replace('=','\0');
					sArg=sArg.replace('>','\0');
					sArg=sArg.replace('<','\0');						
					if (sStr[i][1].trim().equals("1"))
					{
						sqlfilter+=" AND "+sStr[i][0]+" = '"+sArg+"'";
					}
					else if (sStr[i][1].trim().equals("0"))				
					{
						sqlfilter+=" AND "+sStr[i][0]+" LIKE '%"+sArg+"%'";
					}
				}
				
			}
		}
		return sqlfilter;
	}
	
	static public String getCurrentDate()
	{
		java.util.Date date=new java.util.Date();
		int Years	=date.getYear()+1900;
		int Months	=date.getMonth()+1;
		int Days	=date.getDate();
		String sMonths="";
		if (Months>=10)
		{
			sMonths=String.valueOf(Months);
		}
		else
		{
			sMonths="0"+String.valueOf(Months);
		}
		String DQSJ = Years+"-"+sMonths+"-"+Days;
		return DQSJ;
	}
		/*
	*比较日期返回天数
	*/
	static public int getDifferDays(String strBegin,String strEnd) 
	{
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null, date2 = null;
		int days=0;
		try
		{
			date1 = f.parse(strBegin);
			date2 = f.parse(strEnd);
			days=(int) ((date2.getTime()-date1.getTime())/86400000);
		} 
		catch (Exception e)
		{
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return days;
	}
	
	 public static String getUUID20(){ 
        String s = UUID.randomUUID().toString(); 
        //去掉“-”符号 	        
        //s= s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
        //调整为20位
        s= s.substring(0,6)+s.substring(9,12)+s.substring(15,17)+s.substring(20,22)+s.substring(26);
        s=s.substring(0,20);
        return s;
	  } 
	 

	 public static String getRecord_no(String DOMDISTRICT){
			Date d = new Date();
			String year = d.getYear()+1900+"";
			String record_num = year+DOMDISTRICT;
			return record_num;
		}

}
