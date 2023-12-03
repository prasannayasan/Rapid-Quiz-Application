package com.yasan.rapidquiz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class RapidquizApplication {

	public static void main(String[] args) {
		SpringApplication.run(RapidquizApplication.class, args);
	}

}
