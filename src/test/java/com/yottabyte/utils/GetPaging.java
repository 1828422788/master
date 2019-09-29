package com.yottabyte.utils;

import com.yottabyte.entity.Paging;
import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class GetPaging {
    private static WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    private static Paging paging = new Paging();

    private WebElement totalNumberElement;

    private WebElement numbersPerPageElement;

    public GetPaging() {
        totalNumberElement = webDriver.findElement(By.xpath("//span[@class='_1a4SFPSKE5LHZ9oIlWNopk']/span"));
        numbersPerPageElement = webDriver.findElement(By.className("ant-select-selection-selected-value"));
    }

    public Paging getPagingInfo() {
        setPagingInfo(paging);
        return paging;
    }

    private void setPagingInfo(Paging paging) {
        int totalPage = getTotalPage();
        WebElement nextPage = webDriver.findElement(By.className(" ant-pagination-next"));

        paging.setTotalPage(totalPage);
        paging.setNextPage(nextPage);
    }

    private int getTotalPage() {
        int totalNumber = Integer.parseInt(totalNumberElement.getText());
        int numbersPerPage = StringUtils.findNumberInString(numbersPerPageElement.getText());
        return (int) Math.ceil((double) totalNumber / numbersPerPage);
    }
}
