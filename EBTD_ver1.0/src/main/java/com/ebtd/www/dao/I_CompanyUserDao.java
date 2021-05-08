package com.ebtd.www.dao;

import java.util.ArrayList;

import com.ebtd.www.bean.CompanyBusBean;
import com.ebtd.www.bean.UserReserveHistoryBean;
import com.ebtd.www.bean.VocBean;

public interface I_CompanyUserDao {
	//당사 버스 유저 이용내역 가져오기
	ArrayList<UserReserveHistoryBean> getUserHistory(String id);

	int getUserTownWheelCount(String tName);

	int getUserTownBlindCount(String tName);

	int getAllWheelCount();

	int getAllBlindCount();

	ArrayList<CompanyBusBean> getBusNum(String id);

	ArrayList<VocBean> getVocList(String id);

	boolean addReply(VocBean vb);

}
