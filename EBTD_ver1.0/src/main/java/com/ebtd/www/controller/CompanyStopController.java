package com.ebtd.www.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.service.CompanyStopMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class CompanyStopController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyBusController.class);


	@Autowired
	private CompanyStopMM sm;
	ModelAndView mav;

	//회사 메인 페이지 
	@GetMapping(value = "/company/companyindexForm") 
	public String companyIndexForm() { 
		return "company/companyindex"; 
	}

	//정류장 목록보기 페이지 이동 
	@GetMapping(value = "/company/getStopList") 
	public ModelAndView getStopList(Integer pageNum) throws JsonProcessingException { 
		logger.info("정류장 목록보기 페이지 이동"); 
		mav=sm.getStopList(pageNum);
		return mav; 

	}
	
	//정류장 정보 상세보기 페이지 이동
	@GetMapping(value = "/company/getStopDetail") 
	public ModelAndView getStopDetail(Integer S_NO) throws JsonProcessingException { 
		logger.info("정류장 정보 상세보기 페이지 이동"); 
		
		mav=sm.getStopDetail(S_NO);
		return mav;

	}

	//정류장 신청 페이지 이동 
	@GetMapping(value = "/company/addNewStopForm") 
	public String addNewStopForm() { 
		logger.info("정류장 신청 페이지 이동"); 
		return "company/addNewStopForm";

	}

	//정류장 신청하기
	@RequestMapping(value = "/company/addNewStop")
	public ModelAndView addNewStop(StopApplyBean sa){
		mav=sm.addNewStop(sa);
		return mav;	
	}


	//정류장 신청내역 보기 페이지 이동 
	@GetMapping(value = "/company/getNewStopConfirmList") 
	public ModelAndView getNewStopConfirmList() throws JsonProcessingException { 
		logger.info("정류장 신청내역 보기 페이지 이동"); 
		mav=sm.getNewStopConfirmList();
		return mav; 

	}

	//정류장 신청정보 상세보기 페이지 이동
		@GetMapping(value = "/company/getStopApplyDetail") 
		public ModelAndView getStopApplyDetail(Integer sa_No) throws JsonProcessingException { 
			logger.info("정류장 신청 정보 상세보기 페이지 이동"); 	
			mav=sm.getStopApplyDetail(sa_No);
			return mav;
		}

}
