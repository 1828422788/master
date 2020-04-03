package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

/**
 * 滚动条相关操作
 *
 * @author sunxj
 */
public class ScrollBar {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 把滚动条拖到最顶端
     *
     * @throws InterruptedException
     */
    @And("^I drag the scroll bar to the top$")
    public void dragToTop() throws InterruptedException {
        ((JavascriptExecutor) webDriver).executeScript("scrollTo(0,1)");
        Thread.sleep(2000);
    }


    /**
     * 把滚动条拖到最底端
     */
    @And("^I drag the scroll bar to the end$")
    public void dragToEnd() {
        ((JavascriptExecutor) webDriver).executeScript("window.scrollTo(0, document.body.scrollHeight)");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /**
     * 把滚动条拖到某个元素位置处
     *
     * @param elementName 元素名称
     */
    @And("^I drag the scroll bar to the element \"([^\"]*)\"$")
    public void dragToElement(String elementName) {
        WebElement webElement = GetElementFromPage.getWebElementWithName(elementName);
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView(false);", webElement);
    }

    /**
     * 把一个元素拖拽到另一个元素处
     *
     * @param source 想要拖拽的元素名称
     * @param target 目标元素名称
     */
    @And("^I drag the element \"([^\"]*)\" to the \"([^\"]*)\"$")
    public void dragElement(String source, String target) {
        //WebElement element = webDriver.findElement(By.className("yw-drag-icon"));
        WebElement sourceElement = GetElementFromPage.getWebElementWithName(source);
        WebElement targetElement = GetElementFromPage.getWebElementWithName(target);
        Actions actions = (new Actions(webDriver));

        actions.clickAndHold(sourceElement);
        actions.moveToElement(targetElement,5,5);
        actions.perform();
        actions.release(targetElement);
        actions.perform();
        //actions.clickAndHold(sourceElement).moveToElement(targetElement).click(targetElement).release().build().perform();
//        actions.clickAndHold(sourceElement).build().perform();
//        actions.moveToElement(targetElement).build().perform();
//        actions.release(sourceElement).build().perform();
        //sourceElement.click();
        //actions.dragAndDrop(sourceElement, targetElement).build().perform();
        //actions.release();

        System.out.println();
    }
}
