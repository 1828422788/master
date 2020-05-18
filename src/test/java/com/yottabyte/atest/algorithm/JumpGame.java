package com.yottabyte.atest.algorithm;

import java.util.HashMap;
import java.util.Map;

/**
 * @author sunxj
 */
public class JumpGame {
    public int jump(int[] nums) {
        if (nums.length <= 2) {
            return nums.length;
        }
        boolean up = true;
        int count = nums[1] - nums[0] == 0 ? 1 : 2;
        for (int i = 1; i < nums.length; i++) {
            if (up != nums[i] - nums[i - 1] >= 0) {
                up = !up;
                count += 1;
            }
        }
        return count;
    }

    public static void main(String[] args) {
        int[] nums = {5, 5, 10, 15, 12};
        JumpGame jumpGame = new JumpGame();
        System.out.println("count = " + jumpGame.jump(nums));
    }
}
