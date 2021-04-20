package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("bus_wh")
@Data
@Accessors(chain = true)
public class DriverBusBean {
	private String b_no;
	private String c_username;
	private int ab_no;
	private int ab_wheel_cnt;
	private int ab_blind_cnt;
	private int ab_type;
}
