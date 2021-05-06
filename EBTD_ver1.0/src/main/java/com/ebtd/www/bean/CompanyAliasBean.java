package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("companyBean")
@Data
@Accessors(chain = true)
public class CompanyAliasBean {
	
	 private String c_username;
	 private String c_password;
	 
	 
	 private String c_name;
	 private String c_no;
	 private String c_imgextention;
	 
	 private int c_status;

}
