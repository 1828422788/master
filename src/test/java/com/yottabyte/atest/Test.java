package com.yottabyte.atest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author sunxj
 */
public class Test {

    public static void main(String[] args) {
        Test test = new Test();
        System.out.println(test.getCurrenTime());
    }

    public Object parseTime() {
        String time = "1578758450320";
        Long lo = Long.parseLong(time);
        Date date = new Date(lo);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(date);
    }

    public Object getCurrenTime() {
        Date date = new Date();
        return date.getTime();
    }

}
