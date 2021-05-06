package com.ebtd.www.dao;

import java.util.LinkedList;
import java.util.List;

import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.bean.UserReservation;
import com.ebtd.www.bean.Wh_StopBean;

public interface I_UserReservationDao {

	LinkedList<BusBean> getBusList();

	LinkedList<StopBean> getStopList();

	List<Wh_StopBean> getBusDetail(String b_No);

	boolean reservation(UserReservation ur);

}
