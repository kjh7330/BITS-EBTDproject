package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.dao.I_CompanyStopDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CompanyStopMM {
	ModelAndView mav;
	@Autowired
	private I_CompanyStopDao sDao;

	//정류장 정보 가져오기
	public ModelAndView getStopList() throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 

		ObjectMapper om =new ObjectMapper(); 

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

	//특정 정류장 정보 검색
	public String searchStop(String S_NAME) throws JsonProcessingException {
		ObjectMapper om = new ObjectMapper();
		List<StopBean> cList = null;
		cList = sDao.searchStop(S_NAME); 
		if(cList!=null && cList.size()!=0) { 
			System.out.println(cList);
			System.out.println("특정 정류장 정보 가져오기 성공"); 
			String omList = om.writeValueAsString(cList);
			return omList;
		} 

		return null;
	}


	//정류장 상세정보
	public ModelAndView getStopDetail(Integer S_NO) throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 

		ObjectMapper om =new ObjectMapper(); 

		List<StopBean> dList = null;

		dList = sDao.getStopDetail(S_NO); 

		//System.out.println(S_NO);
		
		
		if(dList!=null && dList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("dList",om.writeValueAsString(dList));
			view = "company/stopDetailForm";
			System.out.println("정류장 상세정보 가져오기 성공"); 
			System.out.println(dList);
			mav.setViewName(view); 
		} 
		else { 
			view = "company/stopListForm";
			System.out.println("정류장 상세정보 가져오기 실패"); 
			mav.setViewName(view);

		}
		return mav; 
	}



	//정류장 신청
	public ModelAndView addNewStop(StopApplyBean sa) {
		mav = new ModelAndView();
		String view = null;
		boolean b= sDao.addNewStop(sa);
		System.out.println(b);
		if(b) {
			System.out.println("등록신청 성공");
			view="company/companyindex"; //성공시 회사 메인 페이지 
		}else {
			System.out.println("등록신청 실패");
			view="company/addNewStopForm"; //실패시 정류장 등록 페이지
		}
		mav.setViewName(view);
		return mav;
	}



	//정류장 신청내역 가져오기
	public ModelAndView getNewStopConfirmList() throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 

		ObjectMapper om =new ObjectMapper(); 

		List<StopApplyBean> nList = null;

		nList = sDao.getNewStopConfirmList(); 

		if(nList!=null && nList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("nList",om.writeValueAsString(nList));
			view = "company/newStopConfirmListForm";
			System.out.println("정류장 등록신청 정보 가져오기 성공"); 
			mav.setViewName(view); 
		} 
		else { 
			view = "company/companyindex";
			System.out.println("정류장 등록신청 정보 가져오기 실패"); 
			mav.setViewName(view);

		}
		return mav; 
	}
	
	//동 이름 중복조회
	public String checkSaName(String S_NAME) {
		System.out.println(S_NAME);
		StopBean sb = null;
		sb = sDao.checkSaName(S_NAME);
		System.out.println(sb);
		
		if(sb != null) { //검색 결과가 있다면		
			return "사용불가한 정류장 이름"; }
		return null;
	}
	
	//정류장 위치 중복조회
	public String checkSaPosition(int S_X, int S_Y) {
		System.out.println(S_X);
		System.out.println(S_Y);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		StopBean sb = null;
		sb = sDao.checkSaPosition(S_X, S_Y);
		System.out.println(sb);
		
		if(sb != null) { //검색 결과가 있다면		
			return "사용불가한 정류장 위치"; }
		return null;
	}
	
	//정류장 신청 정보 상세
	public ModelAndView getStopApplyDetail(Integer sa_No) throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 
		System.out.println(sa_No);
		ObjectMapper om =new ObjectMapper(); 
		
		List<StopBean> aList = null;

		aList = sDao.getStopApplyDetail(sa_No); 

		
		if(aList!=null && aList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("aList",om.writeValueAsString(aList));
			view = "company/newStopConfirmDetailForm";
			System.out.println("정류장신청 상세정보 가져오기 성공"); 
			System.out.println(aList);
			mav.setViewName(view); 
		} 
		else { 
			view = "company/newStopConfirmListForm";
			System.out.println("정류장신청 상세정보 가져오기 실패"); 
			mav.setViewName(view);

		}
		return mav; 
	}

	
}
