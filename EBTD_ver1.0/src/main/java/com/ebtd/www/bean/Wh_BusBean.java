package com.ebtd.www.bean;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;


import lombok.Data;
import lombok.experimental.Accessors;

@Alias("bus_wh")
@Data
@Accessors(chain = true)
public class Wh_BusBean {
	private String b_no;
	private String c_username;
	private int ab_no;
	private int ab_wheel_cnt;
	private int ab_blind_cnt;
	private int ab_type;
}
