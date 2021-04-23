package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;

public interface I_CompanyStopDao {
	
	//List<Map<String, Object>> getStopList();

	List<StopBean> getStopList();

	boolean addNewStop(StopApplyBean sa);

	List<StopApplyBean> getNewStopConfirmList();

	List<StopBean> searchStop(String S_NAME);
	
}
