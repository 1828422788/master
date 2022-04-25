package com.yottabyte.pages.users;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ElementExist;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class UsagePage extends EditorPage {

    public UsagePage(WebDriver driver) {
        super(driver);
    }

    //@FindBy(className = "yotta-date-time-picker _3AVFjVc8g_ieExovtGZpmq")
    @FindBy(xpath = "//span[@class='yotta-date-time-picker-text yotta-date-time-picker-empty']")
    private WebElement dateButton;

    @FindBy(xpath = "//div[@yotta-test='date_time_picker-start_date-date_picker']//input[@class='yotta-date-picker-date']")
    private WebElement startData;

    private WebElement startTime;

    @FindBy(xpath = "//div[@yotta-test='date_time_picker-end_date-date_picker']//input[@class='yotta-date-picker-date']")
    private WebElement endData;

    private WebElement endTime;

    @FindBy(xpath = "//span[text()='应用']/parent::button")
    private WebElement confirm;

    @FindBy(xpath = "//span[text()='查询']/parent::button")
    private WebElement searchButton;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(className = "yotta-message-content")
    private WebElement suspensionMessage;


    public WebElement getDateButton() {
        return dateButton;
    }

    public WebElement getStartData() {
        return startData;
    }

    public WebElement getStartTime() { return  getYottaCheckbox("date_time_picker-start_time-input"); }

    public WebElement getEndData() {
        return endData;
    }

    public WebElement getEndTime() {
        return getYottaCheckbox("date_time_picker-end_time-input"); }

    public WebElement getConfirm() {
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].blur();", getEndData());  //让结束日期失去焦点
        return confirm;
    }

    public WebElement getSearchButton() {
        return searchButton;
    }

    public WebElement getErrorMessage(){
        try {
            if (ElementExist.isElementExist(webDriver,suspensionMessage)) {
                return suspensionMessage;
            }else {
                return message;
            }
        }catch (NullPointerException e) {
            e.printStackTrace();
        }
        return null;
    }

}
