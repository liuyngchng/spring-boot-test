package hello.config;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.env.EnvironmentPostProcessor;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MapPropertySource;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class DemoEnvironment implements EnvironmentPostProcessor {

    private static final Logger LOGGER = LogManager.getLogger();

    @Override
    public void postProcessEnvironment(ConfigurableEnvironment environment, SpringApplication application) {
        LOGGER.info("postProcessEnvironment");
        String name = "applicationConfig: [classpath:/application.properties]";
        MapPropertySource propertySource = (MapPropertySource) environment.getPropertySources().get(name);
        Map<String, Object> source = propertySource.getSource();
        Map map = new HashMap();
        source.forEach((k, v) -> {
            map.put(k , v);
        });
        // 将配置的端口号修改为 8022
        map.replace("server.port", 8022);
        environment.getPropertySources().replace(name, new MapPropertySource(name, map));
    }
}

