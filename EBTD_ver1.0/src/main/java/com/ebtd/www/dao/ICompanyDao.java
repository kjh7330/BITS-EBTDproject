package com.ebtd.www.dao;


import com.ebtd.www.bean.CompanyAliasBean;
import com.ebtd.www.bean.CompanyJoinBean;

public interface ICompanyDao {
	
	//암호화 된 비밀번호Get
	public String getSecurityPwd(String c_username);
	//일치하는 회사 ID 가 있는지 확인
	public boolean existUsername(CompanyAliasBean cb);
	//user name
	public String accessUser(CompanyAliasBean cb);
	public int accessUserState(String username);
	public String getPwd(CompanyAliasBean cb);
	public String checkId(String c_username);
	public void companyJoin(CompanyJoinBean cjb);
	public void official_document_insert(CompanyJoinBean cjb);
	public Integer get_ap_no();
	public void bus_insert(CompanyJoinBean cjb);
	public void apply_insert(CompanyJoinBean cjb);
	public void apply_detail_insert(CompanyJoinBean cjb);
	public void all_bus_insert(CompanyJoinBean cjb);
	public void update_od_no(CompanyJoinBean cjb);
	public Integer get_d_no();
	public void driver_insert(CompanyJoinBean cjb);
}
