package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserReservationBean;
import com.ebtd.www.service.UserReservationMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping(value = "/user")
public class UserReservationController {
	
	@Autowired
	private UserReservationMM urm;
	
	ModelAndView mav;
	//전체 버스 출력
	@GetMapping(value = "/getBusList")
	public ModelAndView getBusList() throws JsonProcessingException {
		mav=urm.getBusList();
		return mav;
	}
	//전체 정류장 출력
	@GetMapping(value = "/getStopList")
	public ModelAndView getStopList() throws JsonProcessingException {
		mav=urm.getStopList();
		return mav;
	}
	//버스 노선 상세
	@GetMapping(value = "/getBusDetail")
	public ModelAndView getBusDetail(String b_No) throws JsonProcessingException {
		mav=urm.getBusDetail(b_No);
		return mav;
	}
	//정류장 상세(정류장에 서는 버스들)
	@GetMapping(value = "/getStopDetail")
	public ModelAndView getStopDetail(int s_No) throws JsonProcessingException {
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++"+s_No);
		mav=urm.getStopDetail(s_No);
		return mav;
	}
	@PostMapping(value = "/reservation")
	public ModelAndView reservation(UserReservationBean ur, HttpSession session) {
		mav = urm.reservation(ur, session);
		return mav;
	}
	
	@GetMapping(value = "/reservationCheck")
	public ModelAndView reservationCheck(HttpSession session) throws JsonProcessingException {
		System.out.println("뀨뀨뀨");
		mav = urm.reservationCheck(session);
		return mav;
	}
	

}
