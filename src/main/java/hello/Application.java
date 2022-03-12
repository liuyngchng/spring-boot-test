package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

import java.util.function.Function;


@SpringBootApplication
//@ServletComponentScan
//@EnableAutoConfiguration
//@ComponentScan(value = "hello.model")
public class Application extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer(){
        return container -> {
            container.setSessionTimeout(1800);/*单位为s*/
        };
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    Function<String, String> uppercase() {
        return s -> s.toUpperCase();
    }
}