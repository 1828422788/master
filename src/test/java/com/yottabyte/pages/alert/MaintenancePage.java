package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

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

    @FindBy(xpath = "(//input[@placeholder='选择时间'])[last()]")
    private WebElement timeInput;

    @FindBy(xpath = "(//button[@class='el-picker-panel__btn'])[last()]")
    private WebElement ensureButton;

    @FindBy(className = "available")
    private WebElement available;

    @FindBy(xpath = "//input[@placeholder='输入维护原因']")
    private WebElement searchReason;

    @FindBy(xpath = "//span[text()='单次']")
    private WebElement single;

    @FindBy(xpath = "//span[text()='AutoTestRoleWithAllResource']/ancestor::li")
    private WebElement disabledLi;

    public WebElement getDisabledLi() {
        return disabledLi;
    }

    public WebElement getSingle() {
        return single;
    }

    public WebElement getReturnToAlertPage() {
        return super.getButton("返回监控首页");
    }

    public WebElement getEnsureDelete() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSearchReason() {
        return searchReason;
    }

    public WebElement getAvailable() {
        return available;
    }

    public WebElement getSaveButton() {
        return super.getContainsTextButton("保存");
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getTimeInput() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(timeInput));
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

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }
}
