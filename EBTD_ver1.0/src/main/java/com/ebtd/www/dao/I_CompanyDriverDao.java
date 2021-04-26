package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.DriverBean;

public interface I_CompanyDriverDao {

	List<DriverBean> getDriverList();

	boolean addDriver(DriverBean db);

}
