/**
	SysParameter	对系统中应用的参数进行封装的类
	例子：
		DQBH=370200&ZCH=3702001800001&QYLB=1
		分解为3个结果：
		DQBH	370200
		ZCH		3702001800001
		QYLB	1
*/
package com.macrosoft.icms.system;

import java.util.*;

public class SysParameter 
{
	String sParameter=null;
	Hashtable hParameter=null;

	/**
		构造函数
		@para sParameter String	包含指定格式的参数
	*/
	public SysParameter( String sParameter )
	{
		setParameter( sParameter );		
	}

	/**
		缺省构造函数
		@para 没有参数
	*/
	public SysParameter()
	{
	}

	/**
		设置须解析字符串函数
		@para sParameter String	包含指定格式的参数
	*/
	public void setParameter( String sParameter )
	{
		//释放资源
		close();
		//解析数据
		this.sParameter=sParameter;
		hParameter=new Hashtable();
		StringTokenizer s=new StringTokenizer( sParameter, "&" );
		String sPara, sContent;
		while (s.hasMoreTokens())
		{
			sPara="";
			sContent="";
			StringTokenizer s0=new StringTokenizer( s.nextToken(),"=" );
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
				hParameter.put( sPara.toUpperCase(), sContent );				
			}
		}
	}
	/**
		从该类中根据参数名取得参数值
		@para sPara String 要取得参数值的参数名
	*/
	public String getValue( String sPara )
	{
		if ( hParameter.containsKey(sPara.toUpperCase()) )
		{
			return (String)hParameter.get( sPara.toUpperCase() );
		}
		else
			return null;
	}

	/**
		析构函数
	*/
	public void finalize()
	{
		close();
	}

	/**
		资源释放函数
	*/
	public void close()
	{
		if (hParameter==null)
		{
		}
		else
		{
			hParameter.clear();
			hParameter=null;
		}
	}

	public static void main(String[] args) 
	{
		String sQuery="DQBH=370200&ZCH=3702001800001&QYLB=1&";
		com.macrosoft.icms.system.SysParameter sp=new com.macrosoft.icms.system.SysParameter( sQuery );
		System.out.println( "DQBH=" + sp.getValue( "DQBH" ) );
		System.out.println( "QYLB=" + sp.getValue( "QYLB" ) );
		System.out.println( "ZCH=" + sp.getValue( "zch" ) );
		sp.close();
	}
}
