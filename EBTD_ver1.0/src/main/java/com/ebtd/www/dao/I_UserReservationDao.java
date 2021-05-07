package com.ebtd.www.dao;

import java.util.LinkedList;
import java.util.List;

import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.DriverStopBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.UserReservationBean;


public interface I_UserReservationDao {

	LinkedList<BusBean> getBusList();

	LinkedList<StopBean> getStopList();

	List<DriverStopBean> getBusDetail(String b_No);

	boolean reservation(UserReservationBean ur);

}
