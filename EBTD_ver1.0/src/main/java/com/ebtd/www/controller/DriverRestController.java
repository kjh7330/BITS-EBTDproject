package com.ebtd.www.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.DriverReserveBean;
import com.ebtd.www.service.DriverMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
@RequestMapping(value = "/driver")
public class DriverRestController {

	private static final Logger logger = LoggerFactory.getLogger(DriverRestController.class);
	ModelAndView mav;
	
	@Autowired
	DriverMM dm;
	
	@GetMapping(value = "/refresh", produces = "application/json;charset=utf-8")
	public List<DriverReserveBean> refresh (String car, boolean go, String wheel, String blind,  HttpSession ss) throws JsonProcessingException{
		return dm.refresh(car, go, wheel, blind, ss);
	}
	
	@GetMapping(value = "/on_out", produces = "application/json;charset=utf-8")
	public List<String> on (@RequestParam(value="on_data[]") List<String> on_data, @RequestParam(value="out_data[]") List<String> out_data ){
		return dm.on_out(on_data, out_data);
	}
}
