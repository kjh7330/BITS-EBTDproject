package com.ebtd.www.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.CompanyMainMM;
import com.ebtd.www.service.DriverMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RequestMapping(value = "/company/main")
@Controller
public class CompanyMainController {
	
	ModelAndView mav;
	
	@Autowired
	private CompanyMainMM cm;
	
	@PostMapping(value = "/join", produces = "application/json;charset=utf-8")
	public ModelAndView join (@RequestParam Map<String, String> data) throws JsonProcessingException{
		
		return cm.join(data);
	}
	
	@GetMapping(value = "/getRecommandedStopList", produces = "application/json;charset=utf-8")
	public ModelAndView data_test (@RequestParam Map<String, String> data) throws JsonProcessingException{
		return cm.getRecommandedStopList();
	}
	
}
