package com.bikerental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.bikerental.model.User;
import com.bikerental.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Optional;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;


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
        Optional<User> userOpt = userRepository.findByEmail(email);
        
        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {
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

    @PostMapping("/users/create")
    public String registerProcess(String name, String email, String role, String password, org.springframework.ui.Model model) {
        // Create and save new user
        User newUser = new User(name, email, role, password);
        userRepository.save(newUser);
        
        System.out.println("User saved to database: " + email);
        
        model.addAttribute("message", "Registration successful! Please log in.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout() {
        // Redirect back home for mock logout
        return "redirect:/";
    }
}
