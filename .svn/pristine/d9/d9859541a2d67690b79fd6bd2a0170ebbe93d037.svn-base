<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.PageShow" %> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<%      
    String ifelec =  Page.getIFELEC();    
    String OPENO = Page.getOPENO();    
    String ENTTYPE=Page.getENTTYPE();
    String OPETYPE=Page.getOPETYPE();
	if(Page.getSTEP()>=3){
	
	}else{
		Page.setSTEP(3);
	}
	String sVaild="1",sMust="0";//\校验位\必填页面	sMust="1"时先保存再翻页，sMust="0" 可以直接翻页
	if (OPENO.equals(""))
	{		
		sVaild="0";
		sMust="1";
	}
	
	Page.clearPage();
	Page.clearPageCmd();

	PageShow pageShow=new PageShow();
	Page.setSanZheng(sanZheng);
	if(OPETYPE.equals("20")){
		pageShow.getPageForSL( ENTTYPE,sVaild,sMust, Page);
	}else if(OPETYPE.equals("30") || OPETYPE.equals("40")){
		boolean RyChange=false;
		boolean CzChange=false;
		boolean FgsChange=false;
		boolean LlyChange=false;
		boolean FrChange=false;
		boolean CwfzrChange=false;
		if(!OPENO.equals("")){
			QYDJ_BGSX.setOPENO(OPENO);
			ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
			//if(list.size()<1){
			//	sVaild="0";
			//	sMust="1";
			//}
			for(int i=0;i<list.size();i++){
				com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);		
				if(!FrChange){
					QYDJ_BGSX.setFrChange(bgsx.getALTITEM());
					FrChange=QYDJ_BGSX.getFrChange();
				}
				if(!RyChange){
					QYDJ_BGSX.setRyChange(bgsx.getALTITEM());
					RyChange=QYDJ_BGSX.getRyChange();
				}
				if(!CzChange){			
					QYDJ_BGSX.setCzChange(bgsx.getALTITEM());		
					CzChange=QYDJ_BGSX.getCzChange();
				}
				if(!FgsChange){			
					QYDJ_BGSX.setFgsChange(bgsx.getALTITEM());		
					FgsChange=QYDJ_BGSX.getFgsChange();
				}
				if(!LlyChange){
					QYDJ_BGSX.setLlyChange(bgsx.getALTITEM());		
					LlyChange=QYDJ_BGSX.getLlyChange();
				}
				if(!CwfzrChange){
					QYDJ_BGSX.setCwfzrChange(bgsx.getALTITEM());		
					CwfzrChange=QYDJ_BGSX.getCwfzrChange();
				}
			}
		}
		if(OPETYPE.equals("30")){
			pageShow.getPageForBg(ENTTYPE, FrChange,RyChange, CzChange,FgsChange,CwfzrChange,LlyChange, sVaild, sMust, Page);
		}else if(OPETYPE.equals("40")){
			pageShow.getPageForBa(ENTTYPE, RyChange, CzChange,FgsChange,CwfzrChange,LlyChange, sVaild, sMust, Page);	
		}
	}else if(OPETYPE.equals("50")){
		pageShow.getPageForZx(ENTTYPE,sVaild, sMust, Page);
	}
	String[] file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//跳转页面
	}

%>
