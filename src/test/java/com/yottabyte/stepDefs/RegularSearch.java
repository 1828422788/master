package com.yottabyte.stepDefs;

import com.yottabyte.entity.Paging;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.GetPaging;
import com.yottabyte.utils.JsonStringPaser;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.Given;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author sunxj
 */
public class RegularSearch {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @Given("^search from \"([^\"]*)\" then I will see the result \"([^\"]*)\"$")
    public void searchFromDropdown(String dropdownMenu, String searchResult) {
        Map<String, Object> dropdownMap = JsonStringPaser.json2Stirng(dropdownMenu);
        String dropdownKey = dropdownMap.keySet().iterator().next();
        WebElement dropdownList = GetElementFromPage.getWebElementWithName(dropdownKey);
        String dropdownValue = dropdownMap.get(dropdownKey).toString();

        List<String> values = new ArrayList<>();
        values.add(dropdownValue);
        new IChooseValueFromSelectList().iChooseTheFromThe(values, dropdownList);
        this.waitUntilLoadingDisappear();

        this.analyzeSearchResult(searchResult);
    }

    private void waitUntilLoadingDisappear() {
        WebElement loadingMask = webDriver.findElement(By.className("el-loading-mask"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loadingMask));
    }

    private void analyzeSearchResult(String searchResult) {
        Map<String, Object> resultMap = JsonStringPaser.json2Stirng(searchResult);
        WebElement tableBody = webDriver.findElement(By.className("el-table__body"));
        Paging paging = GetPaging.getPagingInfo();

        int columnNum = Integer.parseInt(resultMap.get("column").toString());

        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                paging.getNextPage().click();
                this.waitUntilLoadingDisappear();
            }

            List<WebElement> trList = tableBody.findElements(By.tagName("tr"));
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
}
