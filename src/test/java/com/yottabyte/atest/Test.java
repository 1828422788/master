package com.yottabyte.atest;

/**
 * @author sunxj
 */
public class Test {
    public static int m;

    public static void main(String[] args) {
        Test test = new Test();
        Test.m = 3;
        test.test(Test.m);
        System.out.println(m);
    }

    public void test(int m) {
        Test.m = m;
        System.out.println(Test.m);
    }
}
