package com.itc.bbs.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.itc.bbs.domain.BoardVO;
import com.itc.bbs.domain.LoginVO;
import com.itc.bbs.domain.RegisterVO;
import com.itc.bbs.domain.ResponseVO;
import com.itc.bbs.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService bService;
	
	
	/*
	 * @Autowired ResgisterService rService;
	 */
	@GetMapping("/")
	public String board(Model model) throws Exception {
		model.addAttribute("list", bService.getBoardList());
		return "board/board";
	}


	@GetMapping("/readBoard")
	public String readBoard(@RequestParam(value="boardNo", required=true) int boardNo, Model model) throws Exception {
		model.addAttribute("board", bService.readBoard(boardNo));
		model.addAttribute("list", bService.getResList(boardNo));
		return "board/readBoard";
	}

	@GetMapping("/deleteBoard")
	public String deleteBoard(int boardNo) throws Exception {
		int result = bService.deleteBoard(boardNo);
		if(result < 1) {
			return "board/readboard";
		}else {
		return "redirect:/";
		}
	}

	@GetMapping("/writeBoard")
	public String writeBoard(BoardVO vo, Model model) {
		return "board/writeBoard";
	}
	
	@PostMapping("/writeBoard")
	public String postWriteBoard(BoardVO vo, HttpSession session) throws Exception { //session으로 멤버변수 가져오기
		vo.setMemNo(Integer.parseInt((String) session.getAttribute("no")));
		int writeboard = bService.writeBoard(vo);
		return "redirect:/";
	}
	
	@PostMapping("/updateBoard")
	public String updateBoard(BoardVO vo, HttpSession session) throws Exception {
		vo.setMemNo(Integer.parseInt((String) session.getAttribute("no")));
		int updateboard = bService.updateBoard(vo);
		return "redirect:/readBoard?boardNo="+vo.getBoardNo();
	}
	
	@GetMapping("/updateBoard")
	public String setBoard(@RequestParam(value="boardNo", required=true) int boardNo, Model model) {
		model.addAttribute("update", bService.readBoard(boardNo));
		return "board/updateBoard";
	}
	
	
	@RequestMapping(value = "/boardComment", method = RequestMethod.POST)
	public @ResponseBody int postwriteRes(Model model, ResponseVO vo, HttpSession session) throws Exception {
			HashMap<String, Object> map = new HashMap<String, Object>();
            vo.setMemNo(Integer.parseInt((String) session.getAttribute("no")));
            return bService.postwriteRes(vo);
    }
	

	}
