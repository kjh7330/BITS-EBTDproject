package com.ebtd.www.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.CompanyStopMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
public class CompanyStopRestController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyStopRestController.class);
	@Autowired
	private CompanyStopMM sm;
	ModelAndView mav;

	//정류장 조회

	  @GetMapping(value = "/company/searchStop",produces="text/plain; charset=utf-8") 
	  public String companyIndexForm(String S_NAME) throws JsonProcessingException { 
	  String cList =sm.searchStop(S_NAME); 
	  return cList; }
	 

}
