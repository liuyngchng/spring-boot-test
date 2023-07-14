package hello.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.test.data.TestMe;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created by richard on 14/03/2019.
 */

@Controller
@RequestMapping("/data")
public class TaskController {

    private static final Logger LOGGER = LogManager.getLogger();

    @RequestMapping("/test")
    @ResponseBody
    public String test() {
        LOGGER.info("received request");
        String result =  this.execShell(new String[]{"/usr/bin/bash", "./get_time.sh"}).getBody();

        result = "{\"status\":200}";
        LOGGER.info("response {}", result);
        return result;
    }

    @RequestMapping("/t")
    @ResponseBody
    public String getTimestamp(String t1) {
        String t2 = this.execShell(new String[]{"/usr/bin/bash", "./timestamp.sh"}).getBody().trim();
        LOGGER.info("received request \nt1 = {}, \nt2 = {}", t1, t2);
        return String.format(
            "%s,%s,%s",
            t1,
            t2,
            this.execShell(new String[]{"/usr/bin/bash", "./timestamp.sh"}).getBody().trim()
        );
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
