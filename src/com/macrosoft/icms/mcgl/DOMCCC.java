package com.macrosoft.icms.mcgl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsdbc.LsDbConnection;

public class DOMCCC {
	private int currentNum;
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

	public String CheckZh(String djjg,String nametype,String zh,String zhpy,
			String xzqhjx,String hy,String zzxs,String qymc,String entclass){
		int rowMux = 20;
//		String qymc=xzqhjx+zh+hy+zzxs;		
		String returnInfo="";
		String mczs=getMcZs(nametype, zh, zhpy, qymc, djjg,rowMux,entclass);
		String zhjy=getZhjy(zh, zhpy);
		String wssb=getWssb(nametype, zh, zhpy, qymc, djjg,rowMux);
		if(mczs.equals("") && zhjy.equals("") && wssb.equals("")){
			return "您所申请的名称字号目前无申请使用记录，如果确认用此字号，请点击<input id='choseOne' disabled='false' type='button' value='用此字号申请名称' onclick='choseOne();'/> 继续填写其他申请信息。";
		}
		if(!zhjy.equals("")){
			returnInfo="<table width=\"100%\" border=\"1\"><caption>禁用/保护字号</caption><tr class=\"tc\"><td>字号</td><td>字号拼音</td><td>保护/禁用说明</td><td>保护/禁用类型</td></tr>";
			returnInfo+=zhjy;
		}
		if(!mczs.equals("") || !wssb.equals("")){
			returnInfo+="<table width=\"100%\" border=\"1\"><caption>相同相似字号(只显示前20条)</caption><tr class=\"tc\"><td>字号</td><td>字号拼音</td><td>企业名称</td></tr>";
			returnInfo+=mczs;
			returnInfo+=wssb;
		}
		
		if(returnInfo.indexOf("style='background-color: red;'")>0){
			returnInfo="<font color=\"red\">警告！您的名称申请中存在禁用字号或申请的名称已经被使用，请调整字号或名称重新申请。"
				+returnInfo;
		}else{
			returnInfo="<font color=\"red\">警告！您所申请的名称中的字号存在以下申请使用记录，如果用此字号申请名称，将有可能驳回您的此次申请，确定仍然用此字号申请名称请点击"
				+"<input id='choseOne' disabled='false' type='button' value='用此字号申请名称' onclick='choseOne();'/> 继续填写其他申请信息。</font><br/>"
				+returnInfo;
		}
		return returnInfo;
	}
	public String getWssb(String nametype,String zh,String zhpy,String qymc,String djjg,int rowMux){
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect=null;
		StringBuffer sbf=new StringBuffer();
		//String sqSql="select enttra,tradpiny,entname from mcgl_jbxx_sq where namestatus in ('0','1','2','3') "
		//+" and enttra like '%"+zh+"%' and tradpiny like '%"+zhpy+"%'";
		String sqSql="select enttra,tradpiny,entname from mcgl_jbxx_sq where namestatus = '1'"
		+" and enttra like '%"+zh+"%' and tradpiny like '%"+zhpy+"%'";
		if(nametype.equals("2")){
			String sj_djjg=djjg.substring(0,4)+"00";
			sqSql+=" and preregorg in ('"+djjg+"','"+sj_djjg+"')";
		}else{
			sqSql+=" and preregorg='"+djjg+"'";
		}
		try{
			rsSelect=dbc.executeQuery(sqSql);
			while(rsSelect.next() && currentNum < rowMux){
				if(rsSelect.getString("entname").equals(qymc)){
					sbf.append("<tr style='background-color: red;'><td>"+doPreProcess(rsSelect.getString("enttra"))+"</td><td>"
						    +doPreProcess(rsSelect.getString("tradpiny"))+"</td><td>"
							+doPreProcess(rsSelect.getString("entname"))+"</td></tr>");
				}else{
					sbf.append("<tr><td>"+doPreProcess(rsSelect.getString("enttra"))+"</td><td>"
							+doPreProcess(rsSelect.getString("tradpiny"))+"</td><td>"
							+doPreProcess(rsSelect.getString("entname"))+"</td></tr>");
				}
				currentNum++ ;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(rsSelect!=null){
					rsSelect.close();
				}
				dbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sbf.toString();
	}
	public String getMcZs(String nametype,String zh,String zhpy,String qymc,String djjg,int rowMux,String entclass){
		GsDbConnection gsdbc=new GsDbConnection();
		LsDbConnection lsdbc=new LsDbConnection();
		ResultSet rsSelect=null;
		ResultSet lsrs=null;
		StringBuffer sbf=new StringBuffer();
		try{
			String mczsSql="select enttra, tradpiny, entname, namestatus, saveperto from mcgl_jbxx_zs "
			+ "where  (enttra like '%"+zh+"%' or tradpiny like '%"+zhpy+"%' or entname like '%"+qymc+"%') and apprauth = '"+djjg+"'"			
			+ "   and (saveperto is null or saveperto >= sysdate) "
			+ " union all "
			+ "select enttra, tradpiny, entname, 9 AS namestatus, to_date('') saveperto from mcgl_jbxx_lc "
			+ " where (enttra like '%"+zh+"%' or tradpiny like '%"+zhpy+"%' or entname like '%"+qymc+"%')  and apprauth = '"+djjg+"'  and apprno is null   and (saveperto is null or saveperto >= sysdate) ";
			if("5".equals(entclass)){
				String ccSql =	"SELECT *" +
								"  FROM com_parm_item t, com_parm_item a" + 
								" WHERE t.remark = a.remark" + 
								"   AND t.sort_code = 'UNITTYPE'" + 
								"   AND a.sort_code = 'GTMCDJCC'" + 
								"   AND t.item_code = 'CURRENTUNIT'" + 
								"   AND t.item_status = '1'" + 
								"   AND a.item_status = '1'";
				lsrs = lsdbc.executeQuery(ccSql);
				if(lsrs.next()){
					nametype = "2";
				}
				
			}
			if(nametype.equals("2")){
				String sj_djjg=djjg.substring(0,4)+"00";
				mczsSql="select enttra, tradpiny, entname, namestatus, saveperto from mcgl_jbxx_zs "
				+ " where (enttra like '%"+zh+"%' or tradpiny like '%"+zhpy+"%' or entname like '%"+qymc+"%') and apprauth in ('"+djjg+"','"+sj_djjg+"') and (saveperto is null or saveperto >= sysdate) "
				+" union all "
				+"select enttra, tradpiny, entname, 9 namestatus, to_date('') saveperto from mcgl_jbxx_lc "
				+ "where (enttra like '%"+zh+"%' or tradpiny like '%"+zhpy+"%' or entname like '%"+qymc+"%') and apprauth in ('"+djjg+"','"+sj_djjg+"') and apprno is null and (saveperto is null or saveperto >= sysdate) ";	
			}
			
			int i = 0;
			rsSelect=gsdbc.executeQuery(mczsSql);
			while(rsSelect.next() && i < rowMux){
				if(rsSelect.getString("entname").equals(qymc)){
					sbf.append("<tr style='background-color: red;'><td>"+doPreProcess(rsSelect.getString("enttra"))+"</td><td>"
							+doPreProcess(rsSelect.getString("tradpiny"))+"</td><td>"
							+doPreProcess(rsSelect.getString("entname"))+"</td></tr>");
				}else{
					sbf.append("<tr><td>"+doPreProcess(rsSelect.getString("enttra"))+"</td><td>"
							+doPreProcess(rsSelect.getString("tradpiny"))+"</td><td>"
							+doPreProcess(rsSelect.getString("entname"))+"</td></tr>");
				}
				i++;
			}
			currentNum = i;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(rsSelect!=null){
					rsSelect.close();
				}
				if(lsrs!=null){
					lsrs.close();
				}
				gsdbc.close();
				lsdbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sbf.toString();
	}
	
	public String getZhjy(String zh,String zhpy){
		GsDbConnection gsdbc=new GsDbConnection();
		String zhjySql=
				"SELECT a.banletter,a.banlettpiny,a.banexp,a.bantype,b.content" +
						" FROM  mcgl_zhjy_zs a,com_dm b" + 
						" WHERE a.bantype = b.code" + 
						" AND b.type = 'BANTYPE'" + 
						" AND a.banletter LIKE '%"+zh+"%'" +
						" AND UPPER(a.banlettpiny) LIKE UPPER('%"+zhpy+"%')";

		ResultSet rsSelect=null;
		StringBuffer sbf=new StringBuffer();
		try{
			rsSelect=gsdbc.executeQuery(zhjySql);
			while(rsSelect.next()){
				if(zh.equals(rsSelect.getString("banletter"))&&rsSelect.getString("bantype") != null &&"3,4,6".indexOf(rsSelect.getString("bantype"))>=0){
					sbf.append("<tr style='background-color: red;'><td>"+doPreProcess(rsSelect.getString("banletter"))+"</td><td>"
						    +doPreProcess(rsSelect.getString("banlettpiny"))+"</td><td>"
							+doPreProcess(rsSelect.getString("banexp"))+"</td><td>"+
						    doPreProcess(rsSelect.getString("content"))+"</td></tr>");
				}else{
					sbf.append("<tr><td>"+doPreProcess(rsSelect.getString("banletter"))+"</td><td>"
							+doPreProcess(rsSelect.getString("banlettpiny"))+"</td><td>"
							+doPreProcess(rsSelect.getString("banexp"))+"</td><td>"+
						    doPreProcess(rsSelect.getString("content"))+"</td></tr>");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(rsSelect!=null){
					rsSelect.close();
				}
				gsdbc.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sbf.toString();
	}
}
