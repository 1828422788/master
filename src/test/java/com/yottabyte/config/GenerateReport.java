package com.yottabyte.config;

import java.io.*;

/**
 * @author sunxj
 */
public class GenerateReport {
    public static void main(String[] args) {
        File originFile = new File("/Users/sunxj/IdeaProjects/rzy_auto_test_UI/target/cucumber-html-reports/overview-features.html");
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("/Users/sunxj/IdeaProjects/rzy_auto_test_UI/target/cucumber-html-reports/test.html"));
            writer.write("<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>");

            BufferedReader reader = new BufferedReader(new FileReader(originFile));
            String line;
            boolean flag = false;
            while ((line = reader.readLine()) != null) {
                if (line.contains("id=\"report\"")) {
                    flag = true;
                }
                if (flag) {
                    writer.write(line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
