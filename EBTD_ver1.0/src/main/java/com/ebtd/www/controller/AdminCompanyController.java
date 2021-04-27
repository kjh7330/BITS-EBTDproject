package com.ebtd.www.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.service.AdminCompanyMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
public class AdminCompanyController {
	
	@Autowired
	private AdminCompanyMM acm;	//관리자 회사관리 서비스 클래스
	
	ModelAndView mav;
	
	@RequestMapping(value = "/admin")
	public String getMain() {
		return "/admin/mainForm";  //.jsp
	}
	
	/* ---------- [회사 관리] - [회사 등록 승인] ---------- */
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
	public ModelAndView setCompanyRequestReject(String c_username) {
		mav=acm.setCompanyRequestReject(c_username);
		return mav;
	}
	
	/* ---------- [회사 관리] - [신규 노선 등록] ---------- */
	//신규 노선 등록 신청 목록
	@GetMapping(value = "/admin/company/getNewBusRouteList")
	public ModelAndView getNewBusRouteList() {
		mav=acm.getNewBusRouteList();
		return mav;
	}
	//신규 노선 등록 -> 승인하기
	@PostMapping(value = "/admin/company/setNewBusRouteApproval")
	public ModelAndView setNewBusRouteApproval(String ap_b_no) {
		mav=acm.setNewBusRouteApproval(ap_b_no);
		return mav;
	}
	//신규 노선 등록  -> 반려하기
	@PostMapping(value = "/admin/company/setNewBusRouteReject")
	public ModelAndView setNewBusRouteReject(@RequestParam Map<String, Object>cMap) {
		mav=acm.setNewBusRouteReject(cMap);
		return mav;
	}
	
	/* ---------- [회사 관리] - [기존 노선 변경] ---------- */
	//버스 노선 변경 신청 목록
	@GetMapping(value = "/admin/company/getUpdateBusRouteList")
	public ModelAndView getUpdateBusRouteList() {
		mav=acm.getUpdateBusRouteList();
		return mav;
	}
	//버스 노선 변경 -> 승인하기
	@PostMapping(value = "/admin/company/setUpdateBusRouteApproval")
	public ModelAndView setUpdateBusRouteApproval(String ap_b_no) {
		mav=acm.setUpdateBusRouteApproval(ap_b_no);
		return mav;
	}
	//버스 노선 변경  -> 반려하기
	@PostMapping(value = "/admin/company/setUpdateBusRouteReject")
	public ModelAndView setUpdateBusRouteReject(@RequestParam Map<String, Object>cMap) {
		mav=acm.setUpdateBusRouteReject(cMap);
		return mav;
	}
	
	
	//버스 회사 이름 목록
	@GetMapping(value = "/admin/company/getCompanyNameList")
	public ModelAndView getCompanyNameList() throws JsonProcessingException {
		mav=acm.getCompanyNameList();
		return mav;
	}
	//버스 회사 상세 정보 보기
	@GetMapping(value = "/admin/company/getCompanyDetail")
	public ModelAndView getCompanyDetail(String c_username) {
		mav=acm.getCompanyDetail(c_username);
		return mav;
	}
	//버스 회사 고객 소리함 목록
	@GetMapping(value = "/admin/company/getCompanyQuestionList")
	public ModelAndView getCompanyQuestionList(String c_username) {
		mav=acm.getCompanyQuestionList(c_username);
		return mav;
	}
	//버스 회사 승인 목록
	@GetMapping(value = "/admin/company/getCompanyApprovalList")
	public ModelAndView getCompanyApprovalList() throws JsonProcessingException {
		mav=acm.getCompanyApprovalList();
		return mav;
	}
	//버스 회사 승인 목록 - 상세
	@GetMapping(value = "/admin/company/getCompanyApprovalDetail")
	public ModelAndView getCompanyApprovalDetail() {
		mav=acm.getCompanyApprovalDetail();
		return mav;
	}
	//버스 회사 반려 목록
	@GetMapping(value = "/admin/company/getCompanyRejectList")
	public ModelAndView getCompanyRejectList() {
		mav=acm.getCompanyRejectList();
		return mav;
	}
	//버스 회사 반려 목록 - 상세
	@GetMapping(value = "/admin/company/getCompanyRejectDetail")
	public ModelAndView getCompanyRejectDetail() {
		mav=acm.getCompanyRejectDetail();
		return mav;
	}
	
		
}
