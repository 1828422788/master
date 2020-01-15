package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.Agent;
import com.yottabyte.utils.ListPageUtils;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * 对复选框的操作
 *
 * @author sunxj
 */
public class Checkbox {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    ListPageUtils listPageUtils = new ListPageUtils();

    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     */
    @And("^I \"([^\"]*)\" the label before \"([^\"]*)\"$")
    public void clickCheckLabel(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//div[contains(text(),'" + name + "')]/ancestor::td/preceding-sibling::td//label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.click();
            }
        }
    }

    /**
     * 勾选或取消勾选checkbox（名称可直接点击）
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     */
    @When("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\"$")
    public void clickCheckboxWithGivenName(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "(//span[@class='el-checkbox__label'][contains(text(),'" + name + "')])[last()]";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//preceding-sibling::span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.findElement(By.xpath(".//ancestor::label")).click();
            }
        }
    }

    /**
     * 判断列表页下checkbox的状态
     *
     * @param name      想要判断的名称
     * @param attribute 状态（enabled/disabled）
     */
    @Then("^I will see the checkbox in list before \"([^\"]*)\" is \"([^\"]*)\"$")
    public void checkAttribute(String name, String attribute) {
        ListPageUtils listPageUtils = new ListPageUtils();
        WebElement tr = listPageUtils.getTr(name);
        WebElement label = tr.findElement(By.xpath(".//button"));
        Assert.assertTrue("enabled".equals(attribute) && label.isEnabled() || "disabled".equals(attribute) && !label.isEnabled());
    }


    @When("^the column is \"([^\"]*)\" then i \"([^\"]*)\" the agent label in agent page$")
    public void clickagentLabel(String columnNum, String status) {
        WebElement tr = listPageUtils.getTrWithoutPaging(this.getAgentIp(columnNum));
        WebElement label = tr.findElement(By.xpath(".//label"));
        String attribute = label.getAttribute("class");
        if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
            label.click();
        }
    }



    private String getAgentIp(String columnNum) {
        Agent agent = new Agent();
        String ip = agent.getIp();
        Assert.assertNotNull("无正在运行的agent！", ip);
        String json = "{'column':'" + columnNum + "','name':'" + ip + "'}";
        return json;
    }
}
