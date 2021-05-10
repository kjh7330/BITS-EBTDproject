package com.ebtd.www.service;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.AllBusBean;
import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.DriverStopBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.UserReservationBean;
import com.ebtd.www.dao.I_UserReservationDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class UserReservationMM {
	@Autowired
	private I_UserReservationDao urDao;

	ModelAndView mav;
	
	//버스 정보 가져오기
	public ModelAndView getBusList() throws JsonProcessingException {
		mav = new ModelAndView();
		LinkedList<BusBean> bList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		
		bList = urDao.getBusList();
		System.out.println(bList);
		if(bList!=null || bList.size()!=0) {
			mav.addObject("bList", om.writeValueAsString(bList));
			view = "/user/wheel/busReservationForm";
		}else {
			view = "/user/wheel/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}

	//정류장 정보 가져오기
	public ModelAndView getStopList() throws JsonProcessingException {
		mav = new ModelAndView();
		LinkedList<StopBean> sList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		
		sList = urDao.getStopList();
		if(sList!=null || sList.size()!=0) {
			mav.addObject("sList", om.writeValueAsString(sList));
			view = "/user/wheel/stopReservationForm";
		}else {
			view = "/user/wheel/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//ajax 정류장 정보 가져오기
	public String busList() throws JsonProcessingException {
		LinkedList<BusBean> bList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		
		bList = urDao.getBusList();
		if(bList!=null || bList.size()!=0) {
			return om.writeValueAsString(bList);
		}else {
			return "불러오기 실패";
		}
	}
	//ajax 정류장 정보 가져오기
	public String stopList() throws JsonProcessingException {
		LinkedList<StopBean> sList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();
		
		sList = urDao.getStopList();
		if(sList!=null || sList.size()!=0) {
			return om.writeValueAsString(sList);
		}else {
			return "불러오기 실패";
		}
	}
	
	public ModelAndView getBusDetail(String b_No) throws JsonProcessingException {
		List<DriverStopBean> brList = null;
		List<AllBusBean> abList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();		
		brList = urDao.getBusDetail(b_No);
		abList = urDao.getAllBusList(b_No);
		
		if(brList!=null || brList.size()!=0) {
			mav.addObject("brList", om.writeValueAsString(brList));
			mav.addObject("abList", om.writeValueAsString(abList));
			view = "/user/wheel/busReservationDetailForm";
		}else {
			view = "user/getBusList";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getStopDetail(int s_No) throws JsonProcessingException {
		List<DriverStopBean> brList = null;
		String view = null;
		ObjectMapper om = new ObjectMapper();		
		brList = urDao.getStopDetail(s_No);
		System.out.println("adsfasdfasdfasdfasdfasfdasdfasdfasdfasdfasdfasdfasdfasdfasdf"+brList);
		if(brList!=null || brList.size()!=0) {
			mav.addObject("brList", om.writeValueAsString(brList));
			view = "/user/wheel/stopReservationDetailForm";
		}else {
			view = "user/wheel/stopReservationDetailForm";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//예약하기
	public ModelAndView reservation(UserReservationBean ur, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		String u_username = session.getAttribute("u_username").toString();
		String u_type = session.getAttribute("u_type").toString();
		
		System.out.println("+++++++++++++++++++++++++++"+u_username);
		System.out.println("+++++++++++++++++++++++++------------++"+u_type);
		
		ur.setU_username(u_username);
		ur.setUr_state(Integer.parseInt(u_type));

		if(urDao.reservation(ur)) {
			view="redirect:/user/reservationCheck"; 
		}else {
			if( u_type == "0" ) { //휠체어면
				view = "/user/wheel/mainForm";//.jsp
			}else if(u_type == "1") { //시각이면
				view = "/user/blind/mainForm";//.jsp
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView reservationCheck(HttpSession session) throws JsonProcessingException {
		mav = new ModelAndView();
		System.out.println("lksghdjklfghsjdklghjklsdghjksldfghkjlsdghjksldgljfdhskljghdskfjlghkj");
		List<UserReservationBean> urList = null;
		String view = null;
		String u_username = session.getAttribute("u_username").toString();
		String u_type = session.getAttribute("u_type").toString();
		ObjectMapper om = new ObjectMapper();	
		
		urList = urDao.reservationCheck(u_username);
		System.out.println("urList=======" + urList);
		if(urList!=null || urList.size()!=0) {
			mav.addObject("urList", om.writeValueAsString(urList));
			if( u_type.equals("0") ) { //휠체어면
				view = "user/wheel/mainForm";//.jsp
			}else{ //시각이면
				view = "user/blind/mainForm";//.jsp
			}
		}
		mav.setViewName(view);
		return mav;
	}

	public List<AllBusBean> allbus(String b_No) {
		List<AllBusBean> abList = null;
		ObjectMapper om = new ObjectMapper();
		abList = urDao.getAllBusList(b_No);
		
		return abList;
	}


}
