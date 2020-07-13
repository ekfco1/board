package com.itc.bbs.persistence;

import com.itc.bbs.domain.RegisterVO;

public interface RegisterDAO {

	public int addUser(RegisterVO vo) throws Exception;

	public int idCheck(String memId) throws Exception;

	public RegisterVO infoFind(RegisterVO vo) throws Exception;
}
