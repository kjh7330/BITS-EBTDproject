
package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserReserveHistoryBean;


public interface I_AdminUserDao {

	
	List<UserBean> getUserList();
	
	List<UserBean> getUserSearchUserName(String u_userName);	//유저리스트에서 아이디 검색 ajax
	
	UserBean getUserDetail(String u_userName);

	List<UserReserveHistoryBean> getUserHistoryList();



	

}
