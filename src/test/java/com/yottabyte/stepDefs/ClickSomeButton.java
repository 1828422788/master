package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.*;
import cucumber.api.java.en.And;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;
import java.util.Map;

/**
 * 点击按钮操作
 * Created by A on 2017/4/7.
 */
public class ClickSomeButton {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @When("^I click the \"([^\"]*)\" button$")
    public void clickButton(String buttonName) {
        if (buttonName != null && buttonName.trim().length() != 0) {
            String parameters = "";
            WebElement button;
            if (JsonStringPaser.isJson(buttonName)) {
                Map<String, Object> map = JsonStringPaser.json2Stirng(buttonName);
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    buttonName = entry.getKey();
                    parameters = (String) entry.getValue();
                }
                button = GetElementFromPage.getWebElementWithName(buttonName, parameters);
            } else {
                button = GetElementFromPage.getWebElementWithName(buttonName);
            }
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
            clickElement(button);
        } else {
            System.out.println("skip this step!");
        }
    }

    public void clickElement(WebElement button) {
        WaitForElement.waitForElementWithExpectedCondition(
                LoginBeforeAllTests.getWebDriver(), ExpectedConditions.elementToBeClickable(button));
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
        button.click();
    }

    @And("^I trigger the button \"([^\"]*)\"$")
    public void trigger(String buttonName) {
        GetElementFromPage.getWebElementWithName(buttonName);
    }

    /**
     * 监控专用（展开告警）
     *
     * @param buttonName
     */
    @And("^I click the expand button \"([^\"]*)\" if exist$")
    public void clickExpandButtonIfExist(String buttonName) {
        WebElement expandButton = GetElementFromPage.getWebElementWithName(buttonName);
        boolean flag = ElementExist.isElementExist(webDriver, expandButton);
        if (flag) {
            String text = expandButton.getText();
            int duplicatedNum = Integer.parseInt(ParsingString.getNumberInString(text).get(0));

            expandButton.click();
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            List<WebElement> list = expandButton.findElements(By.xpath(".//ancestor::tr/following-sibling::tr"));
            String alertName = null;
            for (int i = 0; i < duplicatedNum; i++) {
                WebElement element = list.get(i);
                String name = element.findElement(By.xpath(".//td[2]")).getText();
                if (alertName == null)
                    alertName = name;
                else
                    Assert.assertEquals(alertName, name);
            }
        }
    }

    /**
     * 如果元素存在则点击，不存在就拉倒
     *
     * @param buttonName 元素名称
     */
    @When("^I click the button \"([^\"]*)\" if exist$")
    public void clickTheButtonIfExist(String buttonName) {
        WebElement webElement = GetElementFromPage.getWebElementWithName(buttonName);
        if (ElementExist.isElementExist(webDriver, webElement))
            webElement.click();
    }

    /**
     * 点击在覆层下面的元素，被一层div遮住导致无法点击时，可用此方法
     *
     * @param elementName 元素名称
     */
    @And("^I click the \"([^\"]*)\" button under some element$")
    public void clickUnderneathButton(String elementName) {
        if (elementName != null && elementName.trim().length() != 0) {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            ClickEvent.clickUnderneathButton(element);
        }
    }

    /**
     * 在搜索页中选择日志来源
     *
     * @param name
     */
    @And("^I choose the \"([^\"]*)\" as log resource$")
    public void iChooseTheAsLogResource(String name) {
        WebElement arrow = webDriver.findElement(By.className("el-icon--right"));
        arrow.click();

        String xpath = "(//span[text()='" + name + "']/ancestor::div)[2]";
        WebElement resource = webDriver.findElement(By.xpath(xpath));
        String attribute = resource.getAttribute("class");
        // 没被选中则点击
        if (!attribute.contains("is-multiple-current")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", resource);
        }

        WebElement ul = webDriver.findElement(By.className("yw-searchbar__prepend-menu"));
    }
}
