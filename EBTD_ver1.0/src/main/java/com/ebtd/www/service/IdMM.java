package com.ebtd.www.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.CompanyAliasBean;
import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBean_ch;
import com.ebtd.www.controller.AdminCompanyController;
import com.ebtd.www.dao.ICompanyDao;
import com.ebtd.www.dao.IUserIdDao;

@Service
public class IdMM {
	//companyDao 주입
	@Autowired
	private ICompanyDao cDao;
	@Autowired
	private IUserIdDao uIdDao;
	
	//모델앤 뷰 필드화
	ModelAndView mav = null;
	

	public ModelAndView login(CompanyAliasBean cb, HttpSession session) {

		mav = new ModelAndView();
		String view = null;
		
		//company DB에 일치하는 아이디 확인
		if(!cDao.existUsername(cb)) {
			//일치하는 아이디 없을 시 로그인창으로 이동 후 msg출력
			mav.addObject("msg", "일치하는 아이디가 없습니다.");
			mav.setViewName("redirect:loginForm");
			System.out.println("existUsername");
			return mav;
		}
		//암호화 모듈 사용해 들어온 비밀번호 암호화
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();		

		//패스워드 일치 확인
		String dbPwd = cDao.getPwd(cb);
		if(!pwdEncoder.matches(cb.getC_password(), dbPwd)) {
			mav.addObject("msg", "비밀번호 일치하지않음.");
			mav.setViewName("redirect:loginForm");
			return mav;
		}
		
		//cb.setC_password(encodedPwd);
		//아이디 및 pw 일치 확인 후 username 정보 입력 (없으면 null)
		String username = cb.getC_username();
		if(username!=null) {
			//일치하는 정보 있을시 userState 정보 가저옴 (1 - 승인, 3 - admin계정)			
			int c_state = cDao.accessUserState(username);
			System.out.println(c_state);
			if(c_state==0||c_state==2){
				//거절 상태 혹은 대기상태시
				mav.addObject("msg", "승인 확인 부탁드립니다.");
				view = "redirect:/loginForm";
			}else if(c_state==1) {
				//승인 완료된 회사일시
				view = "/company/companyindex";
				session.setAttribute("c_username", username);
				session.setAttribute("c_state", c_state);
			}else if(c_state==3) {
				//상태가 admin 일 경우
				view = "redirect:/admin";
				session.setAttribute("c_username", username);
				session.setAttribute("c_state", c_state);
			}
		}else {
			// 비밀번호가 틀린경우
			mav.addObject("msg", "비밀번호를 확인해주세요");
			view = "redirect:/loginForm";
			return mav;
		}mav.setViewName(view);
		
		return mav;
	}
	

	public int checkId(String c_username) {
		//아이디 있을경우 1, 아닐시 0
		return (cDao.checkId(c_username)!=null)?1:0;
	}
	public String findId(UserBean ub) {
		String result = uIdDao.findId(ub);
		return result;
	}
	
	public String findPw(UserBean ub) {
		String result = uIdDao.findPw(ub);
		System.out.println(result);
		return result;
	}
	public ModelAndView selectPw(String u_username) {
		mav=new ModelAndView();
		mav.addObject("u_username", u_username);
		mav.setViewName("/user/selectPw");
		return mav;
	}
	public ModelAndView updatePw(UserBean_ch ub) {
		mav=new ModelAndView();
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String raw = ub.getU_password();
		ub.setU_password(pwdEncoder.encode(raw));
		
		boolean result = uIdDao.updatePw(ub);
		mav.setViewName("redirect:/user/loginForm");
		return mav;
	}

	
}
