package com.ebtd.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.Company;
import com.ebtd.www.service.AdminCompanyMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
public class AdminCompanyRestController {

	@Autowired
	private AdminCompanyMM acm;

	//신규 노선 등록 신청 목록 - 노선보기
	@GetMapping(value = "/admin/company/getNewBusRouteDetail")
	public String getNewBusRouteDetail(String ap_b_no) throws JsonProcessingException {
		return acm.getNewBusRouteDetail(ap_b_no);
	}
	//신규 노선 등록 신청 목록 - 공문보기
	@GetMapping(value = "/admin/company/getNewBusOfficialDocument")
	public String getNewBusOfficialDocument(String ap_no) throws JsonProcessingException {
		return acm.getNewBusOfficialDocument(ap_no);
	}
	//신규 노선 등록 신청 목록 - 상세 공문에서 버스번호만
	@GetMapping(value = "/admin/company/getNewBusNumber")
	public String getNewBusNumber(String ap_no) throws JsonProcessingException {
		return acm.getNewBusNumber(ap_no);
	}
	
	
	//노선 변경 신청 목록 - 노선보기
	@GetMapping(value = "/admin/company/getUpdateBusRouteDetail")
	public String getUpdateBusRouteDetail(String ap_b_no) throws JsonProcessingException {
		return acm.getUpdateBusRouteDetail(ap_b_no);
	}
	//신규 노선 등록 신청 목록 - 공문보기
	@GetMapping(value = "/admin/company/getUpdateBusOfficialDocument")
	public String getUpdateBusOfficialDocument(String ap_no) throws JsonProcessingException {
		return acm.getUpdateBusOfficialDocument(ap_no);
	}
	//노선 변경 신청 목록 - 상세 공문에서 버스번호만
	@GetMapping(value = "/admin/company/getUpdateBusNumber")
	public String getUpdateBusNumber(String ap_no) throws JsonProcessingException {
		return acm.getUpdateBusNumber(ap_no);
	}
	

}
