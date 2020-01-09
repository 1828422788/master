package com.yottabyte.atest.algorithm;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

/**
 * @author sunxj
 * <p>
 * 有效括号
 */
public class ValidBrackets {
    public static void main(String[] args) {
        ValidBrackets test = new ValidBrackets();
        System.out.println(test.isValid("(([]))()[]"));
    }

    public boolean isValid(String s) {
        Map<Character, Character> map = new HashMap();
        map.put(')', '(');
        map.put('}', '{');
        map.put(']', '[');

        Stack stack = new Stack();
        for (char value : s.toCharArray()) {
            if (stack.empty()) {
                stack.push(value);
            } else if (map.keySet().contains(value) && map.get(value).equals(stack.peek())) {
                stack.pop();
            } else {
                stack.push(value);
            }
        }
        return stack.isEmpty();
    }

    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> map = new HashMap<>();
        int[] array = new int[2];
        for (int i = 0; i < nums.length; i++) {
            if (!map.keySet().contains(nums[i])) {
                map.put(target - nums[i], i);
            } else {
                array[0] = map.get(nums[i]);
                array[1] = i;
            }
        }
        return array;
    }

}
