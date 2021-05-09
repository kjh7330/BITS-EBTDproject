package com.ebtd.www.service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.TownBean;
import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBean_ch;
import com.ebtd.www.dao.IUserIdDao;
import com.ebtd.www.dao.I_BusDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
@Service
public class UserIdMM {
	@Autowired
	private IUserIdDao uIdDao;
	
	@Autowired
	I_BusDao bDao;
	
	ObjectMapper om;
	ModelAndView mav;

	public ModelAndView getTownList() throws JsonProcessingException {
		mav = new ModelAndView();
		om = new ObjectMapper();
		
		//현재 있는 town의 name값을 가져옴
		ArrayList<String> townListArr = bDao.getTownNameList();
		//townList로 출력
		mav.addObject("townList", om.writeValueAsString(townListArr));
		
		return mav;
	}
	//유저 아이디 중복체크
	public int userCheckId(String u_username) {
		return (uIdDao.userCheckId(u_username)!=null)?1:0;
	}
	public int userCheckNo(String u_disableno) {
		return (uIdDao.userCheckNo(u_disableno)!=null)?1:0;
	}
	
	//유저 회원가입
	public ModelAndView wheelUserJoinResult(UserBean_ch ub) {
		mav = new ModelAndView();
		String view = null;	
		
		//암호화 모듈 등록
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		//bean에 암호화된 패스워드 등록
		System.out.println(ub.getU_password());
		ub.setU_password(pwdEncoder.encode(ub.getU_password()));
		
		System.out.println(ub.getU_password());
		System.out.println("wheelUserJoinResult");
		
		
		//userJoin으로 insert문 실행 후
		boolean flag = uIdDao.userJoin(ub);
		if(flag) {
			//성공시 
			view = "redirect:/user/loginForm";
		}else {
			//실패시
			view = "redirect:/user/wheel/wheelJoin";
		}mav.setViewName(view);
		
		return mav;
	}

	public ModelAndView login(UserBean_ch ub, HttpSession session, HttpServletResponse response) {
		mav = new ModelAndView();
		String view = null;
		//company DB에 일치하는 아이디 확인
		System.out.println("username = " + ub.getU_username());
		if(!uIdDao.existUsername(ub)) {
			System.out.println("1");
			//일치하는 아이디 없을 시 로그인창으로 이동 후 msg출력
			mav.addObject("msg", "일치하는 아이디가 없습니다.");
			mav.setViewName("redirect:/user/loginForm");
			System.out.println("existUsername");
			return mav;
		}
		//암호화 모듈 사용해 들어온 비밀번호 암호화
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();		
		//패스워드 일치 확인
		String dbPwd = uIdDao.getPwd(ub);
		System.out.println(ub.getU_password());
		System.out.println(dbPwd);
		if(!pwdEncoder.matches(ub.getU_password(), dbPwd)) {
			System.out.println("2");
			mav.addObject("msg", "일치하는 아이디가 없습니다.");
			mav.setViewName("redirect:/user/loginForm");
			return mav;
		}
		
		//cb.setC_password(encodedPwd);
		//아이디 및 pw 일치 확인 후 username 정보 입력 (없으면 null)
		String username = ub.getU_username();
		if(username!=null) {
			System.out.println("3");
			//일치하는 정보 있을시 userState 정보 가저옴 (1 - 블라인드, 0 - 휠체어)			
			int u_type = uIdDao.accessUserState(username);
			System.out.println(u_type);
			if(u_type==0){
				System.out.println("4");
				//휠체어 유저인 경우
				session.setAttribute("u_username", username);
				session.setAttribute("u_type", u_type);
				view = "redirect:/user/reservationCheck";
				
				
			}else if(u_type==1) {
				System.out.println("5");
				//시각장애인 유저인 경우
				view = "redirect:/user/blind/mainForm";
				session.setAttribute("u_username", username);
				session.setAttribute("u_type", u_type);
			}			
		}else {
			// 비밀번호가 틀린경우
			mav.addObject("msg", "비밀번호를 확인해주세요");
			view = "redirect:user/loginForm";
		}mav.setViewName(view);
        String u_type = session.getAttribute("u_type")+"";
        Cookie userNameCookie = new Cookie("u_username", username);
        Cookie TypeCookie = new Cookie("u_type", u_type);
        
        if (session.getAttribute("u_username")!=null) {
            response.addCookie(userNameCookie);
            response.addCookie(TypeCookie);
            System.out.println("3단계-쿠키 아이디저장 O");
            // 쿠키 확인
            // System.out.println("Service check" + cookie);
        } else {
            System.out.println("3단계-쿠키 아이디저장 X");
            userNameCookie.setMaxAge(0);
            TypeCookie.setMaxAge(0);
            response.addCookie(userNameCookie);
            response.addCookie(TypeCookie);
        }
		return mav;
	}
}
