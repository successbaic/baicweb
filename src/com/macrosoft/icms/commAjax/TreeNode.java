package com.macrosoft.icms.commAjax;

public class TreeNode {
	private String id;

	private String text;

	private String im0;

	private String im1;

	private String im2;

	private int orderNo;

	private String userdata;

	private boolean hasradio = false;
	private boolean isSelect = false; // �Ƿ�ѡ��
	private boolean isOpen = false; // �Ƿ��
	private boolean isCall = false; // �Ƿ�Ҫ���õ����¼�
	private boolean isChecked = false;// �����checked���ͣ�Ĭ���Ƿ�ѡ��
	private boolean hasChild = false; // �жϸýڵ��Ƿ����ӽڵ�
	private boolean nocheckbox = false; // �������������ó�checkboxʱ�����øýڵ��Ƿ���и�ѡ��
	private boolean disabled = false; // �Ƿ���ԶԸ�ѡ����в�����1Ϊ���У�0Ϊ��

	private String parentId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIm0() {
		return im0;
	}

	public void setIm0(String im0) {
		this.im0 = im0;
	}

	public String getIm1() {
		return im1;
	}

	public void setIm1(String im1) {
		this.im1 = im1;
	}

	public String getIm2() {
		return im2;
	}

	public void setIm2(String im2) {
		this.im2 = im2;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserdata() {
		return userdata;
	}

	public void setUserdata(String userdata) {
		this.userdata = userdata;
	}

	public boolean isSelect() {
		return isSelect;
	}

	public void setSelect(boolean isSelect) {
		this.isSelect = isSelect;
	}

	public boolean isOpen() {
		return isOpen;
	}

	public void setOpen(boolean isOpen) {
		this.isOpen = isOpen;
	}

	public boolean isCall() {
		return isCall;
	}

	public void setCall(boolean isCall) {
		this.isCall = isCall;
	}

	public boolean isChecked() {
		return isChecked;
	}

	public void setChecked(boolean isChecked) {
		this.isChecked = isChecked;
	}

	public boolean isHasChild() {
		return hasChild;
	}

	public void setHasChild(boolean hasChild) {
		this.hasChild = hasChild;
	}

	public boolean isNocheckbox() {
		return nocheckbox;
	}

	public void setNocheckbox(boolean nocheckbox) {
		this.nocheckbox = nocheckbox;
	}

	public boolean isDisabled() {
		return disabled;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public boolean isHasradio() {
		return hasradio;
	}

	public void setHasradio(boolean hasradio) {
		this.hasradio = hasradio;
	}
}
