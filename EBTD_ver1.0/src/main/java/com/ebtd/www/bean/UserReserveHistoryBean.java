package com.ebtd.www.bean;


import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("userReserveHistory")
@Data	//싹 다 만들어줌-롬복 기능 중 게터 세터 투스트링 이퀄스 해쉬코드 활용 가능
public class UserReserveHistoryBean {

	private int urh_no; //예약번호(pk)
	private String u_userName; //id(fk)
	private String b_no;	//버스번호(fk)
	private String c_userName;	//버스회사
	private String urh_date;	//이용일시
	private int s_nostart; //출발 정류장(fk)
	private int s_nolast;  //도착 정류장(fk)
	private int urh_state;	//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
	private int u_type;	//장애유형 시각:1, 휠체어:0
	


}
