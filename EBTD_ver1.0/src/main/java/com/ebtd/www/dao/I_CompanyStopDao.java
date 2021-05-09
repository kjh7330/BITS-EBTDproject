package com.ebtd.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;
import com.ebtd.www.service.CompanyStopMM;

public interface I_CompanyStopDao {

	List<StopBean> getStopList(Integer pageNum);
	
	List<StopBean> getStopDetail(Integer S_NO);
	
	boolean addNewStop(StopApplyBean sa);

	List<StopApplyBean> getNewStopConfirmList(String c_username);

	List<StopBean> searchStop(String S_NAME);

	StopBean checkSaName(String S_NAME);

	StopBean checkSaPosition(Map map);

	List<StopBean> getStopApplyDetail(Integer sa_No);

	@Select("SELECT COUNT(*) FROM stop")
	int getStopCount();

	
}
