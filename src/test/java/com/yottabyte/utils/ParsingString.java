package com.yottabyte.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author sunxj
 */
public class ParsingString {

    /**
     * 获取字符串中的数字
     *
     * @param str
     * @return 数字列表
     */
    public static List<String> getNumberInString(String str) {
        List<String> numberList = new ArrayList<>();
        for (String s : str.replaceAll("[^0-9]", ",").split(",")) {
            if (s.length() > 0)
                numberList.add(s);
        }
        return numberList;
    }

    public static long getLongDate(String time) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = format.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date.getTime();
    }
}
