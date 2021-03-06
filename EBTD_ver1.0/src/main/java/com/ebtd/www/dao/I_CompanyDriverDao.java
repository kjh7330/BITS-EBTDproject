package com.ebtd.www.dao;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ebtd.www.bean.CompanyBusBean;
import com.ebtd.www.bean.DriverBean;

public interface I_CompanyDriverDao {

	List<DriverBean> getDriverList(String c_username);

	boolean addDriver(DriverBean db);

	DriverBean getDriverDetail(int d_no);

	boolean fileInsert(Map<String, String> fMap);

	LinkedList<CompanyBusBean> getCompanyBusList(String C_USERNAME);

	boolean updateDriver(DriverBean db);

	boolean deleteDriver(int d_no);


}
