package hello.controller;

import hello.model.Result;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;



@Controller
@RequestMapping("/private")
public class TestController {

    private static final Logger LOGGER = LogManager.getLogger();

    @Autowired
    private RestTemplate template;


    /**
     * Selenium常用API的使用
     * https://blog.csdn.net/qq_22003641/article/details/79137327
     */
    @RequestMapping("/auth/item")
    @ResponseBody
    public String TestChromeDriver() {
//        this.driver.get("https://www.baidu.com");
//        this.driver.manage().timeouts().implicitlyWait(500, TimeUnit.MILLISECONDS);
//        this.driver.close();
        return "";
    }

    @RequestMapping("/auth/item1")
    @ResponseBody
    public String TestMe() {
        Result result = this.template.getForObject("http://www.baidu.com/{1}/{2}", Result.class,1,5);
        LOGGER.info("result = {}", result);
        return "";
    }
}
