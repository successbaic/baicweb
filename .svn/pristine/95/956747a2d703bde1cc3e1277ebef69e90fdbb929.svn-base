package com.macrosoft.icms.system;
import java.sql.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.cConvert;

public class GeneratePowerTree 
{
	String sReturn;			//返回的HTML结果
	String[] sImages;		//所用的图片URL
	String sTableHeader;	//表结构的前部分
	String sTableFooter;	//表结构的后部分
	int nTreeInfo[][];		//有关目录树的结构，用于生成前面的图片
	ResultSet rsTree;		//作为全局变量，不用传递参数
	
	/** 初始化工作：构造函数 **/
	/*
		path-- http://localhost:8080/jjhk/
	*/
	public GeneratePowerTree()
	{
		sReturn="";
		nTreeInfo=new int[10][2];		//最多支持数层次：10
		for( int i=0; i<10; i++ )
			for( int j=0; j<2; j++ )
				nTreeInfo[i][j]=0;

		sImages=new String[12];
		sImages[0]= "images/vertline.gif";
		sImages[1]= "images/midnodeline.gif";
		sImages[2]= "images/lastnodeline.gif";
		sImages[3]= "images/blank.gif";

		sImages[4]= "images/plusend.gif";
		sImages[5]= "images/minusend.gif";
		sImages[6]= "images/plus.gif";
		sImages[7]= "images/minus.gif";

		sImages[8]= "images/icms.gif";
		sImages[9]= "images/folder.gif";
		sImages[10]= "images/folder2.gif";
		sImages[11]= "images/module.gif";

		sTableHeader="<table border=0 width=300 cellspacing=0 bordercolor=#000000 cellpadding=0 bordercolorlight=#000000 bordercolordark=#FFFFFF>" + "\n" +
			"	<tr>";
		sTableFooter="	</tr>" + "\n" + 
			"</table>\n";
	}

	public void setImagesPath(String path)
	{
		sImages[0]=path+ "images/vertline.gif";
		sImages[1]=path+ "images/midnodeline.gif";
		sImages[2]=path+ "images/lastnodeline.gif";
		sImages[3]=path+ "images/blank.gif";

		sImages[4]=path+ "images/plusend.gif";
		sImages[5]=path+ "images/minusend.gif";
		sImages[6]=path+ "images/plus.gif";
		sImages[7]=path+ "images/minus.gif";

		sImages[8]=path+ "images/icms.gif";
		sImages[9]=path+ "images/folder.gif";
		sImages[10]=path+ "images/folder2.gif";
		sImages[11]=path+ "images/module.gif";
	}

	/** 根据传入的参数，得到结果集 **/
	public void generateTreeRS( DbConnection dbc, boolean bShow, String sLoginID ) throws SQLException
	{
		int nShow;

		if (bShow)
			nShow=1;
		else
			nShow=0;

		String sExecute=new String( "EXECUTE STP_SYS_GENERATETREE " + nShow + ",'" + sLoginID + "'");
		rsTree=dbc.executeQuery( sExecute );
	}

	/** 根据传入的参数，生成关于一个IMG的HTML代码 **/
	public String generateIMG( String sSrc, String sOnclick, String sId )
	{
		return "<img id=\"" + sId + "\" src=\"" + sSrc + "\" align=\"absmiddle\" " + sOnclick + "></img>";
	}

	/** 生成模块图标的HTML代码 **/
	public String generateModuleImage( int level, int isgroup, String sId, int nChildCount )
	{
		String sImageFile="";
		String sOnclick="";

		if (level==1)	//总根目录
		{
			sImageFile=sImages[8];
			sOnclick=generateOnclick( level, isgroup, sId, nChildCount );
			return generateIMG( sImageFile, sOnclick, sId + "i" );
		}
		else
		{
			if (isgroup==1)		//模块组
			{
				sImageFile=sImages[9];
				sOnclick=generateOnclick( level, isgroup, sId, nChildCount );
			}
			else	//模块
			{
				sImageFile=sImages[11];
				sOnclick="";
			}
		}
		return generateIMG( sImageFile, sOnclick, sId + "ii" );
	}

	/** 生成超级链接代码 **/
	public String generateLink( String sText,String sUrl,String sTitle, int isgroup, String sOnclick, boolean bShow, long MODCODE, long superModCode )
	{
		if (isgroup==1)	//模块组
		{
			if (bShow==true)	//显示子节点
			{
				if (MODCODE==0)	// 不允许鼠标双击
					return "<font title=\""+ sTitle +"\" " + sOnclick +">"+sText+"</font>"+"<INPUT TYPE='checkbox' NAME='cbgrp' supermod='"+superModCode+"' value='"+MODCODE+"'>";
				else
					return "<font title=\""+ sTitle +"\" " + sOnclick +">"+sText+"</font>"+"<INPUT TYPE='checkbox' NAME='cbgrp' supermod='"+superModCode+"' ondblclick='arr=new Array();i=0;checkAll(this, "+MODCODE+");doArr(this);' value='"+MODCODE+"'>";
			}
			else
				return sText;
		}
		else		//模块
		{
			return sText+"<INPUT TYPE='checkbox' NAME='cb' supermod='"+superModCode+"' value='"+MODCODE+"'>";
		}
	}

	/** 生成一个模块图标之前的线图标 **/
	public String generateLine( int curlevel, int isgroup, String sId, int nChildCount )
	{
		String sImageFile="";
		String sImageFileOpen="";
		String sOnclick="";
		String sReturn="";
		for( int i=2; i<curlevel; i++ )	//循环生成前面的线的图片
		{
			if (nTreeInfo[i][1]<nTreeInfo[i][0])	//当前节点在本层中还有后续节点
			{
				sImageFile=sImages[0];	//竖线
			}
			else	//没有后续节点了
			{
				sImageFile=sImageFile=sImages[3];	//空白
			}
			sReturn+=generateIMG( sImageFile, "", "" );
		}
		//生成当前级别的图标
		if (isgroup==1)		//是一个模块组
		{
			if (nTreeInfo[curlevel][1]<nTreeInfo[curlevel][0])	//当前结点在本层中还有后续节点
			{
				if (nChildCount>0)	//有子节点
				{
					sImageFile=sImages[6];
				}
				else		//没有子节点
					sImageFile=sImages[1];
			}
			else	//最后一个节点
			{
				if (nChildCount>0)
				{
					sImageFile=sImages[4];
				}
				else
					sImageFile=sImages[2];

			}
		}
		else		//模块
		{
			if (nTreeInfo[curlevel][1]<nTreeInfo[curlevel][0])	//由后续节点
			{
				sImageFile=sImages[1];
			}
			else
			{
				sImageFile=sImages[2];
			}
		}
		sReturn+=generateIMG( sImageFile, generateOnclick(curlevel, isgroup, sId, nChildCount), sId + "i" );
		return sReturn;
	}

	/** 生成onclick事件的代码 **/
	public String generateOnclick(int curlevel, int isgroup, String sId, int nChildCount)
	{
		String sImageFile="";
		String sImageFileOpen="";
		String sOnclick;

		//生成当前级别的图标
		if (isgroup==1)		//是一个模块组
		{
					//根目录
			if (curlevel==1)
			{
				sImageFile=sImages[8];
				sImageFileOpen=sImages[8];
				sOnclick="onclick=\"ToggleFolder('" + sId + "','"+sImageFile+"','"+sImageFileOpen+"')\"";
			}
			else
			{
				if (nTreeInfo[curlevel][1]<nTreeInfo[curlevel][0])	//当前结点在本层中还有后续节点
				{
					if (nChildCount==0)
					{
						sImageFile=sImages[1];
						sImageFileOpen=sImages[1];
					}
					else
					{
						sImageFile=sImages[6];
						sImageFileOpen=sImages[7];
					}
					sOnclick="onclick=\"ToggleFolder('" + sId + "','"+sImageFile+"','"+sImageFileOpen+"')\"";
				}
				else	//最后一个节点
				{
					if (nChildCount==0)
					{
						sImageFile=sImages[2];
						sImageFileOpen=sImages[2];
					}
					else
					{
						sImageFile=sImages[4];
						sImageFileOpen=sImages[5];
					}
					sOnclick="onclick=\"ToggleFolder('" + sId + "','"+sImageFile+"','"+sImageFileOpen+"')\"";
				}
			}
		}
		else		//模块
			sOnclick="onclick=\"switchSysBar()\"";
		return sOnclick;
	}

	public String generateHTMLWithCheckBox( DbConnection dbc, boolean bShow, String sLoginID ) throws SQLException
	{
		String sOnclick;		//生成的onclick事件存放的位置
		String sCursor;		//生成的显示鼠标形状的代码存放位置

		
		long MODCODE=0, MODCODE2=0;
		String MODTITLE="", MODTITLE2="";
		String PICTURE="", PICTURE2="";
		String COMMAND="", COMMAND2="";
		String PARAMETER="", PARAMETER2="";
		int ORDERNO=0, ORDERNO2=0;
		String BZ="", BZ2="";
		int HELPID=0, HELPID2=0;
		int ISGROUP=0, ISGROUP2=0;
		int MODLEVEL=0, MODLEVEL2=0;
		long SUPER=0, SUPER2=0;
		int LEVEL=0, LEVEL2=0;
		int CHILDCOUNT=0, CHILDCOUNT2=0;

		//生成结果集
		generateTreeRS( dbc, bShow, sLoginID );
		//取得第一条数据(这是根目录)
		if (rsTree.next())
		{
			MODCODE=rsTree.getInt("MODCODE");
			MODTITLE=cConvert.getStrings(rsTree,"MODTITLE");
			PICTURE=cConvert.getStrings(rsTree,"PICTURE");
			COMMAND=cConvert.getStrings(rsTree,"COMMAND").trim();
			PARAMETER=cConvert.getStrings(rsTree,"PARAMETER").trim();
			ORDERNO=rsTree.getInt("ORDERNO");
			BZ=cConvert.getStrings(rsTree,"BZ").trim();
			HELPID=rsTree.getInt("HELPID");
			ISGROUP=rsTree.getInt("ISGROUP");
			MODLEVEL=rsTree.getInt("MODLEVEL");
			SUPER=rsTree.getInt("SUPER");
			LEVEL=rsTree.getInt("LEVEL");
			CHILDCOUNT=rsTree.getInt("CHILDCOUNT");

			//向数信息数组中写入值
			nTreeInfo[LEVEL+1][0]=CHILDCOUNT;

			//数据转存			
			MODCODE2	= MODCODE;
			MODTITLE2	= MODTITLE;
			PICTURE2	= PICTURE;
			COMMAND2	= COMMAND;
			PARAMETER2	= PARAMETER;
			ORDERNO2	= ORDERNO;
			BZ2			= BZ;
			HELPID2		= HELPID;
			ISGROUP2	= ISGROUP;
			MODLEVEL2	= MODLEVEL;
			SUPER2		= SUPER;
			LEVEL2		= LEVEL;
			CHILDCOUNT2	= CHILDCOUNT;
			
			//写出结果HTML语句
			sOnclick=generateOnclick( LEVEL, ISGROUP, "id" + MODCODE,CHILDCOUNT );
			sReturn=sTableHeader + "<td style=cursor:hand>"+ generateModuleImage( LEVEL, ISGROUP, "id" + MODCODE, CHILDCOUNT ) + generateLink( MODTITLE, "", BZ, ISGROUP, sOnclick,bShow, MODCODE, SUPER )+ "</td>" + sTableFooter;
		}

		//循环取得所有的数据
		while (rsTree.next())
		{
			//第一个已经写出来了，不用了
			//转存数据			
			MODCODE		= MODCODE2;
			MODTITLE	= MODTITLE2;
			PICTURE		= PICTURE2;
			COMMAND		= COMMAND2;
			PARAMETER	= PARAMETER2;
			ORDERNO		= ORDERNO2;
			BZ			= BZ2;
			HELPID		= HELPID2;
			ISGROUP		= ISGROUP2;
			MODLEVEL	= MODLEVEL2;
			SUPER		= SUPER2;
			LEVEL		= LEVEL2;
			CHILDCOUNT	= CHILDCOUNT2;

			//获得新数据			
			MODCODE2=rsTree.getInt("MODCODE");
			MODTITLE2=cConvert.getStrings(rsTree,"MODTITLE");
			PICTURE2=cConvert.getStrings(rsTree,"PICTURE").trim();
			COMMAND2=cConvert.getStrings(rsTree,"COMMAND").trim();
			PARAMETER2=cConvert.getStrings(rsTree,"PARAMETER").trim();
			ORDERNO2=rsTree.getInt("ORDERNO");
			BZ2=cConvert.getStrings(rsTree,"BZ").trim();
			HELPID2=rsTree.getInt("HELPID");
			ISGROUP2=rsTree.getInt("ISGROUP");
			MODLEVEL2=rsTree.getInt("MODLEVEL");
			SUPER2=rsTree.getInt("SUPER");
			LEVEL2=rsTree.getInt("LEVEL");
			CHILDCOUNT2=rsTree.getInt("CHILDCOUNT");

			//向数信息数组中写入值
			nTreeInfo[LEVEL2+1][0]=CHILDCOUNT2;		//当前处理层的子节点数
			nTreeInfo[LEVEL2][1]=nTreeInfo[LEVEL2][1]+1;

			if (LEVEL2>LEVEL)		//当前结点是前一节点的子节点
			{
				for( int i=1; i<=LEVEL2-LEVEL; i++ )
				{
					if (LEVEL==1)
					{
						sReturn+="<div id=id" + MODCODE + ">\n";
					}
					else
						sReturn+="<div id=id" + MODCODE + " style=display:none>\n";
				}
			}
			if (LEVEL2<LEVEL)	//当前结点比上一节点级别高
			{
				for( int i=LEVEL2; i<LEVEL; i++ )
				{
					nTreeInfo[i+1][1]=0;	//重置当前层下一级节点当前节点为0
					sReturn +="</div>\n";
				}
			}
			if (ISGROUP2==1)
			{
				sCursor=" style=\"cursor:hand;\"";
			}
			else
				sCursor="";
			if (!PARAMETER2.equals(""))
			{
				PARAMETER2 = "?" + PARAMETER2;
			}

			sCursor=" style=\"cursor:hand;\"";
			sOnclick=generateOnclick( LEVEL2, ISGROUP2, "id" + MODCODE2,CHILDCOUNT2 );
			sReturn +=sTableHeader + "<td" + sCursor + ">" + generateLine( LEVEL2, ISGROUP2, "id" + MODCODE2, CHILDCOUNT2 ) + 
				generateModuleImage( LEVEL2, ISGROUP2, "id" + MODCODE2, CHILDCOUNT2 ) + 
				generateLink( MODTITLE2, COMMAND2 +  PARAMETER2, BZ2, ISGROUP2, sOnclick, bShow, MODCODE2, SUPER2 ) + "</td>" + sTableFooter;
/*
			System.out.println("generateOnclick:"+sOnclick);
			System.out.println("generateLine:"+generateLine( LEVEL2, ISGROUP2, "id" + MODCODE2, CHILDCOUNT2 ));
			System.out.println("generateModuleImage:"+generateModuleImage( LEVEL2, ISGROUP2, "id" + MODCODE2, CHILDCOUNT2 ));
			System.out.println("generateLink:"+generateLink( MODTITLE2, COMMAND2 +  PARAMETER2, BZ2, ISGROUP2, sOnclick, bShow, MODCODE2 ));
*/
			//如果没有子节点，则生成空的DIV
			if (CHILDCOUNT2==0)
			{
				sReturn += "<div id=\"id"+ MODCODE2 + "\" style=\"display:none\"></div>\n";
			}
		}
		rsTree.close();
		rsTree=null;
		return sReturn;
	}


	//生成下拉菜单
	public String generateSelect(DbConnection dbc, boolean bShow, String sLoginID) throws SQLException
	{
		long MODCODE=0;
		int ISGROUP=0;
		String MODTITLE="";
		int LEVEL;
		String sReturn="";
		String sPrefix="";

		generateTreeRS( dbc, bShow, sLoginID );
		//取得第一条数据(这是根目录)
		while (rsTree.next())
		{
			MODCODE=rsTree.getInt("MODCODE");
			MODTITLE=cConvert.getStrings(rsTree,"MODTITLE");
			ISGROUP=rsTree.getInt("ISGROUP");
			LEVEL=rsTree.getInt("LEVEL");
			sPrefix="";
			for( int i=1; i<LEVEL; i++ )
				sPrefix+="--";
			sReturn+="<option value='" + MODCODE + "' ISGROUP='"+ISGROUP+"''>"+sPrefix + MODTITLE+"</option>\n";
		}
		rsTree.close();
		rsTree=null;
		return sReturn;
	}
}
