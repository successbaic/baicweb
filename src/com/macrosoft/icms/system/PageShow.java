package com.macrosoft.icms.system;
import java.util.Arrays;
import java.util.List;

import com.macrosoft.icms.util.Constants;
public class PageShow {
	public void getPageForSL( String sENTTYPE,String sVaild,String sMust,WebSysPage Page){
		String[] file;
		if (sENTTYPE.equalsIgnoreCase("GS"))
		{	 
			file= new String[]{"qydj_gs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
			Page.addPage(file);		
			file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
			Page.addPage(file); 		
			file= new String[]{"qydj_czxx_list.jsp","�ɶ�(������)",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_ryxx_list.jsp","���¡����¡�����",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("FGS"))
		{	
			file= new String[]{"qydj_gs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","������",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("NZYY"))
		{	
			file= new String[]{"qydj_gs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","������",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("NZFR"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","����������",sVaild ,sMust};
			Page.addPage(file);
			file= new String[]{"qydj_czxx_list.jsp","���ܲ���",sVaild ,sMust};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WZQY")||sENTTYPE.equalsIgnoreCase("WZFR"))
		{	 
			file= new String[]{"qydj_wzgs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
			Page.addPage(file);		
			file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
			Page.addPage(file); 					
			file= new String[]{"qydj_czxx_list.jsp","������Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_ryxx_list.jsp","���¡����¡�����",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZFZ"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","������",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WGDB"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","��ϯ����",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_ryxx_list.jsp","������Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		
		}
		else if (sENTTYPE.equalsIgnoreCase("WGJY"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","������",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHH"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","ί�ɴ���",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_hhczxx_list.jsp","�ϻ��˳���",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHHFZ"))
		{	
			file= new String[]{"qydj_wzgs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","������",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
			
		}
		else if (sENTTYPE.equalsIgnoreCase("HHQY"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			
			file= new String[]{"qydj_fddbr.jsp","ִ������ϻ���",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_hhczxx_list.jsp","�ϻ��˳���",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("HHFZ"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","������",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZ"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","Ͷ����",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZFZ"))
		{
		    file= new String[]{"qydj_gs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","������",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("HZS"))
		{
		    file= new String[]{"qydj_hzs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_czxx_list.jsp","��Ա������Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file); 
		}
		else if (sENTTYPE.equalsIgnoreCase("HZSFZ"))
		{
		    file= new String[]{"qydj_hzs_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_fddbr.jsp","������",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
			
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file); 
		}
		else if (sENTTYPE.equalsIgnoreCase("GT"))
		{
		    file= new String[]{"gtdj_gt_jbxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"gtdj_jyzxx.jsp","��Ӫ����Ϣ",sVaild}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
			file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
			Page.addPage(file);
			file= new String[]{"gtdj_sqwt.jsp","��Ȩί��",sVaild}; //ҳ���ַ\����\У��λ 
			Page.addPage(file);
		}
		if (sENTTYPE.equalsIgnoreCase("WZHH")||sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WGDB")||sENTTYPE.equalsIgnoreCase("WZFR")||
				sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("WZFZ")){
		file= new String[]{"qydj_wzwjsd.jsp","�ļ��ʹ���",sVaild};
		Page.addPage(file);
		}
		file= new String[]{"wsdj_fjxx_list.jsp","������Ϣ",sVaild};
		Page.addPage(file);	
		if("1".equals(Page.getSanZheng())){
			file= new String[]{"wsdj_ga.jsp","������Ϣ",sVaild};
			Page.addPage(file);	
			file= new String[]{"wsdj_zj.jsp","�ʼ���Ϣ",sVaild};
			Page.addPage(file);	
			file= new String[]{"wsdj_sw.jsp","˰����Ϣ",sVaild};
			Page.addPage(file);	
		}
	}
	public void getPageForBg(String sENTTYPE,boolean FrChange,boolean RyChange,boolean CzChange,boolean FgsChange, boolean CwfzrChange,boolean LlyChange,String sVaild,String sMust,WebSysPage Page){
		String[] file;
		String title_fz = "��֧����";
		String[] enttypes ={"GS","WZGS","WZQY"};
		List<String> list = Arrays.asList(enttypes);
		if(list.contains(sENTTYPE)){
			title_fz = "�ֹ�˾";
		};
		if(sENTTYPE.equals("GT")){
			file= new String[]{"gtdj_bgsx.jsp","�������",sVaild,sMust};
			Page.addPage(file);
		}else{
			file= new String[]{"qydj_bgsx.jsp","�������",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
			Page.addPage(file);
		}
		if(sENTTYPE.equals("GS")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
				Page.addPage(file);
			}	
			if(RyChange){				
				file= new String[]{"qydj_ryxx_list.jsp","���¡����¡�����",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","�ɶ���Ϣ",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if(sENTTYPE.equals("FGS")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);			
			}			
		}
		else if (sENTTYPE.equalsIgnoreCase("NZYY")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("NZFR")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","���ܲ���",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WZQY")){
			if(FrChange){	
				file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
				Page.addPage(file); 
			}	
			if(RyChange){						
				file= new String[]{"qydj_ryxx_list.jsp","�����»��Ա",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","������Ϣ",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
			//file= new String[]{"qydj_wzwjsd.jsp","�ļ��ʹ���",sVaild};
			//Page.addPage(file);
		}
		else if (sENTTYPE.equalsIgnoreCase("WZFZ")){	
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}		
			
		}
		else if(sENTTYPE.equalsIgnoreCase("WGJY"))
		{
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WGDB")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","��ϯ����",sVaild};
				Page.addPage(file);
			}	
			if(RyChange){
				file= new String[]{"qydj_ryxx_list.jsp","������Ϣ",sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHH")){	
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","ί�ɴ���",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_hhczxx_list.jsp","�ϻ�����Ϣ",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHHFZ")){	
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","��������Ϣ",sVaild};
				Page.addPage(file);
			}
			
		}
		else if (sENTTYPE.equalsIgnoreCase("HHQY")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","ִ������ϻ���",sVaild};
				Page.addPage(file);
			}
		    if(RyChange){
		    	file= new String[]{"qydj_hhczxx_list.jsp","�ϻ��˳���",sVaild};
				Page.addPage(file);
		    }
		    //if(CzChange){
		    //	file= new String[]{"qydj_hhczxx_list.jsp","�ϻ��˳���",sVaild};
			//	Page.addPage(file);
		    //}
		    if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HHFZ")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HZS")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","��Ա������Ϣ",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HZSFZ")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZ")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","Ͷ����",sVaild};
				Page.addPage(file);
			}			
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp",title_fz,sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZFZ")){
			if(FrChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
		}
		if(CwfzrChange){
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
		}
		if(LlyChange){
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
		}
		
		if (sENTTYPE.equalsIgnoreCase("WZHH")||sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WGDB")||sENTTYPE.equalsIgnoreCase("WZFR")||
				sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("WZFZ")){
		file= new String[]{"qydj_wzwjsd.jsp","�ļ��ʹ���",sVaild};
		Page.addPage(file);
		}
		
		file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ",sVaild};
		Page.addPage(file);
		file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
		Page.addPage(file);
		file= new String[]{"wsdj_fjxx_list.jsp","������Ϣ",sVaild};
		Page.addPage(file);	
	}
	
	public void getPageForZx(String sENTTYPE,String sVaild,String sMust,WebSysPage Page){
		String[] file;
		if(sENTTYPE.equals("GT")){
			file= new String[]{"gtdj_zxxx.jsp","ע����Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
			Page.addPage(file);	
			file= new String[]{"gtdj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);
		}else{
			file= new String[]{"qydj_zxxx.jsp","ע����Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
			Page.addPage(file);				
			file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
			Page.addPage(file);				
		}
		if (sENTTYPE.equalsIgnoreCase("WZHH")||sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WGDB")||sENTTYPE.equalsIgnoreCase("WZFR")||
				sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("WZFZ")){
		file= new String[]{"qydj_wzwjsd.jsp","�ļ��ʹ���",sVaild};
		Page.addPage(file);
		}
		file= new String[]{"wsdj_fjxx_list.jsp","������Ϣ",sVaild};
		Page.addPage(file);
	}
	
	public void getPageForBa(String sENTTYPE,boolean RyChange,boolean CzChange,boolean FgsChange, boolean CwfzrChange,boolean LlyChange,String sVaild,String sMust,WebSysPage Page){
		String[] file;
		file= new String[]{"qydj_basx.jsp","��������",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
		Page.addPage(file);
		if(sENTTYPE.equals("GS")){		
			if(RyChange){
				file= new String[]{"qydj_ryxx_list.jsp","�����»��Ա",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","��֧����",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("NZFR")){
			//if(RyChange){
			//	file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
			//	Page.addPage(file);
			//}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","���ܲ���",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","��֧����",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WZQY")){	 
			if(RyChange){	
				//file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
				//Page.addPage(file); 		
				file= new String[]{"qydj_ryxx_list.jsp","�����»��Ա",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","������Ϣ",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","��֧����",sVaild};
				Page.addPage(file);
			}					
		}
		else if (sENTTYPE.equalsIgnoreCase("WZFZ")){	
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}			
		}
		else if(sENTTYPE.equalsIgnoreCase("WGJY"))
		{
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","��֧����",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WGDB")){	
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","��ϯ����",sVaild};
				Page.addPage(file);
				file= new String[]{"qydj_ryxx_list.jsp","������Ϣ",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHH")){	
			if(CzChange){
				file= new String[]{"qydj_hhczxx_list.jsp","�ϻ�����Ϣ",sVaild};
				Page.addPage(file);
			}
			if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","��֧����",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("WZHHFZ")){	
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","��������Ϣ",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HHQY")){
		    if(RyChange){
		    	file= new String[]{"qydj_hhczxx_list.jsp","�ϻ��˳���",sVaild};
				Page.addPage(file);
		    }
		    if(FgsChange){
				file= new String[]{"qydj_fzjg_list.jsp","��֧����",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HHFZ")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HZS")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","����������",sVaild};
				Page.addPage(file);
			}
			if(CzChange){
				file= new String[]{"qydj_czxx_list.jsp","��Ա������Ϣ",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("HZSFZ")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZ")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","Ͷ����",sVaild};
				Page.addPage(file);
			}			
		}
		else if (sENTTYPE.equalsIgnoreCase("GRDZFZ")){
			if(RyChange){
				file= new String[]{"qydj_fddbr.jsp","������",sVaild};
				Page.addPage(file);
			}
		}		
		if(CwfzrChange){
			file= new String[]{"qydj_cwfzr.jsp","��������",sVaild};
			Page.addPage(file);
		}
		if(LlyChange){
			file= new String[]{"qydj_llyxx.jsp","����Ա��Ϣ",sVaild};
			Page.addPage(file);
		}
		if (sENTTYPE.equalsIgnoreCase("WZHH")||sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WGDB")||sENTTYPE.equalsIgnoreCase("WZQY")||
				sENTTYPE.equalsIgnoreCase("WGJY")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("WZFZ")){
		file= new String[]{"qydj_wzwjsd.jsp","�ļ��ʹ���",sVaild};
		Page.addPage(file);
		}
		file= new String[]{"qydj_sqwt.jsp","��Ȩί��",sVaild};
		Page.addPage(file);
		file= new String[]{"wsdj_fjxx_list.jsp","������Ϣ",sVaild};
		Page.addPage(file);	
	}
	/**
	 * use �� ��ҵ�Ǽǡ�������Ԥ��
	 * auther:vincent
	 * @param ENTCLASS ��ҵ����
	 */
	public void getPageForMC(String ENTCLASS,String ENTTYPE,String sMust,String sVaild,WebSysPage Page){
		String[] file;
		/**if(ENTCLASS.equals("MCGL_NZ")){
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_jbxx_nz.jsp", "������Ϣ", sVaild, sMust };
			Page.addPage(file);
			file = new String[] {Constants.PROJECT_NAME+ "mcgl/xgcl/nz/mcgl_czxx_nz.jsp", "������Ϣ", sVaild,sMust };
			Page.addPage(file);
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_wtxx_nz.jsp", "��Ȩί��", sVaild,sMust };
			Page.addPage(file);
		}else if(ENTCLASS.equals("MCGL_GT")){
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_jbxx_gt.jsp", "������Ϣ", sVaild, sMust };
			Page.addPage(file);
			//file = new String[] {Constants.PROJECT_NAME+ "mcgl/xgcl/nz/mcgl_czxx_nz.jsp", "������Ϣ", sVaild,sMust };
			//Page.addPage(file);
			//file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_wtxx_nz.jsp", "��Ȩί��", sVaild,sMust };
			//Page.addPage(file);
		}else if(ENTCLASS.equals("MCGL_WZ")){
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_jbxx_wz.jsp", "������Ϣ", sVaild, sMust };
			Page.addPage(file);
			file = new String[] {Constants.PROJECT_NAME+ "mcgl/xgcl/nz/mcgl_czxx_wz.jsp", "������Ϣ", sVaild,sMust };
			Page.addPage(file);
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_wtxx_nz.jsp", "��Ȩί��", sVaild,sMust };
			Page.addPage(file);
		}else if(ENTCLASS.equals("MCGL_NZH")){
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_jbxx_nzh.jsp", "������Ϣ", sVaild, sMust };
			Page.addPage(file);
			file = new String[] {Constants.PROJECT_NAME+ "mcgl/xgcl/nz/mcgl_czxx_nzh.jsp", "������", sVaild,sMust };
			Page.addPage(file);
			file = new String[] { Constants.PROJECT_NAME+"mcgl/xgcl/nz/mcgl_wtxx_nz.jsp", "��Ȩί��", sVaild,sMust };
			Page.addPage(file);
			
		}**/
		if(ENTCLASS.equals("1") || ENTCLASS.equals("2")|| ENTCLASS.equals("8")||ENTCLASS.equals("6")){
			file = new String[] { "mcgl_jbxx.jsp", "������Ϣ", sVaild, sMust };
			Page.addPage(file);
			if(ENTTYPE.equals("GS") || ENTTYPE.equals("WZGS") || ENTTYPE.equals("HZS")
			|| ENTTYPE.equals("WZHH") || ENTTYPE.equals("HHQY")||ENTTYPE.equals("GRDZ")){
				file = new String[] { "mcgl_tzrxx.jsp", "������Ϣ", sVaild,sMust };
				Page.addPage(file);	
			}			
		}else if(ENTCLASS.equals("5")){
			file = new String[] { "mcgl_jbxx.jsp", "������Ϣ", sVaild, sMust };
			Page.addPage(file);
		}
		file = new String[] { "mcgl_sqwt.jsp", "��Ȩί��", sVaild,sMust };
		Page.addPage(file);
	}	
	public String pagesetup_default(){
		
		String p="";
		p+="<script language='javascript'>";
		//p+="var hkey_root,hkey_path,hkey_key;";
		//p+="hkey_root='HKEY_CURRENT_USER';";
		//p+="hkey_path='\\Software\\Microsoft\\Internet Explorer\\PageSetup\\';";
		//������ҳ��ӡ��ҳüҳ��ΪĬ��ֵ
		p+="function pagesetup_default(){";
		//p+="var svalue1='<%=icms.getSysDm('REGORG',QYDJ_YWSB.getREGORG())%>-<%=QYDJ_YWSB.getAPPPER()%>-<%=QYDJ_YWSB.getAPPRDATE()%>';";
		/*p+="var svalue='<%=QYDJ_YWSB.getREGORGN()%>';";
		p+="try{";
		p+="var RegWsh = new ActiveXObject('WScript.Shell');";
		p+="hkey_key='footer';";
		p+="RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,svalue);";
		p+="}catch(e){";
        p+="alert('�뿪��active�ؼ���');";
		p+="}";*/
		p+="}";
		p+="</script>";
		return p;
	}
	public String getButton(String STATUS,String OPENO,String OPETYPE,String ENTTYPE,String CDDL){
		StringBuffer sbf=new StringBuffer();
		String tzs=" window.open('slsq_slqk.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE
			       +"&ENTTYPE="+ENTTYPE+"','Ԥ�����','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
		String url ="wsyy/wsyy_qyxz.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE+"&ENTCLASS="+ENTTYPE+"&yytype=1";
		String wsyy="window.open('"+url+"','0','height=550,width=600,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,scrollbars=yes','');";
		String sOPETYPE="";
		if(OPETYPE.equals("30")){sOPETYPE="BG";}else if(OPETYPE.equals("40")){sOPETYPE="BA";}else if(OPETYPE.equals("50")){sOPETYPE="ZX";}
		if(!sOPETYPE.equals("")){sOPETYPE="_"+sOPETYPE;}
		String sqs="window.open('print/"+ENTTYPE+sOPETYPE+"_PRINT.jsp?OPENO="+OPENO+"')";
		if(CDDL.equals("4")) //��Ȩ����
		{
			tzs="window.open('gqdj/gqdj_shtzs.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE
		       +"&ENTTYPE="+ENTTYPE+"','Ԥ�����','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
			if(OPETYPE.equals("30")){sOPETYPE="bg";}else if(OPETYPE.equals("50")){sOPETYPE="zx";}else if(OPETYPE.equals("81")){sOPETYPE="cx";}
			sqs="window.open('gqdj/"+ENTTYPE.toLowerCase()+"_"+sOPETYPE+"sqs.jsp?OPENO="+OPENO+"')";
		}
		//��Ԥ��
		if(STATUS.equals("1")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
		}else if(STATUS.equals("5")){//��׼����
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> ");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\")'><img border=0 src='images/icon/icon_edit.gif' alt='����֪ͨ��'> ����֪ͨ��</a>");
		}
		//Ԥ��ͨ������ע��Ǽ�
		else if(STATUS.equals("2") || STATUS.equals("4")||STATUS.equals("7")||STATUS.equals("8")||STATUS.equals("9")||STATUS.equals("10")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='֪ͨ��'> ֪ͨ��</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+sqs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='������'> ������</a>");
		}
		//Ԥ�󲵻�
		else if(STATUS.equals("3")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('0','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='�޸�'> �޸�</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> ");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\")'><img border=0 src='images/icon/icon_edit.gif' alt='����֪ͨ��'> ����֪ͨ��</a>");
		}
		//δ�ύ
		else if(STATUS.equals("0")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('0','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='�޸�'> �޸�</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> ");			
		}
		//�鵵���
		else if(STATUS.equals("11")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
		}
		if(STATUS.equals("2")){
			//sbf.append("&nbsp;<a href='#' onclick=\""+wsyy+"\"><img border=0 src='images/icon/icon_edit.gif' alt='����ԤԼ'> ����ԤԼ</a>");
			//sbf.append("&nbsp;<a href='#' onclick='showEmsMess(\""+OPENO+"\")'><img border=0 src='images/icon/ems.gif' alt='��ݷ���'> ��ݷ���</a>");
		}
		else if(STATUS.equals("12")){
			String lz="window.open('http://218.57.139.24:8083/businessShow/service/show.do?showNo="+OPENO+"','����','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+lz+"\"><img border=0 src='images/icon/icon_edit.gif' alt='����'> ����</a>");
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
		+"&ENTTYPE="+ENTTYPE+"','Ԥ�����','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
		String url ="wsyy/wsyy_qyxz.jsp?OPENO="+OPENO+"&STATUS="+STATUS+"&OPETYPE="+OPETYPE+"&ENTCLASS="+ENTTYPE+"&yytype=2";
		String wsyy="window.open('"+url+"','0','height=550,width=600,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,scrollbars=yes','');";
		String sqs = "";
		if(OPETYPE.equals("10")||OPETYPE.equals("11")||OPETYPE.equals("12")||OPETYPE.equals("13")){
			sqs="window.open('mcgl/print/"+STYPE+"_PRINT.jsp?OPENO="+OPENO+"')";			      
		}
		//��Ԥ��
		if(STATUS.equals("1") || STATUS.equals("2")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
		}
		//Ԥ��ͨ������ע��Ǽ�
		else if( STATUS.equals("4")||STATUS.equals("7")||STATUS.equals("8")||STATUS.equals("9")||STATUS.equals("10")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='֪ͨ��'> ֪ͨ��</a>");
			sbf.append("&nbsp;<a href='#' onclick=\""+sqs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='������'> ������</a>");
		}
		//Ԥ�󲵻�
		else if(STATUS.equals("3")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('0','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='�޸�'> �޸�</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> ");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\")'><img border=0 src='images/icon/icon_edit.gif' alt='����֪ͨ��'> ����֪ͨ��</a>");
		}
		//δ�ύ
		else if(STATUS.equals("0")){
			
			sbf.append("<a href='#' onclick=\"checkMoreInfo('0','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='�޸�'> �޸�</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> ");			
		}else if(STATUS.equals("2")){
			//sbf.append("&nbsp;<a href='#' onclick=\""+wsyy+"\"><img border=0 src='images/icon/icon_edit.gif' alt='����ԤԼ'> ����ԤԼ</a>");
			//sbf.append("&nbsp;<a href='#' onclick='showEmsMess(\""+OPENO+"\")'><img border=0 src='images/icon/ems.gif' alt='��ݷ���'> ��ݷ���</a>");
//			��׼����
		}else if(STATUS.equals("5")){
			sbf.append("<a href='#' onclick=\"checkMoreInfo('1','"+OPENO+"','"+OPETYPE+"','"+ENTTYPE+"','"+CDDL+"')\"><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
			sbf.append("&nbsp;<a href='#' onclick=\"doDel('"+CDDL+"','"+OPENO+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> ");
			sbf.append("&nbsp;<a href='#' onclick=\""+tzs+"\")'><img border=0 src='images/icon/icon_edit.gif' alt='����֪ͨ��'> ����֪ͨ��</a>");
		}
		return sbf.toString();
	}
	
	public String getGgdjButton(String wStatus,String openo,String opeType,String entType) {
		StringBuffer sb = new StringBuffer();
		if("0".equals(wStatus)) { // �ݸ�
			sb.append("<a href='#' onclick=\"checkMoreInfo('0','"+openo+"','"+opeType+"','"+entType+"','9')\"><img border=0 src='images/icon/icon_edit.gif' alt='�޸�'> �޸�</a>");
			sb.append("&nbsp;<a href='#' onclick=\"doDel('9','"+openo+"')\"><img border=0 src='images/icon/icon_delete.gif' alt='ɾ��'> ɾ��</a> ");		
		} 
		if("1".equals(wStatus)) {// ��Ԥ��
			sb.append("<a href='#' onclick=\"checkMoreInfo('1','"+openo+"','"+opeType+"','"+entType+"','"+'9'+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");			
		} 
		if("2".equals(wStatus)) {// Ԥ��ͨ��
			String tzs = "window.open('ggdj/ggdj_tzs.jsp?openo="+openo+"','��淢���Ǽ�֪ͨ��','top=120,left=350,toolbar=no,width=600,height=400,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no')";
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
			sb.append("<a href='#' onclick=\"checkMoreInfo('1','"+openo+"','"+opeType+"','"+entType+"','"+'9'+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
			sb.append("&nbsp;<a href='#' onclick=\""+tzs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='֪ͨ��'> ֪ͨ��</a>");
			sb.append("&nbsp;<a href='#' onclick=\""+sqs+"\"><img border=0 src='images/icon/icon_edit.gif' alt='������'> ������</a>");
		}
		if("3".equals(wStatus)) {// Ԥ�󲵻�
			sb.append("<a href='#' onclick=\"checkMoreInfo('0','"+openo+"','"+opeType+"','"+entType+"','9')\"><img border=0 src='images/icon/icon_edit.gif' alt='�޸�'> �޸�</a>");
		}
		if("4".equals(wStatus)) {// ��׼ͨ��
			sb.append("<a href='#' onclick=\"checkMoreInfo('1','"+openo+"','"+opeType+"','"+entType+"','"+'9'+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");

		}
		if("5".equals(wStatus)) {// ��׼����
			sb.append("<a href='#' onclick=\"checkMoreInfo('1','"+openo+"','"+opeType+"','"+entType+"','"+'9'+"')\" ><img border=0 src='images/icon/icon_edit.gif' alt='�鿴'> �鿴</a>");
		}
		
		return sb.toString();
	}
}	