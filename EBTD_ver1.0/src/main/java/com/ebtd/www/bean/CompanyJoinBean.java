package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("company_join_wh")
@Data
public class CompanyJoinBean {
	private String c_username; // company
	private String c_password;
	private String c_no;
	private int c_state = 0;
	
	private int od_no = 100001;
	
	private String b_no;
	
	
	private int ap_no;
	private String ap_b_no;
	private int ap_state = 0;
	private int ap_od_no = 100002;
	private String ap_reject = null;
	private String ap_accept_date = null;
	
	private int apde_turn;
	private int s_no;
	
	private String ab_no;
	private int ab_type;
	private int ab_state = 0;
	
	private int d_no;
	private String d_name;
	private String d_phonenum;
	private String d_enterdate;
	private String d_b_no;
	
}
