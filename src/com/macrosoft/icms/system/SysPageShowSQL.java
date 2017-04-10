package com.macrosoft.icms.system;

import com.macrosoft.icms.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

/** 分页显示 **/
public class SysPageShowSQL 
{
	//在SQL语句中用到的列，如果列显示，则该列的下一个值为1，否则为0，
	//如果该列需要作为参数，则该列的第二个值为1，否则为0
	Vector vColumn;
	Vector vHidden; //隐藏域名字
	String sCommandList=""; //命令按钮
	List   cColumn = new ArrayList(); //中文域名字	
	String sTableName;		//表名
	int nRowCount=0;		//行数
	int nPageSize=10;		//页大小
	int nPageCount=0;		//页数
	int nDispCols;		//显示的列数
	int nColumnCount;	//总列数
	int nCurrentPage;	//当前页

	String sCurrentPage;		//当前页面
	String sQueryString;		//查询字串
	String linkURL=null;

	boolean bShowSelect;		//是否显示选择记录的选择框
	boolean bShowSelected;		//当显示选择框的时候显示的缺省值是什么
	String sFormAction="";
	
	public void addHidden( String sName )
	{
		vHidden.add( sName );
	}

	public void setFormAction( String sAction )
	{
		this.sFormAction=sAction;
	}
	
	public void setShowSelect( boolean bShow, boolean bSelect )
	{
		this.bShowSelect=bShow;
		this.bShowSelected=bSelect;
	}

	public SysPageShowSQL()
	{
		vColumn=new Vector();
		vHidden=new Vector();
		sTableName="";
		nDispCols=0;
		nColumnCount=0;
	}

	public void finalize()
	{
		vColumn.clear();
		vColumn=null;
		vHidden.clear();
		vHidden=null;
	}

	public void setTableName(String sTable)
	{
		this.sTableName=sTable;
	}

	public String getTableName()
	{
		return this.sTableName;
	}


	public void setPageSize( int nPageSize )
	{
		this.nPageSize=nPageSize;
	}

	public int getPageSize()
	{
		return this.nPageSize;
	}

	public void setCurrentPage( String sCurrent )
	{
		this.sCurrentPage=sCurrent;
	}

	public void setQueryString( String sQuery )
	{
		this.sQueryString=sQuery;
	}


	//jsp列表自定义表头
	public void addColumn( String sColumnName, int nDisp, int nPara )
	{
		vColumn.addElement( sColumnName );
		vColumn.addElement( new Integer(nDisp) );
		vColumn.addElement( new Integer(nPara) );
		nColumnCount++;
	}
	//包含中文列名
	public void addColumn( String cColumnName, String sColumnName, int nDisp, int nPara )
	{		
		if (nDisp==1)
		{
			if (cColumnName!=null&&cColumnName.trim().compareTo("")!=0)
			{	cColumn.add(cColumnName);	}
			else
			{	cColumn.add(sColumnName);	}			
		}
		addColumn( sColumnName, nDisp, nPara );
		
	}
	//jsp列表自定义命令
	public void addCommand( String sBtnName,String sPage, String sPara)
	{
		sCommandList+="<input type=button value='"+sBtnName+"' onclick=jumpToMC('"+sPage+"','"+sPara+"');>";
	}
	//jsp列表自定义命令
	public void addCommand( String sBtnName,String sPage, String sPara,  String sMessage)
	{
		sCommandList+="<input type=button value='"+sBtnName+"' onclick=jumpToMC('"+sPage+"','"+sPara+"','"+sMessage+"');>";
	}
	//jsp列表自定义命令
	public void addCommand( String sBtnName,String sPage, String sPara,  String sMessage, String sConfirmMessage )
	{
		sCommandList+="<input type=button value='"+sBtnName+"' onclick=jumpToMC('"+sPage+"','"+sPara+"','"+sMessage+"','"+sConfirmMessage+"');>";
	}

	/** 计算页数 **/
	public void calcPageCount(int rowcount) throws SQLException
	{		
		nRowCount=rowcount;
		nPageCount=nRowCount/nPageSize;
		if (nPageCount*nPageSize==nRowCount)
		{
			nPageCount=nPageCount;
		}
		else
			nPageCount++;		
	}
	
	/** 获得需要显示的列的列数 **/
	public void calcDispCols()
	{
		int nDisplayColumnCount=0;

		for( int i=0; i<nColumnCount; i++ )
		{
			if (((Integer)vColumn.elementAt(3*i+1)).intValue()==1)
			{
				nDisplayColumnCount++;
			}
		}
		nDispCols=nDisplayColumnCount;
	}	
	public String showList( HttpServletRequest request, int RowCount , ResultSet rs) throws SQLException
	{
		this.sCurrentPage=request.getRequestURI();	
		this.sQueryString=SysUtility.doPreProcess(request.getQueryString());
		int nPageNo=SysUtility.parseInt(request.getParameter("PAGENO"));		
		calcPageCount(RowCount);//计算总页数		
		if (nPageNo>=nPageCount)
		{
			nPageNo=nPageCount;
		}
		if (nPageNo==0) nPageNo=1;
		nCurrentPage=nPageNo;
		calcDispCols();		//计算需要显示的列
		return showListHtml(rs,nPageNo);
	}
	public String showList( HttpServletRequest request, ResultSet rs) throws SQLException  //reload
	{
		this.sCurrentPage=request.getRequestURI();	
		this.sQueryString=SysUtility.doPreProcess(request.getQueryString());
		int nPageNo=SysUtility.parseInt(request.getParameter("PAGENO"));
		if (nPageNo==0) 	nPageNo=1;
		nCurrentPage=nPageNo;
		calcDispCols();		//计算需要显示的列		
		return showListHtml(rs,nPageNo);

	}
	public String showListLink( HttpServletRequest request, int RowCount, ResultSet rs,String url) throws SQLException
	{
		this.sCurrentPage=request.getRequestURI();	
		this.sQueryString=SysUtility.doPreProcess(request.getQueryString());
		calcPageCount(RowCount);//计算总页数
		int nPageNo=SysUtility.parseInt(request.getParameter("PAGENO"));
		
		if (nPageNo>=nPageCount)
		{
			nPageNo=nPageCount;
		}
		if (nPageNo==0) 	nPageNo=1;		
		nCurrentPage=nPageNo;
		calcDispCols();		//计算需要显示的列
		this.linkURL=url;		
		return showListHtml(rs,nPageNo);

	}
	public String showListHtml( ResultSet rsList, int nPageNo) throws SQLException
	{
		String listCode="";		//HTML语句
		String listCode1="", listCode2="";	//临时变量
		String sTemp;
		int nDispRows=0;		
		String sChecked;
		//判断是否显示checkbox
		if (bShowSelected==true)
			sChecked=" checked";
		else
			sChecked="";
		nDispRows=(nPageNo-1)*nPageSize;
		for (int i=0;i<nDispRows; i++)
		{
			if (!rsList.next())
			{
				nRowCount=i;
				calcPageCount(i);
				nPageNo=nPageCount;
				break;
			}
		}

		//显示中文表头
		if (!cColumn.isEmpty())
		{
			listCode+="<tr align=\"center\" title=\"单击取消选择列\" class=\"tc\" onclick=\"unSelectAll();\">\n";
			if (bShowSelect==true)
			{
				listCode2+="<td>选择</td>\n";
			}
			for (int k=0;k<cColumn.size();k++ )
			{
				listCode2+="<td class=\"tc\">" + (String)(cColumn.get(k)) + "</td>\n";
			}
			listCode+=listCode2 + "</tr>\n";
		}

		int iDispRows=0;
		while( rsList.next() )		//显示行
		{
			listCode1="";
			listCode2="";
			nDispRows++;
			iDispRows++;

			//显示本页后退出循环
			if (iDispRows>nPageSize) 
			{
				if (nRowCount!=0) break;
			}
			else
			{
			
				for( int i=0; i<nColumnCount; i++ )		//显示一行的各列
				{

					String sColumnName=(String)vColumn.elementAt(3*i);	//取得列名
					sTemp=String.valueOf(rsList.getObject(sColumnName));			
					if (sTemp=="null")
						sTemp="";

					//生成传递参数的字符串
					if (((Integer)vColumn.elementAt(3*i+2)).intValue()==1)
					{	
						listCode1+=sColumnName + "=" + sTemp.trim() + "&";
					}

					//生成显示代码，该字段显示//链接时将主键放在链接字段前面
					if (((Integer)vColumn.elementAt(3*i+1)).intValue()==1)
					{
						
						if (linkURL==null||linkURL.equals(""))
						{
							listCode2+="<td>" + sTemp.trim() + "</td>\n";
						}
						else
						{
							listCode2+="<td><a target=_blank href='"+linkURL+"?"+listCode1+"'>" + sTemp.trim() + "</a></td>\n";
						}
						
					}
				}

				if (listCode1.length()>0)	//各列循环完毕，对参数字串进行处理
					listCode1=listCode1.substring( 0, listCode1.length()-1);

				if (bShowSelect==true)	//显示选择框
				{
					listCode2="<td><INPUT TYPE=\"checkbox\" NAME=\"cbid\" "+sChecked+" value=\""+listCode1+"\"></td>"+listCode2;
					nDispCols++;
				}

				listCode+="<tr id=trid class=\"lc2\" onclick=\"doSelect(this,'"+listCode1+"',"+String.valueOf(iDispRows)+")\">\n";
				listCode+=(listCode2 + "</tr>\n");
			}
		}
		if (nRowCount==0) calcPageCount(nDispRows);//是否count计算过,没有则计算总页数;  //
		if (bShowSelect==true)
		{
			nDispCols++;
		}

		if (nDispRows==0) //没有可显示的行
		{
			listCode+="<tr class=lc2><td colspan="+nDispCols+">没有可显示的数据！</td></tr>";
		}
		//while( rsList.next() );  后面不再循环提高查询效率
		rsList.close();
		rsList=null;

		//写隐藏域
		for (int i=0;i<vHidden.size();i++ )
		{
			listCode+="\n" + "<input type=\"hidden\" name='" + (String)vHidden.elementAt( i )+ ">";
		}
		//下面生成导航表单
		listCode+="<tr><td colspan="+nDispCols+">\n";

		//生成下拉框
		String sSelectPage="转至<input type='text' size=5 name=\"PAGENO\" datatype='INT' title='转至页数'>页<input type=\"submit\" value='Go'>\n";

		//生成导航条
		String[] sDIR=sCurrentPage.split("/");
		String sNavigateTable="<TABLE class=fc border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\" bordercolor=\"#111111\" width=\"100%\">";
		sNavigateTable+="<TR>";
		if (bShowSelect==true && nDispRows>0)	//显示选择框
		{
			sNavigateTable+="	<TD width=20><INPUT align=absmiddle TYPE=\"checkbox\" NAME=\"cballid\" "+sChecked+" onclick=\"return doCheckAll(this.checked)\"></TD><TD width=50 nowrap>全选</TD>";
		}
		sNavigateTable+="	<TD width=35% align=\"left\">总数："+nRowCount+"　　页次：<font color=red>"+nPageNo+"</font>/"+nPageCount+"</TD>";
		sNavigateTable+="	<TD width=15% align=right></TD>";
		sNavigateTable+="	<TD width=35% align=right>" +		
		getLinkAddress( 1, "<font face=webdings color=red title='第一页'>9</font>") + "　" +
		getLinkAddress( nPageNo-1, "<font face=webdings color=red title='上一页'>7</font>" ) + "　" +
		getLinkAddress( nPageNo+1, "<font face=webdings color=red title='下一页'>8</font>") + "　" +
		getLinkAddress( nPageCount,"<font face=webdings color=red title='最后一页'>:</font>" ) + "　";
		sNavigateTable+="	<TD width=15% align=center>"+sSelectPage+"</TD>";
		sNavigateTable+="</TR>";
		sNavigateTable+="</TABLE>";
		listCode+=sNavigateTable;
		listCode+="</td></tr>\n";
		//生成命令按钮条
		listCode+=" <tr><td width=\"100%\" colspan=\"12\" class=\"fc\"><p align=\"center\">";
		listCode+=sCommandList;
		listCode+="</td></tr>\n";
		return listCode;
	}

	
	public String getLinkAddress( int nPageNo, String sDisplay)
	{
		if (nPageNo==0) nPageNo=1;
		if (nPageNo>=nPageCount) nPageNo=nPageCount;
		return "<SPAN STYLE=\"CURSOR: HAND\" onclick=\"document.forms(0).PAGENO.value="+nPageNo+";document.forms(0).submit();\">"+sDisplay+"</SPAN>";
	}
	public String getQueryString()
	{
		String sQuery="";
		StringTokenizer s=new StringTokenizer( sQueryString, "&" );
		String sPara, sContent;
		while (s.hasMoreTokens())
		{
			StringTokenizer s0=new StringTokenizer( s.nextToken(),"=" );
			sPara="";
			sContent="";
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
				if (sPara.compareTo( "PAGENO" )!=0)
				{
					sQuery+=(sPara+"="+sContent+"&");
				}
			}
		}
		if (sQuery.length()>0)
		{
			return sQuery.substring(0, sQuery.length()-1);
		}
		else
			return sQuery;
	}


	public String getSqlFilter(HttpServletRequest request, String[][] sStr)
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
}
