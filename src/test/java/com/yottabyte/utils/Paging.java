package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * @author sunxj
 */
public class Paging {
    private static WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    private String totalNumberElementXpath;
    private String numbersPerPageElementXpath;
    private String nextPageClass;
    private String tableListClass;

    public Paging() {
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
    }

    public List<WebElement> getTableList() {
        return webDriver.findElements(By.className(tableListClass));
    }

    public WebElement getNextPage() {
        return webDriver.findElement(By.className(nextPageClass));
    }

    public int getTotalPage() {
        WebElement totalNumberElement = webDriver.findElement(By.xpath(totalNumberElementXpath));
        int totalNumber = StringUtils.findNumberInString(totalNumberElement.getText());
        WebElement numbersPerPageElement = webDriver.findElement(By.xpath(numbersPerPageElementXpath));
        int numbersPerPage = StringUtils.findNumberInString(numbersPerPageElement.getText());
        return (int) Math.ceil((double) totalNumber / numbersPerPage);
    }

    /**
     * @return true为旧框架
     */
    public boolean checkUrl() {
        String currentUrl = webDriver.getCurrentUrl();
        String[] vueUrl = {"/account/usergroups/", "/account/roles/"};
        for (String url : vueUrl) {
            if (currentUrl.contains(url)) {
                return true;
            }
        }
        return false;
    }
}
