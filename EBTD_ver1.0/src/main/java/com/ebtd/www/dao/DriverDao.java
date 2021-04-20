package com.ebtd.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.ebtd.www.bean.Wh_BusBean;
import com.ebtd.www.bean.Wh_CompanyBean;
import com.ebtd.www.bean.Wh_DriverBean;
import com.ebtd.www.bean.Wh_ReserveBean;
import com.ebtd.www.bean.Wh_StopBean;


public interface DriverDao {
	
	public List<Wh_CompanyBean> getCompanyList();
	
	public List<Wh_BusBean> getBusList(String c_username);

	public List<Wh_DriverBean> getDriverList(String ab_no);

	public List<Wh_StopBean> getBusRouteList(String b_no);

	public List<Wh_ReserveBean> refresh(String b_no);

	public void updateBus(Map<String, Object> bm);
}
