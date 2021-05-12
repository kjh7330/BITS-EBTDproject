package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.UserReservationBean;

public interface I_UserReservationInfoDao {
	
	//휠체어의 예약내역
	List<UserReservationBean> getReservationInfo(String u_username);

	//휠체어의 예약 상세내역
	UserReservationBean getReservationDetail(int ur_no);
	
	//시각의 예약내역 가져오기
	UserReservationBean getBlindReservationInfo(String u_username);

	void reservationCancel(int ur_no);


}
