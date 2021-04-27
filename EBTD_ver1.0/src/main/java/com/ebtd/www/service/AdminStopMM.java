package com.ebtd.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
	
	//정류장 리스트 보기 후 페이지 이동
	public ModelAndView getStopList() throws JsonProcessingException {
		mav = new ModelAndView();
		List<StopBean> sList = null;
		ObjectMapper om = new ObjectMapper();
		String view = null;
		
		sList=sDao.getStopList();
		
		if(sList!=null && sList.size() != 0) {
			mav.addObject("sList", om.writeValueAsString(sList));
			view = "/admin/stop/stopListForm";//.jsp
		}else {
			view = "/admin";
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
			view = "/admin/stop/stopDetailForm";//.jsp
		}else {
			view = "/admin/stop/stopListForm";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//정류장 코멘트 등록
	public ModelAndView addStopComment(StopBean sb) {
		mav = new ModelAndView();
		String view = null;
		if(sDao.addStopComment(sb)!=0) {
			view="redirect:/admin/stop/getStopDetail?s_No="+sb.getS_NO();
		}else {
			view="redirect:/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//정류장 신청리스트 불러오기
	public ModelAndView getStopConfirmList() throws JsonProcessingException {
		mav = new ModelAndView();
		List<StopApplyBean> saList = null;
		String view = null;
		saList=sDao.getStopConfirmList();
		ObjectMapper om = new ObjectMapper();
		if(saList!=null && saList.size() != 0) {
			mav.addObject("saList", om.writeValueAsString(saList));
			view = "admin/stop/stopConfirmListForm";//.jsp
		}else {
			view = "admin/stop/stopConfirmListForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//정류장 신청리스트 상세정보 불러오기
	public ModelAndView getStopConfirmDetail(Integer sa_No) {
		mav = new ModelAndView();
		List<StopApplyBean> saList = null;
		String view = null;
		saList=sDao.getStopConfirmDetail(sa_No);
		if(saList!=null && saList.size() != 0) {
			mav.addObject("saList", saList);
			view = "admin/stop/stopConfirmDetailForm";//.jsp
		}else {
			view = "/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//정류장 등록하기
	public ModelAndView addStop(StopBean sb) {
		mav = new ModelAndView();
		String view = null;
		if(sDao.addStop(sb)) {
			view="redirect:/admin/stop/getStopList"; 
		}else {
			view="redirect:/admin/stop/addStopForm";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//정류장 추가 - 동 이름 불러오기
	public ModelAndView stopList() {
		mav = new ModelAndView();
		List<StopBean> sList = null;
		String view = null;
		
		sList=sDao.stopList();
		
		if(sList!=null && sList.size() != 0) {
			mav.addObject("sList", sList);
			view = "admin/stop/addStopForm";//.jsp
		}else {
			view = "/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	//해당 동네 정류장 마지막번호 + 1 불러오기
	public String checkPosition(String t_Name) {
		String s_No = sDao.checkStopNo(t_Name);
		
		return s_No;
	}

	//정류장 이름 중복체크
	public String checkName(String s_Name) {
		StopBean sb = sDao.checkStopList(s_Name);
		if(sb!=null) {
			return "사용 불가능 합니다.";
		}
		return "사용 가능 합니다.";
	}
	
	//정류장 위치 중복체크
	public String checkPosition(int s_X, int s_Y) {
		StopBean sb = new StopBean();
		System.out.println("s_X = " + s_X);
		System.out.println("s_Y = " + s_Y);
		if(	s_X <= 100&&s_Y<=100 ) {
		sb.setS_X(s_X);
		sb.setS_Y(s_Y);
		sb = sDao.checkPosition(sb);
		if(sb!=null) {
			return "해당 위치에 정류장이 있습니다.";
		}
			return "사용 가능 합니다.";	
		}
		return "좌표를 벗어났습니다.";
	}
	
	//정류장 승인 버튼 클릭시 state 값 0-->1 , 정류장 리스트에 추가
	public ModelAndView setStopRequestApproval(Map<String, Object> saList) {
		mav = new ModelAndView();
		String view = null;
		int s_No = sDao.getStopNo(saList);
		saList.put("s_No", s_No);
		
		if(sDao.approvalAddStop(saList)) {
			sDao.setStopRequestApproval(saList.get("sa_No"));
			view="redirect:/admin/stop/getStopConfirmList";
		}else {
			view="redirect:/admin/stop/getStopConfirmList";
		}
		mav.setViewName(view);
		return mav;
	}

	//정류장 반려 버튼 클릭시 state 값 0-->2
	public ModelAndView setStopRequestReject(Integer sa_No) {
		mav = new ModelAndView();
		String view = null;
		if(sDao.setStopRequestReject(sa_No)!=0) {
			view="redirect:/admin/stop/getStopConfirmList";
		}else {
			view="redirect:/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//승인 반려 결재내역 불러오기
	public ModelAndView getOfficialDocumentResult(){
		mav = new ModelAndView();
		List<StopApplyBean> saList = null;
		String view = null;
		
		saList=sDao.getOfficialDocumentResult();
		
		if(saList!=null && saList.size() != 0) {
			mav.addObject("saList", saList);
			view = "/admin/stop/officialDocumentResultForm";//.jsp
		}else {
			view = "/admin/stop/officialDocumentResultForm";
		}
		mav.setViewName(view);
		return mav;
	}

}
