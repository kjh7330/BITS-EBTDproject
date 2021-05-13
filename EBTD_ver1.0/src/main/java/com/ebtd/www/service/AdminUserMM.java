package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserReserveHistoryBean;
import com.ebtd.www.dao.I_AdminUserDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class AdminUserMM {	//김아름

	@Autowired
	private I_AdminUserDao uDao;

	ModelAndView mav;
	
	//이용자 리스트 가져오기
	public ModelAndView getUserList() throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<UserBean> uList = null;

		uList = uDao.getUserList();	//userList 디비 가서 가져오기
		//디비에서 가져온 데이터가 있으면
		if( (uList!=null) && (uList.size()!= 0) ) {
			mav.addObject("uList", om.writeValueAsString(uList));
			//잭슨으로 데이터-->json으로 변환
			view = "/admin/user/userListForm";//.jsp
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("userList가져오기 실패-메인으로 이동");
			view = "redirect:/admin";
		}
		mav.setViewName(view);
		return mav;
	} //getUserList end
	
	//Rest
	//이용자 리스트에서 아이디 검색하면
	public String getUserSearchUserName(String u_userName) throws JsonProcessingException {
			
		ObjectMapper om = new ObjectMapper();
		List<UserBean> uerInfoList = null;
		
		System.out.println("받은 유저네임:"+u_userName);
		uerInfoList = uDao.getUserSearchUserName(u_userName);	// 디비 가서 가져오기
		//디비에서 가져온 데이터가 있으면
		if( uerInfoList!=null ) {
			return om.writeValueAsString(uerInfoList); //List를 json으로 변환
		}else {
			return "userSearchUserName 가져오기 실패";
		}
	}	//getUserSearchUserName end
	
	//Rest
	//이용자 리스트에서 장애유형 선택하면
	public String getUserSearchUType(String u_type) throws JsonProcessingException {
		
		ObjectMapper om = new ObjectMapper();
		List<UserBean> uerInfoList = null;
		int u_type2 = 10;
		
		System.out.println("u_type = " + u_type); //시각
		
		if(u_type.equals("시각")) {	//1
			u_type2 = 1;
		}
		if(u_type.equals("휠체어")) {	//0
			u_type2 = 0;
		}
		uerInfoList = uDao.getUserSearchUType(u_type2);	// 디비 가서 가져오기
		System.out.println("=============");

		System.out.println(uerInfoList);
		//디비에서 가져온 데이터가 있으면
		if( uerInfoList!=null) {
			return om.writeValueAsString(uerInfoList); //List를 json으로 변환
		}else {
			return "getUserSearchUType 가져오기 실패";
		}
	}	//getUserSearchUType end

	
	
	//이용자 상세정보 보기
	public ModelAndView getUserDetail(String u_userName) throws JsonProcessingException {

		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		UserBean uInfo = null;
		
		System.out.println(u_userName);
		uInfo = uDao.getUserDetail(u_userName);	// 디비 가서 가져오기
		//디비에서 가져온 데이터가 있으면
		if( uInfo!=null ) {
			mav.addObject("uInfo", om.writeValueAsString(uInfo));
			view = "/admin/user/userDetailForm";//.jsp	
		}else {
			System.out.println("userDetail 가져오기 실패-메인으로 이동");
			view = "redirect:/admin";
		}
		System.out.println(uInfo);
		mav.setViewName(view);
		return mav;
	} //getUserDetail end

	
	//이용자 히스토리 : 전체 가져오기
	public ModelAndView getUserHistoryList() throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<UserReserveHistoryBean> urhList = null;
 
		urhList = uDao.getUserHistoryList();	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( (urhList!=null) && (urhList.size()!= 0) ) {
			mav.addObject("urhList", om.writeValueAsString(urhList));
			System.out.println(urhList);
			//잭슨으로 데이터-->json으로 변환
			view = "/admin/user/userHistoryListForm";//.jsp
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("userHistoryList가져오기 실패-메인으로 이동");
			view = "redirect:/admin";
		}
		mav.setViewName(view);
		return mav;
	}	//getUserHistoryList end
	
	//Rest
	//이용자 히스토리 : 이용일 기간 검색
	public String getUserHistoryDateList(String select) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urhList = null;
		int period = 0;
 
		if(select.equals("1주일")) {
			period = 7;
		}else if(select.equals("1개월")) {
			period = 30;
		}else if(select.equals("3개월")) {
			period = 90;
		}else if(select.equals("6개월")) {
			period = 180;
		}else if(select.equals("1년")) {
			period = 365;
		}
		urhList = uDao.getUserHistoryDateList(period);	//디비 가서 정보 가져오기
			//디비에서 가져온 데이터가 있으면
			return om.writeValueAsString(urhList);
	}
	
	//Rest
	//이용자 히스토리 : 장애유형 검색
	public String getHistorySearchUType(int u_type) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urhList = null;
 
		urhList = uDao.getHistorySearchUType(u_type);	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( urhList!=null) {
			return om.writeValueAsString(urhList); //List를 json으로 변환
		}else {
			return "getHistorySearchUType 가져오기 실패";
		}
	}

	//Rest
	//이용자 히스토리 : 아이디 검색
	public String getUserHistoryUserName(String u_userName) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urhList = null;
 
		urhList = uDao.getUserHistoryUserName(u_userName);	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( urhList!=null) {
			return om.writeValueAsString(urhList); //List를 json으로 변환
		}else {
			return "userSearchUserName 가져오기 실패";
		}
	}	//getUserHistoryUsername end
	
	//Rest
	//이용자 히스토리 : 회사명 검색
	public String getUserHistoryCompanyName(String c_userName) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urhList = null;
		
		urhList = uDao.getUserHistoryCompanyName(c_userName);	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( urhList!=null) {
			return om.writeValueAsString(urhList); //List를 json으로 변환
		}else {
			return "getUserHistoryCompanyName 가져오기 실패";
		}
	}
	
	//Rest
	//이용자 히스토리 : 버스번호 검색
	public String getUserHistoryBusNum(String b_no) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urhList = null;
 
		urhList = uDao.getUserHistoryBusNum(b_no);	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( urhList!=null) {
			return om.writeValueAsString(urhList); //List를 json으로 변환
		}else {
			return "getUserHistoryBusNum 가져오기 실패";
		}
	}

	//Rest
	//이용자 히스토리 : 출발지 검색
	public String getStopStartName(String s_namestart) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urhList = null;
 
		urhList = uDao.getStopStartName(s_namestart);	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( urhList!=null) {
			return om.writeValueAsString(urhList); //List를 json으로 변환
		}else {
			return "getUserStartName 가져오기 실패";
		}
	}
	
	//Rest
	//이용자 히스토리 : 도착지 검색
	public String getStopLastName(String s_namelast) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urhList = null;
 
		urhList = uDao.getStopLastName(s_namelast);	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( urhList!=null) {
			return om.writeValueAsString(urhList); //List를 json으로 변환
		}else {
			return "getStopLastName 가져오기 실패";
		}
	}
	
	//Rest
	//이용자 히스토리 : 이용상태 검색
	public String getState(String ur_state) throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		List<UserReserveHistoryBean> urhList = null;
 
		urhList = uDao.getState(ur_state);	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( urhList!=null) {
			return om.writeValueAsString(urhList); //List를 json으로 변환
		}else {
			return "getState 가져오기 실패";
		}
	}
	
	//이용자 차트 보기
	public Object getUserChart() {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<UserReserveHistoryBean> urhList = null;

		urhList = uDao.getUserHistoryList();	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( (urhList!=null) && (urhList.size()!= 0) ) {
			//mav.addObject("urhList", om.writeValueAsString(urhList));
			//잭슨으로 데이터-->json으로 변환
			view = "/admin/user/userHistoryListForm";//.jsp
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("userHistoryList가져오기 실패-메인으로 이동");
			view = "redirect:/admin";

		}
		mav.setViewName(view);
		return mav;
	}	//getUserChart end






	

	

	

	

	



} //AdminUserMM
