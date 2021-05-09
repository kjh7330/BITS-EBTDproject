package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.UserReservationBean;

public interface I_UserReservationInfoDao {
	
	List<UserReservationBean> getReservationInfo(String u_username);

	UserReservationBean getReservationDetail(int ur_no);

	void reservationCancel(int ur_no);
}
