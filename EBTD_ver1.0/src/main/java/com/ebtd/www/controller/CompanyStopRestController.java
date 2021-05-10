package com.ebtd.www.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.CompanyStopMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
public class CompanyStopRestController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyStopRestController.class);
	@Autowired
	private CompanyStopMM sm;
	ModelAndView mav;


	//정류장 이름 중복조회
	@GetMapping(value = "/company/checkSaName", produces="text/plain; charset=utf-8")
	public ResponseEntity<?> checkSaName(String S_NAME) {
		return ResponseEntity.ok(sm.checkSaName(S_NAME));
	}

	//정류장 위치 중복조회
	@GetMapping(value = "/company/checkSaPosition", produces="text/plain; charset=utf-8")
	public ResponseEntity<?> checkSaPosition(int S_X, int S_Y) {
		return ResponseEntity.ok(sm.checkSaPosition(S_X, S_Y));
	}

}
