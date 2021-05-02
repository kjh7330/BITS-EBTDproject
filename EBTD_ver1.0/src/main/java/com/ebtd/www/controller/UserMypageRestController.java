package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.service.AdminCompanyMM;
import com.ebtd.www.service.UserMypageMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
public class UserMypageRestController {

	@Autowired
	private UserMypageMM umm;

	//마이페이지 - 이용한 버스 노선 번호 가져오기
	@GetMapping(value = "/user/getReservationBusNum")
	public String getReservationBusNum(HttpSession session) throws JsonProcessingException {
		String u_username = (String) session.getAttribute("u_username");
		return umm.getReservationBusNum(u_username);
	}

	
}
