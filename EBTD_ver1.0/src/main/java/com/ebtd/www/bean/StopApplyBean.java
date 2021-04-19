package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

//정류장 신청목록 bean
@Alias("sa")
@Data
@Accessors(chain = true)
public class StopApplyBean {
	private int sa_X;			//정류장 신청 - x축
	private int sa_Y;			//정류장 신청 - y축
	private String sa_Name;		//정류장 신청 - 정류장 이름
	private String t_Name;		//정류장 신청 - 동 이름
	private String c_UserName;	//정류장 신청 - 회사 이름
	private String sa_Reason;	//정류장 신청 - 신청 사유
	private int sa_Status;		//정류장 신청 - 상태
	private int sa_No;
}
