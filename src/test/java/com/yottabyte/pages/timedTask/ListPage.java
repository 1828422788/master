package com.yottabyte.pages.timedTask;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class ListPage extends ListPageFactory {

    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//span[text()='定时任务']/following-sibling::span/div")
    private WebElement selectName;

    @FindBy(xpath = "//*[@placeholder='请选择时间范围']")
    private WebElement dateEditor;

    @FindBy(className = "yotta-date-time-picker")
    private WebElement datePicker;

    @FindBy(xpath = "//div[text()='请选择应用']/ancestor::div[2]")
    private WebElement appDropdown;

    @FindBy(xpath = "//div[text()='全部资源']/ancestor::div[2]")
    private WebElement tagDropdown;

    @FindBy(xpath= "//div[@class='ant-modal-content']")
    private WebElement tagPanel;

    @FindBy(xpath = "(//div[text()='标签'])[last()]/following-sibling::div[1]")
    private WebElement tagField;

    @FindBy(xpath = "//span[text()='创建补采任务']/ancestor::div[2]")
    private WebElement complementPanel;

    @FindBy(xpath = "//label[contains(text(),'开始时间')]/following-sibling::div//input[@placeholder='请选择日期']")
    private WebElement startDate;

    @FindBy(xpath = "//label[contains(text(),'开始时间')]/following-sibling::div//input[@placeholder='请输入时间']")
    private WebElement startTime;

    @FindBy(xpath = "//label[contains(text(),'结束时间')]/following-sibling::div//input[@placeholder='请选择日期']")
    private WebElement endDate;

    @FindBy(xpath = "//label[contains(text(),'结束时间')]/following-sibling::div//input[@placeholder='请输入时间']")
    private WebElement endTime;

    @FindBy(xpath = "//div[@class='yotta-select-option'][1]")
    private WebElement li;

    @FindBy(xpath = "//span[text()='是否覆盖已存在定时任务结果']/preceding-sibling::label/span")
    private WebElement overwrite;

    @FindBy(xpath = "//span[@class='yotta-message-content']")
    private WebElement notice;

    @FindBy(xpath = "//span[@class = 'ant-spin-dot ant-spin-dot-spin']")
    private WebElement loading;

    @FindBy(xpath = "//p[text()='暂无数据']")
    private WebElement noData;

    @FindBy(xpath = "(//tr)[last()]/td[8]")
    private WebElement tagOfTheLastItem;

    @FindBy(xpath = "(//tr)[last()]/td[7]")
    private WebElement appOfTheLastItem;

    public WebElement getAppOfTheLastItem() {
        return appOfTheLastItem;
    }

    public WebElement getTagOfTheLastItem() {
        return tagOfTheLastItem;
    }

    public WebElement getNoData() {
        return noData;
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getStartDate() {
        return startDate;
    }

    public WebElement getStartTime() {
        return startTime;
    }

    public WebElement getEndDate() {
        return endDate;
    }

    public WebElement getEndTime() {
        return endTime;
    }

    public WebElement getOverwrite() {
        return overwrite;
    }

    public WebElement getNotice() {
        return notice;
    }

    public WebElement getTagDropdown() {
        tagDropdown.click();
        return this.getLastDropdownList();
    }

    public WebElement getAppDropdown() {
        appDropdown.click();
        return this.getLastDropdownList();
    }

    public WebElement getSearchIcon() {
        return super.getSearchIcon();
    }

    public WebElement getDatePicker() {
        return datePicker;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getSelectName() {
        selectName.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return super.getLastDropdownList();
    }

    public WebElement getComplement() {
        return super.getButton("定时任务补采");
    }

    public WebElement getCreateComplement() {
        return super.getButton("创建补采任务");
    }

    public WebElement getTagPanel() {
        return tagPanel;
    }

    public WebElement getTagField() {
        tagField.click();
        return this.getLastDropdownList();
    }

    public WebElement getComplementPanel() {
        return complementPanel;
    }
}
