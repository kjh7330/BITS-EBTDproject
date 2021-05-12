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
import com.ebtd.www.service.CompanyApplyConfirmMM;
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
	@Autowired
	private CompanyApplyConfirmMM am;
	
	ModelAndView mav;
	
	@GetMapping(value = "/newBusForm")
	public ModelAndView newBusForm() throws JsonProcessingException { //신규 노선 등록 신청 페이지 이동
		System.out.println("/newBusForm");
		mav = new ModelAndView();
		mav = bm.getStopInfoList();
		mav.setViewName("company/newBusForm");
		return mav;
	}
	@RequestMapping(value = "/mainForm")
	public ModelAndView mainForm() throws JsonProcessingException { //신규 노선 등록 신청 페이지 이동
		System.out.println("/mainForm");
		mav.setViewName("/company/companyindex");
		return mav;
	}
	@GetMapping(value = "/newApplyForm") 
	public ModelAndView newApplyForm(HttpSession session) throws JsonProcessingException {
		System.out.println("/newApplyForm");
		String id = session.getAttribute("c_username").toString();
		System.out.println(id);
		mav = am.getNewApplyConfirm(id);
		mav.setViewName("/company/newApplyForm");
		return mav;
	}
	@GetMapping(value = "/updateApplyForm")
	public ModelAndView updateApplyForm(HttpSession session) throws JsonProcessingException {
		System.out.println("/updateApplyForm");
		String id = session.getAttribute("c_username").toString();
		mav = am.getUpdateApplyConfirm(id);
		mav.setViewName("/company/updateApplyForm");
		return mav;
	}
	
	@PostMapping(value = "/applyNewBusRoute") //신규 노선 정보 요청하기
	public ModelAndView applyNewBusRoute(@RequestParam Map busRoute, Model model, HttpSession session) {
		model.addAttribute("busNum", busRoute.get("busNum"));
		Object id = session.getAttribute("c_username");
		Object busNum = model.getAttribute("busNum");
		mav = new ModelAndView();
		System.out.println("버스넘버는"+model.getAttribute("busNum"));
		System.out.println("세션은"+session.getAttribute("c_username"));
		int od_no = bm.get_od_no(session.getAttribute("c_username").toString());
		mav = bm.applyNewBusRoute(id, busNum, od_no);
		mav = bm.applyNewBusRouteDetail(busRoute, model); //순서 바꿔야함 밑이랑
		mav = bm.addBusNumber(busRoute, model);
		mav.setViewName("redirect:/company/mainForm");
		return mav;
	}
	@GetMapping(value = "/existBusUpdateForm")
	public ModelAndView existBusUpdateForm() throws JsonProcessingException { //기존 노선 변경 페이지 이동
		mav = new ModelAndView();
		mav = bm.getStopInfoList();
		mav.setViewName("company/existBusUpdateForm");
		return mav;
	}
	@PostMapping(value = "/applyUpdateBusRoute") //기존 노선 정보 변경 요청하기
	public ModelAndView applyUpdateBusRoute(@RequestParam Map busRoute, Model model, HttpSession session) {
		model.addAttribute("busNum", busRoute.get("busNum"));
		Object id = session.getAttribute("c_username");
		Object busNum = model.getAttribute("busNum");
		mav = new ModelAndView();
		System.out.println("버스넘버는"+model.getAttribute("busNum"));
		System.out.println("세션은"+session.getAttribute("c_username"));
		bm.applyUpdateBusRoute(id, busNum, bm.get_od_no(session.getAttribute("c_username").toString()));
		bm.applyUpdateBusRouteDetail(busRoute, model); //순서 바꿔야함 밑이랑
		/* mav = bm.addUpdateBusNumber(busRoute, model); */
		mav.setViewName("redirect:/company/mainForm");
		return mav;
	}
}