package com.ebtd.www.dao;

import java.util.ArrayList;

import com.ebtd.www.bean.CompanyApplyListBean;

public interface I_ApplyConfirmDao {

	ArrayList<CompanyApplyListBean> getNewApplyConfirm(String id);

	ArrayList<CompanyApplyListBean> getUpdateApplyConfirm(String id);

}
