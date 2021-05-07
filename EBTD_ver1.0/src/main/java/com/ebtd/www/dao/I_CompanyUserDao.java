package com.ebtd.www.dao;

import java.util.ArrayList;

import com.ebtd.www.bean.UserReserveHistoryBean;

public interface I_CompanyUserDao {
	//당사 버스 유저 이용내역 가져오기
	ArrayList<UserReserveHistoryBean> getUserHistory(String id);

	int getUserTownWheelCount(String tName);

	int getUserTownBlindCount(String tName);

	int getAllWheelCount();

	int getAllBlindCount();

}
