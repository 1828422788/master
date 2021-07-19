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

    @FindBy(xpath = "//input[@yotta-test='alert-name-input'][@placeholder='请输入维护原因']")
    private WebElement maintainReason;

    public WebElement getMaintainReason() {
        return maintainReason;
    }

    @FindBy(xpath = "//button[@yotta-test='alert-select_alerts-button']")
    private WebElement chooseAlertButton;

    public WebElement getChooseAlertButton() {
        return chooseAlertButton;
    }

    @FindBy(xpath = "//input[@yotta-test='alert-alert_list_filter-input'][@placeholder='请输入关键字']")
    private WebElement alertNameSearchInput;

    public WebElement getAlertNameSearchInput() {
        return alertNameSearchInput;
    }

//    @FindBy(xpath = "//p[contains(text(),'已选中')]/following::input[@placeholder='请输入关键字']/following-sibling::span/i")
    @FindBy(xpath = "//input[@yotta-test='alert-alert_list_filter-input'][@placeholder='请输入关键字']/following-sibling::span")
    private WebElement alertNameSearchIcon;

    public WebElement getAlertNameSearchIcon() {
        return alertNameSearchIcon;
    }

//    @FindBy(xpath = "//label[@class='P6t_i2gGWUIWPSCJcrPhU css-re7vk9 ant-checkbox-wrapper']")
    @FindBy(xpath = "//input[@yotta-test='alert-alert_list-checkbox']/parent::span")
    private WebElement alertNameBody;

    public WebElement getAlertNameBody() {
        return alertNameBody;
    }

    @FindBy(xpath = "//p[contains(text(),'已选中')]/following::span/input[@class='ant-checkbox-input']/following-sibling::span")
    private WebElement alertNameCheckbox;

    public WebElement getAlertNameCheckbox() {
        return alertNameCheckbox;
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement alertNameEnsure;

    public WebElement getAlertNameEnsure() {
        return alertNameEnsure;
    }

//  @FindBy(xpath = "//span[text()='维护原因']")
    @FindBy(xpath = "//label[contains(text(),'维护原因')]")
    private WebElement beginTimeLabel;

    public WebElement getBeginTimeLabel() {
        return beginTimeLabel;
    }

    public WebElement getBeginWeeklyDayList() {
//        String xpath = "//span[text()='开始时间']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        String xpath = "//div[@yotta-test='alert-fixed_start_unit-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getEndWeeklyDayList() {
//        String xpath = "//span[text()='结束时间']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        String xpath = "//div[@yotta-test='alert-fixed_end_unit-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//div[@yotta-test='alert-fixed_start_time-time_picker']//input")
    private WebElement maintainBeginTimeInput;
    public WebElement getMaintainBeginTimeInput() {
        return maintainBeginTimeInput;
    }

    @FindBy(css = "[class='yotta-popover css-1shj747 yotta-time-picker-popover']")
    private WebElement beginTimeListHideItem;
    public WebElement getBeginTimeListHideItem() {
//        String str_selector = "[class='yotta-popover css-1shj747 yotta-time-picker-popover']";
//        WebElement element = webDriver.findElement(By.cssSelector(str_selector));
        return maintainBeginTimeInput;
    }

    public WebElement getMaintainBeginTimeList() {
        String xpath = "//div[@yotta-test='alert-fixed_start_time-time_picker']/span/span";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getMaintainBeginTimeDropdownList();
    }

    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-DownOutlined yotta-time-table-column-down']")
    private WebElement downOutlinedButton;
    public WebElement getDownOutlinedButton() {
        return downOutlinedButton;
    }

    @FindBy(xpath = "//div[@yotta-test='alert-fixed_end_time-time_picker']//input")
    private WebElement maintainEndTimeInput;
    public WebElement getMaintainEndTimeInput() {
        return maintainEndTimeInput;
    }

    public WebElement getMaintainEndTimeList() {
        String xpath = "//div[@yotta-test='alert-fixed_end_time-time_picker']/span/span";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
//        for (int j=0;j<22;j++){
//            downOutlinedButton.click();
//        }
        return getMaintainEndTimeDropdownList();
    }

    public WebElement getMaintainWeekEndTimeList() {
        String xpath = "//div[@yotta-test='alert-fixed_end_time-time_picker']/span/span";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getMaintainWeekEndTimeDropdownList();
    }

    @FindBy(xpath = "//main[@yotta-test='navigation-main-dom']")
    private WebElement mainDom;
    public WebElement getMainDom() {
        return mainDom;
    }

    @FindBy(xpath = "//span[text()='单次']/parent::label")
    private WebElement singleButton;

    public WebElement getSingleButton() {
        return singleButton;
    }

    public WebElement getPerformPlanList() {
        String xpath = "//div[@yotta-test='alert-fixed_frequency-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

//    @FindBy(xpath = "//span[text()='开始时间']/following::i")
    @FindBy(xpath = "//div[@yotta-test='alert-single_start_time-date_picker']/span/span")
    private WebElement singleBeginTimeButton;

    public WebElement getSingleBeginTimeButton() {
        return singleBeginTimeButton;
    }

//    @FindBy(xpath = "//div[@class='ant-calendar-picker-container ant-calendar-picker-container-placement-bottomLeft']//div[text()='18']")
    @FindBy(xpath = "//div[@class='yotta-date-table-content']//td[text()='1']")
    private WebElement beginTimeDiv;

    public WebElement getBeginTimeDiv() {
        return beginTimeDiv;
    }

    @FindBy(xpath = "//span[text()='此刻']/parent::button")
    private WebElement singleCurrentTimeButton;

    public WebElement getSingleCurrentTimeButton() {
        String xpath = "//div[@yotta-test='alert-single_start_time-time_picker']/span/span";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return singleCurrentTimeButton;
    }

    public WebElement getSingleStartTimeList() {
        String xpath = "//div[@yotta-test='alert-single_start_time-time_picker']/span/span";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getMaintainBeginTimeList();
    }

    @FindBy(xpath = "//div[@class='ant-calendar-picker-container ant-calendar-picker-container-placement-bottomLeft']//a[text()='确定']")
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
