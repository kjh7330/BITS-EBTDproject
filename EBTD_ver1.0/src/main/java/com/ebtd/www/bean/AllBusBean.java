package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("allbus")
@Data 
@Accessors(chain = true)
public class AllBusBean {
	private int ab_no;
	private String b_no;
	private int d_no;
	private int r_turn;
	private int ab_wheel_cnt;
	private int ab_blind_cnt;
	private int ab_type;
	private int ab_state;
	private String ab_updown;
	
}
