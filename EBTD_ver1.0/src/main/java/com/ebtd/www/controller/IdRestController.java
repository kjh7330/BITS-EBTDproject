package com.ebtd.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebtd.www.service.IdMM;

@Controller
public class IdRestController {
	
	@Autowired
	private IdMM idmm;
	
	@RequestMapping(value = "join/checkId", method = RequestMethod.GET)
	@ResponseBody
	public int checkId(@RequestParam("c_username") String c_username) {
		return idmm.checkId(c_username);
	}
}
























