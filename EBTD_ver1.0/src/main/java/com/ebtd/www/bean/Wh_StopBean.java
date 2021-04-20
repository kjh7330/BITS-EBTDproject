package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("stop_wh")
@Data
@Accessors(chain = true)
public class Wh_StopBean {
	private int r_turn;
	private String b_no;
	private int s_no;
	private String s_name;
}
