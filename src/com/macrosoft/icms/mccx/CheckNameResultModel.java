package com.macrosoft.icms.mccx;

import java.io.Serializable;

public class CheckNameResultModel implements Serializable {

	private String SN; // ����� field001
	private String BID; // ҵ������ field002
	private String enterpriseStateType; // ��ҵ��״ field006
	private String enterpriseName; // ��ҵ���� field009
	private String enterpriseShortName; // ��ҵ�ֺ�
	private String enterpriseNameSpell; // ��ҵ����ƴ��
	private String nameStopDate; // ������Ч���޽�ֹ field123
	private String spanNameType; // �������� field161
	private String checkNameType; // ���ط���
	private String innserID; // �ڲ����
	private String tradeCategory; // ��ҵ����
	private String tradeCategoryCode; // ��ҵ����
	private String approveDate; // ��׼����

	public String getBID() {
		return BID;
	}

	public String getCheckNameType() {
		return checkNameType;
	}

	public String getEnterpriseName() {
		return enterpriseName;
	}

	public String getEnterpriseStateType() {
		return enterpriseStateType;
	}

	public String getNameStopDate() {
		return nameStopDate;
	}

	public String getSpanNameType() {
		return spanNameType;
	}

	public String getSN() {
		return SN;
	}

	public void setSpanNameType(String spanNameType) {
		this.spanNameType = spanNameType;
	}

	public void setSN(String SN) {
		this.SN = SN;
	}

	public void setNameStopDate(String nameStopDate) {
		this.nameStopDate = nameStopDate;
	}

	public void setEnterpriseStateType(String enterpriseStateType) {
		this.enterpriseStateType = enterpriseStateType;
	}

	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}

	public void setCheckNameType(String checkNameType) {
		this.checkNameType = checkNameType;
	}

	public void setBID(String BID) {
		this.BID = BID;
	}

	public String getEnterpriseNameSpell() {
		return enterpriseNameSpell;
	}

	public void setEnterpriseNameSpell(String enterpriseNameSpell) {
		this.enterpriseNameSpell = enterpriseNameSpell;
	}

	public String getInnserID() {
		return innserID;
	}

	public void setInnserID(String innserID) {
		this.innserID = innserID;
	}

	public String getEnterpriseShortName() {
		return enterpriseShortName;
	}

	public void setEnterpriseShortName(String enterpriseShortName) {
		this.enterpriseShortName = enterpriseShortName;
	}

	public String getTradeCategory() {
		return tradeCategory;
	}

	public String getTradeCategoryCode() {
		return tradeCategoryCode;
	}

	public void setTradeCategoryCode(String tradeCategoryCode) {
		this.tradeCategoryCode = tradeCategoryCode;
	}

	public void setTradeCategory(String tradeCategory) {
		this.tradeCategory = tradeCategory;
	}

	public String getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}
}
