package com.itc.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itc.bbs.domain.RegisterVO;
import com.itc.bbs.persistence.RegisterDAO;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	RegisterDAO dao;

	@Override
	public int addUser(RegisterVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.addUser(vo);
	}

	@Override
	public int idCheck(String memId) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(memId);
	}

	@Override
	public RegisterVO infoFind(RegisterVO vo) throws Exception {
		return dao.infoFind(vo);
	}

}
