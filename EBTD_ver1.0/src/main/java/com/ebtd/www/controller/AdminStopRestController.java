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
	
	/*
	 * @GetMapping(value="/admin/stop/checkName", produces =
	 * "text/plain;charset=utf-8") public ResponseEntity<?> checkName(String
	 * s_Name){ //ResponseEntity<T> 결과값과 통신의 상태값까지 저장 System.out.println("dddddd");
	 * return ResponseEntity.ok(am.checkName(s_Name)); }
	 */
	
//	@GetMapping(value="/admin/stop/checkName", produces = "text/plain;charset=utf-8")
//	public ResponseEntity<?> checPosition(Integer s_X, Integer s_Y){ 
//		System.out.println("ddd");
//		System.out.println(s_X);
//		System.out.println(s_Y);
//		return ResponseEntity.ok(am.checkPosition(s_X, s_Y));
//	}
}
