package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.service.UserMypageMM;

@Controller
public class UserMypageController {
	
	@Autowired
	private UserMypageMM umm; //휠체어 마이페이지 서비스 클래스
	
	ModelAndView mav;
	
	@RequestMapping(value = "/user/wheel/myPage")
	public String getMypage(HttpSession session) {
		String view;
		if(session.getAttribute("u_username")!=null) {
			  view = "/user/wheel/myPageForm";}
		else {view = "/user/wheel/mainForm";}
		return view;
	}
	
/*	@GetMapping(value = "/user/wheel/getUserMyInfo")
	public ModelAndView getUserMyInfo() {
		System.out.println("정신차려");
		//String u_username = (String) session.getAttribute("u_username");
		//System.out.println(u_username);
		//mav=umm.getUserMyInfo();
		return mav;
	}*/
}
