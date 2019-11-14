package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.*;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.*;

/**
 * @author sunxj
 */
public class ValidateResult {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    private Map<String, Object> resultMap;
    private int columnNum;
    private Paging pagingInfo = new Paging();

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
//        this.validateSearchResultContainsValue(searchResult);
    }

    private void waitUntilLoadingDisappear() {
        WebElement loadingMask;
        try {
            loadingMask = webDriver.findElement(By.className("ant-spin-spinning"));
        } catch (NoSuchElementException e) {
            return;
        }
        if (ElementExist.isElementExist(webDriver, loadingMask))
            WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loadingMask));
    }

    /**
     * 验证搜索列表
     * contains可省，只要有contains则为不包含某一字段，若匹配名称为第一列则可直接写名称
     *
     * @param searchResult 格式：{'column':'列数-1','name':'关键字名称','contains':'no'}
     */
    @Then("^I will see the search result \"([^\"]*)\"$")
    public void validateSearchResult(String searchResult) {
        ListPageUtils listPageUtils = new ListPageUtils();
        List<WebElement> trList = listPageUtils.getTrList();
        if (trList == null && searchResult.contains("no")) {
            return;
        } else if (trList == null) {
            Assert.assertTrue(false);
        }

        Paging paging = new Paging();
        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                paging.getNextPage().click();
                this.waitUntilLoadingDisappear();
                trList = this.getTrList();
            }
            validateResult(trList, searchResult);
        }
    }

    /**
     * 验证搜索列表，无分页
     * contains可省，只要有contains则为不包含某一字段
     *
     * @param searchResult 格式：{'column':'列数-1','name':'关键字名称','contains':'no'}
     */
    @Then("^I will see the search result without paging \"([^\"]*)\"$")
    public void validateResultWithoutPaging(String searchResult) {
        List<WebElement> trList = this.getTrList();
        if (trList == null)
            return;
        validateResult(trList, searchResult);
    }

    private void validateResult(List<WebElement> trList, String searchResult) {
        Map<String, Object> resultMap;
        if (JsonStringPaser.isJson(searchResult)) {
            resultMap = JsonStringPaser.json2Stirng(searchResult);
        } else {
            resultMap = new HashMap<>();
            resultMap.put("column", "0");
            resultMap.put("name", searchResult);
        }
        int columnNum = Integer.parseInt(resultMap.get("column").toString());
        for (WebElement tr : trList) {
            List<WebElement> tdList = tr.findElements(By.xpath(".//td"));
            if (tdList.size() >= columnNum) {
                String actualText = tdList.get(columnNum).getText();
                String expectText = resultMap.get("name").toString();
                if (actualText.equals(""))
                    return;
                if (resultMap.containsKey("contains"))
                    Assert.assertNotEquals(expectText, actualText);
                else
                    Assert.assertTrue(actualText.toLowerCase().contains(expectText.toLowerCase()));
            }
        }
    }

    /**
     * 验证搜索列表包含某一字段，无分页
     *
     * @param searchResult
     */
    @And("^I will see the search result without paging contains \"([^\"]*)\"$")
    public void iWillSeeTheSearchResultWithoutPagingContains(String searchResult) {
        List<WebElement> trList = this.getTrList();
        if (trList == null)
            return;
        Assert.assertTrue(validateContainsResult(searchResult, trList));
    }


    private boolean validateContainsResult(String searchResult, List<WebElement> trList) {
        resultMap = JsonStringPaser.json2Stirng(searchResult);
        columnNum = Integer.parseInt(resultMap.get("column").toString());
        return this.validateTdList(trList);
    }

    private boolean validateTdList(List<WebElement> trList) {
        for (WebElement tr : trList) {
            List<WebElement> tdList = tr.findElements(By.xpath(".//td"));
            if (tdList.size() >= columnNum) {
                String actualText = tdList.get(columnNum).getText();
                String expectText = resultMap.get("name").toString();
                if (actualText.contains(expectText)) {
                    return true;
                }
            }
        }
        return false;
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
        Paging paging = new Paging();

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
                    System.out.println("！！！！！实际时间：" + actualTime);
                    System.out.println("！！！！！预期时间：" + expectTime);
                    compareTime(actualTime, expectTime);
                }
            }
        }
    }

    private List<WebElement> getTrList() {
        List<WebElement> trList = webDriver.findElements(By.xpath("//tbody[@class='ant-table-tbody']/tr"));
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
                int day = calendar.get(Calendar.DATE);
                calendar.set(Calendar.DATE, day - recentlyTime);
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

        Paging paging = new Paging();
        String expectedClassName = "circle " + colour + "-circle";

        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                paging.getNextPage().click();
                this.waitUntilLoadingDisappear();
                trList = this.getTrList();
            }

            for (WebElement tr : trList) {
                List<WebElement> tdList = tr.findElements(By.xpath(".//td"));
                if (tdList.size() >= 2) {
                    WebElement td = tdList.get(1).findElement(By.xpath("(.//div/div/span)[last()]"));
                    String actualClassName = td.getAttribute("class");
                    Assert.assertEquals(expectedClassName, actualClassName);
                }
            }
        }
    }


    /**
     * 验证详情页中告警等级
     *
     * @param colour
     */
    @Then("^I will see the detail alert grade is \"([^\"]*)\"$")
    public void checkDetailGradeColour(String colour) {
        List<WebElement> trList = this.getTrList();
        if (trList == null)
            return;

        Paging paging = new Paging();
        String expectedClassName = "circle " + colour + "-circle";

        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                paging.getNextPage().click();
                this.waitUntilLoadingDisappear();
                trList = this.getTrList();
            }

            for (WebElement tr : trList) {
                WebElement element = tr.findElement(By.xpath(".//td//div[last()]//div[last()]"));
                String actualClassName = element.getAttribute("class");
                Assert.assertEquals(expectedClassName, actualClassName);
            }
        }
    }


    /**
     * 验证某一行某一列的值是否修改正确
     *
     * @param benchmarkName 基准名称 {'column':'比较列(from 0)','name':'名称'} 字符串则默认为第一列
     * @param values        格式：{'column':'比较列(from 1)','name':'比较名称'}
     */
    @Then("^I will see the data \"([^\"]*)\" values \"([^\"]*)\"$")
    public void iWillSeeTheData(String benchmarkName, String values) {
        Map<String, Object> valuesMap = JsonStringPaser.json2Stirng(values);
        if (valuesMap.get("name") == null)
            return;
        ListPageUtils clickButton = new ListPageUtils();
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
