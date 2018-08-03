package com.naver.dgkim1007.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.dgkim1007.entities.Dept;
import com.naver.dgkim1007.entities.Salary;
import com.naver.dgkim1007.entities.SalaryRoll;

public interface SalaryDao {
	int empnoConfirm (String empno);
	int insertRow (Salary salary);
	ArrayList<Salary> selectAll();
	ArrayList<Dept> selectAllDept();
	Salary selectOne(String empno);
	int updateRow(Salary salary);
	int deleteRow(String empno);
	ArrayList<Salary> selectAllForNew();
	void salaryrollDelete(HashMap rollkey);
	void salaryrollInsertRow(SalaryRoll salaryroll);
	ArrayList<SalaryRoll> salaryrollList(HashMap yyyymm);
}
