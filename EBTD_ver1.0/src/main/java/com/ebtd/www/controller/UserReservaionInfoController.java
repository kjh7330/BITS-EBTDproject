package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserReservationBean;
import com.ebtd.www.service.UserReservaionInfoMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping(value = "/user")
public class UserReservaionInfoController {	//김아름

	private static final Logger logger = LoggerFactory.getLogger(DriverController.class);
	@Autowired 
	private UserReservaionInfoMM urim;	

	ModelAndView mav;

	//예약 확인 - 예약내역 가져오기
	@GetMapping(value = "/getReservationInfo")
	public ModelAndView getReservationInfo(HttpSession session) throws JsonProcessingException {			
		mav = urim.getReservationInfo(session);	
	return mav;		
	}
	
	//예약 확인 - 예약 상세내역 가져오기
	@GetMapping(value = "/getReservationDetail")
	public ModelAndView getReservationDetail(UserReservationBean rb) throws JsonProcessingException {			
		mav = urim.getReservationDetail(rb);	
	return mav;		
	}
	
	//예약 취소 : ur_state 값 변경 (0 --> 1)
	@PostMapping(value = "/reservationCancel")
	public ModelAndView reservationCancel(UserReservationBean rb) throws JsonProcessingException {			
		mav = urim.reservationCancel(rb);	
	return mav;		
	}
	
}
