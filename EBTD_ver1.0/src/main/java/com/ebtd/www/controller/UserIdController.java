package com.ebtd.www.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.ebtd.www.bean.CompanyAliasBean;
import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBean_ch;
import com.ebtd.www.dao.I_BusDao;
import com.ebtd.www.service.UserIdMM;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping(value="/user")
public class UserIdController {	//유저 - 로그인, 회원가입
	@Autowired
	private UserIdMM uIdmm;
		
	@Autowired
	I_BusDao bDao;
	
	ModelAndView mav;
	
	@RequestMapping(value = "/joinForm")
	public String joinForm(HttpSession session) {
		String view;
		//쿠키 확인 후 시각장애인일 경우 바로 이동
		/**/
		//세션에 아이디가 없을 경우만 Login으로 이동
		if(session.getAttribute("u_username")==null) {view = "/user/joinSelectType";}
		else {view = "/user/wheel/mainForm";}
		
		return view;
	}
	
	@RequestMapping(value = "/wheel/join")
	public ModelAndView wheelJoinForm() throws JsonProcessingException {
		mav = uIdmm.getTownList();
		mav.addObject("type", 0);
		mav.setViewName("/user/wheel/wheelJoin");
		return mav;
	}
	//wheel/joinAccess
	@PostMapping(value = "/wheel/joinAccess")
	public ModelAndView userJoinResult(UserBean_ch ub, HttpSession session) {
		System.out.println("회원가입 등록");
		mav = uIdmm.wheelUserJoinResult(ub);
		
		if(mav!=null) {return mav;}
		else {joinForm(session);
		
		}return mav;
		
	}
	@PostMapping(value = "/loginAccess")
    public ModelAndView login(UserBean_ch ub, HttpSession session, HttpServletResponse response) {
		
        mav = uIdmm.login(ub,session,response);
		System.out.println(session.getAttribute("u_username"));
		return mav;
	}
	@RequestMapping(value = "/loginForm")
    public String loginForm(HttpSession session, HttpServletRequest request) {        		
		
        String view = null;
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
         
        if ( session.getAttribute("u_username")==null ){ // 로그인된 세션이 없는 경우...
            // 우리가 만들어 논 쿠키를 꺼내온다.
            Cookie u_usernameCookies = WebUtils.getCookie(request, "u_username");
            Cookie u_typeCookies = WebUtils.getCookie(request, "u_type");
            System.out.println(u_typeCookies);
            
            if ( u_usernameCookies != null && u_typeCookies!=null){ // 쿠키가 존재하는 경우(이전에 로그인때 생성된 쿠키가 존재한다는 것)
                // loginCookie의 값을 꺼내오고 -> 즉, 저장해논 세션Id를 꺼내오고
                session.setAttribute("u_username", u_usernameCookies);
                session.setAttribute("u_type", u_typeCookies);
            }
        }
		
		if(session.getAttribute("u_username")==null) {view = "/user/loginForm";}
		else if(session.getAttribute("u_type").equals(0)) {view = "/user/wheel/mainForm";}
		else if(session.getAttribute("u_type").equals(1)) {view = "/user/blind/mainForm";}
		return view;
	}
	@RequestMapping(value = "/logout")
    public String logout(HttpSession session, HttpServletRequest request) {        
	        //request객체에서 쿠키 가져옴
	        Cookie[] cookies = request.getCookies();
	        //쿠키에 값이 있을경우
	        if (cookies != null) {
	            for (int i = 0; i < cookies.length; i++) {
	                System.out.println(cookies[i].getValue());
	                //쿠키값 제거
	                cookies[i].setMaxAge(0);
	            }
	        }
		session.removeAttribute("u_username");
		session.removeAttribute("u_type");
		
		String view = "redirect:/user/loginForm";
		return view;
	}
	@RequestMapping(value = "/findForm")
	public String findForm(HttpSession session, HttpServletRequest request) {
		return "/user/findForm";        
	}
	@RequestMapping(value = "/findPwForm")
	public String findPwForm(HttpSession session, HttpServletRequest request) {
		return "/user/findPwForm";        
	}
	@RequestMapping(value = "/findIdForm")
	public String findIdForm(HttpSession session, HttpServletRequest request) {
		return "/user/findIdForm";        
	}
	
	@PostMapping(value = "/findPw")
	public String findPw(HttpSession session, HttpServletRequest request) {
		return "/user/findIdForm";        
	}
	@PostMapping(value = "/selectPw")
	public ModelAndView selectPw(String u_username) {
		mav=new ModelAndView();
		mav.addObject("username",u_username);
		mav.setViewName("/user/selectPw");
		return mav;        
	}
	@PostMapping(value = "/rePw")
	public ModelAndView rePw(UserBean_ch ub) {
		mav=new ModelAndView();
		mav=uIdmm.updatePw(ub);
		return mav;        
	}
}
















