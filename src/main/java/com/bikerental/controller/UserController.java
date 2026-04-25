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
    public String loginProcess(String email, String password, org.springframework.ui.Model model, jakarta.servlet.http.HttpSession session) {
        Optional<User> userOpt = userRepository.findByEmail(email);
        
        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {
            // Save user to session
            session.setAttribute("user", userOpt.get());
            return "redirect:/dashboard";
        }
        
        model.addAttribute("error", "Invalid email or password");
        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard(jakarta.servlet.http.HttpSession session, org.springframework.ui.Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("user", user);
        return "dashboard";
    }

    @GetMapping("/profile")
    public String profile(jakarta.servlet.http.HttpSession session, org.springframework.ui.Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping("/users/create")
    public String registerProcess(String name, String email, String role, String password, org.springframework.ui.Model model) {
        // Basic check for existing email
        if (userRepository.findByEmail(email).isPresent()) {
            model.addAttribute("error", "Email already registered!");
            return "register";
        }

        // Create and save new user
        User newUser = new User(name, email, role, password);
        userRepository.save(newUser);
        
        System.out.println("User saved to database: " + email);
        
        model.addAttribute("message", "Registration successful! Please log in.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(jakarta.servlet.http.HttpSession session) {
        // Invalidate session
        session.invalidate();
        return "redirect:/";
    }
}
