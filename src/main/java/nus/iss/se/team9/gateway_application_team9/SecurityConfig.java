package nus.iss.se.team9.gateway_application_team9;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/user/**").authenticated()
                        .requestMatchers("/admin/**").authenticated()
                        .requestMatchers("/recipe/**").authenticated()
                        .requestMatchers("/email/**").authenticated()
                        .requestMatchers("/csv/**").authenticated()
                        .requestMatchers("/report/**").authenticated()
                        .anyRequest().permitAll()
                )
                .build();
    }
}
