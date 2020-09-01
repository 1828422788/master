package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import gherkin.lexer.Da;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 时间控件的相关操作
 */
public class SetTime {
    private String date;

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
     * 输入当前时间后的若干分钟，返回格式为yyyy-MM-dd HH:mm:ss
     *
     * @param elementName 元素名称
     * @param time        分钟数（整数）
     */
    @And("^I set the time input \"([^\"]*)\" to \"([^\"]*)\" minutes later$")
    public void iSetTheTimeInputToMinutesLater(String elementName, String time) {
        int minutes = Integer.parseInt(time);
        long minutesLater = System.currentTimeMillis() + minutes * 60 * 1000;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String laterTime = format.format(new Date(minutesLater));
        WebElement inputElement = GetElementFromPage.getWebElementWithName(elementName);
        new SetKeyWithValue().iSetTheParameterWithValue(inputElement, laterTime);
    }

    /**
     * 输入当前时间的若干天前
     *
     * @param elementName 元素名称
     * @param time        天数
     */
    @And("^I set the time input \"([^\"]*)\" to \"([^\"]*)\" days ago$")
    public void iSetTheTimeInputToMinutesAgo(String elementName, String time) {
        int days = Integer.parseInt(time);
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.DATE, -days);
        Date d = c.getTime();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date = format.format(d);
        WebElement inputElement = GetElementFromPage.getWebElementWithName(elementName);
        new SetKeyWithValue().iSetTheParameterWithValue(inputElement, date);
    }

    /**
     * 设置时间范围为yyyy-MM-dd HH:mm:ss 至 yyyy-MM-dd HH:mm:ss
     *
     * @param elementName 元素名称
     * @param time
     */
    @And("^I set the time input \"([^\"]*)\" to a range in recent \"([^\"]*)\"$")
    public void iSetTheTimeInputToARangeInRecentDays(String elementName, String time) {
        Date d = this.getTime(time);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = format.format(d);
        String currentDate = format.format(new Date());
        WebElement inputElement = GetElementFromPage.getWebElementWithName(elementName);
        new SetKeyWithValue().iSetTheParameterWithValue(inputElement, date + " 至 " + currentDate);
    }

    /**
     * 设置时间为当天某时至某时
     *
     * @param elementName 元素名称
     * @param begin       起始时间
     * @param end         终止时间
     */
    @And("^I set the time input \"([^\"]*)\" between \"([^\"]*)\" and \"([^\"]*)\" at someday")
    public void iSetTheTimeInputBetweenAndAtToday(String elementName, String begin, String end) {
        Date startDate = this.getDate(begin);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String start = format.format(startDate);
        String beginDate = start + " " + date;
        String endDay = format.format(this.getDate(end));
        String endDate = endDay + " " + date;
        WebElement inputElement = GetElementFromPage.getWebElementWithName(elementName);
        new SetKeyWithValue().iSetTheParameterWithValue(inputElement, beginDate + " 至 " + endDate);
    }

    private Date getDate(String date) {
        this.date = date;
        if (date.contains(" ")) {
            String time = date.split(" ")[0];
            this.date = date.split(" ")[1];
            return this.getTime(time);
        }
        return new Date();
    }

    private Date getTime(String time) {
        String unit = time.substring(time.length() - 1);
        time = time.substring(0, time.length() - 1);
        int days = Integer.parseInt(time);
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        switch (unit) {
            case "d":
                c.add(Calendar.DATE, -days);
                break;
            case "m":
                c.add(Calendar.MONTH, -days);
                break;
            case "y":
                c.add(Calendar.YEAR, -days);
        }
        Date d = c.getTime();
        return d;
    }
}
