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
    public void JavascriptDragAndDrop(String source, String target) {
        WebElement sourceElement = GetElementFromPage.getWebElementWithName(source);
        WebElement targetElement = GetElementFromPage.getWebElementWithName(target);
        String js = "function createEvent(typeOfEvent) {\n" +
                "    var event = document.createEvent(\"CustomEvent\");\n" +
                "    event.initCustomEvent(typeOfEvent, true, true, null);\n" +
                "    event.dataTransfer = {\n" +
                "        data: {},\n" +
                "        setData: function (key, value) {\n" +
                "            this.data[key] = value;\n" +
                "        },\n" +
                "        getData: function (key) {\n" +
                "            return this.data[key];\n" +
                "        }\n" +
                "    };\n" +
                "    return event;\n" +
                "}\n" +
                "function dispatchEvent(element, event, transferData) {\n" +
                "    if (transferData !== undefined) {\n" +
                "        event.dataTransfer = transferData;\n" +
                "    }\n" +
                "    if (element.dispatchEvent) {\n" +
                "        element.dispatchEvent(event);\n" +
                "    } else if (element.fireEvent) {\n" +
                "        element.fireEvent(\"on\" + event.type, event);\n" +
                "    }\n" +
                "}\n" +
                "function simulateDragAndDrop(element, target) {\n" +
                "    var dragStartEvent = createEvent('dragstart');\n" +
                "    dispatchEvent(element, dragStartEvent);\n" +
                "    var dropEvent = createEvent('drop');\n" +
                "    dispatchEvent(target, dropEvent, dragStartEvent.dataTransfer);\n" +
                "    var dragEndEvent = createEvent('dragend');\n" +
                "    dispatchEvent(element, dragEndEvent, dropEvent.dataTransfer);\n" +
                "}\n";
        js += "simulateDragAndDrop(arguments[0], arguments[1])";
        JavascriptExecutor executor = (JavascriptExecutor)webDriver;
        executor.executeScript(js, sourceElement, targetElement);
    }

    /**
     * 把一个元素拖拽到另一个元素处
     *
     * @param source 想要拖拽的元素名称
     * @param target 目标元素名称
     */
    @And("^I drag the element1 \"([^\"]*)\" to the \"([^\"]*)\"$")
    public void JavascriptDragAndDrop1(String source, String target) {
        WebElement sourceElement = GetElementFromPage.getWebElementWithName(source);
        WebElement targetElement = GetElementFromPage.getWebElementWithName(target);
        String js = "function createEvent(typeOfEvent) {\n" +
                "    var event = document.createEvent(\"CustomEvent\");\n" +
                "    event.initCustomEvent(typeOfEvent, true, true, null);\n" +
                "    event.dataTransfer = {\n" +
                "        data: {},\n" +
                "        setData: function (key, value) {\n" +
                "            this.data[key] = value;\n" +
                "        },\n" +
                "        getData: function (key) {\n" +
                "            return this.data[key];\n" +
                "        }\n" +
                "    };\n" +
                "    return event;\n" +
                "}\n" +
                "function dispatchEvent(element, event, transferData) {\n" +
                "    if (transferData !== undefined) {\n" +
                "        event.dataTransfer = transferData;\n" +
                "    }\n" +
                "    if (element.dispatchEvent) {\n" +
                "        element.dispatchEvent(event);\n" +
                "    } else if (element.fireEvent) {\n" +
                "        element.fireEvent(\"on\" + event.type, event);\n" +
                "    }\n" +
                "}\n" +
                "function simulateDragAndDrop(element, target) {\n" +
                "    var dragStartEvent = createEvent('dragstart');\n" +
                "    dispatchEvent(element, dragStartEvent);\n" +
                "    var dropEvent = createEvent('drop');\n" +
                "    dispatchEvent(target, dropEvent, dragStartEvent.dataTransfer);\n" +
                "    var dragEndEvent = createEvent('dragend');\n" +
                "    dispatchEvent(element, dragEndEvent, dropEvent.dataTransfer);\n" +
                "}\n";
        js += "simulateDragAndDrop(arguments[0], arguments[1])";
        JavascriptExecutor executor = (JavascriptExecutor)webDriver;
    }

    /**
     * 把一个元素拖拽到右边/左边(搜索页页面拖拽)
     *
     * @param source 想要拖拽的元素名称
     * @param side   想要元素拖拽到方向，right/left
     */
    @And("^I drag the element \"([^\"]*)\" to the \"([^\"]*)\" side$")
    public void JavascriptDragToRightOrLeft(String source, String side) {
        WebElement sourceElement = GetElementFromPage.getWebElementWithName(source);
        int sourceX = sourceElement.getLocation().getX();
        if (side.equals("right")) {
            new Actions(webDriver).dragAndDropBy(sourceElement, 230-sourceX, 0).build().perform();
        } else if (side.equals("left")) {
            //21-half width of bar
            new Actions(webDriver).dragAndDropBy(sourceElement, -(sourceX - 21), 0).build().perform();
        }
    }

    /**
     * 把一个元素拖拽到右边/左边(搜索页页面拖拽)
     *
     * @param source 想要拖拽的元素名称
     * @param side   想要元素拖拽到方向，right/left
     */
    @And("^I drag1 the element \"([^\"]*)\" to the \"([^\"]*)\" side$")
    public void JavascriptDragToRightOrLeft1(String source, String side) {
        WebElement sourceElement = GetElementFromPage.getWebElementWithName(source);
        if (side.equals("right")) {
            new Actions(webDriver).dragAndDropBy(sourceElement, 200, 0).build().perform();
        } else if (side.equals("left")) {
            int sourceX = sourceElement.getLocation().getX();
            //21-half width of bar
            new Actions(webDriver).dragAndDropBy(sourceElement, -(sourceX - 21), 0).build().perform();
        }
    }

}
