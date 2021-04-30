package com.ebtd.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopBean;
import com.ebtd.www.service.UserReservationMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
@RequestMapping(value = "/user")
public class UserReservationRestController {
	@Autowired
	private UserReservationMM urm;
	
	
	@GetMapping(value="/busList", produces ="text/plain;charset=utf-8")
	public String busList() throws JsonProcessingException{
		String busList = urm.busList();
		return busList; 
	}
	
	@GetMapping(value="/stopList", produces ="text/plain;charset=utf-8")
	public String stopList() throws JsonProcessingException{
		String stopList = urm.stopList();
		return stopList; 
	}
	
	
}
