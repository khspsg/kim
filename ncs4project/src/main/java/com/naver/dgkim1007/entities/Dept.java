package com.naver.dgkim1007.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Dept {
	private String code;
	private String name;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
