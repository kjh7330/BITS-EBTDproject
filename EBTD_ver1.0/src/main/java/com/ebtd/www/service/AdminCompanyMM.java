package com.ebtd.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.ApplyBusRoute;
import com.ebtd.www.bean.Company;
import com.ebtd.www.dao.I_AdminCompanyDao;

@Service
public class AdminCompanyMM {
	
	@Autowired
	private I_AdminCompanyDao cDao;
	
	ModelAndView mav;
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
	public ModelAndView getCompanyRequestDetail(String c_name) {
		mav = new ModelAndView();
		String view=null;
		List<ApplyBusHistory> abList = null;
		List<ApplyBusRoute> abrList = null;
		abList = cDao.getCompanyRequestDetail(c_name);
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
	//승인 처리 -> 승인 목록 페이지로 이동
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
				view="admin/company/companyRequestListForm";
			}
		}
		mav.setViewName(view);
		return mav;
	}
	public ModelAndView setCompanyRequestReject(String c_name) {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		//List<Company> cListchk = null;
		//cListchk = cDao.checkCompanyRequestReject(c_name);
		System.out.println("왜 안되는걸까");
		//if(cListchk == null) {
			cDao.setCompanyRequestReject(c_name);
			cList = cDao.getCompanyRequestList();
			
			for(int i=0; i<cList.size();i++) {
				if(cList.get(i).getC_name() == c_name && cList.get(i).getC_state()==1) {
					view="admin/mainForm";
				}else {
					mav.addObject("cList", cList);
					view="admin/company/companyRequestListForm";
				}
			}
			//mav.addObject("cListchk", cListchk);
		//}
		mav.setViewName(view);
		return mav;
	}
	/*
		public List<Company> setCompanyRequestApproval(String c_name) {
		mav = new ModelAndView();
		String view = null;
		List<Company> cList = null;
		if(cDao.setCompanyRequestApproval(c_name)) {
			cList = cDao.getCompanyRequestList();
		}else {
			cList = null;
			throw new NoCompanyRequestListException("⚠리스트를 가져올 수 없습니다⚠");
		}
		return cList;
	}
	 * */
	
	public ModelAndView getNewBusRouteList() {
		mav = new ModelAndView();
		String view=null;
		List<ApplyBusHistory> abList = null;
		
		abList = cDao.getNewBusRouteList();
		
		if(abList!=null && abList.size()!=0) {
			mav.addObject("abList",abList);
			view="admin/company/newBusRouteListForm";
			System.out.println(abList);
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}
	public ModelAndView getUpdateBusRouteList() {
		mav = new ModelAndView();
		String view = null;
		List<ApplyBusHistory> abList = null;
		
		abList = cDao.getUpdateBusRouteList();
		
		if(abList!=null && abList.size()!=0) {
			mav.addObject("abList",abList);
			view="admin/company/getUpdateBusRouteList";
			System.out.println(abList);
		}else {
			view="admin/mainForm";
		}
		mav.setViewName(view);
		return mav;
	}

}
