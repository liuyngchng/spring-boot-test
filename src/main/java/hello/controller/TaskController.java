package hello.controller;

import com.test.data.TestMe;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by richard on 14/03/2019.
 */

@Controller
@RequestMapping("/data")
public class TaskController {

    @RequestMapping("/test")
    @ResponseBody
    public String test() {

        return "{\n" +
                "  \"dataset\":\n" +
                "    {\"data\":\n" +
                "      [\n" +
                "        {\"a\":\"a\", \"b\": \"b\"}\n" +
                "      ],\n" +
                "      \"totalCount\": \"10\"\n" +
                "    },\n" +
                "  \"currentPage\": \"2\",\n" +
                "  \"pageSize\": \"10\",\n" +
                "  \"subjectId\": \"12345\"\n" +
                "}";
    }

    @RequestMapping("/test/_CLASS")
    @ResponseBody
    public String getClassName() {

        return TestMe.class.getName();
    }


    @RequestMapping(value = "/test1", produces = {"text/plain;charset=UTF-8"})
//    @RequestMapping(value = "/test1", produces = {"application/json;charset=UTF-8"})
    @ResponseBody()
    public String test1(HttpServletResponse response) {

//        response.addHeader("Content-Type", "application/json;charset=UTF-8");

//        response.addHeader("Content-Type", "text/plain;charset=UTF-8");

        return "{\"a\":\"b\"}";
    }
}
