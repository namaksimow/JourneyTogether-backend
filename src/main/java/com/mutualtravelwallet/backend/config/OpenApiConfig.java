package com.mutualtravelwallet.backend.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

	@Bean
	public OpenAPI backendOpenApi() {
		return new OpenAPI()
				.info(new Info()
						.title("Mutual Travel Wallet API")
						.version("v1")
						.description("Public API documentation for backend endpoints."));
	}
}
