package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.UserBookmarkMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping(value = "/user")
public class UserBookmarkController {	//김아름
	private static final Logger logger = LoggerFactory.getLogger(DriverController.class);
	@Autowired 
	private UserBookmarkMM ubm;	//유저의 즐겨찾기 관리 서비스 클래스

	ModelAndView mav;

	//유저(휠체어+시각)의 즐겨찾기 리스트
	@GetMapping(value = "/getBookmarkList")
	public ModelAndView getBookmarkList(HttpSession session) throws JsonProcessingException {			
		mav = ubm.getBookmarkList(session);	
		return mav;		
	}
	
	//시각의 즐겨찾기 Detail
	@GetMapping(value = "/getBookmarkDetail")
	public ModelAndView getBookmarkDetail(HttpSession session, int ub_no) throws JsonProcessingException {			
		mav = ubm.getBookmarkDetail(session, ub_no);	
		return mav;		
	}
	
	//시각의 queryReservation
	@GetMapping(value = "/queryReservation")
	public ModelAndView queryReservation(HttpSession session, int ub_no) throws JsonProcessingException {			
		mav = ubm.queryReservation(session, ub_no);	
		return mav;		
	}
	

}
