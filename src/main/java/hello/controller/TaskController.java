package hello.controller;

import com.test.data.TestMe;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

/**
 * Created by richard on 14/03/2019.
 */

@Controller
@RequestMapping("/data")
public class TaskController {

    private static final Logger LOGGER = LoggerFactory.getLogger(TaskController.class);

    @RequestMapping("/test")
    @ResponseBody
    public String test() {
        LOGGER.info("received request");
        String cmd[] = new String[2];
        cmd[0] = "/usr/bin/bash";
        cmd[1] = "get_time.sh";
        final String result =  this.execShell(cmd).getBody();
        LOGGER.info("response {}", result);
        return result;

//        return System.currentTimeMillis();

//        return "{\n" +
//                "  \"dataset\":\n" +
//                "    {\"data\":\n" +
//                "      [\n" +
//                "        {\"a\":\"a\", \"b\": \"b\"}\n" +
//                "      ],\n" +
//                "      \"totalCount\": \"10\"\n" +
//                "    },\n" +
//                "  \"currentPage\": \"2\",\n" +
//                "  \"pageSize\": \"10\",\n" +
//                "  \"subjectId\": \"12345\"\n" +
//                "}";
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

    public ResponseEntity<String> execShell(final String[] cmds) {
//        LOGGER.info("cmd = {}", Arrays.toString(cmds).replace(",", "").replace(" ", "' '"));
        ResponseEntity<String> responseEntity = null;
        Process process = null;
        BufferedReader stdInput = null;
        BufferedReader stdError = null;
        try {
            process = Runtime.getRuntime().exec(cmds);
            stdInput = new BufferedReader(
                new InputStreamReader(process.getInputStream())
            );
            stdError = new BufferedReader(
                new InputStreamReader(process.getErrorStream())
            );

            String tmp;
            final StringBuilder stdout = new StringBuilder(32);
            final StringBuilder stderr = new StringBuilder(32);
            while ((tmp = stdInput.readLine()) != null) {
                stdout.append(tmp);
                stdout.append("\r\n");

            }
            responseEntity = new ResponseEntity<>(stdout.toString(), HttpStatus.OK);
//            LOGGER.info("stdout of cmd:{}", stdout.toString());
            while ((tmp = stdError.readLine()) != null) {
                stderr.append(tmp);
                stderr.append("\r\n");
            }
//            LOGGER.info("stderr of cmd:\n{}", stderr.toString());

        } catch (IOException e) {
            LOGGER.error("error", e);
            responseEntity = new ResponseEntity<>(e.toString(), HttpStatus.BAD_REQUEST);
        } finally {
            try {
                stdInput.close();
            } catch (IOException e) {
                LOGGER.error("error", e);
            }
            try {
                stdError.close();
            } catch (IOException e) {
                LOGGER.error("error", e);
            }
            process.destroyForcibly();
        }
        return responseEntity;
    }
}
