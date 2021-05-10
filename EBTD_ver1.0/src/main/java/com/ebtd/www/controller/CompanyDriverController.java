package com.ebtd.www.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.DriverBean;
import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.dao.I_CompanyStopDao;
import com.ebtd.www.service.CompanyDriverMM;
import com.ebtd.www.service.CompanyStopMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class CompanyDriverController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyDriverController.class);
	@Autowired
	private CompanyDriverMM dm;
	private DriverBean db;
	ModelAndView mav;

	//	//회사 메인 페이지 
	//	@GetMapping(value = "/company/companyindexForm") 
	//	public String companyIndexForm() { 
	//		return "company/companyindex"; 
	//	}

	//기사 목록보기 페이지 이동 
	@GetMapping(value = "/company/getDriverList") 
	public ModelAndView getDriverList(HttpSession session) throws JsonProcessingException { 
		String c_username = (String) session.getAttribute("c_username");
		logger.info("기사 목록보기 페이지 이동"); 
		mav=dm.getDriverList(c_username);
		return mav; 

	}

	//기사 상세보기 페이지 이동 
	@GetMapping(value = "/company/getDriverDetail") 
	public ModelAndView getDriverDetail(Integer d_no) throws JsonProcessingException { 
		logger.info("기사 목록보기 페이지 이동"); 
		mav=dm.getDriverDetail(d_no);
		return mav; 

	}

	//기사 추가 페이지 이동 
	@GetMapping(value = "/company/addDriverForm") 
	public String addDriverForm() { 
		logger.info("기사 추가 페이지 이동"); 
		return "company/addDriverForm";

	}

	//기사 추가하기
	@RequestMapping(value = "/company/addDriver")
	public ModelAndView addDriver(DriverBean db){
		mav=dm.addDriver(db);
		return mav;	
	}

	//	@RequestMapping(value = "/company/addDriver")
	//	public ModelAndView addDriver(MultipartHttpServletRequest multi){
	//		System.out.println("b_title="+multi.getParameter("b_title"));
	//		System.out.println("bf="+multi.getFile("files").getOriginalFilename());
	//		mav=dm.addDriver(multi);
	//		return mav;	
	//	}
	//	

	//기사정보 수정하기
	@RequestMapping(value = "/company/updateDriver")
	public ModelAndView updateDriver(DriverBean db){
		mav=dm.updateDriver(db);
		return mav;	
	}

	//기사 삭제하기
	@RequestMapping(value = "/company/deleteDriver")
	public ModelAndView deleteDriver(int d_no){
		mav=dm.deleteDriver(d_no);
		return mav;	
	}

}
