package com.naver.dgkim1007.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class Salary {
	private String empno;
	private String dept; //select box
	private String name;
	private String input_date;
	private String birth_date; //date picker
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int pay;  //기본급
	private int extra; //수당
	private String yn;   // "y" "n" 
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public int getPartner() {
		return partner;
	}
	public void setPartner(int partner) {
		this.partner = partner;
	}
	public int getDependent20() {
		return dependent20;
	}
	public void setDependent20(int dependent20) {
		this.dependent20 = dependent20;
	}
	public int getDependent60() {
		return dependent60;
	}
	public void setDependent60(int dependent60) {
		this.dependent60 = dependent60;
	}
	public int getDisabled() {
		return disabled;
	}
	public void setDisabled(int disabled) {
		this.disabled = disabled;
	}
	public int getWomanpower() {
		return womanpower;
	}
	public void setWomanpower(int womanpower) {
		this.womanpower = womanpower;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getExtra() {
		return extra;
	}
	public void setExtra(int extra) {
		this.extra = extra;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
	
}
