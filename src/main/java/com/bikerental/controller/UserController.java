package com.bikerental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/")
    public String home() {
        // Will resolve to /WEB-INF/jsp/home.jsp
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        // Will resolve to /WEB-INF/jsp/login.jsp
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        // Will resolve to /WEB-INF/jsp/register.jsp
        return "register";
    }
}
