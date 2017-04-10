package com.macrosoft.icms.mccx;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.macrosoft.icms.gsdbc.GsDbConnection;

public class NameDAOImpl {
	/**
	 * 著名商标 gs_trademark
	 * 
	 * @param checkNameModel
	 * @return resultList
	 * @throws AppException
	 */
	public ArrayList getCheckNameSuperLogoList(CheckNameModel checkNameModel)
			throws Exception {
		GsDbConnection gsjdb=null;
		ArrayList resultList = new ArrayList();
		StringBuffer sqlBuff = new StringBuffer();
		ResultSet rs = null;
		try {
			if (checkNameModel == null) {
				System.out.println("Exception: checkNameModel is null!");
				return resultList;
			}
			sqlBuff.append("select * from HG0301 where  HG03006 like '%");
			sqlBuff.append(checkNameModel.getEnterpriseShortName());
			sqlBuff.append("%'");
			// 同音查重
			if (!"0".equals(checkNameModel.getSamemode())) {
				sqlBuff.append(" or HG03076 like '%");
				sqlBuff.append(checkNameModel.getEnterpriseShortNameSpell());
				sqlBuff.append("%' ");
			}

			//System.out.println( "sqlBuff:" + sqlBuff.toString());
			
			gsjdb=new GsDbConnection();
			rs = gsjdb.executeQuery(sqlBuff.toString());
			while (rs.next()) {
				CheckNameResultModel checkNameResultModel = new CheckNameResultModel();
				checkNameResultModel.setCheckNameType("20"); // 查重类型
				checkNameResultModel.setInnserID(rs.getString("HG03001"));
				checkNameResultModel.setEnterpriseName(rs.getString("HG03006")); // 名称
				checkNameResultModel.setEnterpriseNameSpell(rs
						.getString("HG03076")); // 名称拼音
				resultList.add(checkNameResultModel);
			}

		} catch (Exception e) {
			System.out.println("Exception:" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
				rs.close();
				}
				gsjdb.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}						
		return resultList;
	}

	/**
	 * 驰名商标 gs_arearight
	 * 
	 * @param checkNameModel
	 * @return resultList
	 * @throws AppException
	 */
	public ArrayList getCheckNameResoundLogoList(CheckNameModel checkNameModel)
			throws Exception {
		GsDbConnection gsjdb=null;
		ArrayList resultList = new ArrayList();
		StringBuffer sqlBuff = new StringBuffer();
		ResultSet rs = null;
		try {
			if (checkNameModel == null) {
				System.out.println("Exception: checkNameModel is null!");
				return resultList;
			}

			sqlBuff.append("select * from HG0201 where HG02006 like '%");
			sqlBuff.append(checkNameModel.getEnterpriseShortName());
			sqlBuff.append("%' ");
			// 同音查重
			if (!"0".equals(checkNameModel.getSamemode())) {
				sqlBuff.append(" or HG02081 like '%");
				sqlBuff.append(checkNameModel.getEnterpriseShortNameSpell());
				sqlBuff.append("%' ");
			}

			//System.out.println("sqlBuff:" + sqlBuff.toString());
			gsjdb=new GsDbConnection();
			rs = gsjdb.executeQuery(sqlBuff.toString());
			while (rs.next()) {
				CheckNameResultModel checkNameResultModel = new CheckNameResultModel();
				checkNameResultModel.setCheckNameType("30"); // 查重类型
				checkNameResultModel.setInnserID(rs.getString("HG02001")); // 内部序号
				checkNameResultModel.setEnterpriseName(rs.getString("HG02006")); // 名称
				checkNameResultModel.setEnterpriseNameSpell(rs
						.getString("HG02081")); // 名称拼音
				resultList.add(checkNameResultModel);
			}

		} catch (Exception e) {
			System.out.println("Exception:" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
				rs.close();
				}
				gsjdb.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultList;
	}

	/**
	 * 企业(名称)登记库 gsgsjin_basis02（未过期）
	 * 
	 * @param checkNameModel
	 * @return resultList
	 * @throws AppException
	 */
	public ArrayList getCheckNameBusinessList(CheckNameModel checkNameModel)
			throws Exception {
		GsDbConnection gsjdb=null;
		ArrayList resultList = new ArrayList();
		StringBuffer sqlBuff = new StringBuffer();
		ResultSet rs = null;
		String enterpriseName = ""; // 企业名称
		try {
			if (checkNameModel == null) {
				System.out.println("Exception: checkNameModel is null!");
				return resultList;
			}

			
			// 查询的登记机关
			String DJJG = checkNameModel.getDJJG(); // 默认冠名机关如果
			
			
			sqlBuff.append("select /*+ rule */ field001,field002,field003,field006,field009,field010,field014,field015,field021,field022,field099,field104,field123,field161 from ");
			sqlBuff.append(" GSGSJIN_BASIS02 ");
						
			String findWay=checkNameModel.getFindWay();
			// 冠市名
			if ("2".equals(findWay)) {
				sqlBuff.append("  where field104 like '");
				sqlBuff.append(DJJG.substring(0, 4) + "%");
			}else{
				sqlBuff.append("  where field104='");
				sqlBuff.append(DJJG);
			}
						
			sqlBuff.append("' and (field002='0102' or field002 like '02%') ");

			// 用于区分企业名称查重和农民专业合作社名称查重
			if ("0106".equals(checkNameModel.getBID())
					|| "0107".equals(checkNameModel.getBID())
					|| "020701".equals(checkNameModel.getBID())
					|| "020702".equals(checkNameModel.getBID())
					|| "030701".equals(checkNameModel.getBID())
					|| "030702".equals(checkNameModel.getBID())) {
				sqlBuff.append(" and field023='13'");
			}

			// 同音同字方式 同音或同字查重
			if ("2".equals(checkNameModel.getSamemode())) {
				sqlBuff
						.append(" and ( field014 like '%"
								+ checkNameModel.getEnterpriseShortName()
								+ "%' or field009 like '%"
								+ checkNameModel.getEnterpriseShortName()
								+ "%' or field010 like '%"
								+ checkNameModel.getEnterpriseShortNameSpell()
								+ "%'  or field015 like '%"
								+ checkNameModel.getEnterpriseShortNameSpell()
								+ "%') ");
			} else

			// 同字查重
			if ("0".equals(checkNameModel.getSamemode())) {
				sqlBuff.append(" and ( field014 like '%"
						+ checkNameModel.getEnterpriseShortName()
						+ "%' or field009 like '%"
						+ checkNameModel.getEnterpriseShortName() + "%') ");
			} else

			// 同音查重
			if ("1".equals(checkNameModel.getSamemode())) {
				sqlBuff
						.append(" and (field010 like '%"
								+ checkNameModel.getEnterpriseShortNameSpell()
								+ "%'  or field015 like '%"
								+ checkNameModel.getEnterpriseShortNameSpell()
								+ "%') ");
			}
			sqlBuff.append(" and (field123 >= '" + checkNameModel.getNowDate()
					+ "' or field123 ='' or field123 is null) ");
			// 按行业门类查重
			if ("1".equals(checkNameModel.getCategorysCope())) {
				sqlBuff.append(" and field021='"
						+ checkNameModel.getTradeCategory() + "' ");
			}
			// 按行业代码查重
			if ("2".equals(checkNameModel.getCategorysCope())) {
				sqlBuff.append(" and field022='"
						+ checkNameModel.getTradeCategoryCode() + "' ");
			}
			sqlBuff.append(" order by field009,field002");

			//System.out.println("sqlBuff:" + sqlBuff.toString());
			
			gsjdb=new GsDbConnection();
			rs = gsjdb.executeQuery(sqlBuff.toString());
			CheckNameResultModel checkNameResultModel = new CheckNameResultModel();
			int i = 0; // 记录指针
			String enterpriseType = "";// 企业现状
			String enterpriseBID = "";// 业务类型
			while (rs.next()) {
				checkNameResultModel = new CheckNameResultModel();
				checkNameResultModel.setCheckNameType("40"); // 查重类型
				checkNameResultModel
						.setEnterpriseName(rs.getString("field009")); // 名称
				checkNameResultModel.setEnterpriseShortName(rs
						.getString("field014")); // 字号
				checkNameResultModel.setEnterpriseNameSpell(rs
						.getString("field010")); // 名称拼音
				checkNameResultModel.setSN(rs.getString("field001")); // 事务号
				checkNameResultModel.setBID(rs.getString("field002")); // 业务类型
				checkNameResultModel.setEnterpriseStateType(rs
						.getString("field006")); // 企业现状
				checkNameResultModel.setSpanNameType(rs.getString("field161")); // 冠名类型
				checkNameResultModel.setInnserID(rs.getString("field003")); // 冠名类型
				checkNameResultModel.setNameStopDate(rs.getString("field123")); // 有效期限截止日期
				checkNameResultModel.setTradeCategory(rs.getString("field021")); // 门类
				checkNameResultModel.setTradeCategoryCode(rs
						.getString("field022")); // 门类代码
				checkNameResultModel.setApproveDate(rs.getString("field099")); // 核准日期

				// 如果当前记录于上条记录不一样则增加列表中 否则 修改上次记录内容
				if (!enterpriseName.equals(rs.getString("field009"))) {
					resultList.add(checkNameResultModel);
					i++;
				} else {
					// 如果是开业,则忽略对记录的更新
					if (!(enterpriseType != null && enterpriseType.equals("1") && enterpriseBID
							.startsWith("02"))) {
						resultList.set(i - 1, checkNameResultModel);
					}
				}
				enterpriseName = rs.getString("field009");
				enterpriseType = rs.getString("field006");
				enterpriseBID = rs.getString("field002");
			}

		} catch (Exception e) {
			System.out.println( "Exception:" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
				rs.close();
				}
				gsjdb.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultList;
	}

	/**
	 * 企业(名称)登记库 gsgsjin_basis02（已过期）
	 * 
	 * @param checkNameModel
	 * @return
	 * @throws AppException
	 */
	public ArrayList getCheckNameOldBusinessList(CheckNameModel checkNameModel)
			throws Exception {
		GsDbConnection gsjdb=null;
		ArrayList resultList = new ArrayList();
		StringBuffer sqlBuff = new StringBuffer();
		ResultSet rs = null;
		String enterpriseName = ""; // 企业名称
		try {
			if (checkNameModel == null) {
				System.out.println("Exception: checkNameModel is null!");
				return resultList;
			}

			// 查询的登记机关
			String DJJG = checkNameModel.getDJJG(); // 默认冠名机关如果
			
			sqlBuff
					.append("select /*+ rule */ field001,field002,field003,field006,field009,field010,field014,field015,field021,field022,field099,field104,field123,field161 from ");
			sqlBuff.append(" GSGSJIN_BASIS02 ");

			String findWay=checkNameModel.getFindWay();
			// 冠市名
			if ("2".equals(findWay)) {
				sqlBuff.append("  where field104 like '");
				sqlBuff.append(DJJG.substring(0, 4) + "%");
			}else{
				sqlBuff.append("  where field104='");
				sqlBuff.append(DJJG);
			}
			
			sqlBuff.append("' and (field002='0102' or field002 like '02%') ");

			// 用于区分企业名称查重和农民专业合作社名称查重
			if ("0106".equals(checkNameModel.getBID())
					|| "0107".equals(checkNameModel.getBID())
					|| "020701".equals(checkNameModel.getBID())
					|| "020702".equals(checkNameModel.getBID())
					|| "030701".equals(checkNameModel.getBID())
					|| "030702".equals(checkNameModel.getBID())) {
				sqlBuff.append(" and field023='13'");
			}

			// 同音同字方式 同音或同字查重
			if ("2".equals(checkNameModel.getSamemode())) {
				sqlBuff
						.append(" and ( field014 like '%"
								+ checkNameModel.getEnterpriseShortName()
								+ "%' or field009 like '%"
								+ checkNameModel.getEnterpriseShortName()
								+ "%' or field010 like '%"
								+ checkNameModel.getEnterpriseShortNameSpell()
								+ "%'  or field015 like '%"
								+ checkNameModel.getEnterpriseShortNameSpell()
								+ "%') ");
			} else

			// 同字查重
			if ("0".equals(checkNameModel.getSamemode())) {
				sqlBuff.append(" and ( field014 like '%"
						+ checkNameModel.getEnterpriseShortName()
						+ "%' or field009 like '%"
						+ checkNameModel.getEnterpriseShortName() + "%') ");
			} else

			// 同音查重
			if ("1".equals(checkNameModel.getSamemode())) {
				sqlBuff
						.append(" and (field010 like '%"
								+ checkNameModel.getEnterpriseShortNameSpell()
								+ "%'  or field015 like '%"
								+ checkNameModel.getEnterpriseShortNameSpell()
								+ "%') ");
			}
			sqlBuff.append(" and (field123 < '" + checkNameModel.getNowDate()
					+ "') ");
			// 按行业门类查重
			if ("1".equals(checkNameModel.getCategorysCope())) {
				sqlBuff.append(" and field021='"
						+ checkNameModel.getTradeCategory() + "' ");
			}
			// 按行业代码查重
			if ("2".equals(checkNameModel.getCategorysCope())) {
				sqlBuff.append(" and field022='"
						+ checkNameModel.getTradeCategoryCode() + "' ");
			}
			sqlBuff.append(" order by field009,field002");

			//System.out.println("sqlBuff:" + sqlBuff.toString());
			
			gsjdb=new GsDbConnection();
			rs = gsjdb.executeQuery(sqlBuff.toString());
			CheckNameResultModel checkNameResultModel = new CheckNameResultModel();
			int i = 0; // 记录指针
			String enterpriseType = "";// 企业现状
			String enterpriseBID = "";// 企业业务类型
			while (rs.next()) {
				checkNameResultModel = new CheckNameResultModel();
				checkNameResultModel.setCheckNameType("40"); // 查重类型
				checkNameResultModel
						.setEnterpriseName(rs.getString("field009")); // 名称
				checkNameResultModel.setEnterpriseShortName(rs
						.getString("field014")); // 字号
				checkNameResultModel.setEnterpriseNameSpell(rs
						.getString("field010")); // 名称拼音
				checkNameResultModel.setSN(rs.getString("field001")); // 事务号
				checkNameResultModel.setBID(rs.getString("field002")); // 业务类型
				checkNameResultModel.setEnterpriseStateType(rs
						.getString("field006")); // 企业现状
				checkNameResultModel.setSpanNameType(rs.getString("field161")); // 冠名类型
				checkNameResultModel.setInnserID(rs.getString("field003")); // 冠名类型
				checkNameResultModel.setNameStopDate(rs.getString("field123")); // 有效期限截止日期
				checkNameResultModel.setTradeCategory(rs.getString("field021")); // 门类
				checkNameResultModel.setTradeCategoryCode(rs
						.getString("field022")); // 门类代码
				checkNameResultModel.setApproveDate(rs.getString("field099")); // 核准日期

				// 如果当前记录于上条记录不一样则增加列表中 否则 修改上次记录内容
				if (!enterpriseName.equals(rs.getString("field009"))) {
					resultList.add(checkNameResultModel);
					i++;
				} else {
					// 如果是开业,则忽略对记录的更新
					if (!(enterpriseType.equals("1") && enterpriseBID
							.startsWith("02"))) {
						resultList.set(i - 1, checkNameResultModel);
					}
				}
				enterpriseName = rs.getString("field009");
				enterpriseType = rs.getString("field006");
				enterpriseBID = rs.getString("field002");
			}

		} catch (Exception e) {
			System.out.println("Exception:" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
				rs.close();
				}
				gsjdb.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultList;
	}

}
