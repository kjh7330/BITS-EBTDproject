package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.UserIdMM;

@Controller
@RequestMapping(value="/wheel")
public class WheelController {
	@Autowired
	private UserIdMM uIdmm;
		
	ModelAndView mav;
	
	@RequestMapping(value = "/loginForm")
	public String joinForm(HttpSession session) {
		String view;
		//쿠키 확인 후 시각장애인일 경우 바로 이동
		/**/
		//세션에 아이디가 없을 경우만 Login으로 이동
		if(session.getAttribute("u_username")!=null) {view = "user/loginForm";}
		else {view = "wheel/mainForm";}
		
		return view;
	}
}
