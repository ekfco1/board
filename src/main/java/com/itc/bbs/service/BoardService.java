package com.itc.bbs.service;

import java.util.List;

import com.itc.bbs.domain.BoardVO;
import com.itc.bbs.domain.ResponseVO;

public interface BoardService {

	public List<BoardVO> getBoardList() throws Exception;

	public BoardVO readBoard(int boardNo);

	public int writeBoard(BoardVO vo) throws Exception;

	public BoardVO setBoard(int boardNo);

	public int updateBoard(BoardVO vo) throws Exception;

	public int deleteBoard(int boardNo) throws Exception;

	public int postwriteRes(ResponseVO vo) throws Exception;

	public List<ResponseVO> getResList(int boardNo) throws Exception;
}
