package com.ebtd.www.dao;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBean_ch;

public interface IUserIdDao {

	public String userCheckId(String u_username);
	
	public boolean userJoin(UserBean_ch ub);
	public boolean existUsername(UserBean_ch ub);
	public int accessUserState(String username);
	public String getPwd(UserBean_ch ub);
	public String userCheckNo(String user_no);
	public String findId(UserBean ub);
	public String findPw(UserBean ub);
	public boolean updatePw(UserBean_ch ub);

}
