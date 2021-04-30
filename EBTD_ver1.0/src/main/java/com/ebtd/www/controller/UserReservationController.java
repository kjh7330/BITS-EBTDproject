package com.ebtd.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.UserReservationMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping(value = "/user")
public class UserReservationController {
	
	@Autowired
	private UserReservationMM urm;
	
	ModelAndView mav;
	//전체 버스 출력
	@GetMapping(value = "/wheel/getBusList")
	public ModelAndView getBusList() throws JsonProcessingException {
		mav=urm.getBusList();
		return mav;
	}
	//전체 정류장 출력
	@GetMapping(value = "/wheel/getStopList")
	public ModelAndView getStopList() throws JsonProcessingException {
		mav=urm.getStopList();
		return mav;
	}
	//버스 노선 상세
	@GetMapping(value = "/wheel/getBusDetail")
	public ModelAndView getBusDetail(String b_No) {
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++"+b_No);
		mav=urm.getBusDetail();
		return mav;
	}
	//정류장 상세(정류장에 서는 버스들)
	@GetMapping(value = "/wheel/getStopDetail")
	public ModelAndView getStopDetail(int s_No) {
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++"+s_No);
		mav=urm.getBusDetail();
		return mav;
	}

}
