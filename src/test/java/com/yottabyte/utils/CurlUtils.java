package com.yottabyte.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author sunxj
 */
public class CurlUtils {
    public static void curl(String url) {
        String[] cmd = {"curl", url};
        ProcessBuilder pb = new ProcessBuilder(cmd);
        pb.redirectErrorStream(true);
        Process p;
        try {
            p = pb.start();
            String line;
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = br.readLine()) != null) {
                System.out.println("\t" + line);
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
