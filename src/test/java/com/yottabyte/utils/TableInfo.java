package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * @author sunxj
 */
public class TableInfo {
    private static WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    public static List<WebElement> getTrList() {
        List<WebElement> trList = webDriver.findElements(By.xpath("//table[@class='el-table__body']//tr"));
        // 列表下无数据则返回空
        if (trList.size() == 1 && "el-table__row no-data".equals(trList.get(0).getAttribute("class")))
            return null;
        return trList;
    }
}
