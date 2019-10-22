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
    List<WebElement> tableList;
    private WebElement totalNumberElement;
    private WebElement numbersPerPageElement;
    private WebElement nextPage;

    public Paging() {
        if (!checkUrl()) {
            totalNumberElement = webDriver.findElement(By.xpath("//span[@class='_1a4SFPSKE5LHZ9oIlWNopk']/span"));
            numbersPerPageElement = webDriver.findElement(By.xpath("(//div[@class='ant-select-selection-selected-value'])[last()]"));
            nextPage = webDriver.findElement(By.className("ant-pagination-next"));
            tableList = webDriver.findElements(By.className("ant-table-tbody"));
        } else {
            totalNumberElement = webDriver.findElement(By.className("el-pagination__total"));
            numbersPerPageElement = webDriver.findElement(By.xpath("//li[@class='el-select-dropdown__item selected']"));
            nextPage = webDriver.findElement(By.className("el-icon-arrow-right"));
            tableList = webDriver.findElements(By.className("el-table__body"));
        }
    }

    public List<WebElement> getTableList() {
        return tableList;
    }

    public WebElement getNextPage() {
        return nextPage;
    }

    public int getTotalPage() {
        int totalNumber = StringUtils.findNumberInString(totalNumberElement.getText());
        int numbersPerPage = StringUtils.findNumberInString(numbersPerPageElement.getText());
        return (int) Math.ceil((double) totalNumber / numbersPerPage);
    }

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
