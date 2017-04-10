package com.macrosoft.icms.system;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.commons.lang.StringUtils;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.gsdbc.GsDbConnection;

public class SysSystem {

	String virtualPath; // ����·�� http://localhost:8080/GP/
	String contextPath; // ����Ŀ¼ /GP
	

	Map<String,String> map_sanZheng = new Hashtable<String, String>();
	Hashtable hDmb;
	Vector vDjjg;
	Vector vGss;
	//Hashtable hConst;

	int nUserCount = 0;
	public String getSanZheng(String XZQH) { // �Ƿ�����֤��һ������֤����(0:�������� ;1:��֤���� ; 2:��֤��һ)
		return this.map_sanZheng.get(XZQH);
		
	}
	
	public void setSanZheng(String XZQH) throws SQLException {
		/*if(map_sanZheng.get(XZQH) == null){
			GsDbConnection gsDbc = new GsDbConnection();
			String sql = "SELECT *" +
					"  FROM com_parm_item t" + 
					" WHERE t.sort_code = 'DJ_SZLB'" + 
					"   AND t.item_status = '1'" + 
					"   AND INSTR(t.item_code,'"+XZQH+"') = 1";
			ResultSet rs = gsDbc.executeQuery(sql);
			if(rs.next()){
				map_sanZheng.put(XZQH,rs.getString("REMARK"));
			}
		}*/		
	}
	public void setVirtualPath(String virtualPath) {
		this.virtualPath = virtualPath;
	}

	public String getVirtualPath() {
		return virtualPath;
	}

	public void setContextPath(String cp) {
		this.contextPath = cp;
	}

	public String getContextPath() {
		return contextPath;
	}

	public Hashtable gethDmb() {
		return hDmb;
	}

	public Vector getVDjjg() {
		return vDjjg;
	}

	public void setVDjjg(Vector djjg) {
		vDjjg = djjg;
	}

	public Vector getVGss() {
		return vGss;
	}

	public void setVGss(Vector gss) {
		vGss = gss;
	}

	/** ���캯�� * */
	public SysSystem() throws SQLException {
		Initialize();
	}

	/** �������� * */
	public void finalize() {
		nUserCount = 0;
		//hConst = null;
		hDmb = null;
		vDjjg =null;
		vGss =null;
	}

	/** �û���¼ * */
	public void doLogin(String sName, int nGh) {
		nUserCount++;
	}

	/** ���û����б���ɾ��* */
	public void doLogout(String sName, int nGh) {
		nUserCount--;
	}

	/** �����ݿ���ȡ�����ݣ���ʼ��ϵͳ������icms * */
	public void Initialize() throws SQLException {
		InitSysDm();
		InitDjjg();
	}
	public void InitDjjg() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rs = dbc.executeQuery("SELECT CODING,CONTENT,PCODING,REMARK,REGLEVEL,MCJC,DQJC FROM COM_DJJG ORDER BY REGLEVEL,CODING ");
		vDjjg = new Vector();
		vGss = new Vector();
		while(rs.next()){
			String CODING=rs.getString("CODING");
			String CONTENT=rs.getString("CONTENT");
			String PCODING=rs.getString("PCODING");
			String REMARK=rs.getString("REMARK");
			String REGLEVEL=rs.getString("REGLEVEL");
			String MCJC=rs.getString("MCJC");
			String DQJC =rs.getString("DQJC");
			if("5".equals(REGLEVEL)){
				vGss.addElement(new String[] {CODING,CONTENT,PCODING,REMARK,REGLEVEL,MCJC,DQJC});
			}else{
				vDjjg.addElement(new String[] {CODING,CONTENT,PCODING,REMARK,REGLEVEL,MCJC,DQJC});
			}					
		}
		rs.close();
		rs=null;
		dbc.close();
	}
	public void InitSysDm() throws SQLException {
		DbConnection dbc = new DbConnection();
		hDmb = new Hashtable();
		ArrayList aDmlx = new ArrayList();
		// ��ʼ��DM
		String sqlDmlx = "SELECT TYPE FROM SYS_DMDZ GROUP BY TYPE ORDER BY TYPE";
		ResultSet rsDmlx = dbc.executeQuery(sqlDmlx);
		while (rsDmlx.next()) {
			String sDmlx = String.valueOf(rsDmlx.getObject("TYPE")).trim()
					.toUpperCase();
			aDmlx.add(sDmlx);
		}
		rsDmlx.close();
		rsDmlx = null;

		for (int i = 0; i < aDmlx.size(); i++) {
			String sqlDm = "SELECT CODE,CONTENT,REMARK,SIGN FROM SYS_DMDZ WHERE TYPE='"
					+ aDmlx.get(i).toString().trim() + "' ORDER BY CODE,SIGN";
			String sDm, sDmnr, sRemark, sign;
			ResultSet rsDm = dbc.executeQuery(sqlDm);
			Vector vTemp = new Vector();
			while (rsDm.next()) {
				sDm = String.valueOf(rsDm.getObject("CODE")).trim()
						.toUpperCase();
				sDmnr = String.valueOf(rsDm.getObject("CONTENT")).trim()
						.toUpperCase();
				sRemark = String.valueOf(rsDm.getObject("REMARK")).trim()
						.toUpperCase();
				sign = String.valueOf(rsDm.getObject("SIGN")).trim()
						.toUpperCase();
				vTemp.addElement(new String[] { sDm, sDmnr, sRemark, sign });
			}
			hDmb.put(aDmlx.get(i).toString().trim().toUpperCase(), vTemp);
			rsDm.close();
			rsDm = null;
		}
		dbc.close();

	}
	public Vector getSysVectorDm(String sDmlx) throws SQLException {
		if (sDmlx.equals("") ) {
			return null;
		} else {
			Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());		
			return vTemp;
		}
	}
	// ���ش�������
	public String getSysDmByRemark(String sDmlx, String sRemark)
			throws SQLException {
		if (sDmlx.equals("") || sRemark == null || sRemark.equals("")) {
			return "";
		} else {
			Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
			if (vTemp == null) {
				return "";
			}
			for (int i = 0; i < vTemp.size(); i++) {
				String[] ss = (String[]) vTemp.get(i);
				if (ss[2].equals(sRemark.toUpperCase())) {
					return ss[1];
				}
			}
			return "";
		}

	}

	public String getSysDmValByRemark(String sDmlx, String sRemark)
			throws SQLException {
		if (sDmlx.equals("") || sRemark == null || sRemark.equals("")) {
			return "";
		} else {
			Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
			if (vTemp == null) {
				return "";
			}
			for (int i = 0; i < vTemp.size(); i++) {
				String[] ss = (String[]) vTemp.get(i);
				System.out.println(ss[2] + "==" + sRemark.toUpperCase());
				if (ss[2].equals(sRemark.toUpperCase())) {
					return ss[0];
				}
			}
			return "";
		}

	}

	// ���ش�������
	public String getSysDm(String sDmlx, String sDm) throws SQLException {
		if (sDmlx.equals("") || sDm == null || sDm.equals("")) {
			return "";
		} else {
			Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
			if (vTemp == null) {
				return "";
			}
			for (int i = 0; i < vTemp.size(); i++) {
				String[] ss = (String[]) vTemp.get(i);
				if (ss[0].equals(sDm.toUpperCase())) {
					return ss[1];
				}
			}
			return "";
		}

	}

	// ����remark����
	public String getSysRemark(String sDmlx, String sDm) throws SQLException {
		if (sDmlx.equals("") || sDm == null || sDm.equals("")) {
			return "";
		} else {
			Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
			if (vTemp == null) {
				return "";
			}
			for (int i = 0; i < vTemp.size(); i++) {
				String[] ss = (String[]) vTemp.get(i);
				if (ss[0].equals(sDm.toUpperCase())) {
					return ss[2];
				}
			}
			return "";
		}

	}

	// ���ص�ǰ����λ����
	public String getCurrentUnitLevel() throws SQLException {
		String sDmlx = "CURRENTUNIT";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		String[] ss = (String[]) vTemp.get(0);
		return ss[2];

	}

	// ���ص�ǰ����λ��������
	public String getCURRENTUNIT() throws SQLException {
		String sDmlx = "CURRENTUNIT";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		String[] ss = (String[]) vTemp.get(0);
		return ss[0];

	}
	// ���ص�ǰ����λ
	public String getCURRENTUNIT_NAME() throws SQLException {
		String sDmlx = "CURRENTUNIT";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		String[] ss = (String[]) vTemp.get(0);
		return ss[1];

	}
	// get select list html
	public String getSysDmList(String sDmlx) throws SQLException {
		String sOptions = "";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null) {
			return sOptions;
		}
		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			// sOptions+="<option value='" + ss[0] + "'>"+ ss[0] +"|"+
			// ss[1].trim() + "</option>" + "\n";
			sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
					+ "</option>" + "\n";
		}
		return sOptions;
	}
	

	public String getSysDmListByXzqh(String sDmlx, String xzqh)
			throws SQLException {
		String sOptions = "";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null) {
			return sOptions;
		}
		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			if (ss[0].startsWith(xzqh)){
				sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
						+ "</option>" + "\n";
			}
		}
		return sOptions;
		
	}
//	��������ҵ�����Ȩ��
	public String getSysDmListByXzqh(String sDmlx, String xzqh,String ENTTYPE)
			throws SQLException {
		String[] enttype_wz = new String[]{"WZGS","WZQY","WZFZ","WGDB","WZFR","WGJY","WZHH","WZHHFZ"};
		boolean isCheck = false;
		if(Arrays.asList(enttype_wz).contains(ENTTYPE)){
			isCheck = true;
		}
		List<String> list = new ArrayList<String>();
		GsDbConnection gsDbc = new GsDbConnection();
		ResultSet rs = null;
		rs = gsDbc.executeQuery("SELECT * FROM com_parm_item t WHERE t.sort_code = 'WZ_YWBL_RIGHT'");
		if(rs.next()){
			list.add(rs.getString("remark"));
		}
		String sOptions = "";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null) {
			return sOptions;
		}
		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			if (ss[0].startsWith(xzqh)){
				if(isCheck && !list.contains(ss[0])){
					sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
							+ "</option>" + "\n";
				}
			}
			}
		rs.close();
		gsDbc.close();
		return sOptions;
		
	}

	// ����Remark�������ش���list
	public String getSysDmListByRemark(String sDmlx, String sRemark)
			throws SQLException {
		String sOptions = "";
		if (sDmlx.equals("") || sRemark == null || sRemark.equals("")) {
			return sOptions;
		} else {
			Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
			if (vTemp == null) {
				return sOptions;
			}
			for (int i = 0; i < vTemp.size(); i++) {
				String[] ss = (String[]) vTemp.get(i);
				if (ss[2].equals(sRemark.toUpperCase())) {
					sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
							+ "</option>" + "\n";
				}
			}
			return sOptions;
		}

	}
	// ����Remark�������ش���list
	public List<String> getSysDmListForJavaByRemark(String sDmlx, String sRemark)
			throws SQLException {
		List<String> list = new ArrayList<String>();
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null) {
			return list;
		}
		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			if (ss[2].equals(sRemark.toUpperCase())) {
				list.add(ss[0]);
			}
		}
		return list;
		
	}

	// ����Remark�������ش���list
	public String getSysDmListLIKERemark(String sDmlx, String sRemark)
			throws SQLException {
		String sOptions = "";
		if (sDmlx.equals("") || sRemark == null || sRemark.equals("")) {
			return sOptions;
		} else {
			if (!"NZFR,GRDZ,ZRR,FZR".contains(sRemark)) {
				sRemark = "ALL";
			}
			Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
			if (vTemp == null) {
				return sOptions;
			}
			for (int i = 0; i < vTemp.size(); i++) {
				String[] ss = (String[]) vTemp.get(i);
				if (ss[2].contains(sRemark)) {
					if (ss[2].contains("DL")) {
						sOptions += "<option style='background-color: #F0F0F0;' disabled='disabled' value='"
								+ ss[0]
								+ "'><font style='font-weight: bold;'>"
								+ ss[1].trim() + "</font>" + "</option>" + "";
					} else {
						sOptions += "<option value='" + ss[0]
								+ "'>&nbsp;&nbsp;" + ss[1].trim() + "</option>"
								+ "";
					}
					if (ss[0].equals("40") || ss[0].equals("50")|| ss[0].equals("90")) {
						sOptions += "<option value='" + ss[0]
								+ "'>&nbsp;&nbsp;" + ss[1].trim() + "</option>"
								+ "";
					}
				}
			}
			return sOptions;
		}

	}

	public String getSysDmListByRemark(String sDmlx, String sRemark, String xzqh)
			throws SQLException {
		String sOptions = "";
		if (sDmlx.equals("") || sRemark == null || sRemark.equals("")) {
			return sOptions;
		} else {
			Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
			if (vTemp == null) {
				return sOptions;
			}
			for (int i = 0; i < vTemp.size(); i++) {
				String[] ss = (String[]) vTemp.get(i);
				if (ss[2].equals(sRemark.toUpperCase())
						&& ss[0].startsWith(xzqh)) {
					sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
							+ "</option>" + "\n";
				}
			}
			return sOptions;
		}

	}

	public String getSysDmRemarkList(String sDmlx) throws SQLException {
		String sOptions = "";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null) {
			return sOptions;
		}
		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			sOptions += "<option value='" + ss[0] + "'>" + ss[0] + "|"
					+ ss[2].trim() + "</option>" + "\n";
		}
		return sOptions;
	}

	public String getSysDmList(String sDmlx, String sRemark)
			throws SQLException {
		String sOptions = "";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null) {
			return sOptions;
		}
		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			if (ss.length > 3
					&& ss[2].trim().equalsIgnoreCase(sRemark.toUpperCase())) {
				sOptions += "<option value='" + ss[0] + "'>" + ss[0] + "|"
						+ ss[1].trim() + "</option>" + "\n";
			}
		}
		return sOptions;
	}

	public String getSysDmListByDm(String sDmlx, String sDm)
			throws SQLException // /startwith sdm from you input
	{
		String sOptions = "";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null || sDm == null) {
			return sOptions;
		}

		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			if ((ss[0].toUpperCase()).startsWith(sDm.toUpperCase())) {
				sOptions += "<option value='" + ss[0] + "'>" + ss[0] + "|"
						+ ss[1].trim() + "</option>" + "\n";
			}
		}
		return sOptions;
	}

	public String getSysDmRemarkListByDm(String sDmlx, String sDm)
			throws SQLException // /startwith sdm from you input
	{
		String sOptions = "";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null || sDm == null) {
			return sOptions;
		}

		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			if ((ss[0].toUpperCase()).startsWith(sDm.toUpperCase())) {
				sOptions += "<option value='" + ss[0] + "' dmnr='"
						+ ss[1].trim() + "' remark='" + ss[2] + "'>" + ss[0]
						+ "|" + ss[1].trim() + "</option>" + "\n";
			}
		}
		return sOptions;
	}

	// ���ɺ���checkbox�б�
	public String getCheckList(String sDmlx, String sName) throws SQLException {
		String sOptions = "";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		if (vTemp == null) {
			return sOptions;
		}
		for (int i = 0; i < vTemp.size(); i++) {
			String[] ss = (String[]) vTemp.get(i);
			sOptions += "<input type='checkbox' name='" + sName.trim()
					+ "' value='" + ss[0] + "'>" + ss[1].trim() + "  ";
		}

		return sOptions;
	}

	// init sysconst
	/*public void InitConst() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlDm = "SELECT NAME,VALUE FROM SYS_CONST ";
		hConst = new Hashtable();
		String sDm, sValue;
		ResultSet rsDm = dbc.executeQuery(sqlDm);
		while (rsDm.next()) {
			sDm = String.valueOf(rsDm.getObject("NAME")).trim().toUpperCase();
			sValue = String.valueOf(rsDm.getObject("VALUE")).trim()
					.toUpperCase();
			hConst.put(sDm, sValue);
		}
		rsDm.close();
		rsDm = null;
		dbc.close();

	}*/

	// ���ز�������
	/*public String getSysConst(String sDm) throws SQLException {
		if (sDm == null || sDm.equals("")) {
			return "";
		} else {
			return (String) hConst.get(sDm.toUpperCase());
		}

	}*/

	/*public String getPoolsInformation() {
		String ret = "";
		DbConnection dbc = new DbConnection();
		try {
			ret = dbc.getPoolsInformation();
			dbc.close();

		} catch (SQLException e) {
			System.err.println("����:" + e.getMessage());
		}
		return ret;
	}

	public int getUsedConnections() {
		int ret = 100;
		DbConnection dbc = new DbConnection();
		try {
			ret = dbc.getUsedConnections();
			dbc.close();

		} catch (SQLException e) {
			System.err.println("����:" + e.getMessage());
		}
		return ret;
	}*/

	// ��ȡ����2011-1-1����ת����xxxx��xx��xx�յ���ʽ
	public String getFormatDate(String datestr) {
		String Years = datestr.substring(0, 4);
		String Months = datestr.substring(5, 7);
		String Days = datestr.substring(8, 10);
		String DQSJ = Years + "��" + Months + "��" + Days + "��";
		return DQSJ;
	}

	// ��ȡ��ǰ���ڣ���ת����xxxx��xx��xx�յ���ʽ
	public String getCurrentDate() {
		java.util.Date date = new java.util.Date();
		int Years = date.getYear() + 1900;
		int Months = date.getMonth() + 1;
		int Days = date.getDate();
		String DQSJ = Years + "��" + Months + "��" + Days + "��";
		return DQSJ;
	}

	// ��ӡʱ��������Ϊ��ʱҲҪ����»���
	public final static String toUnderlineStr(String sourceStr,
			String alignType, int lengthMax) {
		String underlineStr = sourceStr;
		// ���Ϊ�յģ�����û�ж��뷽ʽ�ٻ���û�й涨��󳤶�
		// ��ʱ��ӡ��󳤶ȵ������Ŀ��ַ���
		if (sourceStr == null || "".equals(sourceStr) || alignType == null
				|| "".equals(alignType) || lengthMax < 0) {

			underlineStr = "";
			underlineStr += getNbspStr(false, lengthMax);

			underlineStr = "<u>" + underlineStr + "</u>";
			return underlineStr;
		}

		// ȥ���ո�
		sourceStr = sourceStr.trim();
		underlineStr = sourceStr;
		StringBuffer buffer = new StringBuffer(underlineStr);
		for (int i = 1; i < buffer.length() / 35 + 1; i++) {
			buffer.insert(35 * i - 4, "<br>");
		}
		underlineStr = buffer.toString();
		// ����ַ����ȷ�������Ҫ�󣬸��ݲ�ͬ�Ķ��뷽ʽ����
		if (getStrLength(sourceStr) < lengthMax) {
			if ("center".equals(alignType)) {
				int cnt = lengthMax - getStrLength(sourceStr);
				underlineStr = getNbspStr(false, cnt / 2) + underlineStr
						+ getNbspStr(true, cnt - cnt / 2);
			} else if ("left".equals(alignType)) {
				int cnt = lengthMax - getStrLength(sourceStr);
				underlineStr = underlineStr + getNbspStr(true, cnt);

			} else if ("right".equals(alignType)) {
				int cnt = lengthMax - getStrLength(sourceStr);
				underlineStr = getNbspStr(false, cnt) + underlineStr;
			}
		} else {
			// ���糬����󳤶ȣ������κδ���
			;
		} // end of if(sourceStr.length() < lengthMax)

		// ����html�淶
		underlineStr = "<u>" + underlineStr + "</u>";

		return underlineStr;
	}

	// ����Ҫ���Ǵ������������ұ���������˿��Ƹ�ʽ
	public final static String getNbspStr(boolean isleft, int len) {

		String addstr = " &nbsp;";
		String ret = "";
		if (!isleft) {
			addstr = "&nbsp; ";
		}
		for (int i = 0; i < len / 2; i++) {
			ret += addstr;
		}
		if (len % 2 != 0) {
			if (isleft) {
				ret = ret + "&nbsp;";
			} else {
				ret = "&nbsp;" + ret;
			}
		}
		return ret;
	}

	// ����ַ��ĳ��ȣ�ȫ��������
	public final static int getStrLength(String str) {
		int ret = 0;
		if (str == null) {
			return -1;
		}
		for (int i = 0; i < str.length(); i++) {
			if ((str.charAt(i) > 0) && (str.charAt(i) < 256)) {
				ret++;
			} else {
				ret = ret + 2;
			}
		}
		return ret;
	}

	// ���·��
	public String getLJ(String lx) throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsSelect;
		String lj = "";
		String sql = "select lj from wsdj_lj  where lx='" + lx + "'";
		rsSelect = dbc.executeQuery(sql);
		if (rsSelect.next()) {
			lj = rsSelect.getString("LJ");
		}
		dbc.close();
		return lj;
	}

	/*
	 * �ж��Ƿ���ʡ�ֲ��� by vincent ʡ�֣�true �о֣�false
	 */
	public boolean isSJ() throws SQLException {
		String type = "CURRENTUNIT";
		if (type.equals("") || type == null || type.equals("")) {
			return false;
		} else {
			Vector vTemp = (Vector) hDmb.get(type.toUpperCase());
			if (vTemp == null) {
				return false;
			}
			for (int i = 0; i < vTemp.size(); i++) {
				String[] ss = (String[]) vTemp.get(i);
				if (ss[2].equals("1")) {
					return true;
				} else {
					return false;
				}
			}
			return false;
		}
	}
	
	/**
	 * ���Ż�������
	 */
	
	
	//��ȡ��ǰʡ�ֵĴ���
	public String getSjCode() throws SQLException{
		Vector vTemp = (Vector) hDmb.get("PROVINCE");
		String[] ss=(String[])vTemp.get(0);
		return ss[0];
	}
	//��ȡ��ǰʡ������
	public String getSjName() throws SQLException{
		Vector vTemp = (Vector) hDmb.get("PROVINCE");
		String[] ss=(String[])vTemp.get(0);
		return ss[1];
	}
	// ���ز��Ż�������
	public String getDjjgName(String coding) {
		if (coding == null || coding.equals("") ) {
			return "";
		} else {
			for (int i = 0; i < vDjjg.size(); i++) {
				String[] ss = (String[]) vDjjg.get(i);
				if (coding.equals(ss[0]) ) {
					return ss[1];
				}
			}
			return "";
		}
	}
	/**
	 * �������з־֣������Ǳ�ʡ�����о�
	 * @param pcoding
	 * @return
	 * @throws SQLException
	 */
	public String getDjjgListByPcoding(String pcoding) throws SQLException {
		String sOptions = "";
		
		if (pcoding == null || pcoding.equals("") ) {
			return "";
		}
		String bushumoshi=ContrInfo.bushumoshi;
		if(bushumoshi.equals("SHENGJU")){
			for (int i = 0; i < vDjjg.size(); i++) {
				String[] ss = (String[]) vDjjg.get(i);
				if(pcoding.equals(ss[0])){
					sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
					+ "</option>" + "\n";
				}
			}
		}else{
			for (int i = 0; i < vDjjg.size(); i++) {
				String[] ss = (String[]) vDjjg.get(i);
				if(pcoding.equals(ss[2])){
					sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
					+ "</option>" + "\n";
				}
			}
		}
		
		return sOptions;
	}
	/**
	 * ���ݸ����źͼ����ȡ�б�һ�㲻��
	 * @param pcoding
	 * @param reglevel
	 * @return
	 * @throws SQLException
	 */
	public String getDjjgListByPcodingAndLevel(String pcoding,String reglevel) throws SQLException {
		String sOptions = "";		
		if (pcoding == null || pcoding.equals("") || reglevel == null || reglevel.equals("")) {
			return "";
		}
		
		for (int i = 0; i < vDjjg.size(); i++) {
			String[] ss = (String[]) vDjjg.get(i);
			if(pcoding.equals(ss[2]) && reglevel.equals(ss[4])){
				sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
				+ "</option>" + "\n";
			}
		}
		return sOptions;
	}
	/**
	 * ��ȡ���еǼǻ���
	 * @param coding �оֻ��ش���
	 * @return
	 * @throws SQLException
	 */
	public String getBsDjjg(String coding) throws SQLException {
		String sOptions = "";
		if (coding == null || coding.equals("") ) {
			return "";
		}
		String bushumoshi=ContrInfo.bushumoshi;
		if(bushumoshi.equals("SHENGJU")){
			for (int i = 0; i < vDjjg.size(); i++) {
				String[] ss = (String[]) vDjjg.get(i);
				if(coding.equals(ss[0])){
					sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
					+ "</option>" + "\n";
				}
			}
		}else if(bushumoshi.equals("ALL")){
			for (int i = 0; i < vDjjg.size(); i++) {
				String[] ss = (String[]) vDjjg.get(i);
				String sjcode=getSjCode();
				if(coding.equals(ss[0]) || coding.equals(ss[2]) || sjcode.equals(ss[0])){
					sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
					+ "</option>" + "\n";
				}
			}
		}else{
			for (int i = 0; i < vDjjg.size(); i++) {
				String[] ss = (String[]) vDjjg.get(i);
				if(coding.equals(ss[0]) || coding.equals(ss[2])){
					sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
					+ "</option>" + "\n";
				}
			}
		}		
		return sOptions;
	}
	
	/**
	 * ���ƵǼǻ���
	 * @param coding ���оִ���
	 * @param gmlx ��������
	 * @return
	 * @throws SQLException
	 */
	public Vector getBsMcDjjgVect(String sjcoding,String gmlx) throws SQLException {
		String sOptions = "";
		if (sjcoding == null || sjcoding.equals("") ) {
			return null;
		}
		
		Vector bsjgVect=new Vector();
		Vector bsdjMcVect=new Vector();
		
		String bsjgCodeAll="";
		if(gmlx.indexOf("0")>-1){
			String bushumoshi=ContrInfo.bushumoshi;
			if(bushumoshi.equals("ALL")){
				for (int i = 0; i < vDjjg.size(); i++) {
					String[] ss = (String[]) vDjjg.get(i);
					if(getSjCode().equals(ss[0])){
						bsjgCodeAll+=ss[0]+"/";
						bsjgVect.add(ss);
					}
				}
			}else if(bushumoshi.equals("SHENGJU")){
				sjcoding=getSjCode();
			}			
		}
		for (int i = 0; i < vDjjg.size(); i++) {
			String[] ss = (String[]) vDjjg.get(i);
			if(sjcoding.equals(ss[0]) || sjcoding.equals(ss[2])){
				bsjgCodeAll+=ss[0]+"/";
				bsjgVect.add(ss);
			}
		}
		Vector vTemp=(Vector)hDmb.get("NAMEORG");		
		if(vTemp==null || vTemp.size()<1){
			return null;
		}
		String bsjgMcCode="";
		for (int i=0;i<vTemp.size();i++)
		{
			String[] ss=(String[])vTemp.get(i);			
			if (gmlx.indexOf(ss[2])>-1 && bsjgCodeAll.indexOf(ss[0])>-1)
			{
				bsjgMcCode+=ss[0]+",";
			}				
		}
		for (int i = 0; i < bsjgVect.size(); i++) {
			String[] ss = (String[]) bsjgVect.get(i);
			if(bsjgMcCode.indexOf(ss[0])>-1){				
				bsdjMcVect.add(ss);
			}
		}
		return bsdjMcVect;
	}
	
	/**
	 * ��ȡ������������
	 * @param coding
	 * @return
	 * @throws SQLException
	 */
	public String getGssName(String coding) throws SQLException {
		if (coding == null || coding.equals("") ) {
			return "";
		} else {
			for (int i = 0; i < vGss.size(); i++) {
				String[] ss = (String[]) vGss.get(i);
				if (coding.equals(ss[0]) ) {
					return ss[1];
				}
			}
			return "";
		}
	}
	/**
	 * ��ȡ�����ع�����
	 * @param coding
	 * @return
	 * @throws SQLException
	 */
	public String getBjgGss(String pcoding) throws SQLException {
		String sOptions = "";		
		if (pcoding == null || pcoding.equals("") ) {
			return "";
		}
		for (int i = 0; i < vGss.size(); i++) {
			String[] ss = (String[]) vGss.get(i);		
			if(pcoding.equals(ss[2])){
				sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
				+ "</option>" + "\n";
			}
		}
		return sOptions;
	}
	
	public String getShengJu() throws SQLException{
		String sOptions = "";
		for (int i = 0; i < vDjjg.size(); i++) {
			String[] ss = (String[]) vDjjg.get(i);		
			if(getSjCode().equals(ss[0])){
				sOptions += "<option value='" + ss[0] + "'>" + ss[1].trim()
				+ "</option>" + "\n";
			}
		}
		return sOptions;
	}
	 
	public String getFullElecUnit() throws SQLException {
		String sDmlx = "FULLELECUNIT";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<vTemp.size();i++){
			String[] ss = (String[]) vTemp.get(i);
			String code = ss[0];
			sb.append(code).append(";");
		}
		String codes = sb.substring(0, sb.length()-1);
		return codes.toString();
	}
	
	// ���ص�ǰ��������ַ
	public String getCURRENTURL() throws SQLException {
		String sDmlx = "CURRENTURL";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		String[] ss = (String[]) vTemp.get(0);
		String url ="";
		if(StringUtils.isNotEmpty(ss[1])){
		 url = ss[1].toLowerCase();
	    }
		return url;

	}
	
	// ���ص��ӻ���¼��ַIP�˿�
	public String getELECLOGINURL() throws SQLException {
		String sDmlx = "ELECLOGINURL";
		Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
		String[] ss = (String[]) vTemp.get(0);
		String url ="";
		if(StringUtils.isNotEmpty(ss[1])){
		 url = ss[1].toLowerCase();
	    }
		return url;
	}
}
