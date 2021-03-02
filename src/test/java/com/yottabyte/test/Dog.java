package com.yottabyte.test;

/**
 * @author sunxj
 */
public class Dog implements Animal {
    @Override
    public void eat() {
        System.out.println("dog is eating!");
    }

    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
