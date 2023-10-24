package kr.ac.kopo.hanabit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class HanabitApplication {

	public static void main(String[] args) {
		SpringApplication.run(HanabitApplication.class, args);
	}

}
