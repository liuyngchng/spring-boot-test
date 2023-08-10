package hello.config;

import com.zaxxer.hikari.HikariDataSource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * 需要在resource下添加  META-INF/spring.factories, 对EnableAutoConfiguration进行扩展, 内容如下
 * org.springframework.boot.autoconfigure.EnableAutoConfiguration=hello.config.DataSourceAutoConfiguration
 */
@Configuration
@EnableConfigurationProperties(DataSourceProperties.class)
public class DataSourceAutoConfiguration {

    private static final Logger LOGGER = LogManager.getLogger();

    @Resource
    private DataSourceProperties prop;

    @Bean
    public DataSource dataSource() {
        LOGGER.info("customize datasource");
        HikariDataSource ds = new HikariDataSource();
        ds.setJdbcUrl(this.prop.getUrl());
        ds.setUsername(this.prop.getUsername());
        ds.setPassword(this.prop.getPassword());
        ds.setPassword("P@$$W0rd123");
        ds.setDriverClassName(this.prop.getDriverClassName());
        return ds;
    }


}