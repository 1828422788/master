package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.Scenario;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.logging.LogEntries;
import org.openqa.selenium.logging.LogEntry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Set;


public class GetLogger {

    private static Logger logger;

    static {
        logger = LoggerFactory.getLogger(Thread.currentThread().getStackTrace()[2].getFileName());
    }

    public static Logger getLogger() {
        return logger;
    }

    /**
     * 截取包含traceid的第一段request，嵌入至报告里
     */
    public static void getTraceIdFromRequest(WebDriver webDriver) {
//        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        Set availableLogTypes = webDriver.manage().logs().getAvailableLogTypes();
        System.out.println("logEntries:" + availableLogTypes);
        if (!availableLogTypes.contains("performance"))
            return;
        LogEntries logEntries = webDriver.manage().logs().get("performance");
        for (LogEntry log : logEntries) {
            if (log.getMessage().contains("traceid")) {
                Scenario scenario = SharedDriver.getScenario();
                scenario.embed(log.getMessage().getBytes(), "application/json");
                return;
            }
        }
    }
}
