package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class SetTime {

    /**
     * 时分秒的时间控件
     *
     * @param time 用冒号分割
     */
    @Then("^I set the \"([^\"]*)\" with \"([^\"]*)\"$")
    public void setTimeWithValue(String webElement, String time) {
        WebElement button = GetElementFromPage.getWebElementWithName(webElement);
        button.click();
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        List<WebElement> elements = webDriver.findElements(By.xpath("//ul[@class='el-scrollbar__view el-time-spinner__list']"));
        // 点击相匹配的时间
        for (int i = 0; i < elements.size(); i++) {
            for (WebElement text : elements.get(i).findElements(By.tagName("li"))) {
                if (text.getText().equals(time.split(":")[i])) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", text);
                    text.click();
                    break;
                }
            }
        }
        webDriver.findElement(By.xpath("//button[@class='el-time-panel__btn confirm']")).click();
    }

    /**
     * 输入当前时间后的若干分钟，格式为HH:mm:ss
     *
     * @param elementName
     * @param time
     */
    @And("^I set the time input \"([^\"]*)\" to \"([^\"]*)\" minutes later$")
    public void iSetTheTimeInputToMinutesLater(String elementName, String time) {
        int minutes = Integer.parseInt(time);
        long minutesLater = System.currentTimeMillis() + minutes * 60 * 1000;
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        String laterTime = format.format(new Date(minutesLater));
        WebElement inputElement = GetElementFromPage.getWebElementWithName(elementName);
        new SetKeyWithValue().iSetTheParameterWithValue(inputElement, laterTime);
    }
}
