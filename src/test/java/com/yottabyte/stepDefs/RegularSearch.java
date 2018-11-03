package com.yottabyte.stepDefs;

import com.yottabyte.entity.Paging;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.*;
import cucumber.api.PendingException;
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

    /**
     * 验证每一行数据均为某一值
     *
     * @param dropdownMenu
     * @param searchResult
     */
    @Given("^search from \"([^\"]*)\" then I will see the result \"([^\"]*)\"$")
    public void searchFromDropdown(String dropdownMenu, String searchResult) {
        this.chooseFromDropdown(dropdownMenu);
        this.validateSearchResult(searchResult);
    }

    /**
     * 验证任意一行数据为某一值
     *
     * @param dropdownMenu
     * @param searchResult
     */
    @Given("^search from \"([^\"]*)\" then I will see the result contains \"([^\"]*)\"$")
    public void verifyResultContains(String dropdownMenu, String searchResult) {
        this.chooseFromDropdown(dropdownMenu);
        this.validateSearchResultContainsValue(searchResult);
    }

    private void waitUntilLoadingDisappear() {
        WebElement loadingMask = webDriver.findElement(By.className("el-loading-mask"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loadingMask));
    }

    /**
     * 验证数据已从列表页删除（第一列无该名称则通过）
     *
     * @param dataName
     */
    @Then("^I will see the data \"([^\"]*)\" is not available on the list$")
    public void iWillSeeTheDataIsNotAvailableOnTheList(String dataName) {
        List<WebElement> trList = this.getTrList();
        if (trList == null)
            return;

        Paging paging = GetPaging.getPagingInfo();

        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                paging.getNextPage().click();
                this.waitUntilLoadingDisappear();
                trList = this.getTrList();
            }

            for (WebElement tr : trList) {
                List<WebElement> tdList = tr.findElements(By.xpath(".//td"));
                if (tdList.size() >= 1) {
                    String actualText = tdList.get(0).getText();
                    Assert.assertFalse(dataName.equals(actualText));
                }
            }
        }
    }

    /**
     * 验证搜索列表
     * contains可省，只要有contains则为不包含某一字段
     *
     * @param searchResult 格式：{'column':'列数-1','name':'关键字名称','contains':'no'}
     */
    @Then("^I will see the search result \"([^\"]*)\"$")
    public void validateSearchResult(String searchResult) {
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
                    if (resultMap.containsKey("contains"))
                        Assert.assertFalse(actualText.contains(expectText));
                    else
                        Assert.assertTrue(actualText.contains(expectText));
                }
            }
        }
    }

    /**
     * 验证搜索列表包含某一字段
     *
     * @param searchResult 格式：{'column':'列数-1','name':'关键字名称'}
     */
    @Then("^I will see the search result contains \"([^\"]*)\"$")
    public void validateSearchResultContainsValue(String searchResult) {
        List<WebElement> trList = this.getTrList();
        if (trList == null)
            return;

        Paging paging = GetPaging.getPagingInfo();
        Map<String, Object> resultMap = JsonStringPaser.json2Stirng(searchResult);
        int columnNum = Integer.parseInt(resultMap.get("column").toString());

        outer:
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
                    if (actualText.contains(expectText))
                        break outer;
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

    /**
     * 搜索下拉列表
     *
     * @param dropdownMenu json格式 {'dropdownElement':'selectName'}
     */
    @Given("^choose from \"([^\"]*)\"$")
    public void chooseFromDropdown(String dropdownMenu) {
        WaitForElement.waitUntilLoadingDisappear();
        Map<String, Object> dropdownMap = JsonStringPaser.json2Stirng(dropdownMenu);
        String dropdownKey = dropdownMap.keySet().iterator().next();
        WebElement dropdownList = GetElementFromPage.getWebElementWithName(dropdownKey);
        String dropdownValue = dropdownMap.get(dropdownKey).toString();

        List<String> values = new ArrayList<>();
        values.add(dropdownValue);
        new IChooseValueFromSelectList().iChooseTheFromThe(values, dropdownList);
        this.waitUntilLoadingDisappear();
    }

    /**
     * 验证告警等级
     *
     * @param colour
     */
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


    /**
     * 验证某一行某一列的值是否修改正确
     *
     * @param benchmarkName 基准名称
     * @param values        格式：{'column':'比较列(from 1)','name':'比较名称'}
     */
    @Then("^I will see the data \"([^\"]*)\" values \"([^\"]*)\"$")
    public void iWillSeeTheData(String benchmarkName, String values) {
        Map<String, Object> valuesMap = JsonStringPaser.json2Stirng(values);
        ClickButtonWithGivenName clickButton = new ClickButtonWithGivenName();
        WebElement tr;

        if (!JsonStringPaser.isJson(benchmarkName)) {
            tr = clickButton.findName(benchmarkName);
        } else {
            Map<String, Object> benchmarkNameMap = JsonStringPaser.json2Stirng(benchmarkName);
            String name = benchmarkNameMap.get("name").toString();
            int columnNum = Integer.parseInt(benchmarkNameMap.get("column").toString());
            tr = clickButton.getRowWithColumnNum(name, columnNum);
        }

        String xpath = ".//td[" + valuesMap.get("column") + "]";
        String actualName = tr.findElement(By.xpath(xpath)).getText();
        Assert.assertEquals(valuesMap.get("name"), actualName);
    }
}
