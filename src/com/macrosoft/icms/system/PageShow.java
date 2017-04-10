package com.macrosoft.icms.system;
import java.util.Arrays;
import java.util.List;

import com.macrosoft.icms.util.Constants;
public class PageShow {
	public void getPageForSL( String sENTTYPE,String sVaild,String sMust,WebSysPage Page){
		String[] file;
		if (sENTTYPE.equalsIgnoreCase("GS"))
		{	 
			file= new String[]{"qydj_gs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
			Page.addPage(file);		
			file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
			Page.addPage(file); 		
			file= new String[]{"qydj_czxx_list.jsp","股东(发起人)",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_ryxx_list.jsp","董事、监事、经理",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("FGS"))
		{	
			file= new String[]{"qydj_gs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("NZYY"))
		{	
			file= new String[]{"qydj_gs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("NZFR"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild ,sMust};
			Page.addPage(file);
			file= new String[]{"qydj_czxx_list.jsp","主管部门",sVaild ,sMust};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WZQY")||sENTTYPE.equalsIgnoreCase("WZFR"))
		{	 
			file= new String[]{"qydj_wzgs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
			Page.addPage(file);		
			file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
			Page.addPage(file); 					
			file= new String[]{"qydj_czxx_list.jsp","出资信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_ryxx_list.jsp","董事、监事、经理",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZFZ"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WGDB"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","首席代表",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_ryxx_list.jsp","代表信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		
		}
		else if (sENTTYPE.equalsIgnoreCase("WGJY"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","负责人",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHH"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","委派代表",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_hhczxx_list.jsp","合伙人出资",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHHFZ"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("HHQY"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			
			file= new String[]{"qydj_fddbr.jsp","执行事务合伙人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_hhczxx_list.jsp","合伙人出资",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("HHFZ"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZ"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","投资人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZFZ"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("HZS"))
		{
		    file= new String[]{"qydj_hzs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_czxx_list.jsp","成员出资信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file); 
		}
		else if (sENTTYPE.equalsIgnoreCase("HZSFZ"))
		{
		    file= new String[]{"qydj_hzs_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file); 
		}
		else if (sENTTYPE.equalsIgnoreCase("GT"))
		{
		    file= new String[]{"gtdj_gt_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"gtdj_jyzxx.jsp","经营者信息",sVaild}; //页面地址\名称\校验位 
			Page.addPage(file);
			file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
			Page.addPage(file);
			file= new String[]{"gtdj_sqwt.jsp","授权委托",sVaild}; //页面地址\名称\校验位 
			Page.addPage(file);
		}
		if (sENTTYPE.equalsIgnoreCase("WZHH")||sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WGDB")||sENTTYPE.equalsIgnoreCase("WZFR")||
				sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("WZFZ")){
		file= new String[]{"qydj_wzwjsd.jsp","文件送达人",sVaild};
		Page.addPage(file);
		}
		file= new String[]{"wsdj_fjxx_list.jsp","附件信息",sVaild};
		Page.addPage(file);	
		if("1".equals(Page.getSanZheng())){
			file= new String[]{"wsdj_ga.jsp","公安信息",sVaild};
			Page.addPage(file);	
			file= new String[]{"wsdj_zj.jsp","质检信息",sVaild};
			Page.addPage(file);	
			file= new String[]{"wsdj_sw.jsp","税务信息",sVaild};
			Page.addPage(file);	
		}
	}
	public void getPageForBg(String sENTTYPE,boolean FrChange,boolean RyChange,boolean CzChange,boolean FgsChange, boolean CwfzrChange,boolean LlyChange,String sVaild,String sMust,WebSysPage Page){
		String[] file;
		String title_fz = "分支机构";
		String[] enttypes ={"GS","WZGS","WZQY"};
		List<String> list = Arrays.asList(enttypes);
		if(list.contains(sENTTYPE)){
			title_fz = "分公司";
		};
		if(sENTTYPE.equals("GT")){
			file= new String[]{"gtdj_bgsx.jsp","变更事项",sVaild,sMust};
			Page.addPage(file);
		}else{
			file= new String[]{"qydj_bgsx.jsp","变更事项",sVaild,sMust}; //页面地址\名称\校验位\必填页面
			Page.addPage(file);
		}
		if(sENTTYPE.equals("GS")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
				Page.addPage(file);
			}	
			if(RyChange){				
				file= new String[]{"qydj_ryxx_list.jsp","董事、监事、经理",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","股东信息",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if(sENTTYPE.equals("FGS")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);			
			}			
		}
		else if (sENTTYPE.equalsIgnoreCase("NZYY")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("NZFR")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","主管部门",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WZQY")){
			if(FrChange){	
				file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
				Page.addPage(file); 
			}	
			if(RyChange){						
				file= new String[]{"qydj_ryxx_list.jsp","董监事会成员",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","出资信息",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
			//file= new String[]{"qydj_wzwjsd.jsp","文件送达人",sVaild};
			//Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("WZFZ")){	
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}		
			
		}
		else if(sENTTYPE.equalsIgnoreCase("WGJY"))
		{
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WGDB")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","首席代表",sVaild};
				Page.addPage(file);
			}	
			if(RyChange){
				file= new String[]{"qydj_ryxx_list.jsp","代表信息",sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHH")){	
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","委派代表",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_hhczxx_list.jsp","合伙人信息",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHHFZ")){	
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","负责人信息",sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("HHQY")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","执行事务合伙人",sVaild};
				Page.addPage(file);
			}
		    if(RyChange){
		    	file= new String[]{"qydj_hhczxx_list.jsp","合伙人出资",sVaild};
				Page.addPage(file);
		    }
		    //if(CzChange){
		    //	file= new String[]{"qydj_hhczxx_list.jsp","合伙人出资",sVaild};
			//	Page.addPage(file);
		    //}
		    if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HHFZ")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HZS")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","成员出资信息",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HZSFZ")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZ")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","投资人",sVaild};
				Page.addPage(file);
			}			
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZFZ")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
		}
		if(CwfzrChange){
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
		}
		if(LlyChange){
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
		}
		
		if (sENTTYPE.equalsIgnoreCase("WZHH")||sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WGDB")||sENTTYPE.equalsIgnoreCase("WZFR")||
				sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("WZFZ")){
		file= new String[]{"qydj_wzwjsd.jsp","文件送达人",sVaild};
		Page.addPage(file);
		}
		
		file= new String[]{"qydj_xkxx_list.jsp","许可信息",sVaild};
		Page.addPage(file);
		file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
		file= new String[]{"wsdj_fjxx_list.jsp","附件信息",sVaild};
		Page.addPage(file);	
	}
	
	public void getPageForZx(String sENTTYPE,String sVaild,String sMust,WebSysPage Page){
		String[] file;
		if(sENTTYPE.equals("GT")){
			file= new String[]{"gtdj_zxxx.jsp","注销信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
			Page.addPage(file);	
			file= new String[]{"gtdj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);
		}else{
			file= new String[]{"qydj_zxxx.jsp","注销信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
			Page.addPage(file);				
			file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
			Page.addPage(file);				
		}
		if (sENTTYPE.equalsIgnoreCase("WZHH")||sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WGDB")||sENTTYPE.equalsIgnoreCase("WZFR")||
				sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("WZFZ")){
		file= new String[]{"qydj_wzwjsd.jsp","文件送达人",sVaild};
		Page.addPage(file);
		}
		file= new String[]{"wsdj_fjxx_list.jsp","附件信息",sVaild};
		Page.addPage(file);
	}
	
	public void getPageForBa(String sENTTYPE,boolean RyChange,boolean CzChange,boolean FgsChange, boolean CwfzrChange,boolean LlyChange,String sVaild,String sMust,WebSysPage Page){
		String[] file;
		file= new String[]{"qydj_basx.jsp","备案事项",sVaild,sMust}; //页面地址\名称\校验位\必填页面
		Page.addPage(file);
		if(sENTTYPE.equals("GS")){		
			if(RyChange){
				file= new String[]{"qydj_ryxx_list.jsp","董监事会成员",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","分支机构",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("NZFR")){
			//if(RyChange){
			//	file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
			//	Page.addPage(file);
			//}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","主管部门",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","分支机构",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WZQY")){	 
			if(RyChange){	
				//file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
				//Page.addPage(file); 		
				file= new String[]{"qydj_ryxx_list.jsp","董监事会成员",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","出资信息",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","分支机构",sVaild};
				Page.addPage(file);
			}					
		}
		else if (sENTTYPE.equalsIgnoreCase("WZFZ")){	
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}			
		}
		else if(sENTTYPE.equalsIgnoreCase("WGJY"))
		{
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","分支机构",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WGDB")){	
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","首席代表",sVaild};
				Page.addPage(file);
				file= new String[]{"qydj_ryxx_list.jsp","代表信息",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHH")){	
			if(CzChange){
				file= new String[]{"qydj_hhczxx_list.jsp","合伙人信息",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","分支机构",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHHFZ")){	
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","负责人信息",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HHQY")){
		    if(RyChange){
		    	file= new String[]{"qydj_hhczxx_list.jsp","合伙人出资",sVaild};
				Page.addPage(file);
		    }
		    if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","分支机构",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HHFZ")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HZS")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","法定代表人",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","成员出资信息",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HZSFZ")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZ")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","投资人",sVaild};
				Page.addPage(file);
			}			
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZFZ")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","负责人",sVaild};
				Page.addPage(file);
			}
		}		
		if(CwfzrChange){
			file= new String[]{"qydj_cwfzr.jsp","财务负责人",sVaild};
			Page.addPage(file);
		}
		if(LlyChange){
			file= new String[]{"qydj_llyxx.jsp","联络员信息",sVaild};
			Page.addPage(file);
		}
		if (sENTTYPE.equalsIgnoreCase("WZHH")||sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WGDB")||sENTTYPE.equalsIgnoreCase("WZQY")||
				sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("WZFZ")){
		file= new String[]{"qydj_wzwjsd.jsp","文件送达人",sVaild};
		Page.addPage(file);
		}
		file= new String[]{"qydj_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
		file= new String[]{"wsdj_fjxx_list.jsp","附件信息",sVaild};
		Page.addPage(file);	
	}
	/**
	 * use ： 企业登记——名称预审
	 * auther:vincent
	 * @param ENTCLASS 企业类型
	 */
	public void getPageForMC(String ENTCLASS,String ENTTYPE,String sMust,String sVaild,WebSysPage Page){
		String[] file;
		/**if(ENTCLASS.equals("MCGL_NZ")){
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_jbxx_nz.jsp", "基本信息", sVaild, sMust };
			Page.addPage(file);
			file = new String[] {Constants.PROJECT_NAME+ "mcgl/xgcl/nz/mcgl_czxx_nz.jsp", "出资信息", sVaild,sMust };
			Page.addPage(file);
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_wtxx_nz.jsp", "授权委托", sVaild,sMust };
			Page.addPage(file);
		}else if(ENTCLASS.equals("MCGL_GT")){
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_jbxx_gt.jsp", "基本信息", sVaild, sMust };
			Page.addPage(file);
			//file = new String[] {Constants.PROJECT_NAME+ "mcgl/xgcl/nz/mcgl_czxx_nz.jsp", "出资信息", sVaild,sMust };
			//Page.addPage(file);
			//file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_wtxx_nz.jsp", "授权委托", sVaild,sMust };
			//Page.addPage(file);
		}else if(ENTCLASS.equals("MCGL_WZ")){
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_jbxx_wz.jsp", "基本信息", sVaild, sMust };
			Page.addPage(file);
			file = new String[] {Constants.PROJECT_NAME+ "mcgl/xgcl/nz/mcgl_czxx_wz.jsp", "出资信息", sVaild,sMust };
			Page.addPage(file);
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_wtxx_nz.jsp", "授权委托", sVaild,sMust };
			Page.addPage(file);
		}else if(ENTCLASS.equals("MCGL_NZH")){
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_jbxx_nzh.jsp", "基本信息", sVaild, sMust };
			Page.addPage(file);
			file = new String[] {Constants.PROJECT_NAME+ "mcgl/xgcl/nz/mcgl_czxx_nzh.jsp", "设立人", sVaild,sMust };
			Page.addPage(file);
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_wtxx_nz.jsp", "授权委托", sVaild,sMust };
			Page.addPage(file);
			
		}**/
		if(ENTCLASS.equals("1") || ENTCLASS.equals("2")|| ENTCLASS.equals("8")||ENTCLASS.equals("6")){
			file = new String[] { "mcgl_jbxx.jsp", "基本信息", sVaild, sMust };
			Page.addPage(file);
			if(ENTTYPE.equals("GS") || ENTTYPE.equals("WZGS") || ENTTYPE.equals("HZS")
			|| ENTTYPE.equals("WZHH") || ENTTYPE.equals("HHQY")||ENTTYPE.equals("GRDZ")){
				file = new String[] { "mcgl_tzrxx.jsp", "出资信息", sVaild,sMust };
				Page.addPage(file);	
			}			
		}else if(ENTCLASS.equals("5")){
			file = new String[] { "mcgl_jbxx.jsp", "基本信息", sVaild, sMust };
			Page.addPage(file);
		}
		file = new String[] { "mcgl_sqwt.jsp", "授权委托", sVaild,sMust };
		Page.addPage(file);
	}	
	public String pagesetup_default(){
		
		String p="";
		p+="<script language='javascript'>";
		//p+="var hkey_root,hkey_path,hkey_key;";
		//p+="hkey_root='HKEY_CURRENT_USER';";
		//p+="hkey_path='\\Software\\Microsoft\\Internet Explorer\\PageSetup\\';";
		//设置网页打印的页眉页脚为默认值
		p+="function pagesetup_default(){";
		//p+="var svalue1='<%=icms.getSysDm('REGORG',QYDJ_YWSB.getREGORG())%>-<%=QYDJ_YWSB.getAPPPER()%>-<%=QYDJ_YWSB.getAPPRDATE()%>';";
		/*p+="var svalue='<%=QYDJ_YWSB.getREGORGN()%>';";
		p+="try{";
		p+="var RegWsh = new ActiveXObject('WScript.Shell');";
		p+="hkey_key='footer';";
		p+="RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,svalue);";
		p+="}catch(e){";
        p+="alert('请开启active控件！');";
		p+="}";*/
		p+="}";
		p+="</script>";
		return p;
	}
	public String getButton(String STATUS,String OPENO,String OPETYPE,String ENTTYPE,String CDDL){
		StringBuffer sbf=new StringBuffer();
		String tzs=" window.open('slsq_slqk.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE
			       +"&ENTTYPE="+ENTTYPE+"','预审意见','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
		String url ="wsyy/wsyy_qyxz.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE+"&ENTCLASS="+ENTTYPE+"&yytype=1";
		String wsyy="window.open('"+url+"','0','height=550,width=600,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,scrollbars=yes','');";
		String sOPETYPE="";
		if(OPETYPE.equals("30")){sOPETYPE="BG";}else if(OPETYPE.equals("40")){sOPETYPE="BA";}else if(OPETYPE.equals("50")){sOPETYPE="ZX";}
		if(!sOPETYPE.equals("")){sOPETYPE="_"+sOPETYPE;}
		String sqs="window.open('print/"+ENTTYPE+sOPETYPE+"_PRINT.jsp?OPENO="+OPENO+"')";
		if(CDDL.equals("4")) //股权出质
		{
			tzs="window.open('gqdj/gqdj_shtzs.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE
		       +"&ENTTYPE="+ENTTYPE+"','预审意见','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
			if(OPETYPE.equals("30")){sOPETYPE="bg";}else if(OPETYPE.equals("50")){sOPETYPE="zx";}else if(OPETYPE.equals("81")){sOPETYPE="cx";}
			sqs="window.open('gqdj/"+ENTTYPE.toLowerCase()+"_"+sOPETYPE+"sqs.jsp?OPENO="+OPENO+"')";
		}
		//待预审
		if(STATUS.equals("1")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
		}else if(STATUS.equals("5")){//核准驳回
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> ");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\")'><img border=0 src='images/icon/icon_edit.gif' alt='驳回通知书'> 驳回通知书</a>");
		}
		//预审通过或已注册登记
		else if(STATUS.equals("2") || STATUS.equals("4")||STATUS.equals("7")||STATUS.equals("8")||STATUS.equals("9")||STATUS.equals("10")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='通知书'> 通知书</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+sqs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='申请书'> 申请书</a>");
		}
		//预审驳回
		else if(STATUS.equals("3")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('0','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> ");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\")'><img border=0 src='images/icon/icon_edit.gif' alt='驳回通知书'> 驳回通知书</a>");
		}
		//未提交
		else if(STATUS.equals("0")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('0','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> ");			
		}
		//归档完成
		else if(STATUS.equals("11")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
		}
		if(STATUS.equals("2")){
			//sbf.append("&nbsp;<a href='#' onclick=\""+wsyy+"\"><img border=0 src='images/icon/icon_edit.gif' alt='网上预约'> 网上预约</a>");
			//sbf.append("&nbsp;<a href='#' onclick='showEmsMess(\""+OPENO+"\")'><img border=0 src='images/icon/ems.gif' alt='快递服务'> 快递服务</a>");
		}
		else if(STATUS.equals("12")){
			String lz="window.open('http://218.57.139.24:8083/businessShow/service/show.do?showNo="+OPENO+"','亮照','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+lz+"\"><img border=0 src='images/icon/icon_edit.gif' alt='亮照'> 亮照</a>");
		}
		return sbf.toString();
	}
	public String getMCButton(String STATUS,String OPENO,String OPETYPE,String ENTCLASS,String ENTTYPE,String CDDL){
		StringBuffer sbf=new StringBuffer();
		
		String STYPE="";
		if(OPETYPE.equals("10")){
			if(ENTCLASS.equals("1") || ENTCLASS.equals("2")){
				STYPE = "MCGL_NZ";
			}else if(ENTCLASS.equals("8")){
				STYPE = "MCGL_WZ";
			}else if(ENTCLASS.equals("5")){
				STYPE = "MCGL_GT";
			}else if(ENTCLASS.equals("6")){
				STYPE = "MCGL_NZH";
			}
		}else if(OPETYPE.equals("11")){
			if(ENTCLASS.equals("1") || ENTCLASS.equals("2")){
				STYPE = "MCGL_NZTZ";
			}else if(ENTCLASS.equals("8")){
				STYPE = "MCGL_WZTZ";
			}else if(ENTCLASS.equals("5")){
				STYPE = "MCGL_GTTZ";
			}else if(ENTCLASS.equals("6")){
				STYPE = "MCGL_NZHTZ";
			}
		}else if(OPETYPE.equals("12")){
			if(ENTCLASS.equals("1") || ENTCLASS.equals("2")){
				STYPE = "MCGL_NZYQ";
			}else if(ENTCLASS.equals("8")){
				STYPE = "MCGL_WZTZ";
			}else if(ENTCLASS.equals("5")){
				STYPE = "MCGL_GTTZ";
			}else if(ENTCLASS.equals("6")){
				STYPE = "MCGL_NZHTZ";
			}
		}else if(OPETYPE.equals("13")){
			if(ENTCLASS.equals("1") || ENTCLASS.equals("2")){
				STYPE = "MCGL_NZBG";
			}else if(ENTCLASS.equals("8")){
				STYPE = "MCGL_WZBG";
			}else if(ENTCLASS.equals("5")){
				STYPE = "MCGL_GTBG";
			}else if(ENTCLASS.equals("6")){
				STYPE = "MCGL_NZHBG";
			}
		}	
		
		String tzs=" window.open('mcgl/slsq_slqk.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE
		+"&ENTTYPE="+ENTTYPE+"','预审意见','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
		String url ="wsyy/wsyy_qyxz.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE+"&ENTCLASS="+ENTTYPE+"&yytype=2";
		String wsyy="window.open('"+url+"','0','height=550,width=600,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,scrollbars=yes','');";
		String sqs = "";
		if(OPETYPE.equals("10")||OPETYPE.equals("11")||OPETYPE.equals("12")||OPETYPE.equals("13")){
			sqs="window.open('mcgl/print/"+STYPE+"_PRINT.jsp?OPENO="+OPENO+"')";			      
		}
		//待预审
		if(STATUS.equals("1") || STATUS.equals("2")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
		}
		//预审通过或已注册登记
		else if( STATUS.equals("4")||STATUS.equals("7")||STATUS.equals("8")||STATUS.equals("9")||STATUS.equals("10")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='通知书'> 通知书</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+sqs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='申请书'> 申请书</a>");
		}
		//预审驳回
		else if(STATUS.equals("3")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('0','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> ");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\")'><img border=0 src='images/icon/icon_edit.gif' alt='驳回通知书'> 驳回通知书</a>");
		}
		//未提交
		else if(STATUS.equals("0")){
			
			sbf.append("<a href='#' onclick=\"checkMoreInfo('0','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> ");			
		}else if(STATUS.equals("2")){
			//sbf.append("&nbsp;<a href='#' onclick=\""+wsyy+"\"><img border=0 src='images/icon/icon_edit.gif' alt='网上预约'> 网上预约</a>");
			//sbf.append("&nbsp;<a href='#' onclick='showEmsMess(\""+OPENO+"\")'><img border=0 src='images/icon/ems.gif' alt='快递服务'> 快递服务</a>");
//			核准驳回
		}else if(STATUS.equals("5")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> ");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\")'><img border=0 src='images/icon/icon_edit.gif' alt='驳回通知书'> 驳回通知书</a>");
		}
		return sbf.toString();
	}
	
	public String getGgdjButton(String wStatus,String openo,String opeType,String entType) {
		StringBuffer sb = new StringBuffer();
		if("0".equals(wStatus)) { // 草稿
			sb.append("<a href='#' onclick=\"checkMoreInfo('0','"+openo+"','"+opeType+"','"+entType+"','9')\"><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>");
			sb.append("&nbsp;<a href='#' onclick=\"doDel('9','"+openo+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='删除'> 删除</a> ");		
		} 
		if("1".equals(wStatus)) {// 待预审
			sb.append("<a href='#' onclick=\"checkMoreInfo('1','"+openo+"','"+opeType+"','"+entType+"','"+'9'+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");			
		} 
		if("2".equals(wStatus)) {// 预审通过
			String tzs = "window.open('ggdj/ggdj_tzs.jsp?openo="+openo+"','广告发布登记通知书','top=120,left=350,toolbar=no,width=600,height=400,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
			String sqs ="";
			if("20".equals(opeType)) {
				sqs = "window.open('ggdj/ggdj_slsqs.jsp?openo="+openo+"')";
			}
			if("30".equals(opeType)) {
				sqs = "window.open('ggdj/ggdj_bgsqs.jsp?openo="+openo+"')";
			}
			if("50".equals(opeType)) {
				sqs = "window.open('ggdj/ggdj_zxsqs.jsp?openo="+openo+"')";
			}	
			sb.append("<a href='#' onclick=\"checkMoreInfo('1','"+openo+"','"+opeType+"','"+entType+"','"+'9'+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
			sb.append("&nbsp;<a href='#' onclick=\""+tzs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='通知书'> 通知书</a>");
			sb.append("&nbsp;<a href='#' onclick=\""+sqs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='申请书'> 申请书</a>");
		}
		if("3".equals(wStatus)) {// 预审驳回
			sb.append("<a href='#' onclick=\"checkMoreInfo('0','"+openo+"','"+opeType+"','"+entType+"','9')\"><img border=0 src='images/icon/icon_edit.gif' alt='修改'> 修改</a>");
		}
		if("4".equals(wStatus)) {// 核准通过
			sb.append("<a href='#' onclick=\"checkMoreInfo('1','"+openo+"','"+opeType+"','"+entType+"','"+'9'+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");

		}
		if("5".equals(wStatus)) {// 核准驳回
			sb.append("<a href='#' onclick=\"checkMoreInfo('1','"+openo+"','"+opeType+"','"+entType+"','"+'9'+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='查看'> 查看</a>");
		}
		
		return sb.toString();
	}
}	