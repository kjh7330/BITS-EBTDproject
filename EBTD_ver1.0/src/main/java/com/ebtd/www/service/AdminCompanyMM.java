package com.ebtd.www.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.Company;
import com.ebtd.www.bean.VocBean;
import com.ebtd.www.dao.I_AdminCompanyDao;
import com.ebtd.www.dao.I_BusDao;
import com.ebtd.www.dao.I_CompanyUserDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class AdminCompanyMM {
	
	@Autowired
	private I_AdminCompanyDao cDao;
	@Autowired
	I_CompanyUserDao uDao;
	@Autowired
	I_BusDao bDao;
	
	ModelAndView mav;
	//회사 등록 요청 리스트 가져오기 -> 리스트 출력 페이지로 이동
	public ModelAndView getCompanyRequestList() {
		mav = new ModelAndView();
		String view=null;
		List<Company> cList = null;
		cList = cDao.getCompanyRequestList();
		mav.addObject("cList", cList);
		view="admin/company/companyRequestListForm";
		mav.setViewName(view);
		return mav;
	}
	//회사 신청 리스트 페이지에서 클릭한 회사의 '신청 상세 내역'을 가져오기
	public ModelAndView getCompanyRequestDetail(String c_name) {
		mav = new ModelAndView();
		String view=null;
		List<ApplyBusHistory> abList = null;
		List<ApplyBusHistory> abrList = null;
		//상세내역 및 공문 가져오기
		abList = cDao.getCompanyRequestDetail(c_name);
		//노선 가져오기
		abrList = cDao.getCompanyRequestRouteList(c_name);
		mav.addObject("abList", abList);
		mav.addObject("abrList",abrList);
		view="admin/company/companyRequestDetailForm";
		mav.setViewName(view);
		return mav;
	}
	//신규 회사 승인 처리 -> C_STATE '0'->'1' -> 성공시, 다시 목록 페이지로 이동
	public ModelAndView setCompanyRequestApproval(String c_name) {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		cDao.setCompanyRequestApproval(c_name);
		cList = cDao.getCompanyRequestList();
		System.out.println(cList);//
		if(cList == null) {
			mav.addObject("cList", cList);
			view="redirect:/admin/company/getCompanyRequestList";
		}else {		
			for(int i=0; i<cList.size();i++) {
				if(cList.get(i).getC_name() == c_name && cList.get(i).getC_state()==1) {
					view="redirect:/admin";
				}else {
					mav.addObject("cList", cList);
					view="redirect:/admin/company/getCompanyRequestList";
				}
			}
		}
		mav.setViewName(view);
		return mav;
	}
	//신규 회사 반려 처리 -> DELETE -> 성공시, 다시 목록 페이지로 이동
	@Transactional
	public ModelAndView setCompanyRequestReject(String c_username) {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		List<ApplyBusHistory> abList = null;
		try {
		//DELETE 순서 : DRIVER -> ALLBUS -> BUS -> APPLY_BUS_HISTORY_DETAIL -> APPLY_BUS_HISTORY -> OFFICIAL_DOCUMENT -> COMPANY
			abList = cDao.getUsernameInBus(c_username);
			if(abList != null) {
				cDao.setDeleteDriver(c_username);
				cDao.setDeleteAllbus(c_username);
				cDao.setDeleteBus(c_username);
				cDao.setDeleteApplybusHistorydetail(c_username);
				cDao.setDeleteApplybushistory(c_username);
			}
			cDao.setDeleteOfficialdocument(c_username);
			cDao.setDeleteCompany(c_username);
			System.out.println("신규 회사 등록 반려(삭제) 트랜잭션 성공");
		}catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//바로 롤백되지 않고 문제가 생기면 커밋되기 직전에 롤백됨.
			System.out.println("신규 회사 등록 반려(삭제) 트랜잭션 실패");
		}
		cList = cDao.getCompanyRequestList();
		for(int i=0; i<cList.size();i++) {
			if(cList.get(i).getC_username() == c_username) {
				System.out.println("삭제가 안됨.. 문제가 있다는 얘기죠~?");
				view="redirect:/admin";
			}else {
				mav.addObject("cList", cList);
				view="redirect:/admin/company/getCompanyRequestList";
			}
		}
		mav.setViewName(view);
		return mav;
	}
	//신규 노선 등록 신청 목록을 가져옴
	//주의! 회사의 노선 신규등록만(ap_state=0) 가져와야함!
	//확인필요! 이미 등록된 회사들은 배제야함.. 가져와야함!!!!!
	public ModelAndView getNewBusRouteList() {
		mav = new ModelAndView();
		String view=null;
		List<ApplyBusHistory> abnList = null;
		abnList = cDao.getNewBusRouteList();
		mav.addObject("abnList",abnList);
		view="admin/company/newBusRouteListForm";
		mav.setViewName(view);
		return mav;
	}
	//신규등록 버스노선의 노선보기의 상세 가져오기
	public String getNewBusRouteDetail(String ap_b_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<ApplyBusHistory> abndList = null;
		abndList = cDao.getNewBusRouteDetail(ap_b_no);
		
		return om.writeValueAsString(abndList);
	}
	//신규등록 버스노선의 공문보기 상세 가져오기
	public String getNewBusOfficialDocument(String ap_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<ApplyBusHistory> abndList = null;
		abndList = cDao.getNewBusOfficialDocument(ap_no);
		
		return om.writeValueAsString(abndList);
	}
	//신규등록 버스노선의 번호만 가져오기
	public String getNewBusNumber(String ap_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<ApplyBusHistory> abndList = null;
		abndList = cDao.getNewBusNumber(ap_no);
		
		return om.writeValueAsString(abndList);
	}
	//신규등록 버스 승인하기
	@Transactional
	public ModelAndView setNewBusRouteApproval(String ap_b_no, int ap_no) {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> cList = null;
		ApplyBusHistory abhBean = new ApplyBusHistory();
		abhBean.setAp_b_no(ap_b_no);
		abhBean.setAp_no(ap_no);
		try {
			cDao.setApplyBusHistoryChangeApproval(ap_b_no);
			cDao.setAllBusChangeApproval(ap_b_no);
			cDao.setNewRouteBus(abhBean);
			System.out.println("신규 버스 등록 트랜잭션 성공");
		} catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//바로 롤백되지 않고 문제가 생기면 커밋되기 직전에 롤백됨.
			System.out.println("신규 버스 등록 트랜잭션 실패");
		}
		cList = cDao.getNewBusRouteList();
		System.out.println(cList);//
		if(cList == null) {
			mav.addObject("cList", cList);
			view="redirect:/admin/company/getNewBusRouteList";
		}else {
			for(int i=0; i<cList.size();i++) {
				if(cList.get(i).getAp_b_no() == ap_b_no) {
					view="redirect:/admin";
					System.out.println("신규버스 등록 실패! 쿠구구궁");
				}else {
					mav.addObject("cList", cList);
					view="redirect:/admin/company/getNewBusRouteList";
				}
			}
		}
		mav.setViewName(view);
		return mav;
	}
	//신규등록 버스 반려하기
	public ModelAndView setNewBusRouteReject(Map<String, Object>cMap) {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> cList = null;
		cDao.setApplyBusHistoryChange2Reject(cMap);
		cDao.setDeleteAllbus2(cMap);
		cDao.setDeleteDriver2(cMap);
		cDao.setDeleteBus2(cMap);
		cList = cDao.getNewBusRouteList();
		System.out.println(cList);
		mav.addObject("cList", cList);
		view="redirect:admin/company/getNewBusRouteList";
		mav.setViewName(view);
		return mav;
	}
	//버스 노선 변경 요청 목록 가져오기
	//주의! 노선 상태(ap_state=3) 인것만 가져와야함!
	public ModelAndView getUpdateBusRouteList() {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> abnList = null;
		abnList = cDao.getUpdateBusRouteList();
		System.out.println(abnList);
		mav.addObject("abnList",abnList);
		view="admin/company/updateBusRouteListForm";
		mav.setViewName(view);
		return mav;
	}
	//버스 노선 변경 요청 상세 가져오기
	public String getUpdateBusRouteDetail(String ap_b_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<ApplyBusHistory> abndList = null;
		abndList = cDao.getUpdateBusRouteDetail(ap_b_no);
		
		return om.writeValueAsString(abndList);
	}
	//버스 노선 변경 공문보기 상세 가져오기
	public String getUpdateBusOfficialDocument(String ap_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<ApplyBusHistory> abndList = null;
		abndList = cDao.getUpdateBusOfficialDocument(ap_no);
		
		return om.writeValueAsString(abndList);
	}
	//버스노선 변경 요청의 버스 번호만 가져오기
	public String getUpdateBusNumber(String ap_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<ApplyBusHistory> abndList = null;
		abndList = cDao.getUpdateBusNumber(ap_no);
		
		return om.writeValueAsString(abndList);
	}
//	//버스노선 변경 승인하기
	@Transactional
	public ModelAndView setUpdateBusRouteApproval(String ap_b_no, int ap_no) {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> cList = null;
		ApplyBusHistory abhBean = new ApplyBusHistory();
		abhBean.setAp_b_no(ap_b_no);
		abhBean.setAp_no(ap_no);
		System.out.println(abhBean);
		try {
			cDao.setApplyBusHistoryChange4Approval(abhBean);
			cDao.setDeleteRouteBus(ap_b_no);
			cDao.setUpdateRouteBus(abhBean);
			System.out.println("신규 버스 등록 트랜잭션 성공");
		} catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//바로 롤백되지 않고 문제가 생기면 커밋되기 직전에 롤백됨.
			System.out.println("신규 버스 등록 트랜잭션 실패");
		}
		cList = cDao.getNewBusRouteList();
		System.out.println(cList);//
		for(int i=0; i<cList.size();i++) {
			if(cList.get(i).getAp_b_no() == ap_b_no) {
				view="redirect:/admin";
				System.out.println("신규버스 등록 실패! 쿠구구궁");
			}else {
				mav.addObject("cList", cList);
				view="redirect:/admin/company/getUpdateBusRouteList";
			}
		}
		mav.setViewName(view);
		return mav;
	}
	//버스노선 변경 반려하기
	public ModelAndView setUpdateBusRouteReject(Map<String, Object>cMap) {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> cList = null;
		cDao.setApplyBusHistoryChange5Reject(cMap);
		cList = cDao.getNewBusRouteList();
		System.out.println(cList);
		mav.addObject("cList", cList);
		view="redirect:/admin/company/getUpdateBusRouteList";
		mav.setViewName(view);
		return mav;
	}
	
	//버스 회사 이름 목록 가져오기
	public ModelAndView getCompanyNameList() throws JsonProcessingException {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		ObjectMapper om = new ObjectMapper();
		
		cList = cDao.getCompanyNameList();
		
		if(cList != null && cList.size() != 0) {
			mav.addObject("cList", om.writeValueAsString(cList));
			view="admin/company/companyNameListForm";
		}else {
			view="redirect:/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	
	//선택한 버스회사의 상세 정보 가져오기
	public ModelAndView getCompanyDetail(String c_username) {
		mav = new ModelAndView();
		String view = null;
		Company cName = null; // 회사이름이 안담겨서 따로 가져옴ㅠ
		List<Company> vrCountList = null; // 민원수, 추천수
		List<Company> bdCountList = null; // 버스번호, 총버스수, 기사수
		List<Company> lrCountList = null; // 버스번호, 저상버스수, 일반버스수
		
		cName = cDao.getCompanyName(c_username);
		vrCountList = cDao.getVocRecommendCount(c_username);
		bdCountList = cDao.getBusDriverCount(c_username);
		lrCountList = cDao.getLowfloorRegularCount(c_username);
		
		if(bdCountList !=null && vrCountList !=null && lrCountList !=null) {
			mav.addObject("cName", cName);
			mav.addObject("vrCountList", vrCountList);
			mav.addObject("bdCountList", bdCountList);
			mav.addObject("lrCountList", lrCountList);
			view="admin/company/companyDetailForm";
		}else {
			view="redirect:/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	//선택한 버스회사의 문의함 목록 가져오기
	public ModelAndView getCompanyQuestionList(String c_username) {
		mav = new ModelAndView();
		String view = null;
		Company cName = null; // 회사이름이 안담겨서 따로 가져옴ㅠ
		List<Company> vrCountList = null; // 버스번호, 민원수, 추천수
		List<Company> vocList = null;
		cName = cDao.getCompanyName(c_username);
		vrCountList = cDao.getVocRecommendCount(c_username);
		vocList = cDao.getCompanyQuestionList(c_username);
		//if(vocList != null && vocList.size() != 0) { //현재 null이라서
		if(cName != null) {
			mav.addObject("cName", cName);
			mav.addObject("vrCountList", vrCountList);
			mav.addObject("vocList", vocList);
			view="admin/company/companyQuestionListForm";
		}else {
			view="redirect:/admin";
		}
		mav.setViewName(view);
		return mav;
	}
	//승인된 목록 가져오기
	public ModelAndView getCompanyApprovalList() throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<ApplyBusHistory> baList = null;
		baList = cDao.getCompanyApprovalList();
		
		mav.addObject("baList", om.writeValueAsString(baList));
		view="admin/company/companyApprovalListForm";
		mav.setViewName(view);
		return mav;
	}
	//승인 상세 내역 가져오기
	public ModelAndView getCompanyApprovalDetail(int ap_no, String ap_b_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<ApplyBusHistory> aList = null;
		ApplyBusHistory abh = new ApplyBusHistory();
		abh.setAp_no(ap_no);
		abh.setAp_b_no(ap_b_no);
		aList = cDao.getCompanyApprovalDetail(abh);
		System.out.println(aList);
		mav.addObject("aList", om.writeValueAsString(aList));
		view="admin/company/companyApprovalDetailForm";
		mav.setViewName(view);
		return mav;
	}
	//반려된 목록 가져오기
	public ModelAndView getCompanyRejectList() throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<ApplyBusHistory> baList = null;
		baList = cDao.getCompanyRejectList();
		
		mav.addObject("baList", om.writeValueAsString(baList));
		view="admin/company/companyRejectListForm";
		mav.setViewName(view);
		return mav;
	}
	//반려 상세 내역 가져오기
	public ModelAndView getCompanyRejectDetail(int ap_no, String ap_b_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		String view = null;
		List<ApplyBusHistory> rList = null;
		ApplyBusHistory abh = new ApplyBusHistory();
		abh.setAp_no(ap_no);
		abh.setAp_b_no(ap_b_no);
		rList = cDao.getCompanyRejectDetail(abh);
		mav.addObject("rList", om.writeValueAsString(rList));
		view="admin/company/companyRejectDetailForm";
		mav.setViewName(view);
		return mav;
	}
	//메인 차트
	public ModelAndView getUserTotalInfo() {
		ModelAndView mav = new ModelAndView();
		ArrayList<Integer> cList = new ArrayList<Integer>();
		ArrayList<String> tList = new ArrayList<String>();
		ArrayList<Integer> aList = new ArrayList<Integer>();
		VocBean vb = cDao.getVocCount();
		tList = bDao.getTownNameList();
		for(int i = 0; i < tList.size(); i++) { //송도123 연수123 청학123
				System.out.println(tList.get(i));
				System.out.println("휠체어 교통약자 : "+uDao.getUserTownWheelCount(tList.get(i)));
				System.out.println("시각장애 교통약자 : "+uDao.getUserTownBlindCount(tList.get(i)));
				uDao.getUserTownWheelCount(tList.get(i));
				cList.add(i, uDao.getUserTownWheelCount(tList.get(i)));
				cList.add(i, uDao.getUserTownBlindCount(tList.get(i)));
			};
		aList.add(0, uDao.getAllWheelCount());
		aList.add(1, uDao.getAllBlindCount());
		mav.addObject("cList", cList);
		mav.addObject("aList", aList);
		mav.addObject("vb", vb);
		mav.setViewName("/admin/mainForm");
			/*
			 * for(int i = 1; i<=18; i++) cList.set(0, uDao.getUserTownCount());
			 */
		return mav;
	}


}
