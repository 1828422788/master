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

    public Object pop() {
        Object obj = top.data;
        top = top.next;
        return obj;
    }

    public Object peek() {
        if (this.isEmpty()) {
            return null;
        } else {
            return this.top.data;
        }
    }

    public boolean isEmpty() {
        return top == null;
    }

    public void delete(int index) {
        if (index == 0) {
            top = top.next;
        } else {

        }

    }

    public static void main(String[] args) {
        String s = "a b c d e f";
        LinkedList linkedList = new LinkedList();
        for (String str : s.split(" ")) {
            linkedList.push(str);
        }
        while (!linkedList.isEmpty())
            System.out.println(linkedList.pop());
    }
}
