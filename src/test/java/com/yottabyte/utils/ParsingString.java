package com.yottabyte.utils;

import java.util.ArrayList;
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
}
