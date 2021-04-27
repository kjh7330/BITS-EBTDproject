package com.ebtd.www.dao;

import java.util.List;
import java.util.Map;

import com.ebtd.www.bean.StopApplyBean;
import com.ebtd.www.bean.StopBean;



public interface I_AdminStopDao {
	//정류장 전체목록 불러오기
	List<StopBean> getStopList();
	//정류장 상세목록 불러오기
	List<StopBean> getStopDetail(Integer s_No);
	//정류장 신청목록 불러오기
	List<StopApplyBean> getStopConfirmList();
	//정류장 신청 상세목록 불러오기
	List<StopApplyBean> getStopConfirmDetail(Integer sa_No);
	//정류장 동이름 불러오기
	List<StopBean> stopList();
	//정류장 추가
	boolean addStop(StopBean sb);
	//정류장 코멘트 코멘트
	List<StopBean> getComment(Integer s_No);
	//정류장 이름 중복조회
	StopBean checkStopList(String s_Name);
	//정류장 위치 중복조회
	StopBean checkPosition(StopBean sb);
	//정류장 코멘트 추가
	Integer addStopComment(StopBean sb);
	//정류장 신청 반려
	Integer setStopRequestReject(Integer sa_No);
	//정류장 신청 승인 - 정류장 번호 가져오기
	int getStopNo(Map<String, Object> saList);
	//정류장 신청 승인 - 정류장 추가하기
	boolean approvalAddStop(Map<String, Object> saList);
	//정류장 신청 승인 - 정류장 상태 수정하기
	void setStopRequestApproval(Object object);
	//정류장 결재 내역함 리스트 불러오기
	List<StopApplyBean> getOfficialDocumentResult();
	//정류장 번호 가져오기
	String checkStopNo(String t_Name);


	
	
	


}
