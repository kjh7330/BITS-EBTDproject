package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.dao.I_UserMypageDao;

@Service
public class UserMypageMM {
	
	@Autowired
	private I_UserMypageDao umDao;
	
	ModelAndView mav;
	//휠체어 유저 정보들 가져오기
/*	public ModelAndView getUserMyInfo() {
		mav = new ModelAndView();
		String view = null;
		List<UserBean> miList = null;
		miList = umDao.getUserMyInfo();
		mav.addObject("miList", miList);
		view="user/wheel/userMyInfoForm";
		mav.setViewName(view);
		return mav;
	}
*/
}
