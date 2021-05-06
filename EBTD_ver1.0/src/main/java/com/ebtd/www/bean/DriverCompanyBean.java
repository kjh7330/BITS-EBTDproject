package com.ebtd.www.bean;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;


import lombok.Data;
import lombok.experimental.Accessors;

@Alias("company_wh")
@Data
@Accessors(chain = true)
public class DriverCompanyBean {
	private String c_username;
	private String c_name;
	private int c_state;
}
