package com.yottabyte.stepDefs;

import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.Map;

/**
 * @author sunxj
 */
public class CheckButtonAttribute {

    /**
     * 检查元素是否有某属性
     *
     * @param buttonNameList
     * @param attribute
     */
    @Then("^I will see the \"([^\"]*)\" is \"([^\"]*)\"$")
    public void checkClass(List<String> buttonNameList, String attribute) {
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            Assert.assertTrue(element.getAttribute("class").contains(attribute));
        }
    }


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
     * @param buttonNameList
     */
    @And("^I will see the \"([^\"]*)\" is display$")
    public void checkIsDisplay(List<String> buttonNameList) {
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            Assert.assertFalse(element.getAttribute("style").contains("display: none;"));
        }
    }

    /**
     * 判断按钮不显示
     *
     * @param webElement
     */
    public static void checkIsDisplay(WebElement webElement) {
        Assert.assertTrue(webElement.getAttribute("style").contains("display: none;"));
    }

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
     * 验证元素名称是否正确
     *
     * @param buttonNameList
     * @param expectButtonName
     */
    @Then("^I will see the element \"([^\"]*)\" name is \"([^割]*)\"$")
    public void checkElementName(List<String> buttonNameList, List<String> expectButtonName) {
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
     * 验证元素名称是否正确（传入json格式的参数，目的是避免检验值中出现逗号给分割成另一个参数）
     *
     * @param jsonString
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
}
