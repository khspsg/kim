package com.naver.dgkim1007.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.dgkim1007.entities.Buy;

public interface BuyDao {
	Buy selectRow(int seq);
	int selectSequenceNo(Buy buy);
	void insertRow(Buy buy);
	ArrayList<Buy> selectBuySearchRollup(HashMap buysearch);// vendcode,yyyy,mm,dd
	ArrayList<Buy> selectBuySearchRollupMM(HashMap buysearch);// vendcode,yyyy,mm,dd
	void updateRow(Buy buy);
	void deleteRow(Buy buy);
}
