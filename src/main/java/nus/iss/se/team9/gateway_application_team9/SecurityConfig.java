//package nus.iss.se.team9.gateway_application_team9;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
//import org.springframework.security.config.web.server.ServerHttpSecurity;
//import org.springframework.security.web.server.SecurityWebFilterChain;
//
//@Configuration
//@EnableWebFluxSecurity
//public class SecurityConfig {
//
//    @Bean
//    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) throws Exception {
//        http
//                .authorizeExchange(exchange -> exchange
//                        .pathMatchers("/user/**").authenticated()
//                        .pathMatchers("/admin/**").authenticated()
//                        .pathMatchers("/recipe/**").authenticated()
//                        .pathMatchers("/email/**").authenticated()
//                        .pathMatchers("/csv/**").authenticated()
//                        .pathMatchers("/report/**").authenticated()
//                        .anyExchange().permitAll()
//                )
//                .csrf(ServerHttpSecurity.CsrfSpec::disable);
//        return http.build();
//    }
//}
