package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.StopBean;

public interface I_CompanyStopDao {
	
	//List<Map<String, Object>> getStopList();

	List<StopBean> getStopList();

	boolean addNewStop(StopBean stop);
	
}
