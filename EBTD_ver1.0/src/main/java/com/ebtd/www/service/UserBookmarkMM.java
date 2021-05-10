package com.ebtd.www.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBookmarkBean;
import com.ebtd.www.dao.I_UserBookmarkDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class UserBookmarkMM {	//김아름

	@Autowired
	private I_UserBookmarkDao uBookDao;

	ModelAndView mav;
	
	//유저( 시각 + 휠체어)의 즐겨찾기 리스트
	public ModelAndView getBookmarkList(HttpSession session) throws JsonProcessingException {
		
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<UserBookmarkBean> uBookList = null;
		String u_username = session.getAttribute("u_username").toString();
		int u_type = (int)session.getAttribute("u_type");
		
		uBookList = uBookDao.getBookmarkList(u_username);	//즐겨찾기 리스트 디비 가서 가져오기

		//디비에서 가져온 데이터가 있으면
		if( (uBookList!=null) && (uBookList.size()!= 0) ) {
			mav.addObject("uBookList", om.writeValueAsString(uBookList));
			//mav.addObject("uBookList2", uBookList);
			//잭슨으로 데이터-->json으로 변환
			
			if( u_type == 0 ) { //휠체어면
				view = "/user/wheel/wheelBookmarkListForm";//.jsp
			}else if(u_type == 1) { //시각이면
				view = "/user/blind/blindBookmarkListForm";//.jsp
			}
			
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("uBookList가져오기 실패-메인으로 이동");
			if( u_type == 0 ) { //휠체어면
				view = "/user/wheel/mainForm";//.jsp
			}else if(u_type == 1) { //시각이면
				view = "/user/blind/mainForm";//.jsp
			}
		}
		mav.setViewName(view);
		return mav;	
	} //getBookmarkList end

	
	//즐겨찾기 삭제
	public String deleteBookmark(String ub_no) {
		uBookDao.deleteBookmark(ub_no);	//디비에 즐겨찾기 삭제하러
		return "삭제완료";
	} //deleteBookmark end

	//즐겨찾기 추가
	public String insertBookmark(String ub_no, String u_username, String b_no, int s_nostart, int s_nolast, String ub_alias) {
		UserBookmarkBean uBookmark = new UserBookmarkBean();
		uBookmark.setUb_no(ub_no);
		uBookmark.setU_username(u_username);
		uBookmark.setB_no(b_no);
		uBookmark.setS_nostart(s_nostart);
		uBookmark.setS_nolast(s_nolast);
		uBookmark.setUb_alias(ub_alias);
		
		uBookDao.insertBookmark(uBookmark);	//디비에 즐겨찾기 추가하러
		
		return "저장완료";
	} //insertBookmark end

	//시각장애인 즐겨찾기 Detail
	public ModelAndView getBookmarkDetail(HttpSession session, int ub_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		String view = null;
		UserBookmarkBean bookmark = null;
		int u_type = (int)session.getAttribute("u_type");
		
		bookmark = uBookDao.getBookmarkDetail(ub_no);	//즐겨찾기 리스트 디비 가서 가져오기
		System.out.println("디비에서 가져온 즐겨찾기 Detail= " + bookmark);
		
		//디비에서 가져온 데이터가 있으면
		if( bookmark != null ) {		
			mav.addObject("bookmark", om.writeValueAsString(bookmark));
			if( u_type == 1 ) { 
				view = "/user/blind/bookmarkDetailForm";//.jsp
			}			
		}else {
			System.out.println("bookmark가져오기 실패-메인으로 이동");
			if( u_type == 1 ) { 
				view = "/user/blind/mainForm";//.jsp
			}
		}
		mav.setViewName(view);
		return mav;
	}
	
	//시각장애인 queryReservation
	public ModelAndView queryReservation(HttpSession session, int ub_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		String view = null;
		UserBookmarkBean bookmark = null;
		int u_type = (int)session.getAttribute("u_type");
		
		bookmark = uBookDao.confirmReservation(ub_no);	//즐겨찾기 리스트 디비 가서 가져오기
		System.out.println("디비에서 가져온 즐겨찾기 Detail= " + bookmark);
		
		//디비에서 가져온 데이터가 있으면
		if( bookmark != null ) {		
			mav.addObject("bookmark", om.writeValueAsString(bookmark));
			if( u_type == 1 ) { 
				view = "/user/blind/queryReservationForm";//.jsp
			}			
		}else {
			System.out.println("bookmark가져오기 실패-메인으로 이동");
			if( u_type == 1 ) { 
				view = "/user/blind/mainForm";//.jsp
			}
		}
		mav.setViewName(view);
		return mav;
	}
	
	


	
		
} //UserBookmarkMM class end
