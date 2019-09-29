package com.yottabyte.utils;

import java.util.ArrayList;
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
}
