package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.VocBean;
import com.ebtd.www.service.BusMM;
import com.ebtd.www.service.CompanyApplyConfirmMM;
import com.ebtd.www.service.CompanyUserMM;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/company/user")
public class CompanyUserController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyUserController.class);
	@Autowired
	CompanyUserMM um;
	ModelAndView mav;
	
	@GetMapping(value = "/history")
	public ModelAndView CompanyUserHistory(HttpSession session) throws JsonProcessingException {
		System.out.println("/history");
		String id = session.getAttribute("c_username").toString();
		mav = um.getCompanyUserHistory(id);
		return mav;
	};
	
	@GetMapping(value = "/total")
	public ModelAndView CompanyUserTotal() {
		System.out.println("/total");
		mav = um.getUserTotalInfo();
		return mav;
	}
	@GetMapping(value = "/currentpassenger")
	public ModelAndView CompanyCurrentPassenger(HttpSession session) throws JsonProcessingException {
		System.out.println("/currentpassenger");
		String id = session.getAttribute("c_username").toString();
		mav = um.getBusNum(id);
		return mav;
		
	}
	@GetMapping(value = "/vocForm")
	public ModelAndView vocForm(HttpSession session) throws JsonProcessingException {
		System.out.println("/vocForm");
		String id = session.getAttribute("c_username").toString();
		mav = um.getVocList(id);
		return mav;
	}
	@PostMapping(value = "/addReply")
	public ModelAndView addReply(VocBean vb) {
		System.out.println("/addReply");
		um.addReply(vb);
		return mav;
	}
}
