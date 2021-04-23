package com.ebtd.www.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.BusMM;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/company")
public class CompanyBusController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyBusController.class);
	@Autowired
	private BusMM bm;
	ModelAndView mav;
	
	@GetMapping(value = "/newBusForm")
	public ModelAndView newBusForm() throws JsonProcessingException { //신규 노선 등록 신청 페이지 이동
		System.out.println("URL");
		mav = new ModelAndView();
		mav = bm.getStopInfoList();
		return mav;
	}
}