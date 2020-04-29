package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.Agent;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

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
        if (buttonNameList.size() == 1) {
            Object element = GetElementFromPage.getWebElementWithName(buttonNameList.get(0));
            if (element instanceof List) {
                List<WebElement> elements = (List<WebElement>) element;
                for (WebElement webElement : elements) {
                    Assert.assertTrue(webElement.getAttribute("class").contains(attribute));
                }
                return;
            }
        }
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            Assert.assertTrue(element.getAttribute("class").contains(attribute));
        }
    }

    /**
     * 检查元素style是否包含某值
     *
     * @param buttonNameList 元素名称（支持list）
     * @param attribute      属性值
     */
    @Then("^I will see the element \"([^\"]*)\" style contains \"([^\"]*)\"$")
    public void checkStyle(List<String> buttonNameList, String attribute) {
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            String actualStyle = element.getAttribute("style");
            Assert.assertTrue("style实际值：" + actualStyle, actualStyle.contains(attribute));
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
        if (name.startsWith("get")) {
            name = name.split("get")[1];
        }
        if (Character.isLowerCase(name.charAt(0))) {
            System.out.println("\n Wanning: name is " + name + " , might be UpperCase in the first! \n");
            name = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
        } else {
            name = "get" + name;
        }
        Object page = LoginBeforeAllTests.getPageFactory();
        Method method;
        try {
            Object object = page.getClass().getDeclaredMethod(name).invoke(page);
            method = page.getClass().getDeclaredMethod(name);
            WebElement element = (WebElement) object;
            this.ifExist(element);
        } catch (Exception e) {
            method = null;
        }
        if (method == null) {
            try {
                method = page.getClass().getSuperclass().getDeclaredMethod(name);
                Object object = method.invoke(page);
                this.ifExist((WebElement) object);
            } catch (Exception e) {
                Assert.assertTrue(true);
            }
        }
    }

    @And("^I will see the agent doesn't exist in \"([^\"]*)\" cloumn$")
    public void AgentelementNotExist(String columnNum) {
        Agent agent = new Agent();
        String ip = agent.getIp();
        Assert.assertNotNull("无正在运行的agent！", ip);
        String name = "{'column':'" + columnNum + "','name':'" + ip + "'}";
        if (name.startsWith("get")) {
            name = name.split("get")[1];
        }
        if (Character.isLowerCase(name.charAt(0))) {
            System.out.println("\n Wanning: name is " + name + " , might be UpperCase in the first! \n");
            name = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
        } else {
            name = "get" + name;
        }
        Object page = LoginBeforeAllTests.getPageFactory();
        Method method;
        try {
            Object object = page.getClass().getDeclaredMethod(name).invoke(page);
            method = page.getClass().getDeclaredMethod(name);
            WebElement element = (WebElement) object;
            this.ifExist(element);
        } catch (Exception e) {
            method = null;
        }
        if (method == null) {
            try {
                method = page.getClass().getSuperclass().getDeclaredMethod(name);
                Object object = method.invoke(page);
                this.ifExist((WebElement) object);
            } catch (Exception e) {
                Assert.assertTrue(true);
            }
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

    @Then("^I will see the element \"([^\"]*)\" contains \"([^割]*)\"$")
    public void iWillSeeTheElementContains(String elementName, String expectText) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String actualText = element.getText();
        Assert.assertTrue("实际值：" + actualText + "\n期望值：" + expectText, actualText.contains(expectText));
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
}
