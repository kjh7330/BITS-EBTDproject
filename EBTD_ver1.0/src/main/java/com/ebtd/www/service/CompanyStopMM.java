package com.ebtd.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.exception.CommonException;
import com.ebtd.www.common.Paging;
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
	public ModelAndView getStopList(Integer pageNum) throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 
		ObjectMapper om =new ObjectMapper(); 
		List<StopBean> sList = null;
		
		pageNum = (pageNum==null)? 1 : pageNum;
		
		if(pageNum<=0) {
			throw new CommonException("잘못된 페이지번호 입니다.");
		}
		
		sList = sDao.getStopList(pageNum); 
		if(sList!=null && sList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("sList",om.writeValueAsString(sList));
			mav.addObject("paging", getPaging(pageNum));
			view = "company/stopListForm";
			//System.out.println("정류장 정보 가져오기 성공"); 
			mav.setViewName(view); 
		} 
		else { 
			view = "company/companyindex";
			//System.out.println("정류장 정보 가져오기 실패"); 
		}
		mav.setViewName(view);
		return mav; 
	}
	
	//페이징
	private String getPaging(Integer pageNum) {
		int maxNum = sDao.getBoardCount(); //전체 정류장 수
		int listCount = 20;
		int pageCount = 5;
		String boardName = "getStopList"; //url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging(); //"<이전><a href=3 4><다음>"
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
	
		//System.out.println(S_NAME);
		StopBean sb = null;
		sb = sDao.checkSaName(S_NAME);
		//System.out.println(sb);
		
		if(sb != null) { //검색 결과가 있다면		
			return "사용불가한 정류장 이름"; }
		return null;

		
	}
	
	//정류장 위치 중복조회
	public String checkSaPosition(int S_X, int S_Y) {
		//System.out.println(S_X);
		//System.out.println(S_Y);
		//파라미터 2개를 map에 담음(myBatis에서 파라미터 2개 안먹음)
		Map map = new HashMap();
		map.put("S_X", S_X);
		map.put("S_Y", S_Y);
		StopBean sb = null;
		sb = sDao.checkSaPosition(map);	
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
			//System.out.println(aList);
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
