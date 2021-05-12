package com.ebtd.www.bean;


import org.apache.ibatis.type.Alias;


import lombok.Data;

@Alias("reservation")
@Data	//싹 다 만들어줌-롬복 기능 중 게터 세터 투스트링 이퀄스 해쉬코드 활용 가능
public class UserReservationBean {

	private int ur_no;
	private String u_username;
	private int s_nostart;
	private int s_nolast;
	private String b_no;
	private String ur_date;
	private int ur_state;
	
	private String c_username;	//버스회사
	private String s_namestart; //출발 정류장 이름
	private String s_namelast;  //도착 정류장 이름
}
