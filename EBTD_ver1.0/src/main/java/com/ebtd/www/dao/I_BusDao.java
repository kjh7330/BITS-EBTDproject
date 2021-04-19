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

	/* List<BusInfo> addNewBus(HttpSession session); */

}
