package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author sunxj
 */
public class Paging {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    public List<WebElement> getTableList() {
        return webDriver.findElements(By.className(this.getXpath().get("tableListClass")));
    }

    public WebElement getNextPage() {
        return webDriver.findElement(By.className(this.getXpath().get("nextPageClass")));
    }

    public int getTotalPage() {
        Map<String, String> map = this.getXpath();
        WebElement totalNumberElement = webDriver.findElement(By.xpath(map.get("totalNumberElementXpath")));
        int totalNumber = StringUtils.findNumberInString(totalNumberElement.getText());
        WebElement numbersPerPageElement = webDriver.findElement(By.xpath(map.get("numbersPerPageElementXpath")));
        int numbersPerPage = StringUtils.findNumberInString(numbersPerPageElement.getText());
        return (int) Math.ceil((double) totalNumber / numbersPerPage);
    }

    private Map<String, String> getXpath() {
        String totalNumberElementXpath;
        String numbersPerPageElementXpath;
        String nextPageClass;
        String tableListClass;
        if (!checkUrl()) {
            totalNumberElementXpath = "//span[@class='_1a4SFPSKE5LHZ9oIlWNopk']/span";
            numbersPerPageElementXpath = "(//div[@class='ant-select-selection-selected-value'])[last()]";
            nextPageClass = "ant-pagination-next";
            tableListClass = "ant-table-tbody";
        } else {
            totalNumberElementXpath = "//span[@class='el-pagination__total']";
            numbersPerPageElementXpath = "//li[@class='el-select-dropdown__item selected']";
            nextPageClass = "el-icon-arrow-right";
            tableListClass = "el-table__body";
        }
        Map<String, String> map = new HashMap<>();
        map.put("totalNumberElementXpath", totalNumberElementXpath);
        map.put("numbersPerPageElementXpath", numbersPerPageElementXpath);
        map.put("nextPageClass", nextPageClass);
        map.put("tableListClass", tableListClass);
        return map;
    }

    /**
     * @return true为旧框架
     */
    public boolean checkUrl() {
        String currentUrl = webDriver.getCurrentUrl();
        String[] vueUrl = {"/account/usergroups/", "/plugins/","/sources/input/agent/group/", "/event/"};
        for (String url : vueUrl) {
            if (currentUrl.contains(url)) {
                return true;
            }
        }
        return false;
    }
}
