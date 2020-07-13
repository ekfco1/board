package com.itc.bbs.service;

import com.itc.bbs.domain.LoginVO;

public interface LoginService {
	public LoginVO checkLogin(LoginVO vo) throws Exception;
}
