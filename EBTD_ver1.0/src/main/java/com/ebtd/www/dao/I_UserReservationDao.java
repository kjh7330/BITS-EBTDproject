package com.ebtd.www.dao;

import java.util.LinkedList;

import com.ebtd.www.bean.BusBean;
import com.ebtd.www.bean.StopBean;

public interface I_UserReservationDao {

	LinkedList<BusBean> getBusList();

	LinkedList<StopBean> getStopList();

}
