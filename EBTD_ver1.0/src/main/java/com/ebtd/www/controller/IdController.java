package com.ebtd.www.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.CompanyAliasBean;
import com.ebtd.www.service.IdMM;

//관리자 - 로그인 및 회원가입에 관한 컨트롤러
@Controller
public class IdController {
	@Autowired
	private IdMM idmm;
//	@Autowired
//	private CommonMM cmMM;
	//전역변수 mav 등록
	ModelAndView mav;
	
	//로그인 페이지로 이동
	@RequestMapping(value = "/loginForm")
	public ModelAndView loginForm(HttpSession session) {		
		//로그인 창으로 이동합니다.
		mav = new ModelAndView();
		String view = null;
		
		//세션에 아이디가 없을 경우만 Login으로 이동
		if(session.getAttribute("id")==null) {view = "loginForm";}
		else {view = "admin/mainForm";}
		
		mav.setViewName(view);
		return mav;	//.jsp
	}
	
	@GetMapping(value="/joinForm")
	public ModelAndView joinForm(HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		//세션에 아이디가 없을경우만 조인페이지 이동
		//아닐 시 메인페이지 이동
		if(session.getAttribute("id")==null) {view = "join";}
		else {view = "/admin/mainForm";}
		
		mav.setViewName(view);
		return mav;
	}
	@PostMapping(value = "/login")
	public ModelAndView login(CompanyAliasBean cb, HttpSession session) {
		
		//login service이동
		mav = idmm.login(cb,session);
		System.out.println(session.getAttribute("c_username"));
		return mav;
	}
	
}















