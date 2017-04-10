/**
	Name:		SysUpload
	Function:	Í¼Æ¬´æ´¢µÄ±äÁ¿¡£
	Date:		2006-10-9 
**/
package com.macrosoft.icms.system;
import java.sql.*;
import java.util.*;
public class SysUpload
{	
	String lPath=null;
	String lFile=null;
	String lFilename=null;
	int lType=-1;
	String lObjName=null;
	public SysUpload()
	{
		
	}
	public void init()
	{
		lPath=null;
		lFile=null;
		lFilename=null;
		lObjName=null;
		lType=-1;
	}
	////
	public String getlPath()
	{
		return lPath;
	}

	public void setlPath(String lPath)
	{
		this.lPath = lPath;
	}
	////
	public String getlFile()
	{
		return lFile;
	}
	public void setlFile(String lFile)
	{
		this.lFile = lFile;
	}	
	////
	

	public void setlFilename(String lFilename)
	{
		this.lFilename = lFilename;
	}

	public String getlFilename()
	{
		return lFilename;
	}
	////
	public void setlType(int lType)
	{
		this.lType = lType;
	}
	public int getlType()
	{
		return lType;
	}

	////
	public String getlObjName()
	{
		return lObjName;
	}

	public void setlObjName(String lObjName)
	{
		this.lObjName = lObjName;
	}
	
}
