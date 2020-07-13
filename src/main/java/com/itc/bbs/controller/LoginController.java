package com.itc.bbs.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itc.bbs.domain.LoginVO;
import com.itc.bbs.domain.RegisterVO;
import com.itc.bbs.service.LoginService;
import com.itc.bbs.service.RegisterService;

@Controller
public class LoginController {
	@Autowired
	LoginService lService;

	@Autowired
	RegisterService rService;

	@GetMapping("/login")
	public String login() {
		return "login/login";
	}

	@PostMapping("/login")
	public @ResponseBody Object postCheckLogin(LoginVO vo, HttpSession session, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		LoginVO lVo = lService.checkLogin(vo);
		if (lVo.getCnt() > 0) {
			map.put("result", true);
			session.setAttribute("id", vo.getMemId());
			session.setAttribute("no", lVo.getMemNo());
		} else {
			map.put("result", false);
			model.addAttribute("check", "no");
		}
		return map;
//		if(lVo.getCnt() > 0) {
//			session.setAttribute("id", vo.getMemId());
//			session.setAttribute("no", lVo.getMemNo());			
//			return "board/board";
//		} else {
//			model.addAttribute("check", "no");
//			return "login/login";
//		}
	}

//	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("id");
		session.removeAttribute("no");
		return "redirect:/";
	}

	@GetMapping("/register")
	public String register() {
		return "login/register";
	}

	@PostMapping("/register")
	public String postRegister(RegisterVO vo, Model model) throws Exception {
		int result = rService.addUser(vo);
		if (result == 1) {
			return "redirect:/login";
		} else {
			return "login/register";
		}
	}

	@PostMapping("/idcheck")
	public @ResponseBody Object postIdCheck(RegisterVO vo, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
//		json �������� ���Ͻ�Ű������ ��ųʸ� ����
		int result = rService.idCheck(vo.getMemId());
//		result������ ���̵��ߺ�Ȯ�ΰ���� ����
		map.put("result", result);
//		map�� result��� Ű�� result�� ����
		return map;
	}

	@GetMapping("/find")
	public String find() {
		return "login/find";

	}

	@PostMapping("/infofind")
	public @ResponseBody Object postInfoFind(RegisterVO vo, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		RegisterVO rVo = rService.infoFind(vo);// db���� ���� ����
		if (rVo.getMemCnt() > 0) {
			map.put("result", true);
			map.put("id", rVo.getMemId());// �������� Ŭ���̾�Ʈ ���� ���� ������
			map.put("pw", rVo.getMemPasswd());
		} else {
			map.put("result", false);
		}
		return map;
	}
}
