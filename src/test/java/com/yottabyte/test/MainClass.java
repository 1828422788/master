package com.yottabyte.test;

/**
 * @author sunxj
 */
public class MainClass {
    public static void main(String[] args) {
        Animal obj = new Cat();
        obj.accept(new Visitor());
    }
}
