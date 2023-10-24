package kr.ac.kopo.hanabankapiserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;

@SpringBootApplication
@ComponentScan(
        basePackages = "kr.ac.kopo.hanabankapiserver",
        excludeFilters = {
                @ComponentScan.Filter(
                        type = FilterType.REGEX, pattern
                        = "kr.ac.kopo.hanabankapiserver.account.v2.*")
        }

)
public class HanaBankApiServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(HanaBankApiServerApplication.class, args);
    }

}
