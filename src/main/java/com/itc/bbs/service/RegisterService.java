package com.itc.bbs.service;

//import org.springframework.beans.factory.annotation.Autowired;

import com.itc.bbs.domain.RegisterVO;

public interface RegisterService {

	public int addUser(RegisterVO vo) throws Exception;

	public int idCheck(String memId) throws Exception;

	public RegisterVO infoFind(RegisterVO vo) throws Exception;

}
