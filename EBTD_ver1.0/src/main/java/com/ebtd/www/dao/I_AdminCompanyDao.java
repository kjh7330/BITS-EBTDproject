package com.ebtd.www.dao;

import java.util.List;

import com.ebtd.www.bean.ApplyBusHistory;
import com.ebtd.www.bean.ApplyBusRoute;
import com.ebtd.www.bean.Company;

public interface I_AdminCompanyDao {

	List<Company> getCompanyRequestList();

	List<ApplyBusHistory> getCompanyRequestDetail(String c_name);

	List<ApplyBusHistory> getCompanyRequestRouteList(String c_name);

	boolean setCompanyRequestApproval(String c_name);

	//DELETE 트랜잭션
	void setDeleteAllbus(String c_username);
	void setDeleteBus(String c_username);
	void setDeleteApplybusHistorydetail(String c_username);
	void setDeleteApplybushistory(String c_username);
	void setDeleteOfficialdocument(String c_username);
	void setDeleteCompany(String c_username);

	List<ApplyBusHistory> getNewBusRouteList();

	List<ApplyBusHistory> getNewBusRouteDetail(String ap_b_no);

	List<ApplyBusHistory> getNewBusOfficialDocument(String ap_no);
	
	List<ApplyBusHistory> getNewBusNumber(String ap_no);
	
	//신규 버스 등록
	void setApplyBusHistoryChangeApproval(String ap_b_no);
	void setAllBusChangeApproval(String ap_b_no);
	void setNewRouteBus(String ap_b_no);

	void setApplyBusHistoryChangeReject(String ap_b_no, String ap_reject);

	List<ApplyBusHistory> getUpdateBusRouteList();

	List<ApplyBusHistory> getUpdateBusRouteDetail(String ap_no);

	List<ApplyBusHistory> getUpdateBusNumber(String ap_no);

	List<Company> getCompanyNameList();
	
	//버스 회사 상세
	Company getCompanyName(String c_username);
	List<Company> getVocRecommendCount(String c_username);
	List<Company> getBusDriverCount(String c_username);
	List<Company> getLowfloorRegularCount(String c_username);

	List<Company> getCompanyQuestionList();

	List<ApplyBusHistory> getCompanyApprovalList();

	List<Company> getCompanyApprovalDetail();

	List<ApplyBusHistory> getRouteApprovalDetail();

	List<ApplyBusHistory> getCompanyRejectList();

	List<ApplyBusHistory> getCompanyRejectDetail();





















	
}
