package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.ApplyBusRoute;
import com.ebtd.www.bean.Company;
import com.ebtd.www.dao.I_AdminCompanyDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class AdminCompanyMM {
	
	@Autowired
	private I_AdminCompanyDao cDao;
	
	ModelAndView mav;
	//회사 등록 요청 리스트 가져오기 -> 리스트 출력 페이지로 이동
	public ModelAndView getCompanyRequestList() {
		mav = new ModelAndView();
		String view=null;
		List<Company> cList = null;
		cList = cDao.getCompanyRequestList();
		if(cList!=null && cList.size()!=0) {
			mav.addObject("cList", cList);
			view="admin/company/companyRequestListForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//회사 신청 리스트 페이지에서 클릭한 회사의 '신청 상세 내역'을 가져오기
	public ModelAndView getCompanyRequestDetail(String c_name) {
		mav = new ModelAndView();
		String view=null;
		List<ApplyBusHistory> abList = null;
		List<ApplyBusRoute> abrList = null;
		
		//상세내역 및 공문 가져오기
		abList = cDao.getCompanyRequestDetail(c_name);
		//노선 가져오기
		abrList = cDao.getCompanyRequestRouteList(c_name);
		if(abList!=null && abList.size()!=0) {
			mav.addObject("abList", abList);
			mav.addObject("abrList",abrList);
			view="admin/company/companyRequestDetailForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//승인 처리 -> 성공시, 다시 목록 페이지로 이동
	public ModelAndView setCompanyRequestApproval(String c_name) {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		cDao.setCompanyRequestApproval(c_name);
		cList = cDao.getCompanyRequestList();
		for(int i=0; i<cList.size();i++) {
			if(cList.get(i).getC_name() == c_name && cList.get(i).getC_state()==1) {
				view="admin/mainForm";
			}else {
				mav.addObject("cList", cList);
				view="redirect:/admin/company/getCompanyRequestList";
			}
		}
		mav.setViewName(view);
		return mav;
	}
	//반려 처리 -> 성공시, 다시 목록 페이지로 이동
	public ModelAndView setCompanyRequestReject(String c_name) {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		cDao.setCompanyRequestReject(c_name);
		cList = cDao.getCompanyRequestList();
		for(int i=0; i<cList.size();i++) {
			if(cList.get(i).getC_name() == c_name && cList.get(i).getC_state()==1) {
				view="admin/mainForm";
			}else {
				mav.addObject("cList", cList);
				view="redirect:/admin/company/getCompanyRequestList";
			}
		}
		mav.setViewName(view);
		return mav;
	}
	//신규 노선 등록 신청 목록을 가져옴
	//주의! 회사의 노선 신규등록만(상태=0) 가져와야함!
	public ModelAndView getNewBusRouteList() {
		mav = new ModelAndView();
		String view=null;
		List<ApplyBusHistory> abnList = null;
		abnList = cDao.getNewBusRouteList();
		if(abnList!=null && abnList.size()!=0) {
			mav.addObject("abnList",abnList);
			view="admin/company/newBusRouteListForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//신규등록 버스노선의 상세 정보들 가져오기
	public String getNewBusRouteDetail(String ap_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<ApplyBusHistory> abndList = null;
		abndList = cDao.getNewBusRouteDetail(ap_no);
		
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
	//버스 노선 변경 요청 목록 가져오기
	public ModelAndView getUpdateBusRouteList() {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> abnList = null;
		
		abnList = cDao.getUpdateBusRouteList();
		System.out.println(abnList);
		if(abnList!=null && abnList.size()!=0) {
			mav.addObject("abnList",abnList);
			view="admin/company/updateBusRouteListForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//버스 노선 변경 요청 상세 가져오기
	public String getUpdateBusRouteDetail(String ap_no) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		List<ApplyBusHistory> abndList = null;
		abndList = cDao.getUpdateBusRouteDetail(ap_no);
		
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
	//버스 회사 이름 목록 가져오기
	public ModelAndView getCompanyNameList() {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		
		cList = cDao.getCompanyNameList();
		
		if(cList != null && cList.size() != 0) {
			mav.addObject("cList", cList);
			view="admin/company/companyNameListForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//선택한 버스회사의 상세 정보 가져오기
	public ModelAndView getCompanyDetail(String c_name) {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		
		cList = cDao.getCompanyDetail(c_name);
		if(cList != null && cList.size() != 0) {
			mav.addObject("bList", cList);
			view="admin/company/companyDetailForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//선택한 버스회사의 문의함 목록 가져오기
	public ModelAndView getCompanyQuestionList(String c_name) {
		// TODO Auto-generated method stub
		return null;
	}
	//승인된 목록과 수정요청 목록 가져오기
	public ModelAndView getCompanyApprovalList() {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> abList = null;
		abList = cDao.getCompanyApprovalList();
		if(abList != null && abList.size() != 0) {
			mav.addObject("abList", abList);
			view="admin/company/companyApprovalListForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//승인, 수정된 상세 내역 가져오기
	public ModelAndView getCompanyApprovalDetail() {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> abdList = null;
		abdList = cDao.getCompanyApprovalDetail();
		if(abdList != null && abdList.size() != 0) {
			mav.addObject("abdList", abdList);
			view="admin/company/companyApprovalDetailForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//반려된 목록 가져오기
	public ModelAndView getCompanyRejectList() {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> abList = null;
		abList = cDao.getCompanyRejectList();
		if(abList != null && abList.size() != 0) {
			mav.addObject("abList", abList);
			view="admin/company/companyRejectListForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	//반려 상세 내역 가져오기
	public ModelAndView getCompanyRejectDetail() {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> abdList = null;
		abdList = cDao.getCompanyRejectDetail();
		if(abdList != null && abdList.size() != 0) {
			mav.addObject("abdList", abdList);
			view="admin/company/companyRejectDetailForm";
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}


}
