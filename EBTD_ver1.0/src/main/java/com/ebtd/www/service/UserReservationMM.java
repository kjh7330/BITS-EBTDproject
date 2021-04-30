package com.ebtd.www.service;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.dao.I_UserReservationDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class UserReservationMM {
	@Autowired
	private I_UserReservationDao urDao;

	ModelAndView mav;
	
	//버스 정보 가져오기
	public ModelAndView getBusList() throws JsonProcessingException {
		mav = new ModelAndView();
		LinkedList<BusBean> bList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		
		bList = urDao.getBusList();
		if(bList!=null || bList.size()!=0) {
			mav.addObject("bList", om.writeValueAsString(bList));
			view = "/user/wheel/busReservationForm";
		}else {
			view = "/user/wheel/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}

	//정류장 정보 가져오기
	public ModelAndView getStopList() throws JsonProcessingException {
		mav = new ModelAndView();
		LinkedList<StopBean> sList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		
		sList = urDao.getStopList();
		if(sList!=null || sList.size()!=0) {
			mav.addObject("sList", om.writeValueAsString(sList));
			view = "/user/wheel/stopReservationForm";
		}else {
			view = "/user/wheel/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//ajax 정류장 정보 가져오기
	public String busList() throws JsonProcessingException {
		LinkedList<BusBean> bList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		
		bList = urDao.getBusList();
		if(bList!=null || bList.size()!=0) {
			return om.writeValueAsString(bList);
		}else {
			return "불러오기 실패";
		}
	}
	//ajax 정류장 정보 가져오기
	public String stopList() throws JsonProcessingException {
		LinkedList<StopBean> sList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		
		sList = urDao.getStopList();
		if(sList!=null || sList.size()!=0) {
			return om.writeValueAsString(sList);
		}else {
			return "불러오기 실패";
		}
	}
	//작업중
	public ModelAndView getBusDetail() {
		
		return null;
	}
	//작업중
	public ModelAndView getStopDetail() {
		
		return null;
	}


}
