package com.yottabyte.utils;

import java.io.InputStreamReader;
import java.io.LineNumberReader;

/**
 * @author ouyang kui
 */

public class OsUtils {
    /**
     * linux命令执行
     * @param shellCommand
     * @return int 0 or 1, 0 代表成功执行
     */
    public static int executeShell(String shellCommand) {
        int success = 0;
        try {
            String[] cmd = {"/bin/sh", "-c", shellCommand};
            Process pid = Runtime.getRuntime().exec(cmd);
            if (pid == null) {
                success = 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            success = 1;
        }
        return success;
    }

    /**
     * 获取linux命令执行的结果,cat 之类
     * @param shellCommand
     * @return
     */
    public static String getCmdResult(String shellCommand) {

        String result = "";
        String[] cmd = {"/bin/sh", "-c", shellCommand};
        try {
            Process process = Runtime.getRuntime().exec(cmd);
            InputStreamReader ir = new InputStreamReader(process.getInputStream());
            LineNumberReader input = new LineNumberReader(ir);
            StringBuffer sb = new StringBuffer();
            String line;

            while ((line = input.readLine()) != null){
                sb.append(line).append("\n");
            }
            result = sb.toString();
        } catch (java.io.IOException e) {
            System.err.println("IOException " + e.getMessage());
        }
        return result;
    }

    public static void main(String[] args) {
        String cmd = "touch /Users/ouyangkui/111122222";
        executeShell(cmd);
        System.out.println(getCmdResult("cat /Users/ouyangkui/IdeaProjects/auto_test_UI/1111"));
        System.out.println(getCmdResult("pwd"));
    }

}