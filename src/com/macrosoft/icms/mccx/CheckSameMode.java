package com.macrosoft.icms.mccx;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.macrosoft.icms.gsdbc.GsDbConnection;

public class CheckSameMode {
	/**
	 * 取得查重拼音列表
	 * 
	 * @param String
	 *            chinese 汉字
	 * @return 列表by lxh2004-03-10
	 */
	public ArrayList CheckSameMode(String chinese, String flag)
			throws Exception {
		if (flag == null && chinese == null) {
			throw new Exception("无效的企业查重信息!");
		}
		ArrayList alreturn = new ArrayList();
		ResultSet rs = null;
		String sql = null;
		GsDbConnection gsjdb=null;
		try {
			gsjdb=new GsDbConnection();
			if (flag.equals("0")) {
				sql = "select * from GS_PINYIN where CHINESE='" + chinese + "'";
				rs = gsjdb.executeQuery(sql);
				while (rs.next()) {
					System.out.println("pinyin>>>>>>>>>>>>"+ rs.getString("pinyin"));
					sql = "select * from GS_PINYIN where PINYIN='" + rs.getString("pinyin") + "'";
					rs = gsjdb.executeQuery(sql);
					System.out.println("[OperateDAOImpl--->selectApply]sql is-->"
							+ sql);
					while (rs.next()) {
						ArrayList al = new ArrayList();
						al.add(rs.getString(1));
						al.add(rs.getString(2));
						alreturn.add(al);
					}

				}
			}
			if (flag.equals("1")) {
				sql = "select * from GS_PINYIN where CHINESE='" + chinese + "'";
				rs = gsjdb.executeQuery(sql);
				System.out.println("[OperateDAOImpl--->selectApply]sql is-->" + sql);
				while (rs.next()) {
					ArrayList al = new ArrayList();
					al.add(rs.getString(1));
					al.add(rs.getString(2));
					alreturn.add(al);
				}

			}			
		} catch (Exception e) {
			System.out.print("[RegisterMark--getMchzNumber]Exception："
					+ e.getMessage());
			throw new Exception(e.getMessage());
		} finally {
			if(rs!=null){
				rs.close();
			}
			gsjdb.close();
		}
		return alreturn;
	}



	public String getpinyin(String mcondition) {
		String mid = "";
		String pin = "";
		String result = "";
		int i, j, k;
		GsDbConnection gsjdb=null;
		ResultSet rs = null;
		String condition = "";
		mid = "select pinyin from gs_pinyin where chinese='" + condition + "'";
		i = mcondition.length();
		try {
			gsjdb=new GsDbConnection();
			for (j = 0; j < i; j++) {
				condition = mcondition.substring(j, j + 1);
				mid = "select pinyin from gs_pinyin where chinese='"
						+ condition + "'";
				System.out.print("[CheckSameMode--->getpinyin]sql:" + mid);
				rs = gsjdb.executeQuery(mid);
				if (rs.next()) {
					pin = rs.getString("pinyin");
				} else {
					pin = condition;
				}
				// 去掉多余的空格
				// modify:wangy 2002-10-10
				if (pin != null) {
					pin = pin.trim();
				}
				if (pin.equals("")) {
					result = result.concat(condition);
				} else {
					if (result.equals("")) {
						result = pin;
					} else {
						result = result + " " + pin;
					}
				}
			}
		} catch (Exception e) {
			System.out.println("[CheckSameMode--->getpinyin] Exception:"
					+ e.getMessage());
		} finally {
			try {
				if(rs!=null){
					rs.close();
				}
				gsjdb.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
