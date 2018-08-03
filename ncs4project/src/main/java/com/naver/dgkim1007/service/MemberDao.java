package com.naver.dgkim1007.service;

import java.util.ArrayList;

import com.naver.dgkim1007.entities.Member;

public interface MemberDao {
	int selectConfirm(String email);
	Member selectOne(String email);
	int insertRow(Member member);
	ArrayList<Member> selectAll();
	int updateRow(Member member);
	int deleteRow(String email);
	Member login(String email);
	void updatePassword(Member member);
}
