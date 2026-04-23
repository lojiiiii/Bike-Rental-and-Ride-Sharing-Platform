package com.bikerental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

    @PostMapping("/login")
    public String loginProcess(String email, String password, org.springframework.ui.Model model) {
        // Mock login credentials: admin@example.com / admin123
        if ("admin@example.com".equals(email) && "admin123".equals(password)) {
            return "redirect:/dashboard";
        }
        
        model.addAttribute("error", "Invalid email or password");
        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        // This will be the "Available Bikes" screen
        return "dashboard";
    }

    @GetMapping("/profile")
    public String profile() {
        // User profile screen
        return "profile";
    }

    @GetMapping("/logout")
    public String logout() {
        // Redirect back home for mock logout
        return "redirect:/";
    }
}
