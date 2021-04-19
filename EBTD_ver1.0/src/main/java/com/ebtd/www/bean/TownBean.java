package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
//@Alias("town")
@Data //론복의 기능 중 게터 세터 투 스트링 이퀄스 해쉬코드 활용 가능 
@Accessors(chain = true)
public class TownBean {
	String T_NAME;
	int T_STARTX;
	int T_STARTY;
	int T_LASTX;
	int T_LASTY;
	int T_NO;
}
