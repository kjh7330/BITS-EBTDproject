package com.ebtd.www.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.CompanyMainMM;
import com.ebtd.www.service.DriverMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RequestMapping(value = "/company/main")
@RestController
public class CompanyRestMainController {
	
	ModelAndView mav;
	
	@Autowired
	private CompanyMainMM cm;
	
	
	@GetMapping(value = "/carNumberDupCheck", produces = "application/json;charset=utf-8")
	public int carNumberDupCheck (int ab_no) {
		return cm.carNumberDupCheck(ab_no);
	}
	
}
