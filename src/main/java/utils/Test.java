package utils;


import entity.Account;
import entity.OrderOperation;
import org.springframework.beans.factory.BeanIsNotAFactoryException;
import org.springframework.context.support.StaticApplicationContext;

import java.util.Date;
import java.util.Random;
import java.util.concurrent.CountDownLatch;

/**
 * Created by isus on 2019/2/27.
 */
public class Test {
    //发送请求的url地址

    private static final String url = "http://localhost:9090/magazinemanager3/user/order";
    private static final String param1 = "number=12307&address=宏德楼2栋307&orderdate=2019-02-27&time=noon&user=李佳爱&reason=23";
    private static final String param2 = "number=12308&address=宏德楼2栋308&orderdate=2019-02-28&time=noon&user=李佳爱&reason=24";
    //模拟的并发量
    private static final int BINGFA = 100;

    private static CountDownLatch cdl = new CountDownLatch(BINGFA);
    private static CountDownLatch startGate = new CountDownLatch(1);

    public static void main(String[] args) {

        new Test().timeTasks();
    }


    public long timeTasks() {
        for (int i = 0; i < BINGFA; i++) {
            UserRequest userRequest = new UserRequest();
            userRequest.setUrl(url);
            if (i < 50) {


                userRequest.setParam(param1);
            } else {

                userRequest.setParam(param2);
            }
            new Thread(userRequest).start();
        }
        long start = System.currentTimeMillis();
        //任务开始锁让其他阻塞任务同时开始
        startGate.countDown();
        try { //主线程阻塞
            cdl.await();

        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long end = System.currentTimeMillis();
        System.out.println("用时: " + (end - start) + "ms");
        return end - start;
    }


    public static class UserRequest implements Runnable {
        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

        private String url;

        public String getParam() {
            return param;
        }

        public void setParam(String param) {
            this.param = param;
        }

        private String param;
        private int num;

        @Override
        public void run() {


            try {
                //任务开始计时锁阻塞其他子线程
                startGate.await();
//                String json = HttpClientUtil.doPostJson(url, param);
                Random random = new Random();
                num = random.nextInt(500);


                Thread.sleep(num);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //任务结束锁在执行任务后都countdown一次
            finally {
                long start=System.currentTimeMillis();
                String json = HttpClientUtil.doPostJson(url, param);
                System.out.println(json);
                long end=System.currentTimeMillis();
                System.out.println(Thread.currentThread().getName() + " start and sleep: " + (end-start)+"ms");
                cdl.countDown();
            }

            //使用工具类发送http请求


        }


        //发送的请求参数
        public static String getJson() {

            String str = "number=12308&address=宏德楼2栋308&orderdate=2019-02-27&time=noon&user=李佳爱&reason=23";
            return str;
        }


    }
}
