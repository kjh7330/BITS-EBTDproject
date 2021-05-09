package com.ebtd.www.dao;

import java.util.LinkedList;
import java.util.List;

import com.ebtd.www.bean.AllBusBean;
import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.DriverStopBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.UserReservationBean;


public interface I_UserReservationDao {

	LinkedList<BusBean> getBusList();

	LinkedList<StopBean> getStopList();

	List<DriverStopBean> getBusDetail(String b_No);

	boolean reservation(UserReservationBean ur);

	List<DriverStopBean> getStopDetail(int s_No);

	List<UserReservationBean> reservationCheck(String u_username);

	List<AllBusBean> getAllBusList(String b_No);

}
