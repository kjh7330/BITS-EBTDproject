package com.ebtd.www.dao;

import com.ebtd.www.bean.UserReservationBean;

public interface I_UserReservationInfoDao {
	
	//UserReserveBean 으로 바꿔줘야함 - 재구 
	UserReservationBean getReservationInfo(String u_userName);
		
	

}
