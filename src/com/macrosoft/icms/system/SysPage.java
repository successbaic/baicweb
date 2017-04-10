/**
	Name:		SysPage
	Function:	转换页面和生成超链接用的bean。
	Date:		2006-10-9 
**/
package com.macrosoft.icms.system;
import java.sql.*;
import java.util.*;
public class SysPage
{	
    Vector rVector;
	String OPENO=null;
	String PRIPID=null;
	String ENTCLASS=null;
	String ENTTYPE=null;
	String OPETYPE=null;
	String SIGN=null;
	String MCXH=null;
	String REGNO=null;
	String ENTNAME=null;
	String pageKey=null;
	String pageKey1=null;
	String pageKey2=null;
	String pageKey3=null;
	ArrayList pageCmd;
	String opra=null;		//OPRTYPE
	int ipageKey=-1;		//SIGN
	int pageindex=-1;
	int tabs=10; //how many tabs in a line?
	public SysPage()
	{
		rVector = new Vector();
		pageCmd=new ArrayList();
		pageindex=0;
	}
	/** 析构函数 **/
	public void finalize()
	{
		rVector = null;
		pageCmd=null;
		pageindex=0;
	}
	public void settabs(int itab)
	{
		this.tabs = itab;
	}
	
	public void setOPENO(String OPENO)
	{
		this.OPENO = OPENO;
	}
	public String getOPENO()
	{
		return OPENO;
	}
	public void setPRIPID(String PRIPID)
	{
		this.PRIPID = PRIPID;
	}
	public String getPRIPID()
	{
		return PRIPID;
	}
	public void setENTCLASS(String ENTCLASS)
	{
		this.ENTCLASS = ENTCLASS;
	}
	public String getENTCLASS()
	{
		return ENTCLASS;
	}
	public void setENTTYPE(String ENTTYPE)
	{
		this.ENTTYPE = ENTTYPE;
	}
	public String getENTTYPE()
	{
		return ENTTYPE;
	}
	public void setOPETYPE(String OPETYPE)
	{
		this.OPETYPE = OPETYPE;
	}
	public String getOPETYPE()
	{
		return OPETYPE;
	}

	public void setSIGN(String SIGN)
	{
		this.SIGN = SIGN;
	}
	public String getSIGN()
	{
		return SIGN;
	}

	public void setMCXH(String MCXH)
	{
		this.MCXH = MCXH;
	}
	public String getMCXH()
	{
		return MCXH;
	}

	public void setREGNO(String REGNO)
	{
		this.REGNO = REGNO;
	}
	public String getREGNO()
	{
		return REGNO;
	}

	public void setENTNAME(String ENTNAME)
	{
		this.ENTNAME = ENTNAME;
	}
	public String getENTNAME()
	{
		return ENTNAME;
	}
	public String getopra()
	{
		return opra;
	}

	public void setopra(String opra)
	{
		this.opra = opra;
	}

	public int getipageKey()
	{
		return ipageKey;
	}

	public void setipageKey(int ipageKey)
	{
		this.ipageKey = ipageKey;
	}
	public int getpageindex()
	{
		return pageindex;
	}

	public void setpageindex(int pageindex)
	{
		this.pageindex = pageindex;
	}
	public String getpageKey()
	{
		return pageKey;
	}
	public void setpageKey(String pageKey)
	{
		this.pageKey = pageKey;
	}

	public void setpageKey1(String pageKey1)
	{
		this.pageKey1 = pageKey1;
	}
	public String getpageKey1()
	{
		return pageKey1;
	}
	public void setpageKey2(String pageKey2)
	{
		this.pageKey2 = pageKey2;
	}
	public String getpageKey2()
	{
		return pageKey2;
	}
	public void setpageKey3(String pageKey3)
	{
		this.pageKey3 = pageKey3;
	}
	public String getpageKey3()
	{
		return pageKey3;
	}
	public void init() 
	{
		ipageKey=-1;
		tabs=10;
		opra=null;
		pageindex=0;
		OPENO=null;
		PRIPID=null;
		ENTCLASS=null;
		ENTTYPE=null;
		OPETYPE=null;
		SIGN=null;
		MCXH=null;
		REGNO=null;
		ENTNAME=null;
		pageCmd.clear();
		rVector.clear();
	}

	/*清除全部page，变更时用*/
	public void clearPage()
	{
		rVector.clear();
	}

	public void addCmd(String[] sCmd)   //sCmd string[2] :1-cmdName 2-javascript  3- visible
	{
		pageCmd.add( sCmd );
	}

	public void delPage(int index)
	{
		if(index!=0)
		{
		   rVector.removeElementAt(index);
		}		
	}
	public void addPage(String[] recordInfo)
	{
		rVector.addElement( recordInfo );
	}
	public void insertPage(String[] recordInfo)
	{
		rVector.insertElementAt( recordInfo, 0 );
	}
	public void insertPage(String[] recordInfo, int pos)
	{
		if (rVector==null)
			pos=0;
		else
			pos=(pos<=rVector.size()?pos:rVector.size());

		rVector.insertElementAt( recordInfo, pos );
	}
	public String[] getFirstPage()
	{
		if (rVector==null||rVector.size()==0)
			return  null;
		else
			return (String[])(rVector.firstElement());
	}
	public String[] getLastPage()
	{
		if (rVector==null||rVector.size()==0)
			return  null;
		else
			return (String[])(rVector.lastElement());
	}
	public String[] getCurrentPage()
	{
		if (pageindex<(rVector.size()-1))
			return (String[])rVector.elementAt(pageindex);
		else
			return (String[])(rVector.lastElement());
	}
	

	public String[] getPrePage()
	{
		if (pageindex==0)
			return (String[])(rVector.firstElement());
		else
			return (String[])rVector.elementAt(pageindex-1);
	}

	public String[] getNextPage()
	{
		if (pageindex<(rVector.size()-1))
			return (String[])rVector.elementAt(pageindex+1);
		else
			return (String[])(rVector.lastElement());
	}
	
	public int getCurrentIndex(String[] recordInfo )
	{
		for (int i=0;i<rVector.size() ;i++ )
		{
			String[] file=(String[])rVector.elementAt(i);
			if (file[0]==recordInfo[0]&&file[1]==recordInfo[1])
			{				
				return i;
			}
		}
		return -1;
	}
	public boolean contains(String[] recordInfo )
	{
		for (int i=0;i<rVector.size() ;i++ )
		{
			String[] file=(String[])rVector.elementAt(i);
			if (file[0]==recordInfo[0]&&file[1]==recordInfo[1])
			{
				return true;
			}
		}
		return false;
	}

	public void setVerify(int i)
	{
		if (i<(rVector.size()))
		{			
			String[] file=(String[])rVector.elementAt(i);
			if (file.length>2)
			{
				file[2]="1";	
			}					
		}		
	}
	public String getVerify(int i)
	{
		if (i<(rVector.size()))
		{			
			String[] file=(String[])rVector.elementAt(i);
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
		if (i<(rVector.size()))
		{			
			String[] file=(String[])rVector.elementAt(i);
			if (file.length>3)
			{
				//set 0 have saved
				file[3]="0";
			}					
		}		
	}
	public void setMusted(String pageURI)  //1 must save ;else have saved   
	{
		for(int i=0;i<rVector.size();i++)
		{
			String[] file=(String[])rVector.elementAt(i);		
			if (pageURI.indexOf(file[0])>0&&file.length>3)
			{
				//set 0 have saved
				file[3]="0";
			}					
		}		
	}
	public String getMust(int i)
	{
		if (i<(rVector.size()))
		{			
			String[] file=(String[])rVector.elementAt(i);
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
	public String pageheader(String pageURI)
	{
		int i=0;
		String nav="<div class=tabnav>";
		String header="<table cellpadding='0' cellspacing='0' width='100%' border=0 style=\"border-bottom: 1px solid #B9B9FF;\">\n"; 
		header+="<tr>\n";
		while (i<rVector.size())
		{
			String[] file=(String[])rVector.elementAt(i);			
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
					header+="<td id=T"+i+" noWrap class=taboff>";
					if (getVerify(i).equals("1"))
					{
						header+="<u><a href="+file[0]+"?pageindex="+Integer.toString(i)+"><font color=blue>"+file[1]+"</font></a></u></td>\n";
					}
					else
					{
						header+="<font color=gray>"+file[1]+"</font></td>\n";
					}
					
			}
			else
			{					
					pageindex=i;
					setVerify(i);
					header+="<td id=T"+i+" noWrap class=tabon>";
					header+="<font color=white>"+file[1]+"</font></td>\n";	
			}
			
			i++;
			if (i%tabs==0)
			{
				header+="	<td colspan="+String.valueOf(tabs-(i%tabs))+"></td>";
				header+="	</tr>\n";
				continue;
			}
			if (i==rVector.size())
			{
				header+="	<td>&nbsp;</td>";
				header+="	</tr>\n";
			}
		}
		
		header+="</table>\n";
		//nav dis
		if (getMust(pageindex).equals("1")) ///if must save to next
			nav+="<font color=red>【提示：翻页前请先保存数据】</font>";
		else
			nav+="<a href='"+getFirstPage()[0]+"' title='首页'><font face='Webdings' color=red>9</font></a> <a href='"+getPrePage()[0]+"' title='前一页'><font face='Webdings' color=red>7</font></a> <a href='"+getNextPage()[0]+"' title='后一页'><font face='Webdings' color=red>8</font></a> <a href='"+getLastPage()[0]+"' title='末页'><font face='Webdings' color=red>:</font></a> ";

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
				
				cmd+="<span class=\"inp_L1\" onMouseOver=\"this.className='inp_L2'\" onMouseOut=\"this.className='inp_L1'\" onclick=\""+cmds[0]+";\">"+cmds[1]+"</span>";
				}
			}
		}
		cmd+="</div>";
		return header+cmd;
	}
	
}
