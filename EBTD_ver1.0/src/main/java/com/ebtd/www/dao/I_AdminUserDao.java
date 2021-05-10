
package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserReserveHistoryBean;


public interface I_AdminUserDao {

	
	List<UserBean> getUserList();
	
	List<UserBean> getUserSearchUserName(String u_userName);	//유저리스트에서 아이디 검색 ajax
	
	List<UserBean> getUserSearchUType(int u_type);	//유저리스트에서 장애유형 검색 ajax
	
	UserBean getUserDetail(String u_userName);

	List<UserReserveHistoryBean> getUserHistoryList();

	//유저히스토리에서 이용일 검색 ajax
	List<UserReserveHistoryBean> getUserHistoryDateList(int period); 

	//유저히스토리에서 이용일 검색 ajax
	List<UserReserveHistoryBean> getUserHistoryUserName(String u_userName);

	//유저히스토리에서 회사명 검색 ajax
	List<UserReserveHistoryBean> getUserHistoryCompanyName(String c_userName); 
		
	//유저히스토리에서 버스번호 검색 ajax
	List<UserReserveHistoryBean> getUserHistoryBusNum(String b_no);

	//유저히스토리에서 출발지 검색 ajax
	List<UserReserveHistoryBean> getStopStartName(String s_namestart);

	//유저히스토리에서 목적지 검색 ajax
	List<UserReserveHistoryBean> getStopLastName(String s_namelast);

	//유저히스토리에서 이용상태 검색 ajax
	List<UserReserveHistoryBean> getState(String ur_state);

	



	

}
