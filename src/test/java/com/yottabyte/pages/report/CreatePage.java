package com.yottabyte.pages.report;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.DropdownUtils;
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

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement successMessage;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div//input")
    private WebElement runningUser;

    @FindBy(xpath = "//label[text()='报表分组']/following-sibling::div//input[@class='el-input__inner']")
    private WebElement reportGroup;

    @FindBy(xpath = "//label[text()='报表类型']/following-sibling::div//input[@class='el-input__inner']")
    private WebElement reportType;

    @FindBy(xpath = "//li[@class='ant-dropdown-menu-item'][1]")
    private WebElement li;

    @FindBy(className = "ant-collapse-header")
    private WebElement topoTitle;

    @FindBy(xpath = "//label[text()='接收邮箱']/following-sibling::div//input")
    private WebElement emailInput;

    @FindBy(xpath = "(//div[@class='el-scrollbar'])[last()]")
    private WebElement scrollbar;

    @FindBy(xpath = "//span[text()='趋势图列表']/following-sibling::div/button")
    private WebElement chartList;

    @FindBy(className = "ant-dropdown-menu")
    private WebElement chartDropdownList;

    @FindBy(xpath = "//span[text()='crontab']")
    private WebElement crontabButton;

    @FindBy(xpath = "//div[@class='crontab']//input")
    private WebElement crontab;

    @FindBy(xpath = "//input[@placeholder='分']")
    private WebElement minute;

    @FindBy(xpath = "//input[@placeholder='时']")
    private WebElement hour;

    @FindBy(id = "layout1")
    private WebElement layout1;

    @FindBy(id = "layout2")
    private WebElement layout2;

    @FindBy(id = "layout3")
    private WebElement layout3;

    @FindBy(id = "layout4")
    private WebElement layout4;

    @FindBy(id = "layout5")
    private WebElement layout5;

    @FindBy(id = "layout6")
    private WebElement layout6;

    @FindBy(id = "layout7")
    private WebElement layout7;

    @FindBy(id = "layout8")
    private WebElement layout8;

    @FindBy(xpath = "(//i[@class='el-collapse-item__header__arrow el-icon-arrow-right'])[last()]")
    private WebElement arrow;

    @FindBy(xpath = "(//label[text()='参数设置'])[last()]")
    private WebElement parameterSetting;

    @FindBy(xpath = "(//button[@class='el-button btn-submit el-button--primary'])[last()]")
    private WebElement saveTrend;

    @FindBy(xpath = "(//div[@class='popover-setting-content'])[last()]")
    private WebElement settingContent;

    @FindBy(xpath = "(//span[text()='编辑'][not(@class)])[last()]")
    private WebElement editButton;

    @FindBy(className = "yw-title")
    private WebElement trendTitle;

    @FindBy(xpath = "(//label[contains(text(),'图表类型')]/following-sibling::span//i)[last()]")
    private WebElement chartType;

    @FindBy(xpath = "//li[@class='el-dropdown-menu__item']")
    private WebElement firstLi;

    @FindBy(xpath = "(//span[text()='1'])[2]")
    private WebElement badge1;

    @FindBy(xpath = "(//span[text()='2'])[2]")
    private WebElement badge2;

    @FindBy(xpath = "//span[text()='3']")
    private WebElement badge3;

    @FindBy(xpath = "(//span[text()='4'])[last()]")
    private WebElement badge4;

    @FindBy(xpath = "(//span[text()='5'])[last()]")
    private WebElement badge5;

    @FindBy(xpath = "(//span[text()='6'])[last()]")
    private WebElement badge6;

    @FindBy(xpath = "(//span[text()='7'])[last()]")
    private WebElement badge7;

    @FindBy(xpath = "(//span[text()='8'])[last()]")
    private WebElement badge8;

    @FindBy(xpath = "(//span[text()='9'])[last()]")
    private WebElement badge9;

    @FindBy(xpath = "(//span[text()='10'])[last()]")
    private WebElement badge10;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//i[@class='el-input__icon el-icon-arrow-up']")
    private WebElement app;

    public WebElement getApp() {
        app.click();
        return getDropdownList();
    }

    public WebElement getFirstLi() {
        return firstLi;
    }

    public WebElement getBadge1() {
        return badge1;
    }

    public WebElement getBadge2() {
        return badge2;
    }

    public WebElement getBadge3() {
        return badge3;
    }

    public WebElement getBadge4() {
        return badge4;
    }

    public WebElement getBadge5() {
        return badge5;
    }

    public WebElement getBadge6() {
        return badge6;
    }

    public WebElement getBadge7() {
        return badge7;
    }

    public WebElement getBadge8() {
        return badge8;
    }

    public WebElement getBadge9() {
        return badge9;
    }

    public WebElement getBadge10() {
        return badge10;
    }

    public WebElement getChartType() {
        return chartType;
    }

    public WebElement getTrendTitle() {
        return trendTitle;
    }

    public WebElement getSettingContent() {
        return settingContent;
    }

    public WebElement getSaveTrend() {
        return saveTrend;
    }

    public WebElement getParameterSetting() {
        return parameterSetting;
    }

    public WebElement getEditButton() {
        return editButton;
    }

    public WebElement getArrow() {
        return arrow;
    }

    public WebElement getScrollbar() {
        return scrollbar;
    }

    public WebElement getTopoTitle() {
        return topoTitle;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getDropdownList() {
        DropdownUtils utils = new DropdownUtils();
        return utils.getLastDropdownList();
    }

    public WebElement getName() {
        return this.getInput("名称");
    }

    public WebElement getDescribe() {
        return this.getInput("描述");
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

    public WebElement getEmailInput() {
        return emailInput;
    }

    public WebElement getEmail() {
        return super.getButton("wang.yueming@yottabyte.cn");
    }

    public WebElement getEmail1() {
        return super.getButton("sun.xiaojing@yottabyte.cn");
    }

    public WebElement getSubject() {
        return this.getInput("邮件主题");
    }

    public WebElement getHour() {
        return hour;
    }

    public WebElement getMinute() {
        return minute;
    }

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }

    public WebElement getChartList() throws InterruptedException {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(chartList));
        chartList.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return chartDropdownList;
    }

    public WebElement getChart() {
        return chartList;
    }

    public WebElement getLayout1() {
        return layout1;
    }

    public WebElement getSave() {
        return super.getButton("完成");
    }

    public WebElement getCrontab() {
        crontabButton.click();
        return crontab;
    }

    public WebElement getLayout2() {
        return layout2;
    }

    public WebElement getLayout3() {
        return layout3;
    }

    public WebElement getLayout4() {
        return layout4;
    }

    public WebElement getLayout5() {
        return layout5;
    }

    public WebElement getLayout6() {
        return layout6;
    }

    public WebElement getLayout7() {
        return layout7;
    }

    public WebElement getLayout8() {
        return layout8;
    }

    private WebElement getInput(String name) {
        String xpath = "//label[contains(text(),'" + name + "')]/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }
}
