package com.ebtd.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ebtd.www.service.AdminStopMM;

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
		System.out.println("s_X ="+s_X);
		System.out.println("s_Y ="+s_Y);
		
		return ResponseEntity.ok(am.checkPosition(s_X, s_Y)); 
		
	}
	
}
