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
			view = "/admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
		 	
	} //getUserList end
	
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
			view = "/admin/mainForm";
		}
		System.out.println(uInfo);
		mav.setViewName(view);
		return mav;
	} //getUserDetail end

	//이용자 히스토리 가져오기
	public ModelAndView getUserHistoryList() throws JsonProcessingException {
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<UserReserveHistoryBean> urhList = null;

		urhList = uDao.getUserHistoryList();	//디비 가서 정보 가져오기
		//디비에서 가져온 데이터가 있으면
		if( (urhList!=null) && (urhList.size()!= 0) ) {
			mav.addObject("urhList", om.writeValueAsString(urhList));
			//잭슨으로 데이터-->json으로 변환
			view = "/admin/user/userHistoryListForm";//.jsp
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("userHistoryList가져오기 실패-메인으로 이동");
			view = "/admin/mainForm";

		}
		mav.setViewName(view);
		return mav;
	}	//getUserHistoryList end

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
			view = "/admin/mainForm";

		}
		mav.setViewName(view);
		return mav;
	}	//getUserChart end




}
