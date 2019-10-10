package com.yottabyte.utils;

import com.yottabyte.entity.Paging;
import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPageUtils {
//    Paging pagingInfo = new GetPaging().getPagingInfo();
//    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
//
//    /**
//     * 寻找name所在行
//     *
//     * @param name
//     * @return 行元素
//     */
//    public WebElement findName(String name) {
//        String url = webDriver.getCurrentUrl();
//        List<WebElement> tableList = webDriver.findElements(By.className("ant-table-tbody"));
//
//        if (tableList.size() == 1 || url.contains("agent")) {
//            // 表体
//            WebElement table = tableList.get(0);
//            if (url.contains("agent"))
//                return this.getRowWithoutPaging(name, table);
//            return this.getRow(name, table);
//        } else {
//            return this.getSourcesGroupName(tableList, name);
//        }
//    }
//
//    public WebElement findNameWithoutPaging(String name) {
//        List<WebElement> tableList = webDriver.findElements(By.className("ant-table-tbody"));
//        WebElement table = tableList.get(0);
//        return this.getRowWithoutPaging(name, table);
//    }
//
//    private WebElement findName(String name, WebElement table) {
//        return this.getRowWithoutPaging(name, table);
//    }
}
