package com.ebtd.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping(value = "/")
	public String start() {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		return null;//.jsp
	}
}
