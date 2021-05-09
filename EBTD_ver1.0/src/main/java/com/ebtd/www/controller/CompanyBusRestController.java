package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.BusMM;

@RestController
@RequestMapping(value = "/company/bus")
public class CompanyBusRestController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyBusController.class);
	@Autowired
	private BusMM bm;
	ModelAndView mav;

	@GetMapping(value = "/busNumCheck")
	public int busNumCheck(String busNum) {
		System.out.println("ajax 통신 성공");
		int checkResult = bm.busNumCheck(busNum);
		System.out.println(checkResult);

		return checkResult;
	}
	
	@GetMapping(value = "/existBusNumCheck")
	public int existBusNumCheck(String busNum, HttpSession session) {
		System.out.println("ajax 통신 성공");
		System.out.println("노선번호 확인 :"+ busNum);
		int checkResult = bm.existBusNumCheck(busNum, session);
		return checkResult;
	}

}
