package com.ebtd.www.bean;

import org.apache.ibatis.type.Alias;

import com.ebtd.www.bean.CompanyBusBean;

import lombok.Data;
import lombok.experimental.Accessors;
@Alias("companyBus")
@Data
@Accessors(chain = true)
public class CompanyBusBean {
	private String B_NO;
	private String C_USERNAME;
}
