package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.ApplyBusRoute;
import com.ebtd.www.bean.Company;

public interface I_AdminCompanyDao {

	List<Company> getCompanyRequestList();

	List<ApplyBusHistory> getCompanyRequestDetail(String c_name);

	List<ApplyBusRoute> getCompanyRequestRouteList(String c_name);

	//List<ApplyBusHistory> getApplyBusRouteDetail(String ap_b_no);

	boolean setCompanyRequestApproval(String c_name);

	boolean setCompanyRequestReject(String c_name);
	
	//List<Company> checkCompanyRequestReject(String c_name);

	List<ApplyBusHistory> getNewBusRouteList();

	List<ApplyBusHistory> getUpdateBusRouteList();





	
}
