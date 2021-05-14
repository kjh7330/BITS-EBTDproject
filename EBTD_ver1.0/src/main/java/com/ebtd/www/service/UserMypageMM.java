package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.TownBean;
import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBookmarkBean;
import com.ebtd.www.bean.UserReservationBean;
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
	//회원아이디로 휠체어유저인지 시각장애인유저인지 확인하기
	public ModelAndView getMypage(String u_username) {
		mav = new ModelAndView();
		String view = null;
		UserBean ub = umDao.getMypage(u_username);
		mav.addObject("ub", ub);
		if(ub.getU_type() == 1) {
			view = "user/blind/myPageForm";
		}else if(ub.getU_type() == 0) {
			view = "user/wheel/myPageForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//이용 내역 리스트 가져오기
	public ModelAndView getReservationHistoryList(String u_username) {
		mav = new ModelAndView();
		String view = null;
		List<UserReservationBean> ubList = null;
		UserBean ub = umDao.getMypage(u_username);
		ubList = umDao.getReservationHistoryList(u_username);
		System.out.println(ubList);
		mav.addObject("ubList", ubList);
		if(ub.getU_type()==1) {
			view = "user/blind/reservationHistoryListForm";
		}else if(ub.getU_type()==0) { //휠체어
			view = "user/wheel/reservationHistoryListForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//이용 내역 상세 가져오기
	public ModelAndView getReservationHistoryDetail(String u_username, int ur_no) {
		mav = new ModelAndView();
		String view = null;
		List<UserReservationBean> ubdList = null;
		UserBean ub = umDao.getMypage(u_username);
		ubdList = umDao.getReservationHistoryDetail(ur_no);
		System.out.println(ubdList);
		mav.addObject("ubdList", ubdList);
		if(ub.getU_type()==1) {
			view = "user/blind/reservationHistoryDetailForm";
		}else if(ub.getU_type()==0) { //휠체어
			view = "user/wheel/reservationHistoryDetailForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//이용 내역 - 즐겨찾기 추가
	public ModelAndView setBookMark(UserBookmarkBean bm) {
		mav = new ModelAndView();
		String view = null;
		umDao.setBookMark(bm);
		view="redirect:/user/getBookmarkList"; //즐겨찾기 페이지로 이동
		mav.setViewName(view);
		return mav;
	}
	
	//고객 소리함 - 리스트 가져오기 (내 질문들, 답변들)
	public ModelAndView getMyQuestionList(String u_username) {
		mav = new ModelAndView();
		String view = null;
		List<VocBean> vList = umDao.getMyQuestionList(u_username);
		List<VocBean> aList = umDao.getAnswerList(u_username);
		UserBean ub = umDao.getMypage(u_username);
		mav.addObject("vList", vList);
		mav.addObject("aList", aList);
		System.out.println(vList);
		System.out.println(aList);
		if(ub.getU_type() == 1) { //시각
			view="user/blind/myQuestionListForm";
		}else if(ub.getU_type() == 0) {
			view="user/wheel/myQuestionListForm"; //휠체어
		}
		mav.setViewName(view);
		return mav;
	}
	//고객 소리함 - 작성하기 페이지 이동
	public ModelAndView getMyQuestionWrite(String u_username) {
		mav = new ModelAndView();
		String view = null;
		UserBean ub = umDao.getMypage(u_username);
		mav.addObject("ub", ub);
		if(ub.getU_type() == 1) {
			view = "user/blind/myQuestionWriteForm";
		}else if(ub.getU_type() == 0) {
			view = "user/wheel/myQuestionWriteForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//고객 소리함 - 작성하기 - 이용한 버스 번호들 가져오기
	public String getReservationBusNum(String u_username) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		System.out.println(u_username);
		List<UserReserveHistoryBean> urbList = null;
		urbList = umDao.getReservationBusNum(u_username);
		return om.writeValueAsString(urbList);
	}
	//고객 소리함 - 작성한 내용 저장하기
	public ModelAndView setMyQuestionWrite(VocBean vb) {
		mav = new ModelAndView();
		String view = null;
		System.out.println("뭐가 문제야?");
		umDao.setMyQuestionWrite(vb);
		System.out.println(vb+"응?");
			view = "redirect:/user/getMyQuestionList";
		System.out.println("말좀해봥");
		mav.setViewName(view);
		return mav;
	}
	//고객 소리함 - 작성글 상세보기
	public ModelAndView getMyQuestionDetail(String v_no) {
		mav = new ModelAndView();
		String view = null;
		List<VocBean> vList = null;
		vList = umDao.getMyQuestionDetail(v_no);
		mav.addObject("vList", vList);
		if(vList.get(0).getU_type()==1) { //시각
			view="user/blind/myQuestionDetailForm";
		}else if(vList.get(0).getU_type()==0) { //휠체어
			view="user/wheel/myQuestionDetailForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//내 정보 확인 - 내 정보 가져오기
	public ModelAndView getUserMyInfo(String u_username) {
		mav = new ModelAndView();
		String view = null;
		List<UserBean> miList = umDao.getUserMyInfo(u_username);
		List<UserBean> tList = umDao.get_t_list();
		System.out.println(tList);
		//인천시  송도1동 xxxx
		//012 3 4567 8 9~
		mav.addObject("aDetail", miList.get(0).getU_address().substring(9)); //상세주소
		mav.addObject("tName", miList.get(0).getU_address().substring(4,8)); //동주소
		mav.addObject("tList", tList); //동 리스트
		mav.addObject("miList", miList);
		if(miList.get(0).getU_type()==1) { //시각
			view="user/blind/userMyInfoForm";
		}else if(miList.get(0).getU_type()==0) { //휠체어
			view="user/wheel/userMyInfoForm";
		}
		mav.setViewName(view);
		return mav;
		
	}
	//내 정보 확인 - 내 정보 수정하기
	public ModelAndView setUserMyInfo(UserBean ub) {
		mav = new ModelAndView();
		String view = null;
		System.out.println(ub.getT_name()+" "+ub.getADetail());
		ub.setU_address(ub.getT_name()+" "+ub.getADetail());
		umDao.setUserMyInfo(ub);
		if(ub.getU_type()==0) { // 휠체어
			view="redirect:/user/myPage";
		}else if(ub.getU_type()==1) { // 시각
			view="redirect:/user/getUserMyInfo";
		}
		mav.setViewName(view);
		return mav;
	}

}
