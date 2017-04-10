package com.macrosoft.icms.mccx;

public class CheckNameModel {
	private String enterpriseName; // 企业名称
	private String enterpriseShortName; // 企业字号
	private String enterpriseShortNameSpell; // 企业字号拼音
	private String DJJG; // 登记机关
	private String categorysCope; // 行业范围 不分行业 行业门类 按行业查重
	private String tradeCategory; // 行业门类
	private String tradeCategoryCode; // 行业代码
	private String findWay; // 查重区域 本地查重 冠省名查重 冠市名查重
	private String samemode; // 字号拼音查重方式 同音或同字查重
	private String BID;// 业务类型
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
