package com.ebtd.www.bean;

import lombok.Data;

@Data
public class VocBean {
	
	private int u_type;	//장애유형 시각:1, 휠체어:0
	
	//voc 테이블
	private int v_no; 				//문의 번호	PK
	private String c_username;		//회사 아이디	FK
	private String b_no;			//버스 번호	FK
	private String u_username;		//유저 아이디	FK
	private String v_title;			//제목
	private String v_content;		//내용
	private String v_date;			//작성일
	private String v_imgextention;	//확장자
	private int voc_recommend;		//추천count (1: 추천 -1:비추천)
	
	//voc_to_answer 테이블
	private int a_no;				//답변문의 번호 PK FK
	
	private int chu; //추천
	private int bee; //비추천
}
