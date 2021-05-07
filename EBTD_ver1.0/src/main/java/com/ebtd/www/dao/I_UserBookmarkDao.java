package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.UserBookmarkBean;

public interface I_UserBookmarkDao {

	List<UserBookmarkBean> getBookmarkList(String u_username);

	void deleteBookmark(String ub_no);

	void insertBookmark(UserBookmarkBean uBookmark);
}
