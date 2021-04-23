package com.ebtd.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.AdminUserMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
@RequestMapping(value = "/admin/user")
public class AdminUserRestController {	//김아름
	
	@Autowired 
	private AdminUserMM aum;	//관리자 이용자 관리 서비스 클래스

	ModelAndView mav;
	
	//이용자 리스트에서 장애유형 선택하면
		@GetMapping(value = "/getUserSearchUType", produces =  "text/plain;charset=utf-8")
		public String getUserSearchUType(String u_type) throws JsonProcessingException {	
			String uInfoList = aum.getUserSearchUType(u_type);
			return uInfoList;		
		}
	
	//이용자 리스트에서 아이디 검색하면
	@GetMapping(value = "/getUserSearchUserName", produces =  "text/plain;charset=utf-8")
	public String getUserSearchUserName(String u_userName) throws JsonProcessingException {	
		String uInfoList = aum.getUserSearchUserName(u_userName);
		return uInfoList;		
	}

}
