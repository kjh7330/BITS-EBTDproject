package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("bookmark")
@Data	//싹 다 만들어줌-롬복 기능 중 게터 세터 투스트링 이퀄스 해쉬코드 활용 가능
public class UserBookmarkBean {
	
	private String ub_no; //즐겨찾기번호(pk)
	private String u_userName; //id(pk)(fk)
	private int s_noStart; //출발 정류장(fk)
	private int s_noLast;  //도착 정류장(fk)
	private String b_no; //버스번호(fk)
	private String ub_alias;	//별칭
	
	private String s_nameStart; //출발 정류장 이름
	private String s_nameLast;  //도착 정류장 이름

}
