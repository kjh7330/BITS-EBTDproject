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
	
	public ModelAndView getBookmarkList(HttpSession session) throws JsonProcessingException {
		
		mav = new ModelAndView();	
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<UserBookmarkBean> uBookList = null;
		
		String u_userName = session.getAttribute("u_username").toString();
		System.out.println("세션에서 꺼낸 u_username = " + u_userName);
		uBookList = uBookDao.getBookmarkList(u_userName);	//즐겨찾기 리스트 디비 가서 가져오기
		System.out.println("디비에서 가져온 즐겨찾기 리스트 = " + uBookList);

		//디비에서 가져온 데이터가 있으면
		if( (uBookList!=null) && (uBookList.size()!= 0) ) {
			mav.addObject("uBookList", om.writeValueAsString(uBookList));
			//mav.addObject("uBookList2", uBookList);
			//잭슨으로 데이터-->json으로 변환
			view = "/user/wheel/wheelBookmarkListForm";//.jsp
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?		
		}else {
			System.out.println("uBookList가져오기 실패-메인으로 이동");
			view = "/user/wheel/mainForm";
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
	public String insertBookmark(String ub_no, String u_userName, String b_no, int s_noStart, int s_noLast, String ub_alias) {
		UserBookmarkBean uBookmark = new UserBookmarkBean();
		uBookmark.setUb_no(ub_no);
		uBookmark.setU_userName(u_userName);
		uBookmark.setB_no(b_no);
		uBookmark.setS_noStart(s_noStart);
		uBookmark.setS_noLast(s_noLast);
		uBookmark.setUb_alias(ub_alias);
		
		uBookDao.insertBookmark(uBookmark);	//디비에 즐겨찾기 추가하러
		
		return "저장완료";
	} //insertBookmark end
		
} //UserBookmarkMM class end
