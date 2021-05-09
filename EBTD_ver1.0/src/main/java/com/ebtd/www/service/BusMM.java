package com.ebtd.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.CompanyCheckBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.TownBean;
import com.ebtd.www.dao.I_BusDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class BusMM {
	
	@Autowired
	private I_BusDao bDao;
	ModelAndView mav;
	public ModelAndView getStopInfoList() throws JsonProcessingException { //동읍면, 정류장 정보 가져오기
		ArrayList<StopBean> sList = new ArrayList<StopBean>();
		ArrayList<TownBean> tList = new ArrayList<TownBean>();
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		sList = bDao.getStopList();
		tList = bDao.getTownList();
		mav.addObject("sList", om.writeValueAsString(sList));
		mav.addObject("tList", om.writeValueAsString(tList));
		return mav;
	}
	public int busNumCheck(String busNum) { //버스번호 중복체크
		int checkResult = 0;
		checkResult = bDao.busNumCheck(busNum);
		return checkResult;
	}

	/*
	 * public ModelAndView applyNewBusRoute(Model model) { HashMap<String, String>
	 * rMap = new HashMap<String, String>(); //rMap =
	 * model.getAttribute("busRoute"); System.out.println(rMap);
	 * model.getAttribute("busRoute"); return mav; }
	 */
	public ModelAndView applyNewBusRoute(Object id, Object busNum, int od_no) {
		String busNumber = busNum.toString();
		String companyName = id.toString();
		ApplyBusHistory BusBean = new ApplyBusHistory();
		BusBean.setAp_b_no(busNumber);
		BusBean.setC_username(companyName);
		BusBean.setOd_no(od_no);
		bDao.applyNewBusRoute(BusBean);
		bDao.addBusAndCompany(BusBean);
		return null;
	}
	public ModelAndView applyNewBusRouteDetail(Map busRoute, Model model) {
		System.out.println(busRoute);
		model.addAttribute("busNum", busRoute.get("busNum"));
		model.addAttribute("sCount", busRoute.get("stopCount"));
		int sCount = Integer.parseInt(model.getAttribute("sCount").toString());
		ApplyBusHistory apb = new ApplyBusHistory();
		apb.setAp_b_no(model.getAttribute("busNum").toString());
		int ap_no = bDao.getApplyNumber(apb);
		for(int i = 1 ; i<=sCount; i++) {
			ApplyBusHistory BusBean = new ApplyBusHistory();
			BusBean.setAp_no(ap_no);
			BusBean.setAp_b_no(model.getAttribute("busNum").toString());
			BusBean.setApde_turn(i);
			model.addAttribute("stopNum"+i, busRoute.get("stopRouteNum"+i));
			BusBean.setS_no(Integer.parseInt(model.getAttribute("stopNum"+i).toString()));
			if(Integer.parseInt(model.getAttribute("stopNum"+i).toString())==0) {
				break;
			}
			bDao.applyNewBusRouteDetail(BusBean);
			System.out.println(model.getAttribute("stopNum"+i)+"여기");
		};
		return mav;
	}
	public ModelAndView addBusNumber(Map busRoute, Model model) {
		model.addAttribute("mCount", busRoute.get("motorCount"));
		int mCount = Integer.parseInt(model.getAttribute("mCount").toString());
		System.out.println(busRoute);
		model.addAttribute("busNum", busRoute.get("busNum"));
		for(int i=1; i<=mCount ; i++ ) {
			BusBean bb = new BusBean();
			model.addAttribute("motorNumber"+i, busRoute.get("motorNumber"+i));
			model.addAttribute("lowFloor"+i, busRoute.get("lowFloor"+i));
			System.out.println(Integer.parseInt(model.getAttribute("motorNumber"+i).toString())+"요깅");
			bb.setMotorNumber(Integer.parseInt(model.getAttribute("motorNumber"+i).toString()));
			bb.setBusNumber(model.getAttribute("busNum").toString());
			if(model.getAttribute("lowFloor"+i).toString().equals("저상")) {
				bb.setBusType(1);
			} else {
				bb.setBusType(0);
			}
			bDao.addNewMotorNumber(bb);
		}
		return mav;
	}
	public int existBusNumCheck(String busNum, HttpSession session) {
		Integer checkResult = null;
		String cName = session.getAttribute("c_username").toString();
		CompanyCheckBean cb = new CompanyCheckBean();
		System.out.println("버스남바"+busNum);
		System.out.println("회사이름은!!"+cName);
		cb.setBusNum(busNum);
		cb.setCName(cName);
		checkResult = bDao.existBusNumCheck(cb);
		System.out.println(checkResult);
		if(checkResult.equals(Integer.valueOf(1)) || checkResult.equals(Integer.valueOf(4)) || checkResult.equals(Integer.valueOf(5))) {
			return 1;
		} else if (checkResult.equals(null)){
			return 0;
		} else {
			return 0;
		}
	}
	public ModelAndView applyUpdateBusRoute(Object id, Object busNum) {
		String busNumber = busNum.toString();
		String companyName = id.toString();
		ApplyBusHistory BusBean = new ApplyBusHistory();
		BusBean.setAp_b_no(busNumber);
		BusBean.setC_username(companyName);
		bDao.applyUpdateBusRoute(BusBean);
		/* bDao.addBusAndCompany(BusBean);  bus 테이블에 저장*/
		return null;
	}
	public ModelAndView applyUpdateBusRouteDetail(Map busRoute, Model model) {
		System.out.println(busRoute);
		model.addAttribute("busNum", busRoute.get("busNum"));
		model.addAttribute("sCount", busRoute.get("stopCount"));
		int sCount = Integer.parseInt(model.getAttribute("sCount").toString());
		ApplyBusHistory apb = new ApplyBusHistory();
		apb.setAp_b_no(model.getAttribute("busNum").toString());
		int ap_no = bDao.getApplyNumber(apb);
		for(int i = 1 ; i<=sCount; i++) {
			ApplyBusHistory BusBean = new ApplyBusHistory();
			BusBean.setAp_no(ap_no);
			BusBean.setAp_b_no(model.getAttribute("busNum").toString());
			BusBean.setApde_turn(i);
			model.addAttribute("stopNum"+i, busRoute.get("stopRouteNum"+i));
			BusBean.setS_no(Integer.parseInt(model.getAttribute("stopNum"+i).toString()));
			if(Integer.parseInt(model.getAttribute("stopNum"+i).toString())==0) {
				break;
			}
			bDao.applyNewBusRouteDetail(BusBean);
			System.out.println(model.getAttribute("stopNum"+i)+"여기");
		};
		return mav;
	}
	public int get_od_no(String c_username) {
		return bDao.get_od_no(c_username);
	};


}
