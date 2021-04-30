package com.ebtd.www.dao;

import java.util.List;
import java.util.Map;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.ApplyBusRoute;
import com.ebtd.www.bean.Company;
import com.ebtd.www.bean.UserBean;

public interface I_UserMypageDao {

	List<UserBean> getUserMyInfo(String u_username);

	void setUserMyInfo(UserBean ub);



























	
}
