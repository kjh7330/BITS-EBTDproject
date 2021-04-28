package com.ebtd.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	//이용자 히스토리 조건:이용일 검색
	@GetMapping(value = "/getUserHistoryDateList", produces =  "text/plain;charset=utf-8")		
	public String getUserHistoryDateList(String urh_date) throws JsonProcessingException {	
										//보내주는 애랑 이름 같아야함
		return aum.getUserHistoryDateList(urh_date);		
	}
	
	//이용자 히스토리 조건:아이디 검색
	@GetMapping(value = "/getUserHistoryUserName", produces =  "text/plain;charset=utf-8")
	public String getUserHistoryUserName(String u_userName) throws JsonProcessingException {	
		
		return aum.getUserHistoryUserName(u_userName);		
	}
	
	//이용자 히스토리 조건:회사명 검색
		@GetMapping(value = "/getUserHistoryCompanyName", produces =  "text/plain;charset=utf-8")
		public String getUserHistoryCompanyName(String c_userName) throws JsonProcessingException {	
			
			return aum.getUserHistoryCompanyName(c_userName);		
		}
	//이용자 히스토리 조건:버스번호 검색
		@GetMapping(value = "/getUserHistoryBusNum", produces =  "text/plain;charset=utf-8")
		public String getUserHistoryBusNum(String b_no) throws JsonProcessingException {	
			
			return aum.getUserHistoryBusNum(b_no);		
		}
	
	
}
