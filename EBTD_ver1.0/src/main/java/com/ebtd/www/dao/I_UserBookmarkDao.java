package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.UserBookmarkBean;

public interface I_UserBookmarkDao {

	List<UserBookmarkBean> getBookmarkList(String u_userName);
}
