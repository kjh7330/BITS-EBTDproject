package com.ebtd.www.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.CompanyStopMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class CompanyStopController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyBusController.class);
	@Autowired
	private CompanyStopMM sm;
	ModelAndView mav;

	@GetMapping(value = "/company/companyindexForm") 
	public String companyIndexForm() { //정류장 목록보기 페이지 이동 
		logger.info("정류장 목록보기 페이지 이동"); 
		return "company/companyindex"; 
		
	}
	
	@GetMapping(value = "/company/getStopList") 
	public ModelAndView getStopList() throws JsonProcessingException { //정류장 목록보기 페이지 이동 
		logger.info("정류장 목록보기 페이지 이동"); 
		mav=sm.getStopList();
		return mav; 
		
	}
	
	@GetMapping(value = "/company/addNewStop") 
	public String addNewStopForm() { //정류장 신청 페이지 이동 
		logger.info("정류장 신청 페이지 이동"); 
		//sm.addNewStop();
		return "company/addNewStopForm";
	}
}
