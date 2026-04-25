package com.bikerental.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable()) // Disable CSRF for development/simplicity in this project
            .authorizeHttpRequests(auth -> auth
                .anyRequest().permitAll() // Allow all requests as we handle authorization in the controller
            )
            .headers(headers -> headers.frameOptions(frame -> frame.disable())); // Allow H2 iframe for console
        
        return http.build();
    }
}
