package com.ebtd.www.service;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.BusBean;
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
			view = "/user/wheel/ReservationForm";
		}else {
			view = "/user/wheel/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
}
