package com.macrosoft.icms.mccx;

public class CheckNameModel {
	private String enterpriseName; // ��ҵ����
	private String enterpriseShortName; // ��ҵ�ֺ�
	private String enterpriseShortNameSpell; // ��ҵ�ֺ�ƴ��
	private String DJJG; // �Ǽǻ���
	private String categorysCope; // ��ҵ��Χ ������ҵ ��ҵ���� ����ҵ����
	private String tradeCategory; // ��ҵ����
	private String tradeCategoryCode; // ��ҵ����
	private String findWay; // �������� ���ز��� ��ʡ������ ����������
	private String samemode; // �ֺ�ƴ�����ط�ʽ ͬ����ͬ�ֲ���
	private String BID;// ҵ������
	private String nowDate;
	
	public String getCategorysCope() {
		return categorysCope;
	}

	public String getEnterpriseName() {
		return enterpriseName;
	}

	public String getDJJG() {
		return DJJG;
	}

	public String getEnterpriseShortName() {
		return enterpriseShortName;
	}

	public String getEnterpriseShortNameSpell() {
		return enterpriseShortNameSpell;
	}

	public String getFindWay() {
		return findWay;
	}

	public String getSamemode() {
		return samemode;
	}

	public String getTradeCategory() {
		return tradeCategory;
	}

	public String getTradeCategoryCode() {
		return tradeCategoryCode;
	}

	

	public String getBID() {
		return BID;
	}

	
	public void setTradeCategoryCode(String tradeCategoryCode) {
		this.tradeCategoryCode = tradeCategoryCode;
	}

	public void setTradeCategory(String tradeCategory) {
		this.tradeCategory = tradeCategory;
	}

	public void setSamemode(String samemode) {
		this.samemode = samemode;
	}

	public void setFindWay(String findWay) {
		this.findWay = findWay;
	}

	public void setEnterpriseShortNameSpell(String enterpriseShortNameSpell) {
		this.enterpriseShortNameSpell = enterpriseShortNameSpell;
	}

	public void setEnterpriseShortName(String enterpriseShortName) {
		this.enterpriseShortName = enterpriseShortName;
	}

	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}

	public void setDJJG(String DJJG) {
		this.DJJG = DJJG;
	}

	public void setCategorysCope(String categorysCope) {
		this.categorysCope = categorysCope;
	}

	public void setBID(String BID) {
		this.BID = BID;
	}
	public String getNowDate() {
		return nowDate;
	}

	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}
}
