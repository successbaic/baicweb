package com.macrosoft.icms.commAjax;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.macrosoft.icms.dbc.DbConnection;

public class TreeUtil {

	public static String nodeList2Json(String pid, List<TreeNode> list) {
		String json = "{id:0" + createTreeNodeJson(pid, list) + "}";
		System.out.println(json);
		return json;
	}
	public static String nodeList2JsonAddRoot(String pid, List<TreeNode> list) {
		String json = "{id:0" + createTreeNodeJsonAddRoot(pid, list) + "}";
		System.out.println(json);
		return json;
	}
	private static String createTreeNodeJsonAddRoot(String pid, List<TreeNode> nodelist) {
		List<TreeNode> list = getByPidAddRoot(pid, nodelist);
		StringBuilder strBulider = new StringBuilder(",item:[");
		for (int i = 0; i < list.size(); i++) {
			TreeNode treeNode = list.get(i);
			strBulider.append(node2Json(treeNode));
			if (treeNode.isHasChild()) {
				strBulider
						.append(createTreeNodeJson(treeNode.getId(), nodelist)
								+ "}");
			}
			if (i != list.size() - 1)
				strBulider.append(",");
		}
		strBulider.append("]");
		return strBulider.toString();
	}
	private static String createTreeNodeJson(String pid, List<TreeNode> nodelist) {
		List<TreeNode> list = getByPid(pid, nodelist);
		StringBuilder strBulider = new StringBuilder(",item:[");
		for (int i = 0; i < list.size(); i++) {
			TreeNode treeNode = list.get(i);
			strBulider.append(node2Json(treeNode));
			if (treeNode.isHasChild()) {
				strBulider
				.append(createTreeNodeJson(treeNode.getId(), nodelist)
						+ "}");
			}
			if (i != list.size() - 1)
				strBulider.append(",");
		}
		strBulider.append("]");
		return strBulider.toString();
	}

	private static String node2Json(TreeNode node) {
		StringBuilder strBulider = new StringBuilder("{");
		strBulider.append("id:\"").append(node.getId()).append("\",text:\"")
				.append(node.getText());
//				.append("\",im0:\"").append(
//						node.getIm0()).append("\",im1:\"")
//				.append(node.getIm1()).append("\",im2:\"")
//				.append(node.getIm2()).append("\"");
		if (node.isOpen()){
			strBulider.append(",open:1");
		}
		if (node.isCall()){
			strBulider.append(",call:1");
		}
		if (node.isSelect()){
			strBulider.append(",select:1");
		}
		if (node.isNocheckbox()){
			strBulider.append(",nocheckbox:1");
		}
		if (node.isDisabled()){
			strBulider.append(",disabled:1");
		}
		if (!StringUtils.isEmpty(node.getUserdata())){
			strBulider.append(",userdata:").append(node.getUserdata());
		}
//		if (node.isHasChild())
//			strBulider.append(",child:1,");
//		else
//			strBulider.append(",child:0");
		strBulider.append("\"");
		if (!node.isHasChild()) {
			strBulider.append("}");
		}
		return strBulider.toString();
	}

	private static List<TreeNode> getByPid(String pid, List<TreeNode> list) {
		List<TreeNode> treeNodeList = new ArrayList<TreeNode>();
		if (StringUtils.isBlank(pid)) {
			for (int i = 0; i < list.size(); i++) {
				TreeNode node = list.get(i);
				if (StringUtils.isEmpty(node.getParentId()))
					treeNodeList.add(node);
			}
			return treeNodeList;
		}

		for (int i = 0; i < list.size(); i++) {
			TreeNode node = list.get(i);
			if (pid.equals(node.getParentId()))
				treeNodeList.add(node);
		}
		list.removeAll(treeNodeList);
		return treeNodeList;
	}
	private static List<TreeNode> getByPidAddRoot(String pid, List<TreeNode> list) {
		List<TreeNode> treeNodeList = new ArrayList<TreeNode>();
		if (StringUtils.isBlank(pid)) {
			for (int i = 0; i < list.size(); i++) {
				TreeNode node = list.get(i);
				if (StringUtils.isEmpty(node.getParentId()))
					treeNodeList.add(node);
			}
			return treeNodeList;
		}
		
		for (int i = 0; i < list.size(); i++) {
			TreeNode node = list.get(i);
			if (pid.equals(node.getParentId())||pid.equals(node.getId()))
				treeNodeList.add(node);
		}
		list.removeAll(treeNodeList);
		return treeNodeList;
	}
	public static String createTree(List<TreeNode> list){
		StringBuffer json = new StringBuffer("{id:0,item:["); 
		TreeNode node = null;
		boolean isFirstChild = false;
		for(int i = 0 ; i < list.size() ; i ++){
			node = list.get(i);
			if(node.getParentId() == null){
				if(i == 0){
					json.append("{id:\""+node.getId()+"\",text:\""+node.getText()+"\"");
				}else{
					json.append("{id:"+node.getId()+",text:\""+node.getText()+"\"");
				}
			}else{
				if(isFirstChild){
					json.append(",item:[{id:\""+node.getId()+"\",text:\""+node.getText()+"\"}");
				}else{
					json.append(",{id:\""+node.getId()+"\",text:\""+node.getText()+"\"}");
				}
			}
		}
		json.append( "]}");
		return json.toString();
	}
	public static List<TreeNode> getTreeList() {
		DbConnection db = null;
		ResultSet rs =null;
		List<TreeNode> list = new ArrayList<TreeNode>();
		try {
			db = new DbConnection();
			String sql = "SELECT  t.*,CONNECT_BY_ISLEAF AS isleaf,level FROM bm_gxdw t " + " WHERE 1=1"
					+ " START WITH t.sjcode = '0'"
					+ " CONNECT BY  PRIOR t.code = t.sjcode"
					+ " ORDER SIBLINGS BY t.code";
			rs = db.executeQuery(sql);
			
			TreeNode node = null;
			while (rs.next()) {
				node = new TreeNode();
				node.setId(rs.getString("code"));
				node.setText(rs.getString("content"));
				node.setParentId(rs.getString("sjCode"));
				if("0".equals(rs.getString("isleaf"))){
					node.setHasChild(true);
				}
				list.add(node);
			}
			
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
		return list;
	}

	public static void main(String[] args) {
		
//		TreeUtil.initTree();
		String json = TreeUtil.nodeList2Json("0",getTreeList());
		System.out.println(json);
	}
}