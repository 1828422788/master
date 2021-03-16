package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 与分页相关的元素
 *
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
        String totalNumberElementXpath = "(//div[@class='yotta-pagination-elements'])[1]";
        String numbersPerPageElementXpath = "//div[@class='yotta-pagination-elements']//span[@class='yotta-select-selection-value']";
        String nextPageClass = "yotta-icon-RightOutlined";
        String tableListClass = "yotta-table-body";
        Map<String, String> map = new HashMap<>();
        map.put("totalNumberElementXpath", totalNumberElementXpath);
        map.put("numbersPerPageElementXpath", numbersPerPageElementXpath);
        map.put("nextPageClass", nextPageClass);
        map.put("tableListClass", tableListClass);
        return map;
    }
}
