/**
	Name:		ICMSSuccess
	Function:	���������ɹ�������Ϣ���쳣�ࣨ����ErrorPage���ƣ�ʵ�ֳɹ�������Ϣ����ʾ��
				��ָ����һ��������·��
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
		super( "�����ɹ��ˣ�" );
		this.DetailMessage=sMessage;
	}
	
	public ICMSSuccess( )
	{
		super("�����ɹ��ˣ�" );
		this.DetailMessage="�����ɹ��ˣ�";
	}

	public ICMSSuccess( Exception e )
	{
		super( "�����ɹ��ˣ�" );
		this.DetailMessage=e.getMessage();
	}

	public ICMSSuccess( String DetailMessage, String ReturnPage )
	{
		super( "�����ɹ��ˣ�" );
		this.DetailMessage=DetailMessage;
		this.ReturnPage=ReturnPage;
	}

	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
	}
}
