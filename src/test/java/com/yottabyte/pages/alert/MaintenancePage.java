package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
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
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement reasonNameSearchInput;

    public WebElement getReasonNameSearchInput() {
        return reasonNameSearchInput;
    }

    @FindBy(xpath = "//span[text()='新建']/parent::button")
    private WebElement createButton;

    public WebElement getCreateButton() {
        return createButton;
    }

    @FindBy(xpath = "//span[text()='维护原因']/following::input[@placeholder='请输入维护原因']")
    private WebElement maintainReason;

    public WebElement getMaintainReason() {
        return maintainReason;
    }

    @FindBy(xpath = "//div/a[text()='请选择']")
    private WebElement chooseAlertButton;

    public WebElement getChooseAlertButton() {
        return chooseAlertButton;
    }

    @FindBy(xpath = "//div[text()='影响范围']/following::input[@placeholder='请输入关键字']")
    private WebElement alertNameSearchInput;

    public WebElement getAlertNameSearchInput() {
        return alertNameSearchInput;
    }

    @FindBy(xpath = "//p[contains(text(),'已选中')]/following::input[@placeholder='请输入关键字']/following-sibling::span/i")
    private WebElement alertNameSearchIcon;

    public WebElement getAlertNameSearchIcon() {
        return alertNameSearchIcon;
    }

    @FindBy(xpath = "//label[@class='P6t_i2gGWUIWPSCJcrPhU css-re7vk9 ant-checkbox-wrapper']")
    private WebElement alertNameBody;

    public WebElement getAlertNameBody() {
        return alertNameBody;
    }

    @FindBy(xpath = "//p[contains(text(),'已选中')]/following::span/input[@class='ant-checkbox-input']/following-sibling::span")
    private WebElement alertNameCheckbox;

    public WebElement getAlertNameCheckbox() {
        return alertNameCheckbox;
    }

    @FindBy(xpath = "//span[text()='确 定']/parent::button")
    private WebElement alertNameEnsure;

    public WebElement getAlertNameEnsure() {
        return alertNameEnsure;
    }

    @FindBy(xpath = "//span[text()='维护原因']")
    private WebElement beginTimeLabel;

    public WebElement getBeginTimeLabel() {
        return beginTimeLabel;
    }

    public WebElement getBeginWeeklyDayList() {
        String xpath = "//span[text()='开始时间']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getEndWeeklyDayList() {
        String xpath = "//span[text()='结束时间']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getMaintainBeginTimeList() {
      String xpath = "//span[text()='开始时间']/following::div/span/input[@placeholder='请选择']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getMaintainTimeDropdownList();
    }

    public WebElement getMaintainEndTimeList() {
        String xpath = "//span[text()='结束时间']/following::div/span/input[@placeholder='请选择']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getMaintainTimeDropdownList();
    }

    @FindBy(xpath = "//span[text()='单次']/parent::label")
    private WebElement singleButton;

    public WebElement getSingleButton() {
        return singleButton;
    }

    public WebElement getPerformPlanList() {
        String xpath = "//span[text()='执行计划']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//span[text()='开始时间']/following::i")
    private WebElement singleBeginTimeButton;

    public WebElement getSingleBeginTimeButton() {
        return singleBeginTimeButton;
    }

//    @FindBy(xpath = "//div[@class='ant-calendar-picker-container ant-calendar-picker-container-placement-bottomLeft']//td[@class='ant-calendar-cell ant-calendar-today ant-calendar-selected-date ant-calendar-selected-day']/div")
    @FindBy(xpath = "//div[@class='ant-calendar-picker-container ant-calendar-picker-container-placement-bottomLeft']//div[text()='18']")
    private WebElement beginTimeDiv;

    public WebElement getBeginTimeDiv() {
        return beginTimeDiv;
    }

    @FindBy(xpath = "//div[@class='ant-calendar-picker-container ant-calendar-picker-container-placement-bottomLeft']//a[text()='确 定']")
    private WebElement beginTimeConfirmButton;

    public WebElement getBeginTimeConfirmButton() {
        return beginTimeConfirmButton;
    }

    @FindBy(xpath = "//input[@class='ant-calendar-input'][placeholder='请选择']")
    private WebElement singleBeginTimeInput;

    public WebElement getSingleBeginTimeInput() {
        return singleBeginTimeInput;
    }

    @FindBy(xpath = "//span[text()='保存']/parent::button")
    private WebElement saveButton;

    public WebElement getSaveButton() {
        return saveButton;
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }


    @FindBy(xpath = "//span[text()='开始时间']/following::div/span/input[@placeholder='请选择'][@class='ant-time-picker-input']")
    private WebElement startTime;

    public WebElement getStartTime() {
//        String xpath = "//span[text()='开始时间']/following::div/span/input[@placeholder='请选择']";
//        WebElement element = webDriver.findElement(By.xpath(xpath));
//        element.sendKeys("09:30");
////        webDriver.navigate().refresh();
//        return element;
        return startTime;
    }

    @FindBy(xpath = "//span[text()='结束时间']/following::div/span/input[@placeholder='请选择']")
    private WebElement endTime;

    public WebElement getEndTime() {
        return endTime;
    }

    @FindBy(xpath = "(//a[text()='此刻'])[last()]")
    private WebElement rightNow;

    public WebElement getRightNow() {
        return rightNow;
    }

    @FindBy(xpath = "(//input[@placeholder='选择时间'])[last()]")
    private WebElement timeInput;

    @FindBy(xpath = "(//button[@class='el-picker-panel__btn'])[last()]")
    private WebElement ensureButton;

    @FindBy(className = "available")
    private WebElement available;

    @FindBy(xpath = "//span[text()='单次']")
    private WebElement single;

    @FindBy(xpath = "//span[text()='AutoTestRoleWithAllResource']/ancestor::li")
    private WebElement disabledLi;

    @FindBy(xpath = "//label[@class='required start-time']/following-sibling::div//input[@placeholder='时']")
    private WebElement startHour;

    @FindBy(xpath = "//label[@class='required start-time']/following-sibling::div//input[@placeholder='分']")
    private WebElement startMinute;

    @FindBy(xpath = "//label[@class='required end-time']/following-sibling::div//input[@placeholder='时']")
    private WebElement endHour;

    @FindBy(xpath = "//label[@class='required end-time']/following-sibling::div//input[@placeholder='分']")
    private WebElement endMinute;

    @FindBy(className = "el-icon-search")
    private WebElement searchIcon;

    @Override
    public WebElement getSearchIcon() {
        return searchIcon;
    }

    public WebElement getStartHour() {
        return startHour;
    }

    public WebElement getStartMinute() {
        return startMinute;
    }

    public WebElement getEndHour() {
        return endHour;
    }

    public WebElement getEndMinute() {
        return endMinute;
    }

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

    public WebElement getAvailable() {
        return available;
    }

    public WebElement getTimeInput() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(timeInput));
        return timeInput;
    }

    public WebElement getGroup() {
        return super.getDropdownList("影响涉及范围");
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

}
