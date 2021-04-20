package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.dao.I_AdminStopDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class AdminStopMM {
	@Autowired
	private I_AdminStopDao sDao;
	
	ModelAndView mav;
	
	//정류장 리스트 보기
	public ModelAndView getStopList() throws JsonProcessingException {
		mav = new ModelAndView();
		List<StopBean> sList = null;
		ObjectMapper om = new ObjectMapper();
		String view = null;
		
		sList=sDao.getStopList();
		if(sList!=null && sList.size() != 0) {
			mav.addObject("sList", om.writeValueAsString(sList));
			//mav.addObject("sList", new jackson());
			view = "forward:/admin/stop/stopListForm";//.jsp
		}else {
			view = "forward:/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//정류장 상세정보 보기
	public ModelAndView getStopDetail(Integer s_No) throws JsonProcessingException {
		mav = new ModelAndView();
		List<StopBean> sList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		sList=sDao.getStopDetail(s_No);
		System.out.println(sList);
		if(sList!=null && sList.size() != 0) {
			mav.addObject("sList", om.writeValueAsString(sList));
			view = "forward:/admin/stop/stopDetailForm";//.jsp
		}else {
			view = "admin";
		}
		mav.setViewName(view);
		return mav;
	}
	//정류장 코멘트 불러오기
	public ModelAndView getComment(Integer s_No) throws JsonProcessingException {
		mav = new ModelAndView();
		List<StopBean> sList = null;
		String view = null;
		
		sList=sDao.getComment(s_No);
		ObjectMapper om = new ObjectMapper();
		System.out.println(sList);
		if(sList!=null && sList.size() != 0) {
			mav.addObject("saList", om.writeValueAsString(sList));
			view = "forward:/admin/stop/stopCommentForm";//.jsp
		}else {
			view = "admin";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//정류장 코멘트 등록(아직 미완성)
	public ModelAndView addStopComment() {

		return null;
	}
	
	//정류장 신청리스트 불러오기
	public ModelAndView getStopConfirmList() throws JsonProcessingException {
		mav = new ModelAndView();
		List<StopApplyBean> saList = null;
		String view = null;
		saList=sDao.getStopConfirmList();
		ObjectMapper om = new ObjectMapper();
		System.out.println(saList);
		if(saList!=null && saList.size() != 0) {
			mav.addObject("saList", om.writeValueAsString(saList));
			view = "forward:/admin/stop/stopConfirmListForm";//.jsp
		}else {
			view = "forward:/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	//정류장 신청리스트 상세정보 불러오기
	public ModelAndView getStopConfirmDetail(Integer sa_No) throws JsonProcessingException {
		mav = new ModelAndView();
		List<StopApplyBean> saList = null;
		String view = null;
		
		saList=sDao.getStopConfirmDetail(sa_No);
		ObjectMapper om = new ObjectMapper();
		System.out.println(saList);
		if(saList!=null && saList.size() != 0) {
			mav.addObject("saList", om.writeValueAsString(saList));
			view = "forward:/admin/stop/stopConfirmDetailForm";//.jsp
		}else {
			view = "forward:/admin";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView addStop(StopBean sb) {
		mav = new ModelAndView();
		String view = null;
		if(sDao.addStop(sb)) {
			view="admin"; 
		}else {
			view="admin";
		}
		mav.setViewName(view);
		return mav;
	}

	//정류장 이름 중복체크
	public String checkName(String s_Name) {
		StopBean sb = sDao.checkStopList(s_Name);
		System.out.println(sb);
		if(sb!=null) {
			return "이미 있는 정류장 이름 입니다.";
		}
		return "사용 가능한 정류장 이름 입니다.";
	}
	
//	public Object checkPosition(Integer s_X, Integer s_Y) {
//		StopBean sb = sDao.checkPosition(s_X, s_Y);
//		System.out.println(sb);
//		if(sb!=null) {
//			return "이미 있는 정류장 이름 입니다.";
//		}
//		return "사용 가능한 정류장 이름 입니다.";
//	}

}
