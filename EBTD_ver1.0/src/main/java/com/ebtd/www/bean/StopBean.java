package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;


@Alias("stop")
@Data //론복의 기능 중 게터 세터 투 스트링 이퀄스 해쉬코드 활용 가능 
@Accessors(chain = true)
public class StopBean {
	private int S_NO;
	private String T_NAME;
	private String S_NAME;
	private int S_X;
	private int S_Y;
	private String S_DETAIL;
	
}
