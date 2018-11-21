package com.yottabyte.pages.report;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-message-box__message")
    private WebElement successMessage;

    // 下拉列表
    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownLists;

    @FindBy(xpath = "//label[text()='名称']/following-sibling::div/input")
    private WebElement name;

    @FindBy(xpath = "//label[text()='描述']/following-sibling::div/input")
    private WebElement describe;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div//input")
    private WebElement runningUser;

    @FindBy(xpath = "//label[text()='报表分组']/following-sibling::div//input[@class='el-input__inner']")
    private WebElement reportGroup;

    @FindBy(xpath = "//label[text()='报表类型']/following-sibling::div//input[@class='el-input__inner']")
    private WebElement reportType;

    @FindBy(xpath = "//li[@class='el-dropdown-menu__item'][1]")
    private WebElement li;

    @FindBy(xpath = "//span[@class='yw-title']")
    private WebElement topoTitle;

    public WebElement getTopoTitle() {
        return topoTitle;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getDropdownList() {
        return dropdownLists.get(dropdownLists.size() - 1);
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getDescribe() {
        return describe;
    }

    public WebElement getRunningUser() {
        runningUser.click();
        return this.getDropdownList();
    }

    public WebElement getReportGroup() {
        reportGroup.click();
        return this.getDropdownList();
    }

    public WebElement getReportType() {
        reportType.click();
        return this.getDropdownList();
    }

    @FindBy(xpath = "//label[text()='接收邮箱']/following-sibling::div//input[@class='el-input__inner']")
    private WebElement email;

    public WebElement getEmail() {
        email.click();
        return this.getDropdownList();
    }

    @FindBy(xpath = "//label[text()='邮件主题']/following-sibling::div//input")
    private WebElement subject;

    public WebElement getSubject() {
        return subject;
    }

    @FindBy(xpath = "//input[@placeholder='时']")
    private WebElement hour;

    public WebElement getHour() {
        return hour;
    }

    @FindBy(xpath = "//input[@placeholder='分']")
    private WebElement minute;

    public WebElement getMinute() {
        return minute;
    }

    // 下一步
    @FindBy(className = "yw-extract-primary-btn")
    private WebElement nextButton;

    public WebElement getNextButton() {
        return nextButton;
    }

    @FindBy(xpath = "//label[text()='趋势图列表']/following-sibling::div/button")
    private WebElement chartList;

    @FindBy(className = "el-dropdown-menu")
    private WebElement chartDropdownList;

    public WebElement getChartList() throws InterruptedException {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(chartList));
        chartList.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return chartDropdownList;
    }

    @FindBy(id = "layout1")
    private WebElement layout1;

    public WebElement getLayout1() {
        return layout1;
    }

    @FindBy(xpath = "//span[text()='保存']")
    private WebElement save;

    public WebElement getSave() {
        return save;
    }

    @FindBy(xpath = "//span[text()='crontab']")
    private WebElement crontabButton;

    @FindBy(xpath = "//div[@class='crontab']//input")
    private WebElement crontab;

    public WebElement getCrontab() {
        crontabButton.click();
        return crontab;
    }
}
