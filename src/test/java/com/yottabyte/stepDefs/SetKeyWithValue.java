package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.Agent;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.*;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;


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
     * 双击（搜索页）
     *
     * @param
     */
    @When("^I select the 'sample04061424_chart' on search box$")
    public void selectTheButtonWithText() {
        WebElement element1 = webDriver.findElement(By.className("CodeMirror"));
        JavascriptExecutor js = (JavascriptExecutor) webDriver;
        js.executeScript("arguments[0].CodeMirror.setSelection({line:0,ch:0},{line:0,ch:20});", element1);
    }

    /**
     * 在agent中使用，自动输入运行中Agent的ip，只需定位输入框即可
     *
     * @param elementName 输入框元素名称
     */
    @And("^I set the agent parameter \"([^\"]*)\" with running ip in beats$")
    public void setParamInAgentBeat(String elementName) {
        Agent agent = new Agent();
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String ip = agent.getIp();
        Assert.assertNotNull("无正在运行中的Agent！", ip);
        String dataName = ip +":"+"299";
        iSetTheParameterWithValue(element, dataName);
    }

    @And("^I set the agent parameter \"([^\"]*)\" with running ip$")
    public void setParamInAgent(String elementName) {
        Agent agent = new Agent();
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String ip = agent.getIp();
        Assert.assertNotNull("无正在运行中的Agent！", ip);
//        String dataName = ip ;
        iSetTheParameterWithValue(element, ip);
    }


    /**
     * 为指定变量elementName赋值当前日期
     *
     * @param elementName 输入框元素名称
     */
    @And("^I set the parameter \"([^\"]*)\" with current date$")
    public void setParamWithCurrentDate(String elementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis());
        String current_date = formatter.format(date);
        iSetTheParameterWithValue(element, current_date);
    }

    /**
     * 为指定变量elementName赋值昨天日期
     *
     * @param elementName 输入框元素名称
     */
    @And("^I set the parameter \"([^\"]*)\" with yesterday date$")
    public void setParamWithYesterdayDate(String elementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(System.currentTimeMillis()-24*60*60*1000);
        String current_date = formatter.format(date);
        iSetTheParameterWithValue(element, current_date);
    }

    /**
     * 在report中使用，将执行时间设置为当前时间后addMinutes分钟
     * @param hourElement 输入框小时元素名称
     * @param minuteElement 输入框分钟元素名称
     */
    @And("^I set the parameters \"([^\"]*)\" and \"([^\"]*)\" as \"([^\"]*)\" minutes later from now$")
    public void seParamWithAsFewMinLater(String hourElement, String minuteElement, int addMinutes) {
        WebElement elementHour = GetElementFromPage.getWebElementWithName(hourElement);
        WebElement elementMinute = GetElementFromPage.getWebElementWithName(minuteElement);
        int hours = LocalDateTime.now().getHour();
        int minutes = LocalDateTime.now().getMinute() + addMinutes;
        if (minutes > 59) {
            minutes = minutes % 60;
            hours = hours + 1;
        }
        if (hours > 23) {
            hours = 0;
        }
        iSetTheParameterWithValue(elementHour, Integer.toString(hours));
        iSetTheParameterWithValue(elementMinute, Integer.toString(minutes));
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
        int times = 0;
        sendKeys(element, value);
        // 富文本框获取到的value为空，这里不会再次尝试输入
        while (element.getAttribute("value") != null && !element.getAttribute("value").equals(value) && times < 11) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            sendKeys(element, value);
            System.out.println(times);
            times++;
        }
    }

    private void sendKeys(WebElement element, String value) {
        element.click();
        element.sendKeys(Keys.CONTROL + "a");
            element.sendKeys(Keys.END);
            element.sendKeys(Keys.SHIFT, Keys.HOME);
            element.sendKeys(Keys.BACK_SPACE);
        element.clear();
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
