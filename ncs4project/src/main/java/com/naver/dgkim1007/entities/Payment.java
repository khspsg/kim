package com.naver.dgkim1007.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Payment {
	private int seq;
	private String vendcode; 
	private String vendname; 
	private String yyyy; 
	private String mm; 
	private String dd; 
	private int no; 
	private int hang; 
	private int beforeamount; 
	private int amount; 
	private String balancecolumn; 
	private String beforepaywaycolumn; 
	private String paywaycolumn; 
	private String beforepayway; 
	private String payway; 
	private String memo;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getVendcode() {
		return vendcode;
	}
	public void setVendcode(String vendcode) {
		this.vendcode = vendcode;
	}
	public String getVendname() {
		return vendname;
	}
	public void setVendname(String vendname) {
		this.vendname = vendname;
	}
	public String getYyyy() {
		return yyyy;
	}
	public void setYyyy(String yyyy) {
		this.yyyy = yyyy;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHang() {
		return hang;
	}
	public void setHang(int hang) {
		this.hang = hang;
	}
	public int getBeforeamount() {
		return beforeamount;
	}
	public void setBeforeamount(int beforeamount) {
		this.beforeamount = beforeamount;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getBalancecolumn() {
		return balancecolumn;
	}
	public void setBalancecolumn(String balancecolumn) {
		this.balancecolumn = balancecolumn;
	}
	public String getBeforepaywaycolumn() {
		return beforepaywaycolumn;
	}
	public void setBeforepaywaycolumn(String beforepaywaycolumn) {
		this.beforepaywaycolumn = beforepaywaycolumn;
	}
	public String getPaywaycolumn() {
		return paywaycolumn;
	}
	public void setPaywaycolumn(String paywaycolumn) {
		this.paywaycolumn = paywaycolumn;
	}
	public String getBeforepayway() {
		return beforepayway;
	}
	public void setBeforepayway(String beforepayway) {
		this.beforepayway = beforepayway;
	}
	public String getPayway() {
		return payway;
	}
	public void setPayway(String payway) {
		this.payway = payway;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	} 
	
}
