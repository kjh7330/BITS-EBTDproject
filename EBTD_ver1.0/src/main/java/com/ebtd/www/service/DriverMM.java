package com.ebtd.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.DriverReserveBean;
import com.ebtd.www.dao.DriverDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class DriverMM {

	@Autowired
	DriverDao dd;
	ModelAndView mav;
	
	public ModelAndView getCompanyList() throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		mav.addObject("c_list",om.writeValueAsString(dd.getCompanyList()));
		mav.setViewName("forward:/driver/CompanySelectForm");
		return mav;
	}

	public ModelAndView getBusList(String c_username, HttpSession ss) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		ss.setAttribute("c_username", c_username);
		mav.addObject("b_list",om.writeValueAsString(dd.getBusList(c_username)));
		mav.setViewName("forward:/driver/BusSelectForm");
		return mav;
	}
	public ModelAndView getDriverList(String ab_no, String b_no, String b_type, HttpSession ss) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		ss.setAttribute("b_no", b_no);
		ss.setAttribute("ab_no", ab_no);
		ss.setAttribute("b_type", b_type);
		mav.addObject("d_list",om.writeValueAsString(dd.getDriverList(ab_no)));
		mav.setViewName("forward:/driver/DriverSelectForm");
		return mav;
	}

	public ModelAndView getBusRouteList(String d_name, String d_no, HttpSession ss) throws JsonProcessingException {
		mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		ss.setAttribute("d_name", d_name);
		ss.setAttribute("d_no", d_no);
		mav.addObject("s_list", om.writeValueAsString(dd.getBusRouteList(ss.getAttribute("b_no").toString())));
		mav.setViewName("forward:/driver/DriverMainForm");
		return mav;
	}

	public List<DriverReserveBean> refresh(String car, boolean go, String wheel, String blind, HttpSession ss) {
		Map<String, Object> bm = new HashMap();
		bm.put("ab_no", ss.getAttribute("ab_no").toString());
		bm.put("wheel", wheel);
		bm.put("blind", blind);
		if (go) {
			bm.put("car", car);
			bm.put("d_no", ss.getAttribute("d_no").toString());
		}
		else {
			bm.put("car", "");
			bm.put("d_no", "");			
		}
			
		dd.updateBus(bm); // 버스 위치 업데이트
		
		List<DriverReserveBean> rl = dd.refresh(ss.getAttribute("b_no").toString());					// 예약 정보 가져오기
																								//이용 완료 고객 예약 데이터 삭제
		for( int i = 0 ; i < rl.size() ; i++ ) {
			if(ss.getAttribute("b_type").equals("0") && rl.get(i).getU_type() == 1 )	rl.remove(i--);
			
			if ( rl.get(i).getUr_start_turn() > rl.get(i).getUr_last_turn() ) rl.get(i).setUp(false);
			else													rl.get(i).setUp(true);
		}
		
		return rl;
	}

	public List<String> on(List<String> data) {
		for(String dt : data)	dd.on(dt);
		
		return data;
	}

	public List<String> out(List<String> data) {
		for(String dt : data)	dd.out(dt);		
		return data;
	}
}
