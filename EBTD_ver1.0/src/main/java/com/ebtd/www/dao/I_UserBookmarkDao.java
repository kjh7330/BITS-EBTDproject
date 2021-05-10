package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.UserBookmarkBean;

public interface I_UserBookmarkDao {

	//유저(시각+휠): 즐겨찾기 리스트
	List<UserBookmarkBean> getBookmarkList(String u_username);

	void deleteBookmark(String ub_no);

	void insertBookmark(UserBookmarkBean uBookmark);

	//시각장애인 즐겨찾기 Detail
	UserBookmarkBean getBookmarkDetail(int ub_no);

	//시각장애인 예약확인
	UserBookmarkBean confirmReservation(int ub_no);
}
