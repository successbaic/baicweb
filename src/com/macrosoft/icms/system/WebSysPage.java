/**
	Name:		SysPage
	Function:	转换页面和生成超链接用的bean。
	Date:		2006-10-9 
**/
package com.macrosoft.icms.system;
import java.sql.*;
import java.util.*;
public class WebSysPage
{	 
    Vector cVector;
	String OPENO=null;
	String DL=null; // 业务大类：9 广告登记
	String ENTCLASS=null;
	String ENTTYPE=null;
	String OPETYPE=null; // 业务类型：20设立，30变更，50注销 等等
	String SIGN=null;
	String MCXH=null;
	String REGNO=null;
	String ENTNAME=null;
	String pageKey=null;
	String APPRNO=null;//预审通知书文号
	String GMLX=null;
	//名称序号及法定代表人身份证号
	String XGBH=null;
	String PRIPID=null;
	String sqxxId; //申请业务主体主键
	int STEP=0;
	int NUM=0;
	ArrayList pageCmd;
	String sanZheng;
	String IFELEC;
	String PREREGORG;
	String certNo; // 许可证号

	int pageindex=-1;
	int tabs=10; //how many tabs in a line?
	public WebSysPage()
	{
		cVector = new Vector();
		pageCmd=new ArrayList();
		pageindex=0;
	}
	/** 析构函数 **/
	public void finalize()
	{
		cVector = null;
		pageCmd=null;
		pageindex=0;
	}
	public String getGMLX()
	{
		return GMLX;
	}
	public void setGMLX(String GMLX)
	{
		this.GMLX = GMLX;
	}
	
	public String getSanZheng() {
		return sanZheng;
	}
	public void setSanZheng(String sanZheng) {
		this.sanZheng = sanZheng;
	}
	public void settabs(int itab)
	{
		this.tabs = itab;
	}
	public String getpageKey()
	{
		return pageKey;
	}
	public void setpageKey(String pageKey)
	{
		this.pageKey = pageKey;
	}
	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}
	public void setPRIPID(String pageKey)
	{
		this.PRIPID = doPreProcess(pageKey);
	}
	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}
	public void setOPENO(String pageKey)
	{
		this.OPENO = doPreProcess(pageKey);
	}
	public void setSTEP(int pageKey)
	{
		this.STEP = (pageKey);
	}
	public int getSTEP()
	{
		return STEP;
	}
	public void setNUM(int pageKey)
	{
		this.NUM = (pageKey);
	}
	public int getNUM()
	{
		return NUM;
	}
	public void setDL(String dl)
	{
		this.DL = doPreProcess(dl);
	}
	public String getDL()
	{
		return doPreProcess(DL);
	}
	public void setENTCLASS(String pageKey)
	{
		this.ENTCLASS = (pageKey);
	}
	public String getENTCLASS()
	{
		return doPreProcess(ENTCLASS);
	}
	public void setENTTYPE(String pageKey)
	{
		this.ENTTYPE = doPreProcess(pageKey);
	}
	public String getENTTYPE()
	{
		return doPreProcess(ENTTYPE);
	}
	public void setOPETYPE(String pageKey)
	{
		this.OPETYPE = doPreProcess(pageKey);
	}
	public String getOPETYPE()
	{
		return doPreProcess(OPETYPE);
	}
	public void setSIGN(String pageKey)
	{
		this.SIGN = doPreProcess(pageKey);
	}
	public String getSIGN()
	{
		return doPreProcess(SIGN);
	}

	public void setMCXH(String pageKey)
	{
		this.MCXH = doPreProcess(pageKey);
	}
	public String getMCXH()
	{
		return doPreProcess(MCXH);
	}

	public void setREGNO(String pageKey)
	{
		this.REGNO = doPreProcess(pageKey);
	}
	public String getREGNO()
	{
		return doPreProcess(REGNO);
	}

	public void setENTNAME(String pageKey)
	{
		this.ENTNAME = doPreProcess(pageKey);
	}
	public String getENTNAME()
	{
		return doPreProcess(ENTNAME);
	}

	public void setXGBH(String pageKey)
	{
		this.XGBH = doPreProcess(pageKey);
	}
	public String getXGBH()
	{
		return doPreProcess(XGBH);
	}
	
	public int getpageindex()
	{
		return pageindex;
	}

	public void setpageindex(int pageindex)
	{
		this.pageindex = pageindex;
	}
	public String getAPPRNO() {
		return doPreProcess(APPRNO);
	}
	public void setAPPRNO(String apprno) {
		this.APPRNO = doPreProcess(apprno);
	}
	
	public String getIFELEC() {
		return IFELEC;
	}
	public void setIFELEC(String iFELEC) {
		IFELEC = iFELEC;
	}
	
	
	public String getPREREGORG() {
		return PREREGORG;
	}
	public void setPREREGORG(String pREREGORG) {
		PREREGORG = pREREGORG;
	}
	
	public String getSqxxId() {
		return sqxxId;
	}
	public void setSqxxId(String sqxxId) {
		this.sqxxId = sqxxId;
	}
	public String getCertNo() {
		return certNo;
	}
	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}
	public void init() 
	{
		tabs=10;
		pageindex=0;
		OPENO=null;
		DL=null; 
		IFELEC =null;
		PREREGORG=null;
		ENTCLASS=null;
		ENTTYPE=null;
		OPETYPE=null;
		SIGN=null;
		MCXH=null;
		REGNO=null;
		ENTNAME=null;
		XGBH=null;
		PRIPID=null;
		sqxxId = null;
		certNo = null;
		STEP=0;
		NUM=0;
		pageCmd.clear();
		cVector.clear();
	}

	/*清除全部page，变更时用*/
	public void clearPage()
	{
		cVector.clear();
	}
	public void clearPageCmd(){
		pageCmd.clear();
	}
	public void addCmd(String[] sCmd)   //sCmd string[2] :1-cmdName 2-javascript  3- visible
	{
		pageCmd.add( sCmd );
	}

	public void delPage(int index)
	{
		if(index!=0)
		{
		   cVector.removeElementAt(index);
		}		
	}
	public void addPage(String[] recordInfo)
	{
		cVector.addElement( recordInfo );
	}
	public void insertPage(String[] recordInfo)
	{
		cVector.insertElementAt( recordInfo, 0 );
	}
	public void insertPage(String[] recordInfo, int pos)
	{
		if (cVector==null)
			pos=0;
		else
			pos=(pos<=cVector.size()?pos:cVector.size());

		cVector.insertElementAt( recordInfo, pos );
	}
	public String[] getFirstPage()
	{
		if (cVector==null||cVector.size()==0)
			return  null;
		else
			return (String[])(cVector.firstElement());
	}
	public String[] getLastPage()
	{
		if (cVector==null||cVector.size()==0)
			return  null;
		else
			return (String[])(cVector.lastElement());
	}
	public String[] getCurrentPage()
	{
		if (pageindex<(cVector.size()-1))
			return (String[])cVector.elementAt(pageindex);
		else
			return (String[])(cVector.lastElement());
	}
	

	public String[] getPrePage()
	{
		if (pageindex==0)
			return (String[])(cVector.firstElement());
		else
			return (String[])cVector.elementAt(pageindex-1);
	}

	public String[] getNextPage()
	{
		if (pageindex<(cVector.size()-1))
			return (String[])cVector.elementAt(pageindex+1);
		else
			return (String[])(cVector.lastElement());
	}
	
	public int getCurrentIndex(String[] recordInfo )
	{
		for (int i=0;i<cVector.size() ;i++ )
		{
			String[] file=(String[])cVector.elementAt(i);
			if (file[0]==recordInfo[0]&&file[1]==recordInfo[1])
			{				
				return i;
			}
		}
		return -1;
	}
	public boolean contains(String[] recordInfo )
	{
		for (int i=0;i<cVector.size() ;i++ )
		{
			String[] file=(String[])cVector.elementAt(i);
			if (file[0]==recordInfo[0]&&file[1]==recordInfo[1])
			{
				return true;
			}
		}
		return false;
	}

	public void setVerify(int i)
	{
		if (i<(cVector.size()))
		{			
			String[] file=(String[])cVector.elementAt(i);
			if (file.length>2)
			{
				file[2]="1";	
			}					
		}		
	}
	public String getVerify(int i)
	{
		if (i<(cVector.size()))
		{			
			String[] file=(String[])cVector.elementAt(i);
			if (file.length>2)
			{
				return file[2];	
			}
			else
			{
				return "1";
			}
					
		}
		else
			return "";
		
	}
	public void setMusted(int i)  //1 must save ;else have saved   
	{
		if (i<(cVector.size()))
		{			
			String[] file=(String[])cVector.elementAt(i);
			if (file.length>3)
			{
				//set 0 have saved
				file[3]="0";
			}					
		}		
	}
	public void setMusted(String pageURI)  //1 must save ;else have saved   
	{
		for(int i=0;i<cVector.size();i++)
		{
			String[] file=(String[])cVector.elementAt(i);		
			if (pageURI.indexOf(file[0])>0&&file.length>3)
			{
				//set 0 have saved
				file[3]="0";
			}					
		}		
	}
	public String getMust(int i)
	{
		if (i<(cVector.size()))
		{			
			String[] file=(String[])cVector.elementAt(i);
			if (file.length>3)
			{
				return file[3];	
			}
			else
			{
				return "0";
			}
					
		}
		else
			return "";
		
	}
	public void setCmdVisible(int i)   ///set cmd is visible
	{
		if (i<(pageCmd.size()))
		{			
			String[] file=(String[])pageCmd.get(i);
			if (file.length>2)
			{
				//set 0 have saved
				file[2]="1";
			}					
		}		
	}
	public void setCmdVisible(String name)   ///set cmd is visible
	{
		for (int j=0;j<pageCmd.size();j++ )
		{
			String[] file=(String[])pageCmd.get(j);
			if (file.length>2&&file[1].equals(name))
			{
				//set 0 have saved
				file[2]="1";
				break;
			}	
		}
			
	}	

	public String doPreProcess( String sValue )
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
			}else{
				return sValue;
			}
		}		
	}
	
	public String nwpageheader(String pageURI)
	{
		int i=0;
		String nav="<div class=tabnav>";
		String header="<table width='100%' border=1 style=\"border-bottom: 1px solid #B9B9FF;border-top-style: none;border-top-width:0px;border-left-style: none;border-left-width:0px;border-right-style: none;border-right-width:0px;\">\n"; 
		header+="<tr style='border-top-style: none;border-top-width:0px;'>\n";
		while (i<cVector.size())
		{
			String[] file=(String[])cVector.elementAt(i);			
			int leng=file[0].lastIndexOf("/");
			if (leng==-1)
			{
				leng=0;
			}				
			int leng1=file[0].lastIndexOf("?");
			if (leng1==-1)
			{
				leng1=file[0].length();
			}
			String pn=file[0].substring(leng,leng1);
			if (!pageURI.endsWith(pn))
			{
					header+="<td id=T"+i+" noWrap class=taboff style='border-top-style: none;border-top-width:0px;'>";
					if (getVerify(i).equals("1"))
					{
						header+="<u><a href="+file[0]+"?pageindex="+Integer.toString(i)+"><font color=#000080>"+file[1]+"</font></a></u></td>\n";
					}
					else
					{
						header+="<font color=#000080>"+file[1]+"</font></td>\n";
					}
					
			}
			else
			{					
					pageindex=i;
					setVerify(i);
					header+="<td id=T"+i+" noWrap class=tabon style='border-top-style: none;border-top-width:0px;'>";
					header+="<font color=white>"+file[1]+"</font></td>\n";	
			}
			
			i++;
			if (i%tabs==0)
			{
				header+="	<td colspan="+String.valueOf(tabs-(i%tabs))+" style='border-top-style: none;border-top-width:0px;border-left-style: none;border-left-width:0px;border-right-style: none;border-right-width:0px;'></td>";
				header+="	</tr>\n";
				continue;
			}
			if (i==cVector.size())
			{
				header+="	<td style='border-top-style: none;border-top-width:0px;border-left-style: none;border-left-width:0px;border-right-style: none;border-right-width:0px;'>&nbsp;</td>";
				header+="	</tr>\n";
			}
		}
		
		header+="</table>\n";
		//nav dis
		if (getMust(pageindex).equals("1")) ///if must save to next
			nav+="<font color=red>【提示：翻页前请先保存数据】</font>";
		else
			nav+="<a href='"+getFirstPage()[0]+"' title='首页'><font face='Webdings' color=red>9</font></a> <a href='"+getPrePage()[0]+"' title='前一页'><font face='Webdings' color=red>7</font></a> <a href='"+getNextPage()[0]+"' title='后一页'><font face='Webdings' color=red>8</font></a> <a href='"+getLastPage()[0]+"' title='末页'><font face='Webdings' color=red>:</font></a> ";
			//nav+="<a href='"+getFirstPage()[0]+"'><img src='../images/first.png' align='center' border=0></a> <a href='"+getPrePage()[0]+"' title='前一页'><img src='../images/up.png' align='center' border=0></a> <a href='"+getNextPage()[0]+"' title='后一页'><img src='../images/down.png' align='center' border=0></a> <a href='"+getLastPage()[0]+"' title='末页'><img src='../images/last.png' align='center' border=0></a>&nbsp;&nbsp;&nbsp;&nbsp; ";
		nav+="</div>\n";
		header+=nav;
		//cmd list
		String cmd="<div class=tabcmd>";
		for(int j=0;j<pageCmd.size();j++)
		{
			String[] cmds=(String[])pageCmd.get(j);
			if (cmds.length>2)
			{			
				if (cmds[2]!=null&&cmds[2].equals("1"))
				{
				
				cmd+="<span class=\"inp_L1OLD\" onMouseOver=\"this.className='inp_L2OLD'\" onMouseOut=\"this.className='inp_L1OLD'\" onclick=\""+cmds[0]+";\">"+cmds[1]+"</span>";
				}
			}
		}
		cmd+="</div>";
		return header+cmd;	
	}
	
	public String pageheader(String pageURI)
	{
		int i=0;
		//String nav="<div class=tabnav>";
		StepShow stepShow=new StepShow();
		String header=stepShow.getStep("3",DL+OPETYPE,this.OPENO);
		if((DL.equals("5")&&OPETYPE.equals("20"))){ 
			header=stepShow.getStep("2",DL+OPETYPE,this.OPENO);
		}		
		header+="<table align='center' cellpadding='0' cellspacing='0' width='100%' border=0 style=\"border-bottom: 1px solid #B9B9FF;\">\n"; 
		header+="<tr>\n";
		while (i<cVector.size())
		{
			String[] file=(String[])cVector.elementAt(i);
			//System.out.println(file[0]+"-------"+i+"=="+cVector.size());
			String fontStyleInfo="style='font-size: 11pt;'";
			if(file[1].length()>7){
				//fontStyleInfo="style='font-size: 9pt;'";
			}
			int leng=file[0].lastIndexOf("/");
			if (leng==-1)
			{
				leng=0;
			}				
			int leng1=file[0].lastIndexOf("?");
			if (leng1==-1)
			{
				leng1=file[0].length();
			}
			String pn=file[0].substring(leng,leng1);
			//System.out.println(pn);
			if (!pageURI.endsWith(pn))
			{
				String tabClass = "taboff";
				if(file[1].length()>5){
					tabClass="taboff_djj";
				}
				if(i==0){
					tabClass="taboff_first";
				}else if ((i+1)==cVector.size()){
					tabClass="taboff_last";
				}
				
					header+="<td id=T"+i+" noWrap class="+tabClass+">";
					if (getVerify(i).equals("1"))
					{
						header+="<u><a href="+file[0]+"?pageindex="+Integer.toString(i)+"><font "+fontStyleInfo+" color=black><strong>"+file[1]+"</strong></font></a></u></td>\n";
					}
					else
					{
						header+="<font "+fontStyleInfo+" color=black><strong>"+file[1]+"</strong></font></td>\n";
					}
					
			}
			else
			{			
				String tabClass="tabon";
				if(file[1].length()>5){
					tabClass="tabon_djj";
				}
				if(i==0){
					tabClass="tabon_first";
				}else if ((i+1)==cVector.size()){
					tabClass="tabon_last";
				}
					pageindex=i;
					setVerify(i);
					header+="<td id=T"+i+" noWrap class="+tabClass+">";
					header+="<font "+fontStyleInfo+" color=blue><strong>"+file[1]+"</strong></font></td>\n";	
			}
			
			i++;
			if (i%tabs==0)
			{
				header+="	<td colspan="+String.valueOf(tabs-(i%tabs))+"></td>";
				header+="	</tr>\n";
				continue;
			}
			if (i==cVector.size())
			{
				header+="	<td>&nbsp;</td>";
				header+="	</tr>\n";
			}
		}
		
		header+="</table>\n";

		//if (getMust(pageindex).equals("1")) ///if must save to next
		//	nav+="<font color=red>【提示：翻页前请先保存数据】</font>";
		//else
		//	nav+="<a href='"+getFirstPage()[0]+"' title='首页'><font face='Webdings' color=red>9</font></a> <a href='"+getPrePage()[0]+"' title='前一页'><font face='Webdings' color=red>7</font></a> <a href='"+getNextPage()[0]+"' title='后一页'><font face='Webdings' color=red>8</font></a> <a href='"+getLastPage()[0]+"' title='末页'><font face='Webdings' color=red>:</font></a> ";
			//nav+="<a href='"+getFirstPage()[0]+"'><img src='../images/first.png' align='center' border=0></a> <a href='"+getPrePage()[0]+"' title='前一页'><img src='../images/up.png' align='center' border=0></a> <a href='"+getNextPage()[0]+"' title='后一页'><img src='../images/down.png' align='center' border=0></a> <a href='"+getLastPage()[0]+"' title='末页'><img src='../images/last.png' align='center' border=0></a>&nbsp;&nbsp;&nbsp;&nbsp; ";
		//nav+="</div>\n";
		//header+=nav;
		
		return header;
	}
	
}
