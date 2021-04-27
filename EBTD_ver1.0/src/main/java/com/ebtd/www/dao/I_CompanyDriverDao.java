package com.ebtd.www.dao;

import java.util.List;
import java.util.Map;

import com.ebtd.www.bean.DriverBean;

public interface I_CompanyDriverDao {

	List<DriverBean> getDriverList();

	boolean addDriver(DriverBean db);

	List<DriverBean> getDriverDetail(int d_no);

	boolean fileInsert(Map<String, String> fMap);


}
