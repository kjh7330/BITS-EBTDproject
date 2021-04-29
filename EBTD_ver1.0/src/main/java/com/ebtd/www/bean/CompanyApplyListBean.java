package com.ebtd.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CompanyApplyListBean {
	private String ap_b_no;
	private String ap_date;
	private int ap_state;
	private String ap_reject;
}
