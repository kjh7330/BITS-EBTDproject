package com.ebtd.www.service;


import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.CompanyBusBean;
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
		//System.out.println("@@@@@@@@@@@@");
		//System.out.println(dList);
		if(dList!=null && dList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("dList",om.writeValueAsString(dList));
			view = "company/driverListForm";
			//System.out.println(dList);
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
	
	//기사정보 상세보기
	public ModelAndView getDriverDetail(int d_no) throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 

		ObjectMapper om =new ObjectMapper(); 

		List<DriverBean> rList = null;

		rList = dDao.getDriverDetail(d_no); 
		System.out.println("@@@@@@@@@@@@");
		
		if(rList!=null && rList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("rList",om.writeValueAsString(rList));
			view = "company/driverDetailForm";
			System.out.println("기사 상세정보 가져오기 성공"); 
			//System.out.println(rList);
			mav.setViewName(view); 
		} 
		else { 
			view = "company/driverListForm";
			System.out.println("기사 상세정보 가져오기 실패"); 
			mav.setViewName(view);

		}
		return mav; 
	}
	
	//기사 추가
	public ModelAndView addDriver(DriverBean db) {
		mav = new ModelAndView();
		String view = null;
		System.out.println(db.getD_imgExtention()); 
		boolean b= dDao.addDriver(db);
		System.out.println(b);
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
	
	//해당회사 노선 가져오기
	public String getCompanyBusList(String C_USERNAME) throws JsonProcessingException { 
		ObjectMapper om =new ObjectMapper(); 
//		mav = new ModelAndView();
		LinkedList<CompanyBusBean> bList = null;
		//System.out.println(C_USERNAME);
		bList = dDao.getCompanyBusList(C_USERNAME); 
//		if(bList!=null && bList.size()!=0) { 
//		mav.addObject("bList",om.writeValueAsString(bList));
//			System.out.println("회사 노선 가져오기 성공"); 
//		} 
//		else { 
//			System.out.println("회사 노선 가져오기 실패"); 
//		}		System.out.println("@@@@@@@@@@@@@@@@@@@@");
	
		return om.writeValueAsString(bList); 
	}


}
