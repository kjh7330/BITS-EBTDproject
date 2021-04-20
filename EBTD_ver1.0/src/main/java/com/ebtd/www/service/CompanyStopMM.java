package com.ebtd.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopBean;
import com.ebtd.www.dao.I_AdminStopDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CompanyStopMM {
	ModelAndView mav;
	@Autowired
	private I_AdminStopDao sDao;
	
	//정류장 정보 띄워주기
	public ModelAndView getStopList() throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 
		
		ObjectMapper om =new ObjectMapper(); 
		

		//List<Map<String, Object>> sList = null;
		List<StopBean> sList = null;

		sList = sDao.getStopList(); 
		
		if(sList!=null && sList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("sList",om.writeValueAsString(sList));
			//System.out.println(om.writeValueAsString(sList));
			view = "company/stopListForm";
			//System.out.println(sList);
			//System.out.println(sList.get(0).getS_name());
			System.out.println("정류장 정보 가져오기 성공"); 
			mav.setViewName(view); 
			} 
		else { 
			view = "company/companyindex";
			System.out.println("정류장 정보 가져오기 실패"); 
			mav.setViewName(view);

		}
		return mav; 
	}
	
	//정류장 중복조회
	public void checkStop() {
		
		
	}
	
	/*
	 * public ModelAndView addNewStop() { mav=new ModelAndView(); String view=null;
	 * 
	 * boolean b= sDao.addNewStop(); if(b) {//정류장 신청 성공
	 * view="company/addNewStopForm"; }else {//정류장 신청 실패
	 * view="company/companyindex"; }
	 * 
	 * mav.setViewName(view); return mav; }
	 */
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * //정류장 등록신청 public void addNewStop() { sDao.addNewStop();
	 * 
	 * }
	 */

	
}
