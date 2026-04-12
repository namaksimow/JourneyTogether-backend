package com.mutualtravelwallet.backend.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HealthController {

	@GetMapping("/health")
	@Operation(summary = "Service health check")
	@ApiResponse(responseCode = "200", description = "Service is healthy")
	public HealthResponse health() {
		return new HealthResponse("UP");
	}

	public record HealthResponse(@Schema(example = "UP") String status) {
	}
}
