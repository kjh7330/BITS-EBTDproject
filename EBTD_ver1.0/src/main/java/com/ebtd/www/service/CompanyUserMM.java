package com.ebtd.www.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.CompanyBusBean;
import com.ebtd.www.bean.TownBean;
import com.ebtd.www.bean.UserReserveHistoryBean;
import com.ebtd.www.bean.VocBean;
import com.ebtd.www.dao.I_BusDao;
import com.ebtd.www.dao.I_CompanyUserDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CompanyUserMM {
	
	@Autowired
	I_CompanyUserDao uDao;
	@Autowired
	I_BusDao bDao;
	
	//ModelAndView mav;
	
	public ModelAndView getCompanyUserHistory(String id) throws JsonProcessingException {
		ArrayList<UserReserveHistoryBean> uhList = new ArrayList<UserReserveHistoryBean>();
		System.out.println("가지러 가자!!"+id+"의 히스토리를!!");
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
		ArrayList<Integer> cList = new ArrayList<Integer>();
		ArrayList<String> tList = new ArrayList<String>();
		ArrayList<Integer> aList = new ArrayList<Integer>();
		tList = bDao.getTownNameList();
		for(int i = 0; i < tList.size(); i++) { //송도123 연수123 청학123
				System.out.println(tList.get(i));
				System.out.println("휠체어 교통약자 : "+uDao.getUserTownWheelCount(tList.get(i)));
				System.out.println("시각장애 교통약자 : "+uDao.getUserTownBlindCount(tList.get(i)));
				uDao.getUserTownWheelCount(tList.get(i));
				cList.add(i, uDao.getUserTownWheelCount(tList.get(i)));
				cList.add(i, uDao.getUserTownBlindCount(tList.get(i)));
			};
		aList.add(0, uDao.getAllWheelCount());
		aList.add(1, uDao.getAllBlindCount());
		mav.addObject("cList", cList);
		mav.addObject("aList", aList);
		mav.setViewName("/company/CompanyUserTotal");
			/*
			 * for(int i = 1; i<=18; i++) cList.set(0, uDao.getUserTownCount());
			 */
		return mav;
	}

	public ModelAndView getBusNum(String id) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView();
		ArrayList<CompanyBusBean> bList = new ArrayList<CompanyBusBean>();
		ObjectMapper om = new ObjectMapper();
		bList = uDao.getBusNum(id);
		mav.addObject("busNum", om.writeValueAsString(bList));
		mav.setViewName("/company/CurrentPassengerForm");
		return mav;
	}

	public ModelAndView getVocList(String id) throws JsonProcessingException {
		ModelAndView mav = new ModelAndView();
		ArrayList<VocBean> vList = new ArrayList<VocBean>();
		ObjectMapper om = new ObjectMapper();
		vList = uDao.getVocList(id);
		mav.addObject("vList", om.writeValueAsString(vList));
		mav.setViewName("/company/VocForm");
		return mav;
	}

	public void addReply(VocBean vb) {
		vb.setV_no(vb.getA_no() - 1);
		uDao.addReply(vb);
		
	}
}
