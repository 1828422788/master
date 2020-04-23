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
//            String xpath = "(//span[@class='el-checkbox__label'][contains(text(),'" + name + "')])[last()]";
            String xpath = "(//span[contains(text(),'" + name + "')])[last()]";
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


    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     *                 仅用于字典管理授权页的checkbox
     */
    @And("^I \"([^\"]*)\" the label before \"([^\"]*)\" in the agent$")
    public void clickCheckLabelAgent(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//span[contains(text(),'" + name + "')]//ancestor::th//preceding-sibling::th//label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath("./span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.click();
            }
        }
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


    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     *                 仅用于字典管理授权页的checkbox
     */
    @And("^I \"([^\"]*)\" the label before \"([^\"]*)\" in the dictionary$")
    public void clickCheckLabeldic(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//span[contains(text(),'" + name + "')]/ancestor::td//label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.click();
            }
        }
    }

    /**
     * 判断checkbox的勾选状态
     *
     * @param status   判断状态，checked/unchecked
     * @param nameList 判断名称（支持传入list）
     */
    @And("^I check the label \"([^\"]*)\" status before \"([^\"]*)\" in the dictionary$")
    public void iCheckLabeldic(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//span[contains(text(),'" + name + "')]/ancestor::td//label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            String attribute = label.getAttribute("class");
            Assert.assertTrue((attribute.contains("checked") && "checked".equals(status))
                    || (!attribute.contains("checked") && "unchecked".equals(status)));
        }
    }

    /**
     * 授权页面勾选权限
     *
     * @param status    勾选checked/取消勾选unchecked
     * @param functions 想要勾选的权限名称
     * @param name      想要授权的数据名称
     */
    @When("^I \"([^\"]*)\" function \"([^\"]*)\" from the auth table which name is \"([^\"]*)\"$")
    public void clickAuthFunction(String status, List<String> functions, String name) {
        String preXpath = ".//span[contains(text(),'";
        String sufXpath = "')]";
        this.clickAuthButton(status, functions, name, preXpath, sufXpath);
    }

    /**
     * 授权页面组内读取权限的勾选
     *
     * @param status
     * @param functions
     * @param name
     */
    @When("^I \"([^\"]*)\" function \"([^\"]*)\" from the auth table in group which name is \"([^\"]*)\"$")
    public void clickAuthFunctionInGroup(String status, List<String> functions, String name) {
        String preXpath = "(.//span[contains(text(),'";
        String sufXpath = "')])[last()]";
        this.clickAuthButton(status, functions, name, preXpath, sufXpath);
    }

    private void clickAuthButton(String status, List<String> functions, String name, String preXpath, String sufXpath) {
        String url = webDriver.getCurrentUrl();
        String precedingXpath;
        if (url.contains("/account/roles/assign/")) {
            precedingXpath = "./preceding-sibling::span";
        } else {
            precedingXpath = "./preceding-sibling::label";
        }
        WebElement tr = listPageUtils.getRowWithoutTotalPage(name);
        for (String function : functions) {
            WebElement functionButton = tr.findElement(By.xpath(preXpath + function + sufXpath));
            String functionClass = functionButton.findElement(By.xpath(precedingXpath)).getAttribute("class");
            if (functionClass.contains("checked") && "unchecked".equals(status) || !functionClass.contains("checked") && "checked".equals(status)) {
                functionButton.click();
            }
        }
    }

    /**
     * 勾选权限授权页各资源权限的全选/取消全选
     *
     * @param status checked/unchecked
     * @param name
     */
    @And("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\" in auth table$")
    public void checkboxInAuth(String status, String name) {
        WebElement tr = listPageUtils.getTableRow(name, null);
        WebElement button = tr.findElement(By.xpath(".//label"));
        String functionClass = button.getAttribute("class");
        if (functionClass.contains("checked") && "unchecked".equals(status) || !functionClass.contains("checked") && "checked".equals(status)) {
            button.click();
        }
    }
}
