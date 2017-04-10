package com.macrosoft.icms.mccx;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import com.macrosoft.icms.system.SysUtility;

public class McQueryHander {
	public ArrayList getQueryInfo(HttpServletRequest request){
		
		String DJJG = request.getParameter("djjg"); //查重地域
	    String enterpriseName = SysUtility.convertCode(request.getParameter("ENTTRA")); //企业名称
	    String enterpriseShortName = SysUtility.convertCode(request.getParameter("ENTTRA")); //企业字号
	    String samemode = "2"; //字号拼音查重方式 同音或同字查重
	    String enterpriseShortNameSpell = request.getParameter("TRADPINY"); //多音字拼音记录 DA DE
	    if(!enterpriseShortNameSpell.equals("")){
	    	enterpriseShortNameSpell=" "+enterpriseShortNameSpell+" ";
	    }
	    String findWay = request.getParameter("findWay"); //查重区域 本地查重 冠省名查重 冠市名查重
	    String categorysCope = "0";//request.getParameter("categorysCope"); //行业范围
	    String tradeCategory = "";//request.getParameter("tradeCategory"); //行业门类
	    String tradeCategoryCode ="";// request.getParameter("tradeCategoryCode"); //行业编码
	    String BID = request.getParameter("BID");
	    
	    Calendar cal=Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String nowdate=sdf.format(cal.getTime());
	    
	    NameDAOImpl nameDao=new NameDAOImpl();
	
	    //添加企业字号拼音
	    CheckNameModel checkNameModel = new CheckNameModel();
	    checkNameModel.setEnterpriseName(enterpriseName); //企业名称
	    checkNameModel.setEnterpriseShortName(enterpriseShortName); //企业字号
	    checkNameModel.setEnterpriseShortNameSpell(enterpriseShortNameSpell); //企业字号拼音
	    checkNameModel.setDJJG(DJJG); //登记机关
	    checkNameModel.setCategorysCope(categorysCope); //行业范围 不分行业       行业门类    按行业查重
	    checkNameModel.setTradeCategory(tradeCategory); //行业门类
	    checkNameModel.setTradeCategoryCode(tradeCategoryCode); //行业代码
	    checkNameModel.setFindWay(findWay); //查重区域 本地查重 冠省名查重 冠市名查重
	    checkNameModel.setCategorysCope(categorysCope); //行业范围
	    checkNameModel.setSamemode(samemode); //字号拼音查重方式 同音或同字查重
	    checkNameModel.setNowDate(nowdate); //查重日期
	    checkNameModel.setBID(BID);
	
	    //获得查重结果
	    ArrayList checkNameResultList= new ArrayList();
	    //ArrayList oldCheckNameResultList=new ArrayList();
	
	    ArrayList resultList = null;
		try {
			resultList = (ArrayList)nameDao.getCheckNameSuperLogoList(checkNameModel);
			if(resultList.size()!=0){
		    	checkNameResultList.addAll(resultList);
		    }
		
		    resultList=(ArrayList)nameDao.getCheckNameResoundLogoList(checkNameModel);//驰名商标 gs_arearight
		    if(resultList.size()!=0){
		    	checkNameResultList.addAll(resultList);
		    }
		
		    resultList=(ArrayList)nameDao.getCheckNameBusinessList(checkNameModel);//企业(名称)登记库 gsgsjin_basis02（未过期）
		    if(resultList.size()!=0){
		    	checkNameResultList.addAll(resultList);
		    }		    		   
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkNameResultList;
	}
	
	
public ArrayList getQueryInfoForOld(HttpServletRequest request){
		
		String DJJG = request.getParameter("djjg"); //查重地域
	    String enterpriseName = SysUtility.convertCode(request.getParameter("ENTTRA")); //企业名称
	    String enterpriseShortName = SysUtility.convertCode(request.getParameter("ENTTRA")); //企业字号
	    String samemode = "2"; //字号拼音查重方式 同音或同字查重
	    String enterpriseShortNameSpell = request.getParameter("TRADPINY"); //多音字拼音记录 DA DE
	    if(!enterpriseShortNameSpell.equals("")){
	    	enterpriseShortNameSpell=" "+enterpriseShortNameSpell+" ";
	    }
	    String findWay = request.getParameter("findWay"); //查重区域 本地查重 冠省名查重 冠市名查重
	    String categorysCope = "0";//request.getParameter("categorysCope"); //行业范围
	    String tradeCategory = "";//request.getParameter("tradeCategory"); //行业门类
	    String tradeCategoryCode ="";// request.getParameter("tradeCategoryCode"); //行业编码
	    String BID = request.getParameter("BID");
	    
	    Calendar cal=Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String nowdate=sdf.format(cal.getTime());
	    
	    NameDAOImpl nameDao=new NameDAOImpl();
	
	    //添加企业字号拼音
	    CheckNameModel checkNameModel = new CheckNameModel();
	    checkNameModel.setEnterpriseName(enterpriseName); //企业名称
	    checkNameModel.setEnterpriseShortName(enterpriseShortName); //企业字号
	    checkNameModel.setEnterpriseShortNameSpell(enterpriseShortNameSpell); //企业字号拼音
	    checkNameModel.setDJJG(DJJG); //登记机关
	    checkNameModel.setCategorysCope(categorysCope); //行业范围 不分行业       行业门类    按行业查重
	    checkNameModel.setTradeCategory(tradeCategory); //行业门类
	    checkNameModel.setTradeCategoryCode(tradeCategoryCode); //行业代码
	    checkNameModel.setFindWay(findWay); //查重区域 本地查重 冠省名查重 冠市名查重
	    checkNameModel.setCategorysCope(categorysCope); //行业范围
	    checkNameModel.setSamemode(samemode); //字号拼音查重方式 同音或同字查重
	    checkNameModel.setNowDate(nowdate); //查重日期
	    checkNameModel.setBID(BID);
	
	    //获得查重结果
	    ArrayList checkNameResultList= new ArrayList();
	    //ArrayList oldCheckNameResultList=new ArrayList();
	
	    /*ArrayList resultList = null;
		try {		
		    resultList=(ArrayList)nameDao.getCheckNameOldBusinessList(checkNameModel);//企业(名称)登记库 gsgsjin_basis02（已过期）
		    if(resultList.size()!=0){
		    	checkNameResultList.addAll(resultList);
		    }
		    
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		return checkNameResultList;
	}
}
