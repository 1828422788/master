package com.yottabyte.test;

/**
 * @author sunxj
 */
public class Visitor {
    public void visit(Dog dog) {
        dog.eat();
    }

    public void visit(Cat cat) {
        cat.eat();
    }
}
