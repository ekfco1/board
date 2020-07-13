package com.itc.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itc.bbs.domain.BoardVO;
import com.itc.bbs.domain.ResponseVO;
import com.itc.bbs.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;

	@Override
	public List<ResponseVO> getResList(int boardNo) throws Exception {
		// TODOAuto-generated method stub
		return dao.getResList(boardNo);
	}

	@Override
	public List<BoardVO> getBoardList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardList();
	}

	@Override
	public BoardVO readBoard(int boardNo) {
		return dao.readBoard(boardNo);
	}

	@Override
	public int writeBoard(BoardVO vo) throws Exception {
		return dao.writeBoard(vo);
	}

	@Override
	public BoardVO setBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.setBoard(boardNo);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int boardNo) throws Exception {
		return dao.deleteBoard(boardNo);
	}

	@Override
	public int postwriteRes(ResponseVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.postwriteRes(vo);
	}

}
