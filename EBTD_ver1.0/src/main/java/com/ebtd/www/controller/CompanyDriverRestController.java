package com.ebtd.www.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.CompanyBusBean;
import com.ebtd.www.service.CompanyDriverMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
public class CompanyDriverRestController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyDriverRestController.class);
	@Autowired
	private CompanyDriverMM dm;
	ModelAndView mav;

	//해당회사 노선 가져오기
	@GetMapping(value = "/company/getCompanyBusList", produces="text/plain; charset=utf-8")
	public String getCompanyBusList(String C_USERNAME) throws JsonProcessingException {
		//return ResponseEntity.ok(dm.getCompanyBusList(C_USERNAME));
		return dm.getCompanyBusList(C_USERNAME);
	}

	//드라이버 삭제
	@GetMapping(value = "/company/deleteDriver", produces="text/plain; charset=utf-8")
	public ModelAndView deleteDriver(int d_no){
		System.out.println("#######"+d_no);
		//return ResponseEntity.ok(dm.getCompanyBusList(C_USERNAME));
		return dm.deleteDriver(d_no);
	}

}
