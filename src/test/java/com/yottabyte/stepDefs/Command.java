package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.utils.CurlUtils;
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

    /**
     * manager中执行update操作
     *
     * @param url 待执行的命令
     */
    @Given("^curl update url \"([^\"]*)\"$")
    public void update(String url) {
        String finalUrl = serverHost + ":8180/api/changeconfig?" + url;
        CurlUtils.curl(finalUrl);
    }

    /**
     * 重启服务
     *
     * @param value 重启命令
     */
    @And("^curl restart url \"([^\"]*)\"$")
    public void curlRestartUrl(String value) {
        String url = serverHost + ":8180/api/servicecontroll?" + value + "&action=restart&wait=30";
        CurlUtils.curl(url);
    }

}
