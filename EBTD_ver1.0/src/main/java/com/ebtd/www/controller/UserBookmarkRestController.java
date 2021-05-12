package com.ebtd.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.UserBookmarkBean;
import com.ebtd.www.service.AdminUserMM;
import com.ebtd.www.service.UserBookmarkMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
@RequestMapping(value = "/user")
public class UserBookmarkRestController {

	@Autowired 
	private UserBookmarkMM ubm;	//관리자 이용자 관리 서비스 클래스

	ModelAndView mav;
	
	//즐겨찾기 별 색깔 없애면
	@PostMapping(value = "/deleteBookmark", produces =  "text/plain;charset=utf-8")
	public String deleteBookmark(String ub_no) throws JsonProcessingException {	
		return ubm.deleteBookmark(ub_no);	
	}
	
	//즐겨찾기 별 색깔 생기면
	@PostMapping(value = "/insertBookmark", produces =  "text/plain;charset=utf-8")
	public String insertBookmark(String ub_no, String u_userName, String b_no, int s_noStart, int s_noLast, String ub_alias) throws JsonProcessingException {	
		return ubm.insertBookmark(ub_no, u_userName, b_no, s_noStart, s_noLast, ub_alias);
					
	}
	
	//즐겨찾기 동이름 선택시
	@GetMapping(value = "/getRouteBusList", produces = "application/json;charset=utf-8")
	public List<String> getRouteBusList(String t_name) throws JsonProcessingException {	
		return ubm.getRouteBusList(t_name);
					
	}
	
	//즐겨찾기 노선번호 선택시
	@GetMapping(value = "/getRouteStopList", produces = "application/json;charset=utf-8")
	public List<StopBean> getRouteStopList(String b_no) throws JsonProcessingException {	
		List<StopBean> sList = null;
		sList = ubm.getRouteStopList(b_no);
		return sList;
					
	}
	

	 //즐겨찾기 위치 중복조회
	 
	 @GetMapping(value="/checkBookMark", produces ="text/plain;charset=utf-8")
	 public ResponseEntity<?> checkBookMark(HttpSession session, int s_nostart, int s_nolast){
	 
	 return ResponseEntity.ok(ubm.checkBookMark(session, s_nostart, s_nolast));
	 
	 }
}
