package com.ebtd.www.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.CompanyApplyListBean;
import com.ebtd.www.dao.I_ApplyConfirmDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CompanyApplyConfirmMM {

	@Autowired
	private I_ApplyConfirmDao apDao;
	ModelAndView mav;
	
	public ModelAndView getNewApplyConfirm(String id) throws JsonProcessingException {
		ArrayList<CompanyApplyListBean> aList = new ArrayList<CompanyApplyListBean>();
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		aList = apDao.getNewApplyConfirm(id);
		//System.out.println(aList);
		mav.addObject("aList", om.writeValueAsString(aList));
		System.out.println("모델 객체"+mav.getModel());
		return mav;
	}

	public ModelAndView getUpdateApplyConfirm(String id) throws JsonProcessingException {
		ArrayList<CompanyApplyListBean> aList = new ArrayList<CompanyApplyListBean>();
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		aList = apDao.getUpdateApplyConfirm(id);
		//System.out.println(aList);
		mav.addObject("aList", om.writeValueAsString(aList));
		System.out.println("모델 객체"+mav.getModel());
		return mav;
	}
}
