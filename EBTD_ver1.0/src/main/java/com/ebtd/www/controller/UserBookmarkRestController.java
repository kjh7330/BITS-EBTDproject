package com.ebtd.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.AdminUserMM;
import com.ebtd.www.service.UserBookmarkMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
@RequestMapping(value = "/user")
public class UserBookmarkRestController {

	@Autowired 
	private UserBookmarkMM ubm;	//관리자 이용자 관리 서비스 클래스

	ModelAndView mav;
	
	//즐겨찾기 별 색깔 없애면
	@PostMapping(value = "/deleteBookmark", produces =  "text/plain;charset=utf-8")
	public void deleteBookmark(String ub_no) throws JsonProcessingException {	
		ubm.deleteBookmark(ub_no);	
	}
	
	//즐겨찾기 별 색깔 생기면
	@PostMapping(value = "/insertBookmark", produces =  "text/plain;charset=utf-8")
	public void insertBookmark(String ub_no) throws JsonProcessingException {	
		ubm.insertBookmark(ub_no);
					
	}
}
