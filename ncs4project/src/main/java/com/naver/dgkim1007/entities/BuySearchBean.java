package com.naver.dgkim1007.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BuySearchBean {
	private String searchvender;
	private String searchyyyy;
	private String searchmm;
	private String searchdd;
	public String getSearchvender() {
		return searchvender;
	}
	public void setSearchvender(String searchvender) {
		this.searchvender = searchvender;
	}
	public String getSearchyyyy() {
		return searchyyyy;
	}
	public void setSearchyyyy(String searchyyyy) {
		this.searchyyyy = searchyyyy;
	}
	public String getSearchmm() {
		return searchmm;
	}
	public void setSearchmm(String searchmm) {
		this.searchmm = searchmm;
	}
	public String getSearchdd() {
		return searchdd;
	}
	public void setSearchdd(String searchdd) {
		this.searchdd = searchdd;
	}
	
}
