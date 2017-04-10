package com.macrosoft.icms.system;
import com.macrosoft.icms.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

/** 分页显示 **/
public class SysPageShow 
{
	//在SQL语句中用到的列，如果列显示，则该列的下一个值为1，否则为0，
	//如果该列需要作为参数，则该列的第二个值为1，否则为0
	int RowCount=0;		//行数
	
	int PageSize=10;		//页大小
	int PageCount=0;		//页数
	int CurrentRow=0;	//当前页
	int EndPage=0;
	String sCurrentPage;
	String sQueryString;		//查询字串
	String linkURL=null;
	String RemoteAddr;

	String Pagebean;
	public void setPagebean( String sPagebean )
	{
		this.Pagebean=sPagebean;
	}
	public String getPagebean()
	{
		return this.Pagebean;
	}
	public void setPageSize( int nPageSize )
	{
		this.PageSize=nPageSize;
	}
	public int getPageSize()
	{
		return this.PageSize;
	}

	public void setCurrentPage( int nCurrent )
	{
		this.CurrentRow=nCurrent;
	}
	public int getCurrentPage()
	{
		return this.CurrentRow;
	}

	public void setRowCount( int nRowCount )
	{
		this.RowCount=nRowCount;
	}
	public int getRowCount()
	{
		return this.RowCount;
	}
	public void setEndRow( int nEndRow )
	{
		this.EndPage=nEndRow;
	}
	public int getEndRow()
	{
		return this.EndPage;
	}
	public void setQueryString( String sQuery )
	{
		this.sQueryString=sQuery;
	}
	public SysPageShow(HttpServletRequest request,int nRowCount ) throws SQLException
	{
		this.sCurrentPage=request.getRequestURI();
		this.sQueryString=request.getQueryString();
		this.RemoteAddr=request.getRemoteHost(); 
		calcPageCount(nRowCount);  //cal page
		/// get CurrentRow		
		try
		{
			CurrentRow=Integer.parseInt(request.getParameter("start"));  //获得当前行
		}
		catch (Exception e)
		{
			CurrentRow=0;
		}
		if (CurrentRow<0)
		{
			CurrentRow=-1;
		}
		if (CurrentRow>nRowCount)
		{
			CurrentRow=nRowCount;			
		}	
		if (nRowCount==0)
		{	
			CurrentRow=-1;
		}

	}
    public SysPageShow(HttpServletRequest request,int nRowCount,int nPageSize ) throws SQLException
	{
		this.sCurrentPage=request.getRequestURI();
        this.PageSize=nPageSize;
		this.sQueryString=request.getQueryString();
		this.RemoteAddr=request.getRemoteHost(); 
		calcPageCount(nRowCount);  //cal page
		/// get CurrentRow		
		try
		{
			CurrentRow=Integer.parseInt(request.getParameter("start"));  //获得当前行
		}
		catch (Exception e)
		{
			CurrentRow=0;
		}
		if (CurrentRow<0)
		{
			CurrentRow=-1;
		}
		if (CurrentRow>nRowCount)
		{
			CurrentRow=nRowCount;			
		}
		if (nRowCount==0)
		{	
			CurrentRow=-1;
		}

	}
	public void finalize()
	{

	}

	/** 计算页数 **/
	public void calcPageCount(int iRowCount) throws SQLException
	{		
		RowCount=iRowCount;
		PageCount=RowCount/PageSize;		
		if (PageCount*PageSize==RowCount)
		{
			PageCount=PageCount;
		}
		else
		{
			PageCount++;
		}
	}
	public String PageHeader() throws SQLException  //
	{
		String sNavigateTable="<table border=\"0\" width=\"100%\">";
		sNavigateTable+="<tr>";
		//sNavigateTable+="	<td class=lc1><p align=left>搜索结果</td>" ;
		sNavigateTable+="	<td class=seekstart>" ;
		sNavigateTable+="来自于["+RemoteAddr+"]的搜索请求，共找到<font color=red>["+RowCount+"]</font>条相关数据,以下是搜索到的信息。";
		sNavigateTable+="</td></tr>";
		sNavigateTable+="</table>\n";
		return sNavigateTable;
	}
	/////////////////
	public String PageNav() throws SQLException  //	
	{

		//生成导航条
		String sNavigateTable="<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-style:none\">";
		sNavigateTable+="<tr>";
		sNavigateTable+="	<td class=fc width=100%>";
		int endRow=CurrentRow+PageSize;
		int CurrentPage=(CurrentRow+PageSize)/PageSize;
		if (endRow>RowCount)
		{
			endRow=RowCount;
		}
		EndPage=(CurrentRow/PageSize)+PageSize;
		if (EndPage>PageCount)
		{
			EndPage=PageCount;
		}
		////set page cmd
		
		if (CurrentRow/PageSize==0)
		{
			sNavigateTable+="<font color=gray>首页</font> " ;	
			sNavigateTable+="<font color=gray>上一页</font> " ;	
		}
		else
		{
			sNavigateTable+="<a href=\""+getLinkAddress(0)+"\"><font color=blue>首页</font></a> " ;
			sNavigateTable+="<a href=\""+getLinkAddress(CurrentRow/PageSize-1)+"\"><font color=blue>上一页</font></a> " ;
		}

		if ((CurrentRow/PageSize+1<=RowCount/PageSize)&&(CurrentRow+PageSize<RowCount)) 
		{
			sNavigateTable+="<a href=\""+getLinkAddress(CurrentRow/PageSize+1)+"\"><font color=blue>下一页</font></a> " ;
			sNavigateTable+="<a href=\""+getLinkAddress(PageCount-1)+"\"><font color=blue>尾页</font></a> " ;
		}
		else
		{				
			sNavigateTable+="<font color=gray>下一页</font> " ;
			sNavigateTable+="<font color=gray>尾页</font> " ;
		}
		sNavigateTable+="&nbsp;&nbsp;【第<font color=red>"+(CurrentRow+1)+"-"+endRow+"</font>条 - 第<font color=red>"+CurrentPage+"/"+PageCount+"</font>页 共有<font color=red>"+RowCount+"</font>条记录】";		

		sNavigateTable+="</td></tr>";
		sNavigateTable+="</table>\n";
		return sNavigateTable;
	}


	public String PageNav2() throws SQLException  //	
	{

		//生成导航条
		String sNavigateTable="<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">";
		sNavigateTable+="<tr>";
		sNavigateTable+="	<td class=fc width=100%>";
		int endRow=CurrentRow+PageSize;
		int CurrentPage=(CurrentRow+PageSize)/PageSize;
		if (endRow>RowCount)
		{
			endRow=RowCount;
		}
		EndPage=(CurrentRow/PageSize)+PageSize;
		if (EndPage>PageCount)
		{
			EndPage=PageCount;
		}
		////set page cmd
		
		
		//sNavigateTable+="&nbsp;&nbsp; 【共有<font color=red>"+RowCount+"</font>条记录】";		

		sNavigateTable+="</td></tr>";
		sNavigateTable+="</table>\n";
		return sNavigateTable;
	}

	
	public String getLinkAddress(int iRow)
	{
		String sQuery=getQueryString();
		if (!sQuery.equals(""))
			sQuery+="&start="+iRow*PageSize;
		else
			sQuery+="start="+iRow*PageSize;
		return sCurrentPage+"?"+sQuery;
	}
	
	public String getQueryString()
	{
		String sQuery="";
		if (sQueryString==null)
		{
			return sQuery;
		}
		StringTokenizer s=new StringTokenizer( sQueryString, "&" );		
		while (s.hasMoreTokens())
		{
			StringTokenizer s0=new StringTokenizer( s.nextToken(),"=" );
			String sPara="",sContent="";
			try
			{
				sPara=s0.nextToken();
				sContent=s0.nextToken();				
			}
			catch (NoSuchElementException e)
			{
			}
			finally
			{
				if (!sPara.equals( "start" ))
				{
					sQuery+=sPara+"="+sContent+"&";
				}
			}
		}
		return sQuery;
	}


	
}
