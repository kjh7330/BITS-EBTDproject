package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
@Alias("Company")
@Data //Getter AND Setter by Lombok
@Accessors(chain = true)
public class Company {

	private String c_username;     // 회사 아이디 PK (PK_C_USERNAME)
	private String c_name; 		   // 회사 이름 UQ - NN
	private String c_password; 	   // 비밀번호 - NN
	private String c_no; 		   // 사업장 등록번호 UQ - NN
	private String c_imgextention; // 이미지 확장자
	private int c_state; 		   // 승인상태 0:미승인 1:승인 2:반려 3:관리자
}
