package com.ebtd.www.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.TownBean;

public interface I_BusDao {

	ArrayList<StopBean> getStopList(); //정류장 전체정보 가져오기

	ArrayList<TownBean> getTownList(); //동읍면 전체정보 가져오기

	int busNumCheck(String busNum);

<<<<<<< HEAD
	ArrayList<String> getTownNameList(); // town name가져오기(이충호)
=======
	int applyNewBusRoute(ApplyBusHistory BusBean);

	int applyNewBusRouteDetail(ApplyBusHistory BusBean);

	int addNewMotorNumber(BusBean bb);

	int getApplyNumber(ApplyBusHistory apb);

	int addBusAndCompany(ApplyBusHistory busBean);

	ArrayList<String> getTownNameList(); // town name가져오기(이충호)
	/* List<BusInfo> addNewBus(HttpSession session); */
>>>>>>> d1b0ba71a15449dcd8f78c788d1308d2898a2fb5
	/* List<BusInfo> addNewBus(HttpSession session); */

}
