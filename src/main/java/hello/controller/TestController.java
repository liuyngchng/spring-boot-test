package hello.controller;

import hello.model.Result;
import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;
import java.util.concurrent.TimeUnit;


@Controller
@RequestMapping("/private")
public class TestController {

    private static final Logger logger = LoggerFactory.getLogger(TestController.class);

    @Autowired
    private RestTemplate template;

    @Autowired
    private WebDriver driver;

    /**
     * Selenium常用API的使用
     * https://blog.csdn.net/qq_22003641/article/details/79137327
     */
    @RequestMapping("/auth/item")
    @ResponseBody
    public String TestChromeDriver() {
        this.driver.get("https://www.baidu.com");
        this.driver.manage().timeouts().implicitlyWait(500, TimeUnit.MILLISECONDS);
        this.driver.close();
        return "";
    }

    @RequestMapping("/auth/item1")
    @ResponseBody
    public String TestMe() {
        Result result = this.template.getForObject("http://www.baidu.com/{1}/{2}", Result.class,1,5);
        logger.info("result = {}", result);
        return "";
    }
}
