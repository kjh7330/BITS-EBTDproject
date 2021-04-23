package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

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
	private String d_enterDate; //입사일
	private String b_no; //버스번호
	
}
