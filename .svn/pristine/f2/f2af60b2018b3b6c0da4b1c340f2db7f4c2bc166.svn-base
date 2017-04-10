/**
	Name:		ICMSSuccess
	Function:	用来产生成功操作信息的异常类（利用ErrorPage机制，实现成功操作信息的显示，
				并指明下一步操作的路径
	Author:		Orchid
	Date:		2002-3-16
	UseFile:	
	Modify:		
**/
package com.macrosoft.icms;

public class ICMSSuccess extends Exception
{
	String ReturnPage="javascript:history.back();";
	String DetailMessage="";

	public String getReturnPage()
	{	return ReturnPage;	}

	public void setReturnPage( String ReturnPage )
	{	this.ReturnPage=ReturnPage;	}

	public String getDetailMessage()
	{	return DetailMessage;	}

	public void setDetailMessage( String DetailMessage )
	{	this.DetailMessage=DetailMessage;	}
	
	
	public ICMSSuccess( String sMessage )
	{
		super( "操作成功了！" );
		this.DetailMessage=sMessage;
	}
	
	public ICMSSuccess( )
	{
		super("操作成功了！" );
		this.DetailMessage="操作成功了！";
	}

	public ICMSSuccess( Exception e )
	{
		super( "操作成功了！" );
		this.DetailMessage=e.getMessage();
	}

	public ICMSSuccess( String DetailMessage, String ReturnPage )
	{
		super( "操作成功了！" );
		this.DetailMessage=DetailMessage;
		this.ReturnPage=ReturnPage;
	}

	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
	}
}
