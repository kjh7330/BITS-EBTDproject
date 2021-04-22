package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;



public interface I_AdminStopDao {

	List<StopBean> getStopList();

	List<StopBean> getStopDetail(Integer s_No);

	List<StopApplyBean> getStopConfirmList();

	List<StopApplyBean> getStopConfirmDetail(Integer sa_No);

	boolean addStop(StopBean sb);

	List<StopBean> getComment(Integer s_No);

	StopBean checkStopList(String s_Name);
	
	StopBean checkPosition(StopBean sb);

	Integer addStopComment(StopBean sb);
	


}
