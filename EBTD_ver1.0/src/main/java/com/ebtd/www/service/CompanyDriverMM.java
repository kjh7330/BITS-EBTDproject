package com.ebtd.www.service;


import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	public ModelAndView getDriverList(String c_username) throws JsonProcessingException {
		mav = new ModelAndView(); 
		String view=null; 
		
		ObjectMapper om =new ObjectMapper(); 
		List<DriverBean> dList = null;
		
		dList = dDao.getDriverList(c_username); 
		//System.out.println("@@@@@@@@@@@@");
		//System.out.println(dList);
		if(dList!=null && dList.size()!=0) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			
			//시간 짜르고 날짜만
			for(DriverBean data : dList) data.setD_enterDate( data.getD_enterDate().substring(0,10));
			mav.addObject("dList",om.writeValueAsString(dList));
			view = "company/driverListForm";
		
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

		DriverBean rBean = null;

		rBean = dDao.getDriverDetail(d_no); 
		
		if(rBean!=null) { 
			//ObjectMapper를 사용해서 리스트를 json으로 변환 
			mav.addObject("rBean",om.writeValueAsString(rBean));
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
		boolean b= dDao.addDriver(db);
		System.out.println(b);
		if(b) {
			System.out.println("기사 추가 성공");
			view="redirect:getDriverList"; //성공시 기사 리스트 페이지 
		}else {
			System.out.println("기사 추가 실패");
			view="company/addDriverForm"; //실패시 기사 추가 페이지
		}
		mav.setViewName(view);
		return mav;
	}
	
//	public ModelAndView addDriver(MultipartHttpServletRequest multi) {
//		mav=new ModelAndView();
//		String view=null;
//		int d_no=Integer.parseInt(multi.getParameter("d_no"));
//		String c_userName=multi.getParameter("c_userName");
//		String d_name=multi.getParameter("d_name");
//		String d_imgExtention=multi.getParameter("d_imgExtention");
//		String d_phoneNum=multi.getParameter("d_phoneNum");
//		String enterDate=multi.getParameter("b_contents");
//		String b_no=multi.getParameter("b_no");
		

//		Board board=new Board();
//		board.setB_title(title).setB_contents(contents).setB_id(id);
		
//		boolean b=dDao.addDriver(db); //글번호:시퀀스
//		System.out.println("bnum="+board.getB_num());
//		if(b) {//글쓰기 성공
//			view="company/companyindex";
//		}else {
//			view="company/addDriverForm";
//			check=0;
//		}
//		if(check==1) {
//			//현재 글번호
//			//int bnum=bDao.getCurBoardNum();
//			if(fm.fileUp(multi, board.getB_num())) {
//				System.out.println("upload OK");
//				view="company/companyindex";
//			}else {
//				view="company/addDriverForm";
//			}
//		}
//		mav.setViewName(view);
//		return mav;
//	}
		
		
	
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
	
	//기사정보 수정하기(로그인 꼭 하기@@@@@@@@@@@@@@@)
	public ModelAndView updateDriver(DriverBean db) {
		mav = new ModelAndView();
		String view = null;
		
		System.out.println(db.getD_no());
		boolean b= dDao.updateDriver(db);
		System.out.println("bbbb"+b);
		if(b) {
			System.out.println("기사정보 수정 성공");
			
			mav.setViewName("redirect:getDriverList"); //성공시 기사 목록 페이지 
		}else {
			System.out.println("기사정보 수정 실패");
			mav.setViewName("redirect:getDriverDetail"); //실패시 기사 목록 페이지
		}
		return mav;
	}
	
	//드라이버 삭제
	public ModelAndView deleteDriver(int d_no) {
		mav = new ModelAndView();
		String view = null;
		
		boolean b = dDao.deleteDriver(d_no);
		if(b) {
			System.out.println("기사 삭제 성공");
			mav.setViewName("redirect:getDriverList"); //성공시 기사 목록 페이지 
		}else {
			System.out.println("기사 삭제 실패");
			mav.setViewName("redirect:getDriverDetail"); //실패시 기사 목록 페이지
		}
		return mav;
	}


}
