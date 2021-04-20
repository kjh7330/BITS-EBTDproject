package com.ebtd.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.AdminCompanyMM;

@Controller
public class AdminCompanyController {
	
	@Autowired
	private AdminCompanyMM acm;	//관리자 회사관리 서비스 클래스
	
	ModelAndView mav;
	
	@RequestMapping(value = "/admin")
	public String getMain() {
		System.out.println("요기까지옴");
		
		return "/admin/mainForm";  //.jsp
	}
	//회사 등록 신청 목록 페이지
	@GetMapping(value = "/admin/company/getCompanyRequestList")
	public ModelAndView getCompanyRequestList() {
		mav=acm.getCompanyRequestList();
		return mav;
	}
	//회사 등록 신청 목록 - 상세
	@RequestMapping(value = "/admin/company/getCompanyRequestDetail")
	public ModelAndView getCompanyRequestDetail(String c_name) {
		mav=acm.getCompanyRequestDetail(c_name);
		return mav;
	}
	//회사 등록 신청 -> 승인하기
	@PostMapping(value = "/admin/company/setCompanyRequestApproval")
	public ModelAndView setCompanyRequestApproval(String c_name) {
		mav=acm.setCompanyRequestApproval(c_name);
		return mav;
	}
	//회사 등록 신청 -> 반려하기
	@PostMapping(value = "/admin/company/setCompanyRequestReject")
	public ModelAndView setCompanyRequestReject(String c_name) {
		mav=acm.setCompanyRequestReject(c_name);
		return mav;
	}
	//신규 노선 등록 신청 목록
	@GetMapping(value = "/admin/company/getNewBusRouteList")
	public ModelAndView getNewBusRouteList() {
		mav=acm.getNewBusRouteList();
		return mav;
	}
	//기존 노선 수정 신청 목록
	@GetMapping(value = "admin/company/getUpdateBusRouteList")
	public ModelAndView getUpdateBusRouteList() {
		mav=acm.getUpdateBusRouteList();
		return mav;
	}
	//버스 회사 이름 목록
	@GetMapping(value = "/company/getCompanyNameList")
	public String getCompanyNameList() {
		return "company/companyNameListForm";
	}
	//버스 회사 고객 소리함 목록
	@GetMapping(value = "/company/getCompanyQuestionList")
	public String getCompanyQuestionList() {
		return "company/companyQuestionListForm";
	}
	//버스 회사 승인 목록
	@GetMapping(value = "/company/getCompanyApprovalList")
	public String getCompanyApprovalList() {
		return "company/companyApprovalListForm";
	}
	//버스 회사 승인 목록 - 상세
	@GetMapping(value = "/company/getCompanyApprovalDetail")
	public String getCompanyApprovalDetail() {
		return "company/companyApprovalDetailForm";
	}
	//버스 회사 반려 목록
	@GetMapping(value = "/company/getCompanyRejectList")
	public String getCompanyRejectList() {
		return "company/companyRejectListForm";
	}
	//버스 회사 반려 목록 - 상세
	@GetMapping(value = "/company/getCompanyRejectDetail")
	public String getCompanyRejectDetail() {
		return "company/companyRejectDetailForm";
	}
	
		
}
