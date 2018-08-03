package com.naver.dgkim1007.service;

import java.util.ArrayList;

import com.naver.dgkim1007.entities.Board;
import com.naver.dgkim1007.entities.BoardPaging;

public interface BoardDao {
	int insertRow(Board board);
	int insertReplyRow(Board board);
	int selectRowCount(String find);
	ArrayList<Board> pageList(BoardPaging boardpaging);
	Board selectOne(int b_seq);
	void updateHit(int b_seq);
	int updateRow(Board board);
	void deleteRowseq(int b_seq);
	void deleteRowref(int b_ref);
}
