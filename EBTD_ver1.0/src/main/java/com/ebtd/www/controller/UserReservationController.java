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
	
	@GetMapping(value = "/wheel/getBusList")
	public ModelAndView getBusList() throws JsonProcessingException {
		mav=urm.getBusList();
		return mav;
	}
}
