package nus.iss.se.team9.gateway_application_team9;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FallbackController {

    @GetMapping("/fallback/user")
    public String userServiceFallback() {
        return "User Service is currently unavailable. Please try again later.";
    }

    @GetMapping("/fallback/admin")
    public String adminServiceFallback() {
        return "Admin Service is currently unavailable. Please try again later.";
    }

    @GetMapping("/fallback/recipe")
    public String recipeServiceFallback() {
        return "Recipe Service is currently unavailable. Please try again later.";
    }

    @GetMapping("/fallback/email")
    public String emailServiceFallback() {
        return "Email Service is currently unavailable. Please try again later.";
    }

    @GetMapping("/fallback/csv")
    public String csvServiceFallback() {
        return "CSV Service is currently unavailable. Please try again later.";
    }

    @GetMapping("/fallback/report")
    public String reportServiceFallback() {
        return "Report Service is currently unavailable. Please try again later.";
    }
}

