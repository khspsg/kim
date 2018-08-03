package com.naver.dgkim1007.service;

import java.util.ArrayList;

import com.naver.dgkim1007.entities.Vender;

public interface VenderDao {
	int codeConfirm (String code);
	int insertRow(Vender Vender);
	int updateRow(Vender Vender);
	ArrayList<Vender> selectAll();
	Vender selectOne(String code);
	int deleteRow(String code);
}
