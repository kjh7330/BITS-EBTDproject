package com.ebtd.www.dao;

import com.ebtd.www.bean.UserReservation;

public interface I_UserReservationInfoDao {
	
	//UserReserveBean 으로 바꿔줘야함 - 재구 
	UserReservation getReservationInfo(String u_userName);
		
	

}
