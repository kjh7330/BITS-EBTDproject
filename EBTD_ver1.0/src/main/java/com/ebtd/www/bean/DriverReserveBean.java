package com.ebtd.www.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("reserve_wh")
@Data
@Accessors(chain = true)
public class DriverReserveBean {
	private int ur_no;
	private int ur_start_turn;
	private int ur_last_turn;
	private Date ur_date;
	private int u_type;
	private boolean up;
	private boolean on = false;
}
