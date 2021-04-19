package com.ebtd.www.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.TownBean;
import com.ebtd.www.dao.I_BusDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class BusMM {
	
	@Autowired
	private I_BusDao bDao;
	ModelAndView mav;
	public ModelAndView getStopInfoList() throws JsonProcessingException { //동읍면, 정류장 정보 가져오기
		ArrayList<StopBean> sList = new ArrayList<StopBean>();
		ArrayList<TownBean> tList = new ArrayList<TownBean>();
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		sList = bDao.getStopList();
		tList = bDao.getTownList();
		mav.addObject("sList", om.writeValueAsString(sList));
		mav.addObject("tList", om.writeValueAsString(tList));
		mav.setViewName("company/newBusForm");
		return mav;
	}
	public int busNumCheck(String busNum) { //버스번호 중복체크
		int checkResult = 0;
		checkResult = bDao.busNumCheck(busNum);
		return checkResult;
	}

	/*
	 * public ModelAndView addNewBus(HttpSession session) { mav = new
	 * ModelAndView(); String view = null; bDao.addNewBus(session); return mav; }
	 */

}
