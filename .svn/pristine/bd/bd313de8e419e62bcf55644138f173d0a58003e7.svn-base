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
		System.out.println("新受理编号为："+newBH);
		return newBH;
	}
	
	/**
	 * 用于生成序列号（9位登记机关派出机构+当前系统时间+2位校验位）
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

		// 校验码字符值
		String ai[] = { "1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2" };

		// 产生随机数
		int mod = roundNUM % 11;
		int mod2 = roundNUM % 8;

		// 得到内部序号
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
