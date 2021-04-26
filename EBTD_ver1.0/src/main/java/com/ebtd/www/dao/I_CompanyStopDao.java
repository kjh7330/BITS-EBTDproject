package com.ebtd.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.service.CompanyStopMM;

public interface I_CompanyStopDao {
	public CompanyStopMM getStopApplyDetail(@Param("S_X") int S_X, @Param("S_Y") int S_Y);

	List<StopBean> getStopList();
	
	List<StopBean> getStopDetail(Integer S_NO);
	
	boolean addNewStop(StopApplyBean sa);

	List<StopApplyBean> getNewStopConfirmList();

	List<StopBean> searchStop(String S_NAME);

	StopBean checkSaName(String S_NAME);

	StopBean checkSaPosition(int S_X, int S_Y);

	List<StopBean> getStopApplyDetail(Integer sa_No);

	
}
