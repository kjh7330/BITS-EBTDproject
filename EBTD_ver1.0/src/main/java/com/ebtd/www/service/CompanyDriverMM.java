package com.ebtd.www.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.DriverBean;
import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.dao.I_CompanyDriverDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CompanyDriverMM {
	ModelAndView mav;
	@Autowired
	private I_CompanyDriverDao dDao;
	
	//기사 정보 가져오기
	public ModelAndView getDriverList() throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 
		
		ObjectMapper om =new ObjectMapper(); 
		
		List<DriverBean> dList = null;

		dList = dDao.getDriverList(); 
		
		if(dList!=null && dList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("dList",om.writeValueAsString(dList));
			view = "company/driverListForm";
			System.out.println(dList);
			//System.out.println(sList.get(0).getS_name());
			System.out.println("기사 정보 가져오기 성공"); 
			mav.setViewName(view); 
			} 
		else { 
			view = "company/companyindex";
			System.out.println("기사 정보 가져오기 실패"); 
			mav.setViewName(view);

		}
		return mav; 
	}
	
	//기사 추가
	public ModelAndView addDriver(DriverBean db) {
		mav = new ModelAndView();
		String view = null;
		boolean b= dDao.addDriver(db);
		//System.out.println(b);
		if(b) {
			System.out.println("기사 추가 성공");
			view="company/companyindex"; //성공시 회사 메인 페이지 
		}else {
			System.out.println("기사 추가 실패");
			view="company/addDriverForm"; //실패시 기사 추가 페이지
		}
		mav.setViewName(view);
		return mav;
	}
	

}
