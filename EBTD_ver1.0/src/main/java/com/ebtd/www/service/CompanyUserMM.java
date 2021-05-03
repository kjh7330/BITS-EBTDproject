package com.ebtd.www.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserReserveHistoryBean;
import com.ebtd.www.dao.I_CompanyUserDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CompanyUserMM {
	
	@Autowired
	I_CompanyUserDao uDao;
	
	//ModelAndView mav;
	
	public ModelAndView getCompanyUserHistory(String id) throws JsonProcessingException {
		ArrayList<UserReserveHistoryBean> uhList = new ArrayList<UserReserveHistoryBean>();
		uhList = uDao.getUserHistory(id);
		ObjectMapper om = new ObjectMapper();
		System.out.println("유저 히스토리"+uhList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("uhList", om.writeValueAsString(uhList));
		mav.setViewName("/company/CompanyUserHistory");
		return mav;
	}

	public ModelAndView getUserTotalInfo() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
