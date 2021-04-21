package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserReserveHistoryBean;


public interface I_AdminUserDao {

	
	List<UserBean> getUserList();

	List<UserReserveHistoryBean> getUserHistoryList();

}
