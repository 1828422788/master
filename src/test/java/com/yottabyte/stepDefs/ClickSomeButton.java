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
import org.openqa.selenium.interactions.Actions;
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
            WebElement button = findButton(buttonName);
            //将该模块与浏览器顶部对齐，防止元素在页面的不可见区域
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
            ClickEvent.clickUnderneathButton(button);
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

    /**
     * 按照text属性点击
     *
     * @param buttonName 元素名称
     */
    @When("^I click the Element with text \"([^\"]*)\"$")
    public void clickTheElementWithText(String buttonName) {
        String xpath = "//*[text()='" + buttonName + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        if (ElementExist.isElementExist(webDriver, button))
            button.click();
    }

    /**
     * 点击某个icon(可以点击地图上的<svg>元素，<g>元素等等)
     *
     * @param buttonName 仪表盘记录名称
     */
    @When("^I click the Circle \"([^\"]*)\" button$")
    public void clickCircleElement(String buttonName) {
        if (buttonName != null && buttonName.trim().length() != 0) {
            WebElement button = findButton(buttonName);
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
            button.click();
        } else {
            System.out.println("skip this step!");
        }
    }

    /**
     * 点击鼠标右键
     *
     * @param buttonName 元素名称
     */
    @When("^I open the context menu of the \"([^\"]*)\" element$")
    public void contextMenuElement(String buttonName) {
        if (buttonName != null && buttonName.trim().length() != 0) {
            WebElement button = findButton(buttonName);
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
            Actions a = new Actions(webDriver);
            a.moveToElement(button).contextClick().build().perform();
        } else {
            System.out.println("skip this step!");
        }
    }

    /**
     * 双点击元素
     *
     * @param elementName 元素名称
     */
    @And("^I double click the \"([^\"]*)\" element$")
    public void doubleClickElement(String elementName) {
        if (elementName != null && elementName.trim().length() != 0) {
            WebElement element = findButton(elementName);
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", element);
            Actions action = new Actions(webDriver);
            action.doubleClick(element).perform();
        } else {
            System.out.println("skip this step!");
        }
    }

    /**
     * 找寻指定元素
     *
     * @param buttonName 字符串：按钮的名称，或者json：{'buttonName':'parameters'}
     */
    static public WebElement findButton(String buttonName){
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
        return button;
    }
}
