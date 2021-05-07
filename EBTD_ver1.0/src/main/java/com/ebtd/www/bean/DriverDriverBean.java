package com.ebtd.www.bean;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;


import lombok.Data;
import lombok.experimental.Accessors;
@Alias("driver_wh")
@Data
@Accessors(chain = true)
public class DriverDriverBean {
	private int d_no;
	private String c_username;
	private String d_name;
	private String d_imgextention;
	private String d_phonenum;
	private Date d_enterdate;
	private String b_no;
}
