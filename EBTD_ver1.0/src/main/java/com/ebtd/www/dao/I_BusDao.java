package com.ebtd.www.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.TownBean;
import com.ebtd.www.bean.VocBean;
import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.CompanyCheckBean;

public interface I_BusDao {

	ArrayList<StopBean> getStopList(); //정류장 전체정보 가져오기

	ArrayList<TownBean> getTownList(); //동읍면 전체정보 가져오기

	int busNumCheck(String busNum);

	int applyNewBusRoute(ApplyBusHistory BusBean);

	int applyNewBusRouteDetail(ApplyBusHistory BusBean);

	int addNewMotorNumber(BusBean bb);

	int getApplyNumber(ApplyBusHistory apb);

	int addBusAndCompany(ApplyBusHistory busBean);

	ArrayList<String> getTownNameList(); // town name가져오기(이충호)

	Integer existBusNumCheck(CompanyCheckBean cb);
	
	int applyUpdateBusRoute(ApplyBusHistory busBean);

	int get_od_no(String c_username);

	void next_od_no(String c_username);

	VocBean getVocCount(String c_username);

	


}
