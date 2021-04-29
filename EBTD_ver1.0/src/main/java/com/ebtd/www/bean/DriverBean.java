package com.ebtd.www.bean;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;


@Alias("driver")
@Data 
@Accessors(chain = true)
public class DriverBean {
	private int d_no; //기사번호
	private String c_userName; //회사 아이디
	private String d_name; //이름
	private String d_imgExtention; //확장자
	private String d_phoneNum; //전화번호
	//@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private String d_enterDate; //입사일
	private String b_no; //버스번호
	
}
