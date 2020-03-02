package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
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
}
