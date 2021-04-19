package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.dao.I_UserDao;


@Service
public class AdminMM {

	@Autowired
	private I_UserDao uDao;

	ModelAndView mav;
	
	
	//김아름
	public List<UserBean> getUserList() {
		
		List<UserBean> uList = null;
		uList = uDao.getUserList();	//userList 디비 가서 가져오기
		
		//디비에서 긁어온 데이터가 있으면
		if(uList!=null && uList.size()!= 0) {
			mav.addObject("uList", uList);
			//json으로 변환?
			//mav.addObject("bList2", new Gson().toJson(bList));	//js
			
			//페이징을 하던 무한대로 쓸수있게 하던 해야됨 !
			//mav.addObject("paging", getPaging(pageNum));	//페이징?	
			//view는 없음, DB긁어오기만
			
			return uList;
		}else {
			return null;
		}
		 	
	} //getUserList end

}
