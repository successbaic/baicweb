package com.macrosoft.icms;

public class ICMSException extends Exception
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String ErrorPage="";
	String ReturnPage="javascript:history.back();";
	String DetailMessage="";

	public String getErrorPage()
	{	return ErrorPage;	}

	public void setErrorPage( String ErrorPage )
	{	this.ErrorPage=ErrorPage;	}

	public String getReturnPage()
	{	return ReturnPage;	}

	public void setReturnPage( String ReturnPage )
	{	this.ReturnPage=ReturnPage;	}

	public String getDetailMessage()
	{	return DetailMessage;	}

	public void setDetailMessage( String DetailMessage )
	{	this.DetailMessage=DetailMessage;	}
	
	
	public ICMSException( String sMessage )
	{
		super( "Error Message" );
		this.DetailMessage=sMessage;
	}
	
	public ICMSException( )
	{
		super("Error Message" );
		this.DetailMessage="Can't Get Error Message£¡";
	}

	public ICMSException( Exception e )
	{
		super( "Error Message" );
		this.DetailMessage=e.getMessage();
	}

	public ICMSException( String ErrorMessage, String DetailMessage, String ErrorPage, String ReturnPage )
	{
		super( ErrorMessage );
		this.DetailMessage=DetailMessage;
		this.ErrorPage=ErrorPage;
		this.ReturnPage=ReturnPage;
	}

	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
	}
}
