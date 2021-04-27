package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.CompanyAliasBean;
import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBean_ch;
import com.ebtd.www.dao.I_BusDao;
import com.ebtd.www.service.UserIdMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping(value="/user")
public class UserIdController {
	@Autowired
	private UserIdMM uIdmm;
		
	@Autowired
	I_BusDao bDao;
	
	ModelAndView mav;
	
	@RequestMapping(value = "/joinForm")
	public String joinForm(HttpSession session) {
		String view;
		//쿠키 확인 후 시각장애인일 경우 바로 이동
		/**/
		//세션에 아이디가 없을 경우만 Login으로 이동
		if(session.getAttribute("u_username")==null) {view = "user/joinSelectType";}
		else {view = "wheel/mainForm";}
		
		return view;
	}
	
	@RequestMapping(value = "/wheel/join")
	public ModelAndView wheelJoinForm() throws JsonProcessingException {
		mav = uIdmm.getTownList();
		mav.setViewName("wheel/wheelJoin");
		return mav;
	}
	//wheel/joinAccess
	@PostMapping(value = "/wheel/joinAccess")
	public ModelAndView userJoinResult(UserBean_ch ub, HttpSession session) {
		System.out.println("회원가입 등록");
		mav = uIdmm.wheelUserJoinResult(ub);
		
		if(mav!=null) {return mav;}
		else {joinForm(session);
		
		}return mav;
		
	}
	@PostMapping(value = "/wheel/login")
	public ModelAndView login(UserBean_ch ub, HttpSession session) {
		
		mav = uIdmm.wheelLogin(ub,session);
		System.out.println(session.getAttribute("u_username"));
		return mav;
	}
	
}
























