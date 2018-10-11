package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class MaintenancePage extends PageTemplate {
    public MaintenancePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//input[@placeholder='开始时间']")
    private WebElement startTime;

    @FindBy(xpath = "//input[@placeholder='结束时间']")
    private WebElement endTime;

    @FindBy(xpath = "(//a[text()='此刻'])[last()]")
    private WebElement rightNow;

    @FindBy(xpath = "//input[@placeholder='选择时间']")
    private WebElement timeInput;

    public WebElement getTimeInput() {
        return timeInput;
    }

    public WebElement getEndTime() {
        return endTime;
    }

    public WebElement getRightNow() {
        return rightNow;
    }

    public WebElement getStartTime() {
        return startTime;
    }

    public WebElement getCreate() {
        return super.getButton("新建");
    }

    public WebElement getReason() {
        return super.getInputElement("维护原因");
    }

    public WebElement getGroup() {
        return super.getDropdownList("影响涉及范围");
    }
}
