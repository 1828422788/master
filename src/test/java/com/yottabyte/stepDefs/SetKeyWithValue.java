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

import java.awt.*;
import java.awt.event.KeyEvent;
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
     * 选中文本（搜索页）
     *
     * @param start 起始位置
     * @param end 结束位置
     */
    @When("^I select the string from \"([^\"]*)\" to \"([^\"]*)\" in search box$")
    public void selectTheButtonWithText(Integer start, Integer end) {
        WebElement element1 = webDriver.findElement(By.className("CodeMirror"));
        JavascriptExecutor js = (JavascriptExecutor) webDriver;
        js.executeScript("arguments[0].CodeMirror.setSelection({line:0,ch:arguments[1]},{line:0,ch:arguments[2]});", element1, start, end);
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
     * 在定时任务中使用，将执行时间设置为当前时间后addMinutes分钟
     * @param timeElement 输入框时间元素名称
     */
    @And("^I set the time parameter \"([^\"]*)\" as \"([^\"]*)\" minutes later from now$")
    public void setTimeParamAsFewMinLater(String timeElement, int addMinutes) {
        WebElement elementTime = GetElementFromPage.getWebElementWithName(timeElement);
        int hours = LocalDateTime.now().getHour();
        int minutes = LocalDateTime.now().getMinute() + addMinutes;
        int seconds = LocalDateTime.now().getSecond();
        if (minutes > 59) {
            minutes = minutes % 60;
            hours = hours + 1;
        }
        if (hours > 23) {
            hours = 0;
        }
        String hours_str=Integer.toString(hours), minutes_str=Integer.toString(minutes), seconds_str=Integer.toString(seconds);
        if (hours<10)
            hours_str = "0" + hours;
        if (minutes<10)
            minutes_str = "0" + minutes;
        if (seconds<10)
            seconds_str = "0" + seconds;
        iSetTheParameterWithValue(elementTime, hours_str + ":" + minutes_str + ":" + seconds_str);
        elementTime.click();
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
//        element.click();
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
        if (System.getProperty("os.name").startsWith("Linux") || System.getProperty("os.name").startsWith("Windows"))
            element.sendKeys(Keys.CONTROL, "a");
        else
            element.sendKeys(Keys.COMMAND, "a");
        element.sendKeys(Keys.BACK_SPACE);
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

    @And("^I select all text in \"([^\"]*)\" element$")
    public void iSelectText(String textarea) {
        WebElement element = GetElementFromPage.getWebElementWithName(textarea);
        selectTextInElement(element);
    }

    @And("^I select all text in \"([^\"]*)\" alert element$")
    public void iSelectAlertText(String textarea) {
        WebElement element = GetElementFromPage.getWebElementWithName(textarea);
        selectTextInAlertElement(element);
        element.sendKeys(Keys.END);
        element.sendKeys(Keys.BACK_SPACE);
    }

    @And("^I select all text in row \"([^\"]*)\" and column \"([^\"]*)\" of the table in word report$")
    public void iSelectTextCell(String row, String column) {
        String xpath = "//tr[" + row + "]/td[" + column + "]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        selectTextInElement(element);
    }

    public void selectTextInElement(WebElement element) {
        String jScript = "var node = arguments[0];\n" +
                "\n" +
                "        if ( document.selection ) {\n" +
                "            var range = document.body.createTextRange();\n" +
                "            range.moveToElementText( node  );\n" +
                "            range.select();\n" +
                "        } else if ( window.getSelection ) {\n" +
                "            var range = document.createRange();\n" +
                "            range.selectNodeContents( node );\n" +
                "            window.getSelection().removeAllRanges();\n" +
                "            window.getSelection().addRange( range );\n" +
                "        }";
        JavascriptExecutor executor = (JavascriptExecutor)webDriver;
        executor.executeScript(jScript, element);
    }

    public void selectTextInAlertElement(WebElement element) {
        String jScript = "var node = arguments[0];\n" +
                "\n" +
                "        if ( document.selection ) {\n" +
                "            var range = document.body.createTextRange();\n" +
                "            range.moveToElementText( node  );\n" +
                "            range.select();\n" +
                "        } else if ( window.getSelection ) {\n" +
                "            var range = document.createRange();\n" +
                "            range.selectNodeContents( node );\n" +
                "            window.getSelection().removeAllRanges();\n" +
                "            window.getSelection().addRange( range );\n" +
                "        }";
        JavascriptExecutor executor = (JavascriptExecutor)webDriver;
        executor.executeScript(jScript, element);
    }

    @And("^I set the parameter \"([^\"]*)\" with value \"([^割]*)\" in word report$")
    public void iSetParameterWithValue(String elementName, String value){
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String jScript = "arguments[0].innerHTML=\"" + value + "\";";
        JavascriptExecutor executor = (JavascriptExecutor)webDriver;
        executor.executeScript(jScript, element);
    }

    @And("^I set the table cell in row \"([^\"]*)\" and column \"([^\"]*)\" with value \"([^割]*)\" in word report$")
    public void iSetTableCellWithValue(String row, String column, String value){
        String xpath = "//tr[" + row + "]/td[" + column + "]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        String jScript = "arguments[0].innerHTML=\"" + value + "\";";
        JavascriptExecutor executor = (JavascriptExecutor)webDriver;
        executor.executeScript(jScript, element);
    }

    @And("^I set the parameter \"([^\"]*)\" with value \"([^割]*)\" and press enter in word report$")
    public void iSetTheParameterWithValueEnter(String elementName, String value) {
        if (elementName != null && elementName.trim().length() != 0) {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            if (element.getTagName().equals("div")) {
                element.click();
                element.sendKeys(Keys.CONTROL + "a");
                element.sendKeys(Keys.END);
                element.sendKeys(Keys.SHIFT, Keys.HOME);
                element.sendKeys(Keys.BACK_SPACE);
                element.clear();
                element.sendKeys(value);
                element.sendKeys(Keys.ENTER);
            } else {
                String jScript = "arguments[0].innerHTML=\"" + value + "</br>\"; \n" +
                        "var par = document.createElement('p'); \n" +
                        "arguments[0].parentNode.insertBefore(par, arguments[0].nextSibling);";
                JavascriptExecutor executor = (JavascriptExecutor)webDriver;
                executor.executeScript(jScript, element);
            }
        }
    }

    @And("^I set the parameter \"([^\"]*)\" with value \"([^割]*)\" and press enter$")
    public void iSetTheParameterWithValuePressEnter(String elementName, String value) {
        if (elementName != null && elementName.trim().length() != 0) {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            element.click();
            WebElement inputElement = webDriver.findElement(By.xpath("//input[contains(@class,'yotta-tag')]"));
            inputElement.sendKeys(value);
            inputElement.sendKeys(Keys.ENTER);
        }
    }

    @And("^I set the parameter \"([^\"]*)\" with link \"([^割]*)\" for current environment$")
    public void iSetTheParameterWithLink(String elementName, String value) {
        if (elementName != null && elementName.trim().length() != 0) {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            ConfigManager config = new ConfigManager();
            String host = config.get("rizhiyi_server_host").split("@")[0];
            element.click();
            element.sendKeys(Keys.CONTROL + "a");
            element.sendKeys(Keys.END);
            element.sendKeys(Keys.SHIFT, Keys.HOME);
            element.sendKeys(Keys.BACK_SPACE);
            element.sendKeys("http://" + host + "/" + value);
        }
    }

    @And("^I press the parameter \"([^\"]*)\" with enter$")
    public void iPressTheParameterWithEnter(String elementName) {
        if (elementName != null && elementName.trim().length() != 0) {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            element.sendKeys(Keys.ENTER);
        }
    }

    /**
     * 模拟用户在文本框中键入Backspace
     * 运行这个操作后，在搜索页上可以显示《搜索历史》按钮
     *
     * @param elementName 元素名称
     */

    @And("^I simulate typing in \"([^\"]*)\"$")
    public void iSimulateTyping(String elementName) throws AWTException {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        element.click();
        Robot robot = new Robot();
        robot.keyPress(KeyEvent.VK_BACK_SPACE);
        robot.keyRelease(KeyEvent.VK_BACK_SPACE);
    }

    @And("^I set the parameter \"([^\"]*)\" with value \"([^割]*)\" using step buttons$")
    public void iSetTheParameterWithValueByStep(String elementName, String value) {
        if (elementName != null && elementName.trim().length() != 0) {
            float new_value = Float.parseFloat(value);
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            float element_value = Float.parseFloat(element.getAttribute("value"));
            WebElement stepUp = element.findElement(By.xpath(".//following-sibling::span/span[contains(@class,'increase')]"));
            WebElement stepDown = element.findElement(By.xpath(".//following-sibling::span/span[contains(@class,'decrease')]"));
            stepUp.click();
            float step = Float.parseFloat(element.getAttribute("value")) - element_value;
            stepDown.click();
            int times = (int)((new_value - element_value) / step);
            times = (times < 0) ? -times : times;
            for(int i=0; i < times ; i++){
               if (new_value > element_value) {
                   stepUp.click();
               } else if (new_value < element_value) {
                   stepDown.click();
               } else if (new_value == element_value) {
                   break;
               }
               element_value = Float.parseFloat(element.getAttribute("value"));
            }
        }
    }
}
