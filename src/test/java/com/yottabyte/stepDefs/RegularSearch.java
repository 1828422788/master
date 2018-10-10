package com.yottabyte.stepDefs;

import com.yottabyte.entity.Paging;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.*;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.*;

/**
 * @author sunxj
 */
public class RegularSearch {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @Given("^search from \"([^\"]*)\" then I will see the result \"([^\"]*)\"$")
    public void searchFromDropdown(String dropdownMenu, String searchResult) {
        this.chooseFromDropdown(dropdownMenu);
        this.analyzeSearchResult(searchResult);
    }


    private void waitUntilLoadingDisappear() {
        WebElement loadingMask = webDriver.findElement(By.className("el-loading-mask"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loadingMask));
    }

    private void analyzeSearchResult(String searchResult) {
        List<WebElement> trList = this.getTrList();
        if (trList == null)
            return;

        Paging paging = GetPaging.getPagingInfo();
        Map<String, Object> resultMap = JsonStringPaser.json2Stirng(searchResult);
        int columnNum = Integer.parseInt(resultMap.get("column").toString());

        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                paging.getNextPage().click();
                this.waitUntilLoadingDisappear();
                trList = this.getTrList();
            }

            for (WebElement tr : trList) {
                List<WebElement> tdList = tr.findElements(By.xpath(".//td"));
                if (tdList.size() >= columnNum) {
                    String actualText = tdList.get(columnNum).getText();
                    String expectText = resultMap.get("name").toString();
                    Assert.assertTrue(actualText.contains(expectText));
                }
            }
        }
    }

    @Then("^I will see the result time in \"([^\"]*)\"$")
    public void searchByTime(String searchTime) {
        this.waitUntilLoadingDisappear();
        List<WebElement> trList = this.getTrList();
        if (trList == null)
            return;

        Map<String, Object> resultMap = JsonStringPaser.json2Stirng(searchTime);
        long expectTime = this.getExpectTime(resultMap);

        int columnNum = Integer.parseInt(resultMap.get("column").toString());

        // 获取分页相关信息
        Paging paging = GetPaging.getPagingInfo();

        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(paging.getNextPage()));
                paging.getNextPage().click();
                this.waitUntilLoadingDisappear();
                trList = this.getTrList();
            }

            for (WebElement tr : trList) {
                List<WebElement> tdList = tr.findElements(By.xpath(".//td"));
                if (tdList.size() >= columnNum) {
                    String actualTime = tdList.get(columnNum).getText();
                    compareTime(actualTime, expectTime);
                }
            }
        }
    }

    private List<WebElement> getTrList() {
        List<WebElement> trList = webDriver.findElements(By.xpath("//table[@class='el-table__body']//tr"));
        // 列表下无数据则返回空
        if (trList.size() == 1 && "el-table__row no-data".equals(trList.get(0).getAttribute("class")))
            return null;
        return trList;
    }

    private long getExpectTime(Map<String, Object> resultMap) {
        if (resultMap.containsKey("recently")) {
            String resultValue = resultMap.get("recently").toString();
            int recentlyTime = Integer.parseInt(ParsingString.getNumberInString(resultValue).get(0));

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            if (resultValue.contains("m")) {
                calendar.set(Calendar.MINUTE, calendar.get(Calendar.MINUTE) - recentlyTime);
            } else if (resultValue.contains("h")) {
                calendar.set(Calendar.HOUR, calendar.get(Calendar.HOUR) - recentlyTime);
            } else if (resultValue.contains("d")) {
                calendar.set(Calendar.DAY_OF_WEEK, calendar.get(Calendar.DAY_OF_WEEK) - recentlyTime);
            }

            return calendar.getTimeInMillis();
        }
        return 0;
    }

    private void compareTime(String actual, long expect) {
        long actualDate = ParsingString.getLongDate(actual);
        long currentDate = new Date().getTime();
        Assert.assertTrue(actualDate >= expect && actualDate <= currentDate);
    }

    @Given("^choose from \"([^\"]*)\"$")
    public void chooseFromDropdown(String dropdownMenu) {
        Map<String, Object> dropdownMap = JsonStringPaser.json2Stirng(dropdownMenu);
        String dropdownKey = dropdownMap.keySet().iterator().next();
        WebElement dropdownList = GetElementFromPage.getWebElementWithName(dropdownKey);
        String dropdownValue = dropdownMap.get(dropdownKey).toString();

        List<String> values = new ArrayList<>();
        values.add(dropdownValue);
        new IChooseValueFromSelectList().iChooseTheFromThe(values, dropdownList);
        this.waitUntilLoadingDisappear();
    }

    @Then("^I will see the alert grade is \"([^\"]*)\"$")
    public void checkGradeColour(String colour) {
        List<WebElement> trList = this.getTrList();
        if (trList == null)
            return;

        Paging paging = GetPaging.getPagingInfo();
        String expectedClassName = "circle el-tooltip " + colour + "-circle";

        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                paging.getNextPage().click();
                this.waitUntilLoadingDisappear();
                trList = this.getTrList();
            }

            for (WebElement tr : trList) {
                List<WebElement> tdList = tr.findElements(By.xpath(".//td"));
                if (tdList.size() >= 2) {
                    WebElement td = tdList.get(1).findElement(By.xpath("(.//div/div)[last()]"));
                    String actualClassName = td.getAttribute("class");
                    Assert.assertEquals(expectedClassName, actualClassName);
                }
            }
        }
    }
}
