package com.macrosoft.icms.util;


public class JQgridBaseAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6583047776116152197L;
	protected Integer page ;//当前页
	protected Integer total;//总页数
	protected Integer records;//总记录数
	protected Integer  rows;//每页显示多少条记录
	protected String sord;//索引
	protected String sidx;//排序方法
	
	// (1)添加和查询有关的成员变量search、searchField、searchString、searchOper  
	private boolean search;  
	private String searchField;  
	private String searchString;  
	private String searchOper;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getRecords() {
		return records;
	}
	public void setRecords(Integer records) {
		this.records = records;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public boolean isSearch() {
		return search;
	}
	public void setSearch(boolean search) {
		this.search = search;
	}
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	public String getSearchString() {
		return searchString;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	public String getSearchOper() {
		return searchOper;
	}
	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	} 
	

	
}
