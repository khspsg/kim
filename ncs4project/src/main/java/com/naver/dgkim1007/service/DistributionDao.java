package com.naver.dgkim1007.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.dgkim1007.entities.Balance;
import com.naver.dgkim1007.entities.Buy;
import com.naver.dgkim1007.entities.Payment;

public interface DistributionDao {
	ArrayList<Balance> balanceListYYYY( String yyyy );
	Balance balanceSelectOne( HashMap  balancekey );
	int balanceUpdate(Balance balance);
	void buyBalanceAdd(Buy buy);
	void buyBalanceSub(Buy buy);
	void paymentBalanceAdd(Payment payment);
	void paymentBalanceSub(Payment payment);
}
