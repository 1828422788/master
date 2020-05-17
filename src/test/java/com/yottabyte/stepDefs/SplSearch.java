package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.Map;

/**
 * @author sunxj
 */
public class SplSearch {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 验证搜索页列表字段值
     *
     * @param json {'字段名称'：'字段名称+字段值'}
     */
    @Then("^I will see the spl search result \"([^割]*)\"$")
    public void iWillSeeTheSplSearchResult(String json) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(json);

        for (String key : map.keySet()) {
            WebElement tr = webDriver.findElement(By.xpath("((//span[text()='" + key + "'])[last()]/ancestor::div)[last()]"));
            String actualValue = tr.getText();
            Assert.assertEquals(map.get(key), actualValue);
        }
    }

    @Then("^I will see the spl search result \"([^割]*)\" which is selected$")
    public void iWillSeeTheSplSearchResultWhichIsSelected(String json) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(json);

        for (String key : map.keySet()) {
            WebElement tr = webDriver.findElement(By.xpath("//span[contains(text(),'事件操作')]/ancestor::div[1]/ancestor::div[1]//span[text()='" + key + "']/ancestor::pre[1]"));
            String actualValue = tr.getText();
            Assert.assertEquals(map.get(key), actualValue);
        }
    }

    /**
     * 验证搜索页列表下不包含某个字段
     *
     * @param list
     */
    @And("^I will see the spl search result data \"([^\"]*)\" doesn't exist$")
    public void ifDataExist(List<String> list) {
        for (String key : list) {
            WebElement element;
            try {
                element = webDriver.findElement(By.xpath("(//span[text()='" + key + "'])[last()]/following-sibling::span"));
            } catch (Exception e) {
                continue;
            }
            new CheckButtonAttribute().ifExist(element);
        }
    }


    @Then("^I will see the number of log is \"([^\"]*)\" when search \"([^割]*)\"$")
    public void checkLogNum(String logNum, String spl) {
        //class="_284Y6gRNbLs9PP8RvGX76B Fqdex4rec8vrc91HwX3oB"
        WebElement table = GetElementFromPage.getWebElementWithName("SearchTable");
        int totalLogNum = Integer.parseInt(logNum);
        List<WebElement> pages = webDriver.findElements(By.className("number"));
        pages.get(pages.size() - 1).click();
        int totalPage = Integer.parseInt(pages.get(pages.size() - 1).getText());
        int realTotalLogNum = 20 * (totalPage - 1) + table.findElements(By.tagName("tr")).size();
        if (realTotalLogNum != totalLogNum) {
//            logger.error("\n搜索语句：" + spl + "\n期望日志条数：" + logNum + "\n实际日志条数：" + realTotalLogNum);
            Assert.assertTrue(false);
        }
    }

}
