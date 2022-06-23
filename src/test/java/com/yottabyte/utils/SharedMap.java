/**
 * @author ouyang kui
 */
package com.yottabyte.utils;

import java.util.HashMap;

public class SharedMap {
    /**
     *     单例模式的使用方法
     *     SharedMap map = SharedMap.getInstance();
     *     map.setValue("username","username_202206231430");
     *     System.out.println(map.getValue("username"));
     */


    private static volatile SharedMap instance = null;

    HashMap<String, String> myMap = new HashMap<String, String>();

    public static SharedMap getInstance() {
        if (instance == null) {
            synchronized (SharedMap.class) {
                if (instance == null) {
                    instance = new SharedMap();
                }
            }
        }
        return instance;
    }
    
    public void setValue(String key, String value){
        myMap.put(key, value);
    }
    
    public String getValue(String key) {
        return myMap.get(key);
    }
}




