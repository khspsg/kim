package com.naver.dgkim1007.entities;

import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class Member {
	private String email;
	private String name;
	private String password;
	private String phone1;
	private String phone2;
	private String phone3;
	private String postno;
	private String addr1;
	private String addr2;
	private String inputdate;
	private String photo;
	private String beforephoto;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getPostno() {
		return postno;
	}
	public void setPostno(String postno) {
		this.postno = postno;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getBeforephoto() {
		return beforephoto;
	}
	public void setBeforephoto(String beforephoto) {
		this.beforephoto = beforephoto;
	}
	
}
