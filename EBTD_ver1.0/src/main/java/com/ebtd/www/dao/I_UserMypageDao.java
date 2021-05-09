package com.ebtd.www.dao;

import java.util.List;
import java.util.Map;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.ApplyBusRoute;
import com.ebtd.www.bean.Company;
import com.ebtd.www.bean.TownBean;
import com.ebtd.www.bean.UserBean;
import com.ebtd.www.bean.UserBookmarkBean;
import com.ebtd.www.bean.UserReservationBean;
import com.ebtd.www.bean.UserReserveHistoryBean;
import com.ebtd.www.bean.VocBean;

public interface I_UserMypageDao {

	UserBean getMypage(String u_username);
	List<UserReservationBean> getReservationHistoryList(String u_username);
	List<UserReservationBean> getReservationHistoryDetail(int ur_no);
	void setBookMark(UserBookmarkBean bm);
	List<VocBean> getMyQuestionList(String u_username);
	List<VocBean> getAnswerList(String u_username);
	List<UserReserveHistoryBean> getReservationBusNum(String u_username);
	void setMyQuestionWrite(VocBean vb);
	List<VocBean> getMyQuestionDetail(String v_no);
	List<UserBean> getUserMyInfo(String u_username);
	void setUserMyInfo(UserBean ub);
	List<UserBean> get_t_list();
































	
}
