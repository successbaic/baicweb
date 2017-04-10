package com.macrosoft.icms.util;

import java.sql.SQLException;
import java.sql.Types;

import com.macrosoft.icms.dbc.DbConnection;

public class SYS_BHBM {
	public static String CREATEBH(int lb,String dqbh) throws SQLException
	{  
		DbConnection dbc=new DbConnection();
		java.util.ArrayList lst = new java.util.ArrayList();
		lst.add(new Integer(lb));
		lst.add(dqbh);
		String newBH=(String)dbc.executeStp("{ ?=call STP_CREATE_BH(?,?)}", lst,Types.VARCHAR);			
		dbc.close();
		System.out.println("��������Ϊ��"+newBH);
		return newBH;
	}
	
	/**
	 * �����������кţ�9λ�Ǽǻ����ɳ�����+��ǰϵͳʱ��+2λУ��λ��
	 * 
	 * @param one
	 * @param two
	 * @return String
	 */
	public static String getSequenceNumber(String djjg, int roundNUM) {
		/**
		 * RandomNum RNUM = new RandomNum(); RNUM.setRange("10000000-99999999");
		 * RNUM.generateRandomObject();
		 */
		if (djjg.length() < 7) {
			djjg = djjg + "000";
		}

		String NumberStr = "";
		long NowTime = System.currentTimeMillis();

		// У�����ַ�ֵ
		String ai[] = { "1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2" };

		// ���������
		int mod = roundNUM % 11;
		int mod2 = roundNUM % 8;

		// �õ��ڲ����
		NumberStr = djjg + NowTime + ai[mod] + ai[mod2];
		return NumberStr;

	}
	public static String getUniqueId(String djjg) {
		RandomNum RNUM = new RandomNum();
		try {
			RNUM.setRange("10000000-99999999");
			RNUM.generateRandomObject();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getSequenceNumber(djjg, RNUM.getRandom().intValue());
	}
}
