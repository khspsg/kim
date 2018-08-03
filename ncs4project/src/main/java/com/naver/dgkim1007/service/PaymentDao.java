package com.naver.dgkim1007.service;

import java.util.ArrayList;

import com.naver.dgkim1007.entities.Buy;
import com.naver.dgkim1007.entities.Payment;

public interface PaymentDao {
	int selectSequenceNo(Payment payment);
	Payment selectRow(int seq);
	void insertRow(Payment payment);
	void updateRow(Payment payment);
	ArrayList<Payment> selectPaymentSearchRollup(Payment payment);
	ArrayList<Buy> selectPaymentSearchRollupMM(Payment payment);
}
