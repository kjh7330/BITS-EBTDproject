package com.ebtd.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.ebtd.www.bean.DriverBusBean;
import com.ebtd.www.bean.DriverCompanyBean;
import com.ebtd.www.bean.DriverDriverBean;
import com.ebtd.www.bean.DriverReserveBean;
import com.ebtd.www.bean.DriverStopBean;


public interface DriverDao {
	
	public List<DriverCompanyBean> getCompanyList();
	
	public List<DriverBusBean> getBusList(String c_username);

	public List<DriverDriverBean> getDriverList(String ab_no);

	public List<DriverStopBean> getBusRouteList(String b_no);

	public List<DriverReserveBean> refresh(String b_no);

	public void updateBus(Map<String, Object> bm);
	
	int carNumberDupCheck(int ab_no);

	public void on(String dt);

	public void out(String dt);
}
