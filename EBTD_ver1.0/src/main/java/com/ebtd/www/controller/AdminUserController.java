package com.ebtd.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.service.AdminMM;

@Controller
public class AdminUserController {	//김아름
	
	@Autowired
	private AdminMM am;	//관리자 서비스 클래스
	
	ModelAndView mav;

	
		//이용자 리스트 전체 가져오기
		@GetMapping(value = "/getUserList")
		public String getUserList() {	
			List<UserBean> uList;
			uList= am.getUserList();	
			return null;	//uList에서 gson or jackson 사용해서 String으로 바꿔온 것을 반환 해야함	
		}	
		
		//김아름
		//이용자 리스트 페이지 이동
		@GetMapping(value = "/userListForm")
		public String userListForm() {		
			//mav = new ModelAndView();
			//mav.setViewName("joinFrm");
			return "/admin/user/userListForm";	//.jsp
		}
		
		//이용자 히스토리 전체 리스트 가져오기
		@GetMapping(value = "/getUserHistoryList")
		public String getUserHistoryList() {	
			List<UserBean> uList;
			//uList= am.getUserHistoryList();	
			return null;	//uList에서 gson or jackson 사용해서 String으로 바꿔온 것을 반환 해야함	
		}
		//이용자 히스토리 리스트 페이지 이동
		@GetMapping(value = "/userHistoryListForm")
		public String userHistoryListForm() {		
			//mav = new ModelAndView();
			//mav.setViewName("joinFrm");
			return "/admin/user/userListForm";	//.jsp
		}
		//이용자 통계 가져오기
		@GetMapping(value = "/getUserChart")
		public String getUserChart() {	
			List<UserBean> uList;
			//uList= am.getUserChart();	
			return null;	//uList에서 gson or jackson 사용해서 String으로 바꿔온 것을 반환 해야함	
		}
		//이용자 통계 페이지 이동
		@GetMapping(value = "/userChartForm")
		public String userChartForm() {		
			//mav = new ModelAndView();
			//mav.setViewName("joinFrm");
			return "/admin/user/userListForm";	//.jsp
		}
		
}
