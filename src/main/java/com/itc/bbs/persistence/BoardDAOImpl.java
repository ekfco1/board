package com.itc.bbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itc.bbs.domain.BoardVO;
import com.itc.bbs.domain.ResponseVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sql;

	private static String namespace = "bbs.mapper.boardMapper";

	@Override
	public List<BoardVO> getBoardList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getBoardList");
	}

	@Override
	public List<ResponseVO> getResList(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getResList", boardNo);
	}

	@Override
	public BoardVO readBoard(int BoardNo) { // TODO Auto-generated

		return sql.selectOne(namespace + ".readBoard", BoardNo);
	}

	@Override
	public int writeBoard(BoardVO vo) throws Exception {
		return sql.insert(namespace + ".writeBoard", vo);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {// 보낼때 타입 int 파라미터 vo
		// TODO Auto-generated method stub
		return sql.update(namespace + ".updateBoard", vo);
	}

	@Override
	public BoardVO setBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".setBoard", boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return sql.delete(namespace + ".deleteBoard", boardNo);
	}

	@Override
	public int postwriteRes(ResponseVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.insert(namespace + ".postwriteRes", vo);
	}
}
