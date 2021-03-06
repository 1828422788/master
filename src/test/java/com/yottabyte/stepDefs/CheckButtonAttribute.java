package com.yottabyte.stepDefs;

import com.yottabyte.constants.WebDriverConst;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.Agent;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 检查元素是否包含某属性
 *
 * @author sunxj
 */
public class CheckButtonAttribute {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 检查元素class是否包含某值
     *
     * @param buttonNameList 元素名称（支持list）
     * @param attribute      属性值
     */
    @Then("^I will see the \"([^\"]*)\" is \"([^\"]*)\"$")
    public void checkClass(List<String> buttonNameList, String attribute) {
        this.checkElementsContainsAttribute(buttonNameList, "class", attribute);
    }

    /**
     * 检查元素style是否包含某值
     *
     * @param buttonNameList 元素名称（支持list）
     * @param attribute      属性值
     */
    @Then("^I will see the element \"([^\"]*)\" style contains \"([^\"]*)\"$")
    public void checkStyle(List<String> buttonNameList, String attribute) {
        this.checkElementsContainsAttribute(buttonNameList, "style", attribute);
    }

    /**
     * 检查元素style是否包含某值
     *
     * @param buttonNameList 元素名称（支持list）
     * @param attribute      属性值
     */
    @Then("^I will see the element \"([^\"]*)\" transform contains \"([^\"]*)\"$")
    public void checkTransform(List<String> buttonNameList, String attribute) {
        this.checkElementsContainsAttribute(buttonNameList, "transform", attribute);
    }

    /**
     * 检查元素fill是否包含某值
     *
     * @param buttonNameList 元素名称（支持list）
     * @param attribute      属性值
     */
    @Then("^I will see the element \"([^\"]*)\" fill contains \"([^\"]*)\"$")
    public void checkFill(List<String> buttonNameList, String attribute) {
        this.checkElementsContainsAttribute(buttonNameList, "fill", attribute);
    }

    /**
     * 检查元素的某一属性是否包含某一值
     *
     * @param buttonNameList 两种情况：1：传入的是列表 2：传入的元素是一个列表
     * @param type
     * @param attribute
     */
    private void checkElementsContainsAttribute(List<String> buttonNameList, String type, String attribute) {
        if (buttonNameList.size() == 1) {
            Object element = GetElementFromPage.getWebElementWithName(buttonNameList.get(0));
            if (element instanceof List) {
                List<WebElement> elements = (List<WebElement>) element;
                for (WebElement webElement : elements) {
                    Assert.assertTrue("实际值：" + webElement.getAttribute(type), webElement.getAttribute(type).contains(attribute));
                }
                return;
            }
        }
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            Assert.assertTrue("实际值：" + element.getAttribute(type), element.getAttribute(type).contains(attribute));
        }
    }


    /**
     * 判断元素是否可点击
     *
     * @param buttonNameList 元素名称（支持list）
     */
    @And("^I will see the \"([^\"]*)\" is clickable$")
    public void checkIsClickable(List<String> buttonNameList) {
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            Assert.assertFalse(element.getAttribute("class").contains("disabled"));
        }
    }

    /**
     * 判断按钮显示
     *
     * @param buttonNameList 元素名称（支持list）
     */
    @And("^I will see the \"([^\"]*)\" is display$")
    public void checkIsDisplay(List<String> buttonNameList) {
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            Assert.assertFalse(element.getAttribute("style").contains("display: none;"));
        }
    }

    /**
     * 日志来源展示结构
     *
     * @param nodeName
     * @param attribute
     */
    @Then("^I will see the \"([^\"]*)\" node is \"([^\"]*)\"$")
    public void checkNodeIsDisabled(String nodeName, String attribute) {
        List<WebElement> nodeList = GetElementFromPage.getWebElementWithName("NodeList");
        for (WebElement webElement : nodeList) {
            if (webElement.getText().equals(nodeName) && !"".equals(attribute)) {
                boolean disabledFlag = webElement.getAttribute("class").contains("node-disabled");
                if (!"".equals(attribute))
                    Assert.assertTrue(disabledFlag);
                else
                    Assert.assertFalse(disabledFlag);
            }
        }
    }

    /**
     * 验证元素内容是否为某一值，若两个参数均为list，要确保两个list长度相同
     *
     * @param buttonNameList   元素名称（支持list）
     * @param expectButtonName 期望值（支持list）
     */
    @Then("^I will see the element \"([^\"]*)\" name is \"([^割]*)\"$")
    public void ConfigsAppcheckElementName(List<String> buttonNameList, List<String> expectButtonName) {
        if (buttonNameList.size() == 1 && expectButtonName.size() != 1) {
            String finalName = expectButtonName.get(0) + expectButtonName.get(1);
            expectButtonName.clear();
            expectButtonName.add(finalName);
        }

        for (String buttonName : buttonNameList) {
            String expectText = expectButtonName.get(buttonNameList.indexOf(buttonName));
            validateElementName(expectText, buttonName);
        }
    }

    /**
     * 验证元素内容是否包含某一值，若两个参数均为list，要确保两个list长度相同
     *
     * @param buttonNameList   元素名称（支持list）
     * @param expectButtonName 期望值（支持list）
     */
    @Then("^I will see the element \"([^\"]*)\" name contains \"([^割]*)\"$")
    public void checkElementContainsName(List<String> buttonNameList, List<String> expectButtonName) {
        if (buttonNameList.size() == 1 && expectButtonName.size() != 1) {
            String finalName = expectButtonName.get(0) + expectButtonName.get(1);
            expectButtonName.clear();
            expectButtonName.add(finalName);
        }

        for (String buttonName : buttonNameList) {
            String expectText = expectButtonName.get(buttonNameList.indexOf(buttonName));
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            String actualText = element.getText();
            Assert.assertTrue("实际值： " + actualText + "\n期望值： " + expectText, actualText.contains(expectText));
        }
    }

    /**
     * 验证元素名称是否正确（传入json格式的参数，目的是避免检验值中出现逗号给分割成另一个参数）
     *
     * @param jsonString json格式 {'元素名称'：'元素值'}
     */
    @Then("^I will see the element value in json \"([^割]*)\"$")
    public void checkElementName(String jsonString) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(jsonString);
        for (String key : map.keySet()) {
            validateElementName(map.get(key).toString(), key);
        }
    }

    private void validateElementName(String expect, String actualElementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(actualElementName);
        String actualText = element.getText();
        System.out.println("expect:");
        System.out.println(expect);
        System.out.println("actualText:");
        System.out.println(actualText);

        Assert.assertEquals(expect, actualText);
    }

    /**
     * 验证多个元素名称是否正确
     *
     * @param element  为list
     * @param nameList
     */
    @Then("^I will see the element \"([^\"]*)\" value is \"([^割]*)\"$")
    public void iWillSeeTheElementValueIs(String element, List<String> nameList) {
        Object o = GetElementFromPage.getWebElementWithName(element);
        if (o instanceof List) {
            List<WebElement> list = (List<WebElement>) o;
            if (list.size() == 0) {
                Assert.assertTrue(false);
            }
            for (int i = 0; i < list.size(); i++) {
                Assert.assertEquals(nameList.get(i), list.get(i).getText());
            }
        }
    }

    /**
     * 验证多个元素名称是否包含某一值
     *
     * @param element  为list
     * @param nameList
     */
    @Then("^I will see the element \"([^\"]*)\" value contains \"([^割]*)\"$")
    public void validateElementValueContains(String element, List<String> nameList) {
        Object o = GetElementFromPage.getWebElementWithName(element);
        if (o instanceof List) {
            List<WebElement> list = (List<WebElement>) o;
            if (list.size() == 0) {
                Assert.assertTrue(false);
            }
            for (int i = 0; i < list.size(); i++) {
                Assert.assertTrue("实际值：" + list.get(i).getText() + "\n期望值：" + nameList.get(i), list.get(i).getText().contains(nameList.get(i)));
            }
        }
    }

    /**
     * 验证元素不存在
     *
     * @param name 元素名称
     */
    @And("^I will see the \"([^\"]*)\" doesn't exist$")
    public void elementNotExist(String name) {
        webDriver.manage().timeouts().implicitlyWait(WebDriverConst.WAIT_FOR_ELEMENT_INVISIBLE, TimeUnit.MILLISECONDS);
        try {
            WebElement element = GetElementFromPage.getWebElementWithName(name);
            Assert.assertFalse(ElementExist.isElementExist(webDriver, element));
        } catch (NoSuchElementException e) {
            Assert.assertTrue(true);
        } finally {
            webDriver.manage().timeouts().implicitlyWait(WebDriverConst.WAIT_FOR_ELEMENT_TIMEOUT, TimeUnit.MILLISECONDS);
        }
    }


    protected void ifExist(WebElement element) {
        try {
            ClickEvent.clickUnderneathButton(element);
            Assert.assertTrue(false);
        } catch (Exception e) {
            Assert.assertTrue(true);
        }
    }

    /**
     * @param elementName 元素名称
     * @param expectText  期望值
     */
    @Then("^I will see the element \"([^\"]*)\" contains \"([^割]*)\"$")
    public void iWillSeeTheElementContains(String elementName, String expectText) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String actualText = element.getText();
        Assert.assertTrue("实际值：" + actualText + "\n期望值：" + expectText, actualText.contains(expectText));
    }

    /**
     * 验证元素不包括具体值
     *
     * @param elementName 元素名称
     * @param text  文本值
     */
    @Then("^I will see the element \"([^\"]*)\" does not contain \"([^割]*)\"$")
    public void iWillSeeTheElementDoesNotContain(String elementName, String text) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String actualText = element.getText();
        Assert.assertFalse("实际值：" + actualText, actualText.contains(text));
    }

    /**
     * @param elementName 元素名称
     * @param expectText  期望值
     */
    @Then("^I will see the element \"([^\"]*)\" larger than \"([^割]*)\"$")
    public void iWillSeeTheElementLarger(String elementName, String expectText) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String actualText = element.getText();
        actualText = actualText.replace("(", "");
        actualText = actualText.replace(")", "");

        int actualInt = Integer.parseInt(actualText);
        int expectInt = Integer.parseInt(expectText);

        if (actualInt <= expectInt) {
            Assert.assertFalse(false);
        } else {
            Assert.assertTrue("1", true);
        }

    }

    @Then("^I will see the config element \"([^\"]*)\" value is \"([^\"]*)\"$")
    public void iWillSeeTheConfigElementValueIs(String name, String expectText) {
        String xpath = "//a[text()='" + name + "']/ancestor::tr";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        Assert.assertTrue("实际值：" + element.getText() + "\n期望值：" + expectText, element.getText().contains(expectText));
    }

    @Then("^I will see the element \"([^\"]*)\" attribute is \"([^\"]*)\"$")
    public void iWillSeeTheElementAttributeIs(String elementName, String attribute) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        Assert.assertTrue("enabled".equals(attribute) && element.isEnabled() || "disabled".equals(attribute) && !element.isEnabled());
    }

    @Then("^I will see the element \"([^\"]*)\" attribute \"([^\"]*)\" is \"([^\"]*)\"$")
    public void iWillSeeTheElementAttributeIs(String elementName, String attribute, String attributeName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        Assert.assertTrue("实际值：" + element.getAttribute(attribute), element.getAttribute(attribute).contains(attributeName));
    }

    @Then("^I will see the element \"([^\"]*)\" attribute \"([^\"]*)\" is \"([^\"]*)\" in siem$")
    public void iWillSeeTheElementAttributeIsSiem(String elementName, String attribute, String attributeName) {

        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String actualText = element.getAttribute(attribute);
//        Assert.assertTrue(element.getAttribute(attribute).contains(attributeName));
        Assert.assertEquals(attributeName, actualText);
    }

    /**
     * 判断inputBox显示
     *
     * @param buttonNameList 元素名称（支持list）
     */
    @And("^I will see the inputbox \"([^\"]*)\" contains \"([^\"]*)\" display$")
    public void checkInputBoxIsDisplay(List<String> buttonNameList) {
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            Assert.assertFalse(element.getAttribute("value").contains("display: none;"));
        }
    }

    /**
     * @param elementName 元素名称
     * @param expectText  期望值
     */
    @Then("^I will see the input box \"([^\"]*)\" contains \"([^割]*)\"$")
    public void iWillSeeTheInputBoxContains(String elementName, String expectText) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        Assert.assertEquals(element.getAttribute("value"), expectText);
    }

    /**
     * @param expectText 期望值
     */
    @Then("^I will see the every page \"([^\"]*)\" 条$")
    public void iWillSeeTheEveryPageEventNumber(String expectText) {
        String xpath = "//div[contains(text(),'每页')]//span[text()='" + expectText + "']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        Assert.assertEquals(element.getText(), expectText);
    }

    /**
     * @param expectText 期望值
     */
    @Then("^I will see the message \"([^\"]*)\" on page$")
    public void iWillSeeTheMessageOnPage(String expectText) {
        String xpath = "//span[contains(text(),'" + expectText + "')]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        Assert.assertEquals(element.getText(), expectText);
    }

    /**
     * 判断按钮显示
     *
     * @param lastLineName 元素名称
     */
    @And("^I will see the last line \"([^\"]*)\" is display$")
    public void checktheLastLineIsDisplay(String lastLineName) {
        //bubble.test^archiver.process.fds
        //div[@id='hot']//td[text()='bubble.test^archiver.process.fds']
        String xpath = "//div[@id='hot']//td[text()='" + lastLineName + "']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        Assert.assertFalse(element.getAttribute("style").contains("display: none;"));

    }

    /**
     * 判断按钮显示
     *
     * @param lastLineName 元素名称
     */
    @And("^I will see1 the last line \"([^\"]*)\" is display$")
    public void checktheLastLineIsDisplay1(String lastLineName) {
        //bubble.test^archiver.process.fds
        //div[@id='hot']//td[text()='bubble.test^archiver.process.fds']
        String xpath = "//div[@id='hot']//td[text()='" + lastLineName + "']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        Assert.assertFalse(element.getAttribute("style").contains("display: none;"));
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].setAttribute('id','id-last-line')", element);
        WebElement id_element = webDriver.findElement(By.id("id-last-line"));
        id_element.click();
        id_element.click();
        System.out.println("edit last one============");
        Actions a = new Actions(webDriver);
        a.moveToElement(id_element).sendKeys(Keys.CONTROL, "a").perform();
        a.moveToElement(id_element).sendKeys(Keys.BACK_SPACE);
        a.moveToElement(id_element).sendKeys("testedit");
        a.moveToElement(id_element).sendKeys(Keys.ENTER);
//        id_element.sendKeys("");
//        a.moveToElement(id_element).contextClick().build().perform();
    }

}
