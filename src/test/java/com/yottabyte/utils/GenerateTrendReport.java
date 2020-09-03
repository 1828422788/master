package com.yottabyte.utils;

import java.io.*;

/**
 * @author sunxj
 */
public class GenerateTrendReport {
    public static void main(String[] args) {
        BufferedWriter writer;

        try {
            writer = new BufferedWriter(new FileWriter("target/cucumber-html-reports/embeddings/actual_img/trend/test.html"));
            writer.write("<!DOCTYPE html>\n<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n");

            writer.write("<div>曲线图sample1\nspl：tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10</div>");
            writer.write("<img src=\"曲线图sample1.png\" style=\"width: 1000px; height: 700px; \">");


            writer.write("</body></html>");
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
