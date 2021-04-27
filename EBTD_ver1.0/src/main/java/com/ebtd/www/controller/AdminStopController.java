package com.ebtd.www.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.service.AdminStopMM;
import com.fasterxml.jackson.core.JsonProcessingException;




@Controller
public class AdminStopController {
	@Autowired
	private AdminStopMM am; 
	
	ModelAndView mav;
	
	//정류장 전체 리스트 불러오기
	@GetMapping(value = "/admin/stop/getStopList")
	public ModelAndView getStopList() throws JsonProcessingException {
		mav=am.getStopList();
		return mav; 
	}
	
	//정류장 상세정보 불러오기
	@GetMapping(value = "/admin/stop/getStopDetail")
	public ModelAndView getStopDetail(@RequestParam("s_No")Integer s_No) throws JsonProcessingException {
		System.out.println(s_No);
		mav=am.getStopDetail(s_No);
		return mav; 
	}
	
	//코멘트 등록
	@GetMapping(value = "/admin/stop/addStopComment")
	public ModelAndView addStopComment(StopBean sb){
		mav=am.addStopComment(sb);
		return mav;
	}
	
	
	//정류장 신청 리스트 불러오기
	@GetMapping(value = "/admin/stop/getStopConfirmList")
	public ModelAndView getStopConfirmList() throws JsonProcessingException {
		mav=am.getStopConfirmList();
		return mav; 
	}
	
	//정류장 신청 상세정보 불러오기
	@GetMapping(value = "/admin/stop/getStopConfirmDetail")
	public ModelAndView getStopConfirmDetail(@RequestParam("sa_No")Integer sa_No) {
		mav=am.getStopConfirmDetail(sa_No);
		return mav; 
	}
	
	
	//정류장 등록하기 정류장 리스트 불러온 후 페이지 이동
	@GetMapping(value = "/admin/stop/stopList")
	public ModelAndView stopList(){
		mav=am.stopList();
		return mav; 
	}
	
	//정류장 등록하기
	@RequestMapping(value = "/admin/stop/addStop")
	public ModelAndView addStop(StopBean sb){
		mav=am.addStop(sb);
		return mav; 
	}
	
	//정류장 신청 승인하기
	@PostMapping(value = "/admin/stop/setStopRequestApproval")
	public ModelAndView setStopRequestApproval(@RequestParam Map<String,Object> saList){
		mav=am.setStopRequestApproval(saList);
		return mav; 
	}
	
	//정류장 신청 반려하기
	@GetMapping(value = "/admin/stop/setStopRequestReject")
	public ModelAndView setStopRequestReject(Integer sa_No){
		mav=am.setStopRequestReject(sa_No);
		return mav; 
	}
	
	//정류장 결재내역 불러오기
	@GetMapping(value = "/admin/stop/getOfficialDocumentResult")
	public ModelAndView getOfficialDocumentResult(){
		mav=am.getOfficialDocumentResult();
		return mav; 
	}
	
}