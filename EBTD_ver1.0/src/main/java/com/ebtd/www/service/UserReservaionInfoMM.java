package com.ebtd.www.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserReservationBean;
import com.ebtd.www.dao.I_UserReservationDao;
import com.ebtd.www.dao.I_UserReservationInfoDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class UserReservaionInfoMM {	//김아름

	@Autowired
	private I_UserReservationInfoDao uriDao;
	@Autowired
	private I_UserReservationDao urDao;

	ModelAndView mav;
	
	//휠체어 예약 확인
	public ModelAndView getReservationInfo(HttpSession session) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<UserReservationBean> uReserveList = null;
		int u_type = (int)session.getAttribute("u_type");
		String u_username = session.getAttribute("u_username").toString();
		
		uReserveList = uriDao.getReservationInfo(u_username);	//예약내역 디비 가서 가져오기
		//디비에서 가져온 데이터가 있으면
		if( (uReserveList.size() !=0) ) {
			mav.addObject("uReserveList", om.writeValueAsString(uReserveList));
			//mav.addObject("uBookList2", uBookList);
			//잭슨으로 데이터-->json으로 변환

			if( u_type == 0 ) { //휠체어면
				view = "/user/wheel/reservationInfoForm";//.jsp
			}else if(u_type == 1) { //시각이면
				view = "/user/blind/reservationInfoForm";//.jsp
			}
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("uReserveList가져오기 실패-메인으로 이동");
				view = "redirect:/user/reservationCheck";//.jsp
		}
		mav.setViewName(view);
		return mav;	
	}

	//휠체어 예약 상세내역
	public ModelAndView getReservationDetail(UserReservationBean rb) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		UserReservationBean reserveDetail = null;
		
		int ur_no = rb.getUr_no();
		reserveDetail = uriDao.getReservationDetail(ur_no);

		//디비에서 가져온 데이터가 있으면
		if( (reserveDetail != null) ) {
			mav.addObject("reserveDetail", om.writeValueAsString(reserveDetail));
			mav.addObject("brList", om.writeValueAsString(urDao.getBusDetail(rb.getB_no())));
			view = "/user/wheel/reservationInfoDetailForm";//.jsp
		}else {
			System.out.println("reserveDetail가져오기 실패-메인으로 이동");
			view = "redirect:/user/reservationCheck";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//시각의 예약내역
	public ModelAndView getBlindReservationInfo(HttpSession session) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		UserReservationBean rb = null;
		int u_type = (int)session.getAttribute("u_type");
		String u_username = session.getAttribute("u_username").toString();
		
		rb = uriDao.getBlindReservationInfo(u_username);	//예약내역 디비 가서 가져오기
		//디비에서 가져온 데이터가 있으면
		if( (rb != null) ) {
			mav.addObject("reservation", om.writeValueAsString(rb));
			mav.addObject("brList", om.writeValueAsString( urDao.getBusDetail(rb.getB_no())) );
			//mav.addObject("uBookList2", uBookList);
			//잭슨으로 데이터-->json으로 변환

			if( u_type == 0 ) { //휠체어면
				view = "/user/wheel/reservationInfoForm";//.jsp
			}else if(u_type == 1) { //시각이면
				view = "/user/blind/reservationInfoForm";//.jsp
			}
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("getBlindReservationInfo가져오기 실패-메인으로 이동");
				view = "redirect:/user/reservationCheck";//.jsp
		}
		mav.setViewName(view);
		return mav;	
	}


	//예약 취소
	public ModelAndView reservationCancel(UserReservationBean rb) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		int ur_no = rb.getUr_no();
		uriDao.reservationCancel(ur_no);	//디비에서 ur_state 값 변경
		view = "redirect:/user/reservationCheck";//.jsp
		 
		mav.setViewName(view);
		return mav;
	}


}
