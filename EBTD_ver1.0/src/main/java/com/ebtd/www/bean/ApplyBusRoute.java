package com.ebtd.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data //Getter AND Setter by Lombok
@Accessors(chain = true)
public class ApplyBusRoute {

	private int ap_no; 	 // 신청 번호  PK FK (PK_HD_NO / SEQ_AP_NO) - NN
	private String ap_b_no; // 버스 번호  FK (FK_HD_AP_NO / SEQ_B_NO) - NN
	private int hd_turn; // 정류장 순번 FK (FK_HD_S_NO) - NN
	private int s_no; 	 // 정류장 번호
	private String c_name; // 회사 이름

}
