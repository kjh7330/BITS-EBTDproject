package com.ebtd.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CompanyCheckBean {
	private String busNum;
	private String cName;
}
