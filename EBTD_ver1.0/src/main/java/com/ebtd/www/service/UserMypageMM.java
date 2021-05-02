package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBookmarkBean;
import com.ebtd.www.bean.UserReserveHistoryBean;
import com.ebtd.www.bean.VocBean;
import com.ebtd.www.dao.I_UserMypageDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class UserMypageMM {
	
	@Autowired
	private I_UserMypageDao umDao;
	
	ModelAndView mav;
	//이용 내역 리스트 가져오기
	public ModelAndView getReservationHistoryList(String u_username) {
		mav = new ModelAndView();
		String view = null;
		List<UserBookmarkBean> ubList = null;
		//ubList = umDao.getReservationHistoryList(u_username);
		//mav.addObject("ubList", ubList);
		view = "user/wheel/reservationHistoryListForm";
		mav.setViewName(view);
		return mav;
	}
	//고객 소리함 - 리스트 가져오기 (내 질문들, 답변들)
	public ModelAndView getMyQuestionList(String u_username) {
		mav = new ModelAndView();
		String view = null;
		List<VocBean> vList = null;
		//vList = umDao.getMyQuestionList(u_username);
		//mav.addObject("vList", vList);
		//if(vList.get(0).getU_type()==0) { //휠체어
			view="user/wheel/myQuestionListForm";
		//}else if(vList.get(0).getU_type()==1) {
		//	view="user/wheel/myQuestionListForm"; //시각
		//}
		mav.setViewName(view);
		return mav;
	}
	//고객 소리함 - 작성하기 - 이용한 버스 번호들 가져오기
	public String getReservationBusNum(String u_username) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urbList = null;
		urbList = umDao.getReservationBusNum(u_username);
		return om.writeValueAsString(urbList);
	}
	//고객 소리함 - 작성한 내용 저장하기
	public ModelAndView setMyQuestionWrite(VocBean vb) {
		mav = new ModelAndView();
		String view = null;
		umDao.setMyQuestionWrite(vb);
		view="user/wheel/userMyInfoForm";
		mav.setViewName(view);
		return mav;
	}
	//고객 소리함 - 작성글 상세보기
	public ModelAndView getMyQuestionDetail(String v_no) {
		mav = new ModelAndView();
		String view = null;
		List<VocBean> vList = null;
		//vList = umDao.getMyQuestionDetail(v_no);
		//mav.addObject("vList", vList);
		view="user/wheel/myQuestionDetailForm";
		mav.setViewName(view);
		return mav;
	}
	//내 정보 확인 - 내 정보 가져오기
	public ModelAndView getUserMyInfo(String u_username) {
		mav = new ModelAndView();
		String view = null;
		List<UserBean> miList = null;
		miList = umDao.getUserMyInfo(u_username);
		mav.addObject("miList", miList);
		if(miList.get(0).getU_type()==0) { // 휠체어 유저
			view="user/wheel/userMyInfoForm";
		}else if(miList.get(0).getU_type()==1) { // 시각 장애인 유저
			view="user/wheel/userMyInfoForm";
		}
		mav.setViewName(view);
		return mav;
		
	}
	//내 정보 확인 - 내 정보 수정하기
	public ModelAndView setUserMyInfo(UserBean ub) {
		mav = new ModelAndView();
		String view = null;
		List<UserBean> miList = null;
		umDao.setUserMyInfo(ub);
		//miList = umDao.getUserMyInfo(ub.getU_userName());
		//mav.addObject("miList", miList);
		if(ub.getU_type()==0) { // 휠체어
			view="redirect:/user/myPage";
		}else if(ub.getU_type()==1) { // 시각
			view="redirect:/user/getUserMyInfo";
		}
		mav.setViewName(view);
		return mav;
	}

}
