package com.test.data;


import org.junit.Test;

import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class TestMeTest {


    @Test
    public void testMe() {
        int corePoolSize = 2;
        int maximumPoolSize = 2;
        long keepAliveTime = 6000L;
        LinkedBlockingQueue<Runnable> workQueue = new LinkedBlockingQueue<Runnable>();
        Executor cachedThread = new ThreadPoolExecutor(corePoolSize, maximumPoolSize, keepAliveTime, TimeUnit.MILLISECONDS,
            workQueue);

        for (int i = 0; i < 100; i++) {
            System.out.println("=====" + i);//设置i==3的时候或20的时候断点生效
            cachedThread.execute(new Runnable() {
                @Override
                public void run() {
                    System.out.println("hi");
                    try {
                        //此处等待10秒，用于观察各参数值的变化
                        Thread.sleep(1000);
                        System.out.println("threadName:" + Thread.currentThread().getName());
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }

                }
            });
        }

    }

}