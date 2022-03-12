package hello.controller;

import hello.model.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/private")
public class TestController {

    private static final Logger logger = LoggerFactory.getLogger(TestController.class);

    @Autowired
    private RestTemplate template;

    @RequestMapping("/auth/item")
    @ResponseBody
    public String TestMe() {
        Result result = this.template.getForObject("http://www.baidu.com/{1}/{2}", Result.class,1,5);
        logger.info("result = {}", result);
        return "";
    }
}
