package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.service.UserMypageMM;

@Controller
public class UserMypageController {
	
	@Autowired
	private UserMypageMM umm; //휠체어 마이페이지 서비스 클래스
	
	ModelAndView mav;
	
	@RequestMapping(value = "/user/myPage")
	public String getMypage(HttpSession session) {
		String view;
		if(session.getAttribute("u_username")!=null) {
			  view = "/user/wheel/myPageForm";}
		else {view = "/user/wheel/mainForm";}
		return view;
	}
	
	@GetMapping(value = "/user/getUserMyInfo")
	public ModelAndView getUserMyInfo(HttpSession session) {
		String u_username = (String) session.getAttribute("u_username");
		mav=umm.getUserMyInfo(u_username);
		return mav;
	}
	@PostMapping(value = "/user/setUserMyInfo")
	public ModelAndView setUserMyInfo(UserBean ub) {
		
		System.out.println("+++++++++++++++++++++++++++++++++"+ub.getU_userName());
		System.out.println("+++++++++++++++++++++++++++++++++"+ub.getU_name());
		
		mav=umm.setUserMyInfo(ub);
//		mav=umm.setUserMyInfo(u_userName, u_name, u_userphonenum, u_address, u_guardname, u_guardphonenum);
		return mav;
	}
}
