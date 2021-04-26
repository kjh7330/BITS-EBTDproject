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

	
	private String b_no;    		// 버스 번호
	private int b_all_num; 			// 총 버스수
	private int d_num;				// 운전기사수

	private int v_count;			// 총 문의수
	private int voc_recommend;		// 총 추천수
	
	private int b_lowfloor_num;		// 저상버스수
	private int b_regular_num;		// 일반버스수
	
	private int v_no;				// 문의글 번호
	private int a_no;				// 답변일 번호
	private String v_title;			// 문의글 제목
	private String v_content;		// 문의글 내용
	private String v_date;			// 문의글 작성일
	
}
