package com.ebtd.www.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.DriverBusBean;
import com.ebtd.www.bean.DriverCompanyBean;
import com.ebtd.www.service.DriverMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/driver")
public class DriverController {
	private static final Logger logger = LoggerFactory.getLogger(DriverController.class);
	ModelAndView mav;
	
	@Autowired
	DriverMM dm;
	
	@GetMapping(value = "/getCompanyList", produces = "application/json;charset=utf-8")
	public ModelAndView getCompanyList () throws JsonProcessingException{
		return dm.getCompanyList();
	}
	@GetMapping(value = "/getBusList", produces = "application/json;charset=utf-8" )
	public ModelAndView getBusList(String c_username, HttpSession ss) throws JsonProcessingException {
		return dm.getBusList(c_username, ss);
	}
	@GetMapping(value = "/getDriverList", produces = "application/json;charset=utf-8" )
	public ModelAndView getDriverList(String ab_no, String b_no, String b_type,HttpSession ss) throws JsonProcessingException {
		return dm.getDriverList(ab_no, b_no, b_type, ss);
	}
	@GetMapping(value = "/getBusRouteList", produces = "application/json;charset=utf-8" )
	public ModelAndView getBusRouteList(String d_name, String d_no, HttpSession ss) throws JsonProcessingException {
		return dm.getBusRouteList(d_name, d_no, ss);
	}
	
	@GetMapping(value = "/DriverMainForm")
	public String driverMainForm(HttpSession ss, String d_name) {
		ss.setAttribute("d_name", d_name);
		return "/driver/DriverMainForm";//.jsp
	}
	@GetMapping(value = "/startForm")
	public String startForm() {
		return "/common/start";//.jsp
	}
	@GetMapping(value = "/CompanySelectForm")
	public String companySelectForm() {
		return "/driver/CompanySelectForm";//.jsp
	}
	@GetMapping(value = "/BusSelectForm")
	public String busSelectForm() {
		return "/driver/BusSelectForm";//.jsp
	}
	@GetMapping(value = "/DriverSelectForm")
	public String driverSelectForm() {
		return "/driver/DriverSelectForm";//.jsp
	}
}
