package com.naver.dgkim1007.service;

import java.util.ArrayList;

import com.naver.dgkim1007.entities.Buy;
import com.naver.dgkim1007.entities.Product;

public interface ProductDao {
	int codeConfirm (String code);
	int insertRow(Product product);
	int updateRow(Product product);
	ArrayList<Product> selectAll();
	Product selectOne(String code);
	int deleteRow(String code);
	void buyProductAdd(Buy buy);
	void buyProductStockSub(Buy buy);
	
}
