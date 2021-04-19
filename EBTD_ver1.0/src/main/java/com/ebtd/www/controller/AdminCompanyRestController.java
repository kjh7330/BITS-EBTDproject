package com.ebtd.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.Company;
import com.ebtd.www.service.AdminCompanyMM;

@RestController
public class AdminCompanyRestController {

	/*
	@Autowired
	private AdminCompanyMM acm;
	
	@PostMapping(value = "/admin/company/setCompanyRequestApproval", produces = "application/json;charset=utf-8")
	public ResponseEntity<?> setCompanyRequestApproval(String c_name) {
		List<Company> cList = acm.setCompanyRequestApproval(c_name);
		return ResponseEntity.ok(cList);
	}
	*/
}
