package com.ebtd.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data //Getter AND Setter by Lombok
@Accessors(chain = true)
public class ApplyBusHistory {
	
	private String c_name;	   // 회사 이름
	private String c_username; // 회사 아이디 FK (FK_AP_C_USERNAME) - NN
	private int ap_no; 		   // 버스 신청 번호 PK (PK_AP_NO / SEQ_AP_NO) - NN
	private String sa_date;    // 회사 신청 번호
	private String ap_b_no;    // 버스 번호 PK FK (FK_AP_B_NO / SEQ_B_NO) - NN
	private String ap_date;    // 회사 신청일 // SYSDATE
	private String c_no; 	   // 사업장 등록번호 UQ - NN
	private int apde_turn;	   // 정류장 순번
	private int s_no;		   // 정류장 번호
	private String s_name;	   // 정류장 이름
	private String t_name;	   // 동 이름
	private int c_state;	   // 회사 승인상태 0:미승인 1:승인 2:반려 3:수정
	private int ap_state;	   // 버스 승인상태 0:미승인 1:승인 2:반려 3:수정

	
	
}
