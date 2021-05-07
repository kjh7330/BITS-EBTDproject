package com.ebtd.www.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserReservationBean;
import com.ebtd.www.dao.I_UserReservationInfoDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class UserReservaionInfoMM {	//김아름

	@Autowired
	private I_UserReservationInfoDao uriDao;

	ModelAndView mav;
	
	//예약 확인
	public ModelAndView getReservationInfo(HttpSession session) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<UserReservationBean> uReserveList = null;
		
		String u_username = session.getAttribute("u_username").toString();
		System.out.println("세션에서 꺼낸 u_username = " + u_username);
		uReserveList = uriDao.getReservationInfo(u_username);	//예약내역 디비 가서 가져오기
		System.out.println("디비에서 가져온 예약내역 = " + uReserveList);

		//디비에서 가져온 데이터가 있으면
		if( (uReserveList.size() !=0) ) {
			mav.addObject("uReserveList", om.writeValueAsString(uReserveList));
			//mav.addObject("uBookList2", uBookList);
			//잭슨으로 데이터-->json으로 변환
			view = "/user/wheel/reservationInfoForm";//.jsp
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("uReserveList가져오기 실패-메인으로 이동");
			view = "/user/wheel/mainForm";
		}
		mav.setViewName(view);
		return mav;
		
	}

}
