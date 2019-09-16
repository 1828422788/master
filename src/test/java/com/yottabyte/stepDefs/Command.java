package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author sunxj
 */
public class Command {

    private ConfigManager configManager = new ConfigManager();
    private String serverHost = configManager.get("rizhiyi_server_host");

    @Given("^curl update url \"([^\"]*)\"$")
    public void update(String url) {
        String finalUrl = serverHost + ":8180/api/changeconfig?" + url;
        this.curl(finalUrl);
    }

    @And("^curl restart url \"([^\"]*)\"$")
    public void curlRestartUrl(String value) {
        String url = serverHost + ":8180/api/servicecontroll?" + value + "&action=restart";
        this.curl(url);
    }

    private void curl(String url) {
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
