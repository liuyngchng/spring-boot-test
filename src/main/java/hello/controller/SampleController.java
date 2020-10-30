package hello.controller;

import com.google.common.base.Strings;
import hello.model.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * config database https://www.cnblogs.com/liangblog/p/5228548.html
 */
@Controller
@RequestMapping("/")
public class SampleController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SampleController.class);

    @Value("${spring.datasource.url}")
    private String dataSource;

    @Autowired
    private JdbcTemplate jdbcTemplate;


    @RequestMapping("")
    public ModelAndView index() {
        LOGGER.info("hello, index");
        LOGGER.info("spring.datasource.url is {}", dataSource);
        this.jdbcTemplate.execute("PRAGMA journal_mode=WAL");
        LOGGER.info("open wal mode.");
        ModelAndView modelAndView =  new ModelAndView("menu");
        modelAndView.addObject("name", "whoAmI");
        modelAndView.addObject("dae", new Date());
        String sql = " create table if not exists file_info(" +
            "id integer primary key," +
            "app_id integer," +
            "file_id integer," +
            "name varchar(128)," +
            "size integer," +
            "path varchar(128)," +
            "slice_size integer," +
            "slice_total integer," +
            "slice_snd integer," +
            "md5 char(32)," +
            "create_time timestamp not null default(strftime('%Y-%m-%d %H:%M:%f', 'now' ,'localtime'))," +
            "update_time timestamp not null default(strftime('%Y-%m-%d %H:%M:%f', 'now' ,'localtime'))," +
            "del integer default 0" +
            ");";
        LOGGER.debug(sql);
        this.jdbcTemplate.execute(sql);
        String sql1 = "create table if not exists task_info(" +
            "id integer primary key," +
            "task_name varchar(128)," +
            "app_id integer," +
            "data_size integer," +
            "uid varchar(128)," +
            "origin_ip char(16)," +
            "target_ip varchar(128)," +
            "used_time integer," +
            "complete_per char(5)," +
            "create_time timestamp not null default(strftime('%Y-%m-%d %H:%M:%f', 'now' ,'localtime'))," +
            "finish_time timestamp," +
            "push_time timestamp," +
            "update_time timestamp," +
            "interrupt_time integer," +
            "retry_count integer," +
            "retry_time integer," +
            "retry_ip char(16)," +
            "slice_sended integer," +
            "slice_total integer," +
            "restart_time timestamp," +
            "cancel_time timestamp," +
            "file_id varchar(128)," +
            "priority integer," +
            "progress integer," +
            "op_uid varchar(128)," +
            "op_type integer," +
            "task_type integer," +
            "status integer," +
            "del integer default 0" +
            ");";
        LOGGER.debug(sql1);
        this.jdbcTemplate.execute(sql1);
        String sql2 = "insert into task_info (task_name, status, task_type,origin_ip,"+
            "target_ip,data_size,complete_per,used_time,interrupt_time,retry_count,"+
            "retry_time,retry_ip,finish_time,push_time,slice_sended,slice_total)"+
            " values ('abc.pdf', 3, 2,'192.168.0.1','192.168.0.2',100, '100%',10,0,0,0,'',"+
            " '2020-11-11 08:00:39.000','2020-11-11 08:00:39.000',10,10)";
        LOGGER.debug(sql2);
        this.jdbcTemplate.execute(sql2);
        return modelAndView;
    }

    @RequestMapping("task_list")
    public ModelAndView taskList() {
        LOGGER.info("hello, taskInfo");
        ModelAndView modelAndView =  new ModelAndView("task_list");
        modelAndView.addObject("name", "whoAmI");
        modelAndView.addObject("dae", new Date());
        return modelAndView;
    }

    @RequestMapping("task_detail")
    public ModelAndView taskDetail() {
        LOGGER.info("hello, taskDetail");
        ModelAndView modelAndView =  new ModelAndView("task_detail");
        modelAndView.addObject("name", "whoAmI");
        modelAndView.addObject("dae", new Date());
        return modelAndView;
    }

    @RequestMapping("file_list")
    public ModelAndView fileList() {
        LOGGER.info("hello, fileList");
        ModelAndView modelAndView =  new ModelAndView("file_list");
        modelAndView.addObject("name", "whoAmI");
        modelAndView.addObject("dae", new Date());
        return modelAndView;
    }

    @RequestMapping("curve_data")
    public ModelAndView curveData() {
        LOGGER.info("hello, curveData");
        ModelAndView modelAndView =  new ModelAndView("curve_data");
        modelAndView.addObject("name", "whoAmI");
        modelAndView.addObject("dae", new Date());
        return modelAndView;
    }

    @RequestMapping("data")
    @ResponseBody
    public Pagination getImportData(final TaskSearchDto searchDto) {
        String sql = "select * from task_info where task_name = 'abc.pdf' limit 0, 25";
        List<Map<String,Object>> result = this.jdbcTemplate.query(sql, new RowMapper<Map<String,Object>>() {
            @Override
            public Map mapRow(ResultSet rs, int rowNum) throws SQLException {
                Map row = new HashMap();
                row.put("id", rs.getInt("id"));
                row.put("task_name", rs.getString("task_name"));
                row.put("create_time", rs.getString("create_time"));
                row.put("finish_time", rs.getString("finish_time"));
                row.put("data_size", rs.getString("data_size"));
                row.put("complete_per", rs.getString("complete_per"));
                row.put("status", rs.getString("status"));
                row.put("task_type", rs.getString("task_type"));
                row.put("origin_ip", rs.getString("origin_ip"));
                row.put("target_ip", rs.getString("target_ip"));
                return row;
            }
        });
        Pagination pagination = new Pagination(searchDto.getPageNo(),25,23L);
        pagination.setRows(result);
        return pagination;
    }


    @RequestMapping("view")
    public ModelAndView view() {
        LOGGER.info("hello, myview");
        ModelAndView modelAndView =  new ModelAndView("view");
        modelAndView.addObject("name", "whoAmI");
        modelAndView.addObject("dae", new Date());
        return modelAndView;
    }

    @RequestMapping("test")
    public ModelAndView test() {
        LOGGER.info("hello, test");
        ModelAndView modelAndView =  new ModelAndView("test");
        Data data = new Data();
        data.setKey1("value1");
        data.setKey2("value2");
        data.setKey3("value3");
        modelAndView.addObject("data", data);
        return modelAndView;
    }

    @RequestMapping("file")
    public ModelAndView file() {
        LOGGER.info("hello, file");
        ModelAndView modelAndView =  new ModelAndView("file");
        return modelAndView;
    }

    @RequestMapping("login")
    public ModelAndView login(HttpServletRequest request) {
        if (null != request.getSession().getAttribute("user.name")) {
            final String name = String.valueOf(request.getSession().getAttribute("user.name"));
            if (Strings.isNullOrEmpty(name)) {
                LOGGER.info("user name is null");
                return new ModelAndView("login_index");
            }
            LOGGER.info("user login {}", name);
            ModelAndView modelAndView =  new ModelAndView("index");
            modelAndView.addObject("name", name);
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            modelAndView.addObject("date", sf.format(new Date()));
            return modelAndView;
        }
        final String name = request.getParameter("name");
        final String password = request.getParameter("password");
        LOGGER.info("user login {}", name);
        request.getSession().setAttribute("user.name", name);
        ModelAndView modelAndView =  new ModelAndView("index");
        modelAndView.addObject("name", name);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        modelAndView.addObject("date", sf.format(new Date()));
        return modelAndView;
    }

    @RequestMapping("logout")
    public ModelAndView logout(HttpServletRequest request) {
        LOGGER.info("hello, file");
        ModelAndView modelAndView =  new ModelAndView("login_index");
        modelAndView.addObject("data", "您已退出系统，欢迎下次再来");
        request.getSession().removeAttribute("user.name");
        return modelAndView;
    }

    @RequestMapping("task")
    public ModelAndView doTask(HttpServletRequest request) {
        LOGGER.info("hello, task");
        final String name = String.valueOf(request.getSession().getAttribute("user.name"));
        ModelAndView modelAndView;
        if (Strings.isNullOrEmpty(name) || name.equals("null")) {
            LOGGER.info("user name is null");
            return new ModelAndView("login_index");
        }
        if (name.equals("abc")) {
            modelAndView = new ModelAndView("task");
            if (request.getMethod().toLowerCase().equals("get")) {
                LOGGER.info("http get method.");
            } else {
                request.getParameterMap().forEach((k, v) -> {
                    if (k.startsWith("_s_")) {
                        final String score = v[0];
                        final String[] keys = k.replace("_s_", "").split("_");
                        final String sql = buildUpdateSql(keys, score);
                        LOGGER.info("update sql is {}", sql);
                        int result = this.jdbcTemplate.update(sql);
                        LOGGER.info("update result is {}", result);
                    }
                });
            }
            List<Map<String, Object>> list = getData("select * from test.test");
            modelAndView.addObject("scoreList", list);
            modelAndView.addObject("file", UploadController.fileList);
        } else {
            modelAndView = new ModelAndView("task_illegal");
        }
        return modelAndView;
    }

    private List<Map<String, Object>> getData(String sql) {
        List<Map<String, Object>> list =  this.jdbcTemplate.queryForList(sql);

        list.forEach(item -> {
            StringBuilder sb = new StringBuilder(10);
            sb.append("_s_");
            sb.append(item.get("city") + "_");
            sb.append(item.get("item") + "_");
            sb.append(item.get("id1") + "_");
            sb.append(item.get("id2") + "");
            item.put("data_key", sb.toString());
        });
        LOGGER.info("list is {}", list);
        return list;
    }

    private String buildUpdateSql(String[] keys, String score) {
        if (keys.length != 4) {
            return "";
        }
        StringBuilder sb = new StringBuilder("update test.test set score = '");
        sb.append(score);
        sb.append("' where true ");
        sb.append("and city = '" + keys[0] + "'");
        sb.append("and item = '" + keys[1] + "'");
        sb.append("and id1 = '" + keys[2] + "'");
        sb.append("and id2 = '" + keys[3] + "'");
        return sb.toString();
    }
}