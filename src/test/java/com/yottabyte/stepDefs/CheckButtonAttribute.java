package com.yottabyte.stepDefs;

import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

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

    @And("^I will see the \"([^\"]*)\" is display$")
    public void checkIsDisplay(List<String> buttonNameList) {
        for (String buttonName : buttonNameList) {
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            Assert.assertFalse(element.getAttribute("style").contains("display: none;"));
        }
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

        for (int i = 0; i < buttonNameList.size(); i++) {
            String buttonName = buttonNameList.get(i);
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            String actualText = element.getText();
            String expectText = expectButtonName.get(i);
            Assert.assertEquals(expectText, actualText);
        }
    }
}
