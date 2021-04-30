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
import com.ebtd.www.service.AdminStopMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController

public class AdminStopRestController {
	@Autowired
	private AdminStopMM am; 
	
	
	@GetMapping(value="/admin/stop/checkName", produces ="text/plain;charset=utf-8")
	public ResponseEntity<?> checkName(String s_Name){
		return ResponseEntity.ok(am.checkName(s_Name)); 
		
	}
	
	@GetMapping(value="/admin/stop/checkPosition", produces ="text/plain;charset=utf-8")
	public ResponseEntity<?> checkPosition(int s_X, int s_Y){
		
		return ResponseEntity.ok(am.checkPosition(s_X, s_Y)); 
		
	}
	
	@GetMapping(value = "/admin/stop/checkStopNo", produces="text/plain;charser=utf-8")
	public String stopList(String t_Name){
		return am.checkPosition(t_Name); 
	}
	
	@GetMapping(value="/admin/stop/search", produces ="text/plain;charset=utf-8")
	public String search(String search) throws JsonProcessingException{
		String sList = am.searchStop(search);
		
		return sList;
	}
	
}
