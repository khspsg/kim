package com.naver.dgkim1007.entities;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Buy {
   private int seq;
   private String vendcode;
   private String vendname;
   private String yyyy;
   private String mm;
   private String dd;
   private int no;
   private int hang;
   private String procode;
   private String proname;
   private int price;
   private int qty;
   private int total;
   private String memo;
   private String procolumn;
   private String balancecolumn;
   private String dealcolumn;
   private int stock;
   private int beforeqty; //업데이트 때 사용될 원래의 수량
   private String beforeprocode; //업데이트 때 사용될 원래의 수량
   private String beforeprice; //업데이트 때 사용될 원래의 수량
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
public String getProcode() {
	return procode;
}
public void setProcode(String procode) {
	this.procode = procode;
}
public String getProname() {
	return proname;
}
public void setProname(String proname) {
	this.proname = proname;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}
public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
public String getMemo() {
	return memo;
}
public void setMemo(String memo) {
	this.memo = memo;
}
public String getProcolumn() {
	return procolumn;
}
public void setProcolumn(String procolumn) {
	this.procolumn = procolumn;
}
public String getBalancecolumn() {
	return balancecolumn;
}
public void setBalancecolumn(String balancecolumn) {
	this.balancecolumn = balancecolumn;
}
public String getDealcolumn() {
	return dealcolumn;
}
public void setDealcolumn(String dealcolumn) {
	this.dealcolumn = dealcolumn;
}
public int getStock() {
	return stock;
}
public void setStock(int stock) {
	this.stock = stock;
}
public int getBeforeqty() {
	return beforeqty;
}
public void setBeforeqty(int beforeqty) {
	this.beforeqty = beforeqty;
}
public String getBeforeprocode() {
	return beforeprocode;
}
public void setBeforeprocode(String beforeprocode) {
	this.beforeprocode = beforeprocode;
}
public String getBeforeprice() {
	return beforeprice;
}
public void setBeforeprice(String beforeprice) {
	this.beforeprice = beforeprice;
}
   
}