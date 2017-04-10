package com.macrosoft.icms.commAjax.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.macrosoft.icms.commAjax.SpiltString;
import com.macrosoft.icms.commAjax.TreeNode;
import com.macrosoft.icms.commAjax.TreeUtil;
import com.macrosoft.icms.dbc.DbConnection;

public class CreateTreesAction {
	public static String getQylx(HttpServletRequest request) {
		// String jsonStr = GetRequestJson.readJSONString(request);
		// JSONObject obj = JSONObject.fromObject(jsonStr);
		// String id = obj.getString("ID");
		String id = request.getParameter("ID");
		String method = request.getParameter("method");
		// System.out.println("))))):"+obj.get("gxdw"));
		DbConnection db = null;
		ResultSet rs = null;
		List<TreeNode> list = new ArrayList<TreeNode>();
		String sql = "";
		try {
			db = new DbConnection();
			sql = "SELECT * FROM ( SELECT a.code AS code,a.content AS content,a.qylxdl AS sjCode  FROM BM_QYLX a "
					+ " UNION"
					+ " SELECT b.code AS code ,b.content AS content,'0' AS sjCode  FROM BM_QYDL b ) t"
					+ " START WITH t.sjCode = '0'"
					+ " CONNECT BY PRIOR t.code = t.sjCode"
					+ " ORDER SIBLINGS BY t.code";
			rs = db.executeQuery(sql);

			TreeNode node = null;
			while (rs.next()) {
				node = new TreeNode();
				node.setId(rs.getString("code"));
				node.setText(rs.getString("content"));
				if ("0".equals(rs.getString("sjCode"))) {
					node.setParentId(rs.getString("sjCode"));
				} else {
					// node.setParentId(null);
					node.setParentId(rs.getString("sjCode"));
				}
				list.add(node);
			}
			String json = TreeUtil.nodeList2Json(id, list);
			return json;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (db != null) {
				try {
					db.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public static String createTrees(HttpServletRequest request) {
		// String jsonStr = GetRequestJson.readJSONString(request);
		// JSONObject obj = JSONObject.fromObject(jsonStr);
		// String id = obj.getString("ID");
		String id = request.getParameter("ID");
		String method = request.getParameter("method");
		String level = request.getParameter("level");
		String djjg = request.getParameter("djjg");
		String gxdw = request.getParameter("gxdw");
		// System.out.println("))))):"+obj.get("gxdw"));
		DbConnection db = null;
		ResultSet rs = null;
		List<TreeNode> list = new ArrayList<TreeNode>();
		String sql = "";
		TreeNode node = null;
		try {
			db = new DbConnection();
			if ("getQylx".equals(method)) {
				sql = "SELECT * FROM ( SELECT a.code AS code,a.content AS content,a.qylxdl AS sjCode  FROM BM_QYLX a "
						+ " UNION"
						+ " SELECT b.code AS code ,b.content AS content,'0' AS sjCode  FROM BM_QYDL b ) t"
						+ " START WITH t.sjCode = '0'"
						+ " CONNECT BY PRIOR t.code = t.sjCode"
						+ " ORDER SIBLINGS BY t.code";
			} else if ("getHydm".equals(method)) {
				sql = "SELECT * FROM ( SELECT a.code AS code,a.content AS content,a.ml AS sjCode  FROM BM_HY a "
						+ " UNION"
						+ " SELECT b.code AS code ,b.content AS content,'0' AS sjCode  FROM BM_HYML b ) t"
						+ " START WITH t.sjCode = '0'"
						+ " CONNECT BY PRIOR t.code = t.sjCode"
						+ " ORDER SIBLINGS BY t.code";
			} else if ("getJgxm".equals(method)) {
				SpiltString toInString = new SpiltString();
				sql = "SELECT *"
						+ "   FROM (SELECT a.code AS code, a.content AS content, a.jgxm AS sjCode,a.gxdw AS gxdw"
						+ "           FROM hk_bm_jgxmxl a"
						+ "         UNION"
						+ "         SELECT b.code AS code, b.content AS content, '0' AS sjCode,b.gxdw AS gxdw"
						+ "           FROM hk_bm_jgxm b) t WHERE  1=1";
				if (!"".equals(djjg)) {
					sql += " AND t.gxdw IN('33000000','" + djjg + "') ";
				}
				if (!"".equals(gxdw)) {
					sql += " OR t.gxdw IN (" + toInString.spilt(gxdw)
							+ ",'33000000') ";
				}
				sql += "  START WITH t.sjCode = '0'"
						+ "  CONNECT BY PRIOR t.code = t.sjCode"
						+ "  ORDER SIBLINGS BY t.code";
			} else if ("getZrq".equals(method)) {
				if ("2".equals(level)) {
					sql = "SELECT t.*,CONNECT_BY_ISLEAF AS isleaf,level FROM  bm_gxdw t "
							+ " START WITH t.sjcode = '0'"
							+ " CONNECT BY  PRIOR t.code = t.sjcode"
							+ " ORDER SIBLINGS BY t.code";
				} else if ("3".equals(level)) {
					sql = "SELECT  t.*,CONNECT_BY_ISLEAF AS isleaf,level ,CONNECT_BY_ROOT code AS preCode"
							+ "   FROM (SELECT a.code AS code, a.content AS content, a.gxdwdm AS sjCode"
							+ "           FROM bm_pianhao a"
							+ "         UNION"
							+ "         SELECT b.code AS code, b.content AS content, b.sjcode AS sjCode"
							+ "           FROM bm_gxdw b) t"
							+ "           WHERE t.sjcode  = '"
							+ id
							+ "'"
							+ " AND  CONNECT_BY_ISLEAF <>0"
							+ " AND  t.code <>'33030211'"
							+ " AND  t.code <>'33030217'"
							+ "  START WITH t.sjCode = '"
							+ id
							+ "'"
							// +" START WITH t.sjCode = '0'"
							+ "  CONNECT BY PRIOR t.code = t.sjCode"
							+ "  ORDER SIBLINGS BY t.code";

				}
			} else if ("getGxdw".equals(method)) {
				sql = "SELECT  t.*,CONNECT_BY_ISLEAF AS isleaf,level FROM bm_gxdw t"
						+ " WHERE 1=1"
						+ " START WITH t.sjcode = '0'"
						+ " CONNECT BY  PRIOR t.code = t.sjcode"
						+ " ORDER SIBLINGS BY t.code";

			} else if ("getTzrLx".equals(method)) {
				sql = "SELECT * FROM (SELECT  t.code AS code , t.content AS content,"
						+ " (CASE  "
						+ "  WHEN t.code LIKE '%0' THEN '0'"
						+ "  ELSE SUBSTR(t.code,1,1) || '0'"
						+ "    END) AS sjcode"
						+ " FROM sys_dmdz t WHERE  t.type = 'INVTYPE')"
						+ " START WITH sjcode = '0'"
						+ " CONNECT BY PRIOR code = sjcode"
						//+ " ORDER SIBLINGS BY code"
						+ " UNION"
						+ " SELECT  t.code AS code , t.content AS content,"
						+ " t.code AS sjcode"
						+ " FROM sys_dmdz t WHERE  t.type = 'INVTYPE' "
						+ " AND t.code >='40'";

			}
			rs = db.executeQuery(sql);
			while (rs.next()) {
				node = new TreeNode();
				node.setId(rs.getString("code"));
				node.setText(rs.getString("content"));
				node.setParentId(rs.getString("sjCode"));
				if ("getZrq".equals(method)) {
					if ("2".equals(level)) {
						if ("0".equals(rs.getString("isleaf"))) {
							node.setHasChild(true);
						}
					} else if ("3".equals(level)) {
						node.setHasChild(false);
					}
				}
				list.add(node);
			}
			String json;
			if ("getGxdw".equals(method)) {
				json = TreeUtil.nodeList2JsonAddRoot(id, list);
			} else {
				json = TreeUtil.nodeList2Json(id, list);
			}
			return json;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (db != null) {
				try {
					db.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
}
