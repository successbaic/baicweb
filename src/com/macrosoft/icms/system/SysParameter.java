/**
	SysParameter	��ϵͳ��Ӧ�õĲ������з�װ����
	���ӣ�
		DQBH=370200&ZCH=3702001800001&QYLB=1
		�ֽ�Ϊ3�������
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
		���캯��
		@para sParameter String	����ָ����ʽ�Ĳ���
	*/
	public SysParameter( String sParameter )
	{
		setParameter( sParameter );		
	}

	/**
		ȱʡ���캯��
		@para û�в���
	*/
	public SysParameter()
	{
	}

	/**
		����������ַ�������
		@para sParameter String	����ָ����ʽ�Ĳ���
	*/
	public void setParameter( String sParameter )
	{
		//�ͷ���Դ
		close();
		//��������
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
		�Ӹ����и��ݲ�����ȡ�ò���ֵ
		@para sPara String Ҫȡ�ò���ֵ�Ĳ�����
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
		��������
	*/
	public void finalize()
	{
		close();
	}

	/**
		��Դ�ͷź���
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
