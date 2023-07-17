package hello.config;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Aspect
@Component(value = "intercept")
public class Intercept {

    private static final Logger LOGGER = LogManager.getLogger();

    @Pointcut("execution(String hello.controller.SampleController.index())")
//    @Pointcut("execution(* com.mysql.cj.jdbc.NonRegisteringDriver.connect(..))")
    public void pc1(){
        LOGGER.info("this is a test");
    }

    // 前置通知
    @Before(value = "pc1()")
    public void before(JoinPoint jp) {
        String name = jp.getSignature().getName();
        LOGGER.info("pc1 start, {}", name);
    }

    // 后置通知
    @After(value = "pc1()")
    public void after(JoinPoint jp) {
        String name = jp.getSignature().getName();
        LOGGER.info("pc1 end, {}", name);
    }

    // 返回通知
//    @AfterReturning(value = "pc1()", returning = "result")
//    public void afterReturning(JoinPoint jp, Object result) {
//        String name = jp.getSignature().getName();
//        LOGGER.info(name + "{}, returned {}", name, result);
//    }


//    @AfterThrowing(value = "pc1()", throwing = "e")
//    public void afterThrowing(JoinPoint jp, Exception e) {
//        String name = jp.getSignature().getName();
//        LOGGER.info(name + "{}, throw {}", name, e.getMessage());
//    }

    // 环绕通知
//    @Around("pc1()")
//    public Object around(ProceedingJoinPoint pjp) throws Throwable {
//        String name = pjp.getSignature().getName();
//        // 统计方法执行时间
//        long start = System.currentTimeMillis();
//        Object result = pjp.proceed();
//        long end = System.currentTimeMillis();
//        LOGGER.info("{} ,method consumed: {} ms", name, (end - start));
//        return result;
//    }
}
