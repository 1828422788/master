package com.yottabyte.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author sunxj
 */
public class StringUtils {
    /**
     * 找出字符串中的第一个数字
     *
     * @param str
     * @return
     */
    public static int findNumberInString(String str) {
        if ("".equals(str)) {
            return 10;
        }
        List<Integer> list = StringUtils.findNumbersInString(str);
        return list.get(0);
    }

    /**
     * 找出字符串中的所有数字
     *
     * @param str
     * @return
     */
    public static List<Integer> findNumbersInString(String str) {
        List<Integer> resultList = new ArrayList<>();
        for (String s : str.replaceAll("[^0-9]", ",").split(",")) {
            if (s.length() != 0) {
                resultList.add(Integer.parseInt(s));
            }
        }
        return resultList;
    }

    /**
     * 根据当前日期时间返回一个字符串
     *
     * @param
     * @return
     */
    public static String timeString(){
        SimpleDateFormat myFmt = new SimpleDateFormat("yyMMddHHmmss");
        Date date = new Date();
        return myFmt.format(date);
    }
}
