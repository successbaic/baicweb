package com.macrosoft.icms.system;

import com.macrosoft.icms.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

/** ��ҳ��ʾ **/
public class SysPageShowSQL 
{
	//��SQL������õ����У��������ʾ������е���һ��ֵΪ1������Ϊ0��
	//���������Ҫ��Ϊ����������еĵڶ���ֵΪ1������Ϊ0
	Vector vColumn;
	Vector vHidden; //����������
	String sCommandList=""; //���ť
	List   cColumn = new ArrayList(); //����������	
	String sTableName;		//����
	int nRowCount=0;		//����
	int nPageSize=10;		//ҳ��С
	int nPageCount=0;		//ҳ��
	int nDispCols;		//��ʾ������
	int nColumnCount;	//������
	int nCurrentPage;	//��ǰҳ

	String sCurrentPage;		//��ǰҳ��
	String sQueryString;		//��ѯ�ִ�
	String linkURL=null;

	boolean bShowSelect;		//�Ƿ���ʾѡ���¼��ѡ���
	boolean bShowSelected;		//����ʾѡ����ʱ����ʾ��ȱʡֵ��ʲô
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


	//jsp�б��Զ����ͷ
	public void addColumn( String sColumnName, int nDisp, int nPara )
	{
		vColumn.addElement( sColumnName );
		vColumn.addElement( new Integer(nDisp) );
		vColumn.addElement( new Integer(nPara) );
		nColumnCount++;
	}
	//������������
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
	//jsp�б��Զ�������
	public void addCommand( String sBtnName,String sPage, String sPara)
	{
		sCommandList+="<input type=button value='"+sBtnName+"' onclick=jumpToMC('"+sPage+"','"+sPara+"');>";
	}
	//jsp�б��Զ�������
	public void addCommand( String sBtnName,String sPage, String sPara,  String sMessage)
	{
		sCommandList+="<input type=button value='"+sBtnName+"' onclick=jumpToMC('"+sPage+"','"+sPara+"','"+sMessage+"');>";
	}
	//jsp�б��Զ�������
	public void addCommand( String sBtnName,String sPage, String sPara,  String sMessage, String sConfirmMessage )
	{
		sCommandList+="<input type=button value='"+sBtnName+"' onclick=jumpToMC('"+sPage+"','"+sPara+"','"+sMessage+"','"+sConfirmMessage+"');>";
	}

	/** ����ҳ�� **/
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
	
	/** �����Ҫ��ʾ���е����� **/
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
		calcPageCount(RowCount);//������ҳ��		
		if (nPageNo>=nPageCount)
		{
			nPageNo=nPageCount;
		}
		if (nPageNo==0) nPageNo=1;
		nCurrentPage=nPageNo;
		calcDispCols();		//������Ҫ��ʾ����
		return showListHtml(rs,nPageNo);
	}
	public String showList( HttpServletRequest request, ResultSet rs) throws SQLException  //reload
	{
		this.sCurrentPage=request.getRequestURI();	
		this.sQueryString=SysUtility.doPreProcess(request.getQueryString());
		int nPageNo=SysUtility.parseInt(request.getParameter("PAGENO"));
		if (nPageNo==0) 	nPageNo=1;
		nCurrentPage=nPageNo;
		calcDispCols();		//������Ҫ��ʾ����		
		return showListHtml(rs,nPageNo);

	}
	public String showListLink( HttpServletRequest request, int RowCount, ResultSet rs,String url) throws SQLException
	{
		this.sCurrentPage=request.getRequestURI();	
		this.sQueryString=SysUtility.doPreProcess(request.getQueryString());
		calcPageCount(RowCount);//������ҳ��
		int nPageNo=SysUtility.parseInt(request.getParameter("PAGENO"));
		
		if (nPageNo>=nPageCount)
		{
			nPageNo=nPageCount;
		}
		if (nPageNo==0) 	nPageNo=1;		
		nCurrentPage=nPageNo;
		calcDispCols();		//������Ҫ��ʾ����
		this.linkURL=url;		
		return showListHtml(rs,nPageNo);

	}
	public String showListHtml( ResultSet rsList, int nPageNo) throws SQLException
	{
		String listCode="";		//HTML���
		String listCode1="", listCode2="";	//��ʱ����
		String sTemp;
		int nDispRows=0;		
		String sChecked;
		//�ж��Ƿ���ʾcheckbox
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

		//��ʾ���ı�ͷ
		if (!cColumn.isEmpty())
		{
			listCode+="<tr align=\"center\" title=\"����ȡ��ѡ����\" class=\"tc\" onclick=\"unSelectAll();\">\n";
			if (bShowSelect==true)
			{
				listCode2+="<td>ѡ��</td>\n";
			}
			for (int k=0;k<cColumn.size();k++ )
			{
				listCode2+="<td class=\"tc\">" + (String)(cColumn.get(k)) + "</td>\n";
			}
			listCode+=listCode2 + "</tr>\n";
		}

		int iDispRows=0;
		while( rsList.next() )		//��ʾ��
		{
			listCode1="";
			listCode2="";
			nDispRows++;
			iDispRows++;

			//��ʾ��ҳ���˳�ѭ��
			if (iDispRows>nPageSize) 
			{
				if (nRowCount!=0) break;
			}
			else
			{
			
				for( int i=0; i<nColumnCount; i++ )		//��ʾһ�еĸ���
				{

					String sColumnName=(String)vColumn.elementAt(3*i);	//ȡ������
					sTemp=String.valueOf(rsList.getObject(sColumnName));			
					if (sTemp=="null")
						sTemp="";

					//���ɴ��ݲ������ַ���
					if (((Integer)vColumn.elementAt(3*i+2)).intValue()==1)
					{	
						listCode1+=sColumnName + "=" + sTemp.trim() + "&";
					}

					//������ʾ���룬���ֶ���ʾ//����ʱ���������������ֶ�ǰ��
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

				if (listCode1.length()>0)	//����ѭ����ϣ��Բ����ִ����д���
					listCode1=listCode1.substring( 0, listCode1.length()-1);

				if (bShowSelect==true)	//��ʾѡ���
				{
					listCode2="<td><INPUT TYPE=\"checkbox\" NAME=\"cbid\" "+sChecked+" value=\""+listCode1+"\"></td>"+listCode2;
					nDispCols++;
				}

				listCode+="<tr id=trid class=\"lc2\" onclick=\"doSelect(this,'"+listCode1+"',"+String.valueOf(iDispRows)+")\">\n";
				listCode+=(listCode2 + "</tr>\n");
			}
		}
		if (nRowCount==0) calcPageCount(nDispRows);//�Ƿ�count�����,û���������ҳ��;  //
		if (bShowSelect==true)
		{
			nDispCols++;
		}

		if (nDispRows==0) //û�п���ʾ����
		{
			listCode+="<tr class=lc2><td colspan="+nDispCols+">û�п���ʾ�����ݣ�</td></tr>";
		}
		//while( rsList.next() );  ���治��ѭ����߲�ѯЧ��
		rsList.close();
		rsList=null;

		//д������
		for (int i=0;i<vHidden.size();i++ )
		{
			listCode+="\n" + "<input type=\"hidden\" name='" + (String)vHidden.elementAt( i )+ ">";
		}
		//�������ɵ�����
		listCode+="<tr><td colspan="+nDispCols+">\n";

		//����������
		String sSelectPage="ת��<input type='text' size=5 name=\"PAGENO\" datatype='INT' title='ת��ҳ��'>ҳ<input type=\"submit\" value='Go'>\n";

		//���ɵ�����
		String[] sDIR=sCurrentPage.split("/");
		String sNavigateTable="<TABLE class=fc border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\" bordercolor=\"#111111\" width=\"100%\">";
		sNavigateTable+="<TR>";
		if (bShowSelect==true && nDispRows>0)	//��ʾѡ���
		{
			sNavigateTable+="	<TD width=20><INPUT align=absmiddle TYPE=\"checkbox\" NAME=\"cballid\" "+sChecked+" onclick=\"return doCheckAll(this.checked)\"></TD><TD width=50 nowrap>ȫѡ</TD>";
		}
		sNavigateTable+="	<TD width=35% align=\"left\">������"+nRowCount+"����ҳ�Σ�<font color=red>"+nPageNo+"</font>/"+nPageCount+"</TD>";
		sNavigateTable+="	<TD width=15% align=right></TD>";
		sNavigateTable+="	<TD width=35% align=right>" +		
		getLinkAddress( 1, "<font face=webdings color=red title='��һҳ'>9</font>") + "��" +
		getLinkAddress( nPageNo-1, "<font face=webdings color=red title='��һҳ'>7</font>" ) + "��" +
		getLinkAddress( nPageNo+1, "<font face=webdings color=red title='��һҳ'>8</font>") + "��" +
		getLinkAddress( nPageCount,"<font face=webdings color=red title='���һҳ'>:</font>" ) + "��";
		sNavigateTable+="	<TD width=15% align=center>"+sSelectPage+"</TD>";
		sNavigateTable+="</TR>";
		sNavigateTable+="</TABLE>";
		listCode+=sNavigateTable;
		listCode+="</td></tr>\n";
		//�������ť��
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
					{	//filter �ַ�
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
					//filter �ַ�
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
