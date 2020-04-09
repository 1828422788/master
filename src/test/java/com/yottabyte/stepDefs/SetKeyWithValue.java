package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.Agent;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.*;


public class SetKeyWithValue {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 为指定变量elementName赋值 elementName需要与page中的getElement方法名一致，可以省略get
     *
     * @param elementName 元素名称
     * @param value       输入的值
     */
    @And("^I set the parameter \"([^\"]*)\" with value \"([^割]*)\"$")
    public void iSetTheParameterWithValue(String elementName, String value) {
        if (elementName != null && elementName.trim().length() != 0) {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            if (element.getAttribute("class").contains("CodeMirror")) {
                WebElement element1 = webDriver.findElement(By.className("CodeMirror"));
                JavascriptExecutor js = (JavascriptExecutor) webDriver;
                js.executeScript("arguments[0].CodeMirror.setValue(\"" + value + "\");", element1);
            } else {
                iSetTheParameterWithValue(element, value);
            }
        }
    }

    /**
     * 在agent中使用，自动输入运行中Agent的ip，只需定位输入框即可
     *
     * @param elementName 输入框元素名称
     */
    @And("^I set the agent parameter \"([^\"]*)\" with running ip$")
    public void setParamInAgent(String elementName) {
        Agent agent = new Agent();
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String ip = agent.getIp();
        Assert.assertNotNull("无正在运行中的Agent！", ip);
        iSetTheParameterWithValue(element, ip);
    }

    /**
     * 给搜索框传值
     *
     * @param name 搜索内容
     */
    @Then("^I set the search input with \"([^\"]*)\"$")
    public void setSearchInput(String name) {
        WebElement searchInput = webDriver.findElement(By.xpath("//div[@class='yw-table-group__basic el-input']/input"));
        searchInput.sendKeys(name);
    }


    public void clearElementValue(WebElement element) {
        element.sendKeys(Keys.END);
        element.sendKeys(Keys.SHIFT, Keys.HOME);
        element.sendKeys(Keys.BACK_SPACE);
    }

    public void iSetTheParameterWithValue(WebElement element, String value) {
        boolean flag = true;
        while (flag) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            element.click();
            //element.sendKeys(Keys.CONTROL + "a");
//            element.sendKeys(Keys.END);
//            element.sendKeys(Keys.SHIFT, Keys.HOME);
//            element.sendKeys(Keys.BACK_SPACE);
            element.clear();
//            if (element.getText().equalsIgnoreCase("")) {
                flag = false;
//            }
        }
        element.sendKeys(value);
    }

    @And("^I set the parameter \"([^\"]*)\" with properties \"([^\"]*)\"$")
    public void iSetTheParameterWithProperties(String element, String properties) {
        ConfigManager config = new ConfigManager();
        String property = config.get(properties);
        this.iSetTheParameterWithValue(element, property);
    }

    @And("^I set the parameter \"([^割]*)\" to json editor$")
    public void iSetTheParameterToJsonEditor(String value) {
        WebElement element = webDriver.findElement(By.xpath("(//*[@class='ace_text-input'])[last()]"));
//        webDriver.findElement(By.id("jsoneditor")).click();
        if (System.getProperty("os.name").startsWith("Linux"))
            element.sendKeys(Keys.CONTROL, "a");
        else
            element.sendKeys(Keys.COMMAND, "a");
        element.sendKeys(Keys.DELETE);
        element.sendKeys(value);
    }

    @And("^I set the parameter \"([^割]*)\" to json editor in field parsing$")
    public void iSetTheParameterToJsonEditorNotClick(String value) {
        WebElement element = webDriver.findElement(By.xpath("(//*[@class='ace_text-input'])[last()]"));
        if (System.getProperty("os.name").startsWith("Linux"))
            element.sendKeys(Keys.CONTROL, "a");
        else
            element.sendKeys(Keys.COMMAND, "a");
        element.sendKeys(Keys.DELETE);
        element.sendKeys(value);
    }

    @And("^I set the value \"([^割]*)\" to the textarea \"([^\"]*)\"$")
    public void iSetTheValueToTextarea(String value, String elementName) {
        if (elementName != null && elementName.trim().length() != 0) {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            if (element.getAttribute("class").contains("CodeMirror")) {
                WebElement element1 = webDriver.findElement(By.className("CodeMirror"));
                JavascriptExecutor js = (JavascriptExecutor) webDriver;
                js.executeScript("arguments[0].CodeMirror.setValue(\"" + value + "\");", element1);
            } else {
                iSetTheValueToTextarea(element, value);
            }
        }
    }

    private void iSetTheValueToTextarea(WebElement element, String value) {
        boolean flag = true;
        while (flag) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            element.click();
            element.sendKeys(Keys.CONTROL + "a");
            element.sendKeys(Keys.END);
            element.sendKeys(Keys.SHIFT, Keys.HOME);
            element.sendKeys(Keys.BACK_SPACE);
            if (element.getText().equalsIgnoreCase("")) {
                flag = false;
            }
        }
        element.sendKeys(value);
    }
}
