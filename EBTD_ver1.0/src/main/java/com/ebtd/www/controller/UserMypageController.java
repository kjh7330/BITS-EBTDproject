package com.ebtd.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBookmarkBean;
import com.ebtd.www.bean.VocBean;
import com.ebtd.www.service.UserMypageMM;

@Controller
public class UserMypageController {
	
	@Autowired
	private UserMypageMM umm; //휠체어 마이페이지 서비스 클래스
	
	ModelAndView mav;
	//마이페이지 하위 메뉴 이동 페이지
	@RequestMapping(value = "/user/myPage")
	public ModelAndView getMypage(HttpSession session) {
		String u_username = (String) session.getAttribute("u_username");
		if(u_username != null) {
			mav = umm.getMypage(u_username);
		}
		return mav;
	}
	//마이페이지 - 이용 내역
	@GetMapping(value = "/user/getReservationHistoryList")
	public ModelAndView getReservationHistoryList(HttpSession session) {
		String u_username = (String) session.getAttribute("u_username");
		mav = umm.getReservationHistoryList(u_username);
		return mav;
	}
	//마이페이지 - 이용 상세 내역
	@GetMapping(value = "/user/getReservationHistoryDetail")
	public ModelAndView getReservationHistoryDetail(HttpSession session, int ur_no) {
		String u_username = (String) session.getAttribute("u_username");
		mav = umm.getReservationHistoryDetail(u_username, ur_no);
		return mav;
	}
	//마이페이지 - 즐겨찾기 추가
	@PostMapping(value = "/user/setBookMark")
	public ModelAndView setBookMark(UserBookmarkBean bm) {
		mav=umm.setBookMark(bm);
		return mav;
	}
	//마이페이지 - 고객 소리함
	@GetMapping(value = "/user/getMyQuestionList")
	public ModelAndView getMyQuestionList(HttpSession session) {
		String u_username = (String) session.getAttribute("u_username");
		mav=umm.getMyQuestionList(u_username);
		return mav;
	}
	//마이페이지 - 고객 소리함 - 작성 페이지 이동
	@GetMapping(value = "/user/getMyQuestionWrite")
	public ModelAndView getMyQuestionWrite(HttpSession session) {
		String u_username = (String) session.getAttribute("u_username");
		mav = umm.getMyQuestionWrite(u_username);
		return mav;
	}
	//마이페이지 - 고객 소리함 - 작성 하기
	@PostMapping(value ="/user/setMyQuestionWrite")
	public ModelAndView setMyQuestionWrite(VocBean vb) {
		System.out.println("온거니?");
		mav=umm.setMyQuestionWrite(vb);
		return mav;
	}
	//마이페이지 - 고객 소리함 - 상세 보기
	@GetMapping(value = "/user/getMyQuestionDetail")
	public ModelAndView getMyQuestionDetail(String v_no) {
		mav=umm.getMyQuestionDetail(v_no);
		return mav;
	}
	//마이페이지 - 내정보 확인
	@GetMapping(value = "/user/getUserMyInfo")
	public ModelAndView getUserMyInfo(HttpSession session) {
		String u_username = (String) session.getAttribute("u_username");
		mav=umm.getUserMyInfo(u_username);
		return mav;
	}
	//마이페이지 - 내정보 수정하기
	@PostMapping(value = "/user/setUserMyInfo")
	public ModelAndView setUserMyInfo(UserBean ub) {
		mav=umm.setUserMyInfo(ub);
		return mav;
	}
}
