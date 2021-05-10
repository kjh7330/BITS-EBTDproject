package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.dao.I_BusDao;
import com.ebtd.www.service.UserIdMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping(value="/user")
public class UserLoginController { //휠체어의 페이지이동
	@Autowired
	private UserIdMM uIdmm;
	@Autowired
	I_BusDao bDao;
	ModelAndView mav;
	
	@RequestMapping(value = "/wheel/joinForm")
	public String joinForm(HttpSession session) {
		String view;
		//쿠키 확인 후 시각장애인일 경우 바로 이동
		/**/
		//세션에 아이디가 없을 경우만 Login으로 이동
		if(session.getAttribute("u_username")!=null) {view = "user/loginForm";}
		else {view = "/user/wheel/mainForm";}
		
		return view;
	}
	@RequestMapping(value = "/blind/join")
	public ModelAndView blindJoinForm(HttpSession session) throws JsonProcessingException {
		mav = uIdmm.getTownList();
		mav.addObject("type", 1);
		mav.setViewName("/user/wheel/wheelJoin");
		return mav;
	}
	
	@RequestMapping(value = "/wheel/mainForm")
	public String WheelMainForm(HttpSession session) {
		String view;
		//쿠키 확인 후 시각장애인일 경우 바로 이동
		/**/
		//쿠키 확인 후 시각장애인일 경우 바로 이동
		//세션에 아이디가 없을 경우만 Login으로 이동
		if(session.getAttribute("u_username")==null) {view = "user/loginForm";}
		//else {view = "/user/wheel/mainForm";}
		else {view = "/user/reservationCheck";}
		return view;
	}
	@RequestMapping(value = "/blind/mainForm")
	public String BlindMainForm(HttpSession session) {
		String view;
		//쿠키 확인 후 시각장애인일 경우 바로 이동
		/**/
		//쿠키 확인 후 시각장애인일 경우 바로 이동
		//세션에 아이디가 없을 경우만 Login으로 이동
		if(session.getAttribute("u_username")==null) {view = "/user/loginForm";}
		//else {view = "/user/blind/mainForm";}
		else {view = "redirect:/user/reservationCheck";}
		
		return view;
	}
}
