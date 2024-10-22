package nus.iss.se.team9.gateway_application_team9;

import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@Configuration
public class GatewayConfig {

    @Bean
    public GlobalFilter loggingFilter() {
        return (exchange, chain) -> {
            // 打印请求的路径和方法
            System.out.println("Incoming request: " + exchange.getRequest().getURI() + ", Method: " + exchange.getRequest().getMethod().name());

            return chain.filter(exchange)
                    .doOnSuccess(aVoid -> System.out.println("Response status code: " + exchange.getResponse().getStatusCode()))
                    .doOnError(error -> System.out.println("Error occurred: " + error.getMessage()));
        };
    }
}
