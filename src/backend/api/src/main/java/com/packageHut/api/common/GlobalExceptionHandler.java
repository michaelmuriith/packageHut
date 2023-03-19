package com.packageHut.api.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.LocalDateTime;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<ErrorDetails> handleRuntimeException(RuntimeException ex) {
        HttpStatus status = HttpStatus.BAD_REQUEST;
        ErrorDetails errorDetails = new ErrorDetails(LocalDateTime.now(), status.value(), status.getReasonPhrase(), ex.getMessage());
        return ResponseEntity.status(status).body(errorDetails);
    }

    @Data
    @AllArgsConstructor
    private static class ErrorDetails {
        private LocalDateTime timestamp;
        private int status;
        private String error;
        private String message;
    }
}
