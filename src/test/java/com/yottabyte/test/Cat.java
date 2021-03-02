package com.yottabyte.test;

/**
 * @author sunxj
 */
public class Cat implements Animal {
    @Override
    public void eat() {
        System.out.println("cat is eating!");
    }

    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
