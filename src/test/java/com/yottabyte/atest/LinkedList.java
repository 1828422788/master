package com.yottabyte.atest;

/**
 * @author sunxj
 */
public class LinkedList {
    private class Node {
        Object data;
        Node next = null;

        Node() {
            data = null;
            next = null;
        }

        Node(Object data, Node next) {
            this.data = data;
            this.next = next;
        }
    }

    Node top;

    public void push(Object obj) {
        this.top = new Node(obj, this.top);
    }

//    public Object pop() {
//        if()
//    }

    public Object peek() {
        if (this.isEmpty()) {
            return null;
        } else {
            return this.top.data;
        }
    }

    public boolean isEmpty() {
        return top.next == null;
    }

    public static void main(String[] args) {
        String s = "a b c d e f";
        LinkedList linkedList = new LinkedList();
        for (String str : s.split(" ")) {
            linkedList.push(str);
        }
        System.out.println(linkedList.peek());
    }
}
