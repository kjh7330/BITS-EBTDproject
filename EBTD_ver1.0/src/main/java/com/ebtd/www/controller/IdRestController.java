package com.ebtd.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ebtd.www.bean.UserBean;
import com.ebtd.www.service.IdMM;
import com.ebtd.www.service.UserIdMM;

@RestController
public class IdRestController {	//관리자 전용
	
	@Autowired
	private IdMM idmm;
	@Autowired
	private UserIdMM uIdmm;
	
	//아이디 중복체크
	@RequestMapping(value = "join/checkId", method = RequestMethod.GET)
	@ResponseBody
	public int checkId(@RequestParam("c_username") String c_username) {
		return idmm.checkId(c_username);
	}
	
	//유저 아이디 중복체크
	@RequestMapping(value = "wheel/join/checkId", method = RequestMethod.GET)
	@ResponseBody
	public int UserCheckId(@RequestParam("u_username") String u_username) {
		return uIdmm.userCheckId(u_username);
	}

	@RequestMapping(value = "wheel/join/checkNo", method = RequestMethod.GET)
	@ResponseBody
	public int UserCheckDisNo(@RequestParam("u_disableno") String u_disableno) {
		return uIdmm.userCheckNo(u_disableno);
	}
	@RequestMapping(value = "/user/findId", method = RequestMethod.GET ,produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findId(UserBean ub) {
		System.out.println(ub.getU_name());
		
		return uIdmm.findId(ub);
	}
	@RequestMapping(value = "/user/findPw", method = RequestMethod.GET ,produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String findPw(UserBean ub) {
		String result = uIdmm.findPw(ub);
		System.out.println(result);
		return result;
	}
	


}
























