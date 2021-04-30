package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.dao.I_UserMypageDao;

@Service
public class UserMypageMM {
	
	@Autowired
	private I_UserMypageDao umDao;
	
	ModelAndView mav;
	//휠체어 유저 정보들 가져오기
	public ModelAndView getUserMyInfo(String u_username) {
		mav = new ModelAndView();
		String view = null;
		List<UserBean> miList = null;
		miList = umDao.getUserMyInfo(u_username);
		mav.addObject("miList", miList);
		if(miList.get(0).getU_type()==0) {
			view="user/wheel/userMyInfoForm";
		}else if(miList.get(0).getU_type()==1) {
			view="user/wheel/userMyInfoForm";
		}
		mav.setViewName(view);
		return mav;
		
	}
	public ModelAndView setUserMyInfo(UserBean ub) {
		mav = new ModelAndView();
		String view = null;
		
		List<UserBean> miList = null;
		umDao.setUserMyInfo(ub);
		miList = umDao.getUserMyInfo(ub.getU_userName());
		mav.addObject("miList", miList);
		view="redirect:/user/getUserMyInfo";
		mav.setViewName(view);
		return mav;
	}

}
