package com.yottabyte.pages.report;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement successMessage;

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement message;

    @FindBy(xpath = "//div[@class = 'ant-message-custom-content ant-message-warning']/span")
    private WebElement errorMessage;


    // 下拉列表
    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownLists;

    @FindBy(xpath = "//label[text()='名称']/following-sibling::input")
    private WebElement name;

    @FindBy(xpath = "//label[text()='描述']/following-sibling::input")
    private WebElement describe;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div//input")
    private WebElement runningUser;

    @FindBy(xpath = "//label[text()='报表分组']/following-sibling::div//input[@class='el-input__inner']")
    private WebElement reportGroup;

    @FindBy(xpath = "//label[text()='报表类型']/following-sibling::div")
    private WebElement reportTypeButton;

    @FindBy(xpath = "//label[text()='报表类型']/following-sibling::div//input")
    private WebElement reportType;

    @FindBy(xpath = "//li[@class='ant-dropdown-menu-item'][1]")
    private WebElement li;

    @FindBy(xpath = "//span[@class='yw-title']")
    private WebElement topoTitle;

    @FindBy(xpath = "//label[text()='接收邮箱']/following-sibling::div//input")
    private WebElement emailInput;

    @FindBy(xpath = "(//div[@class='el-scrollbar'])[last()]")
    private WebElement scrollbar;

    @FindBy(xpath = "//label[text()='邮件主题']/following-sibling::input")
    private WebElement subject;

    @FindBy(xpath = "//span[text()='趋势图列表']/following-sibling::div/button")
    private WebElement chartList;

//    @FindBy(className = "el-dropdown-menu")
    @FindBy(xpath = "//li[@class='ant-dropdown-menu-item']/ancestor::ul")
    private WebElement chartDropdownList;

    @FindBy(xpath = "//span[text()='crontab']")
    private WebElement crontabButton;

    @FindBy(xpath = "//span[text()='crontab']/ancestor::span/following-sibling::div/input")
    private WebElement crontab;

    // 下一步
    @FindBy(xpath = "//span[text()='下一步']/ancestor::button")
    private WebElement nextButton;

    @FindBy(xpath = "//span[text()='完成']/ancestor::button")
    private WebElement finishButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement EnsureButton;

    @FindBy(xpath = "(//span[text()='定时']/ancestor::span/following-sibling::div/div/div)[last()]")
    private WebElement period;

    @FindBy(xpath = "//span[text()='定时']/ancestor::span/following-sibling::div/div[2]/div")
    private WebElement selectDay;

    @FindBy(xpath = "//li[text()='每周']")
    private WebElement everyWeek;

    @FindBy(xpath = "//li[text()='每月']")
    private WebElement everyMonth;

    @FindBy(xpath = "//input[@placeholder='分']")
    private WebElement minute;

    @FindBy(xpath = "//input[@placeholder='时']")
    private WebElement hour;

    @FindBy(xpath = "//span[text()='保存']")
    private WebElement save;

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

    @FindBy(xpath = "(//button[@class='el-button btn-submit el-button--primary'])[last()]")
    private WebElement saveTrend;

    @FindBy(xpath = "(//div[@class='popover-setting-content'])[last()]")
    private WebElement settingContent;

    @FindBy(xpath = "//span[text()='编辑']/ancestor::button")
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

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//input")
    private WebElement app;

    @FindBy(xpath = "//label[text()='资源标签']/following-sibling::div//input")
    private WebElement tag;

    @FindBy(xpath = "(//div[@class='ant-collapse-header']/div/span[2])[last()]")
    private WebElement chosenTrendLast;

    @FindBy(xpath = "//div[@class='ant-collapse-header']/div/span[2]")
    private WebElement chosenTrendFirst;

    @FindBy(xpath = "(//div[@class='ant-collapse-header']/div/span[2])[last()]/following-sibling::span/i[1]")
    private WebElement lastTrendDelete;

    @FindBy(xpath = "//div[@class='ant-collapse-header']/div/span[2]/following-sibling::span/i[1]")
    private WebElement firstTrendDelete;

    @FindBy(xpath = "(//div[@class='ant-collapse-header']/div/span[2])[last()]/following-sibling::span/i[5]")
    private WebElement lastTrendUpTop;

    @FindBy(xpath = "//div[@class='ant-collapse-header']/div/span[2]/following-sibling::span/i[4]")
    private WebElement firstTrendDownBottom;

    @FindBy(xpath = "(//div[@class='ant-collapse-header']/div/span[2])[last()]/following-sibling::span/i[2]")
    private WebElement lastTrendUp;

    @FindBy(xpath = "//div[@class='ant-collapse-header']/div/span[2]/following-sibling::span/i[3]")
    private WebElement firstTrendDown;

    @FindBy(xpath = "//span[text()='描述']/ancestor::p")
    private WebElement trendDescription;

    @FindBy(xpath = "//span[text()='搜索内容']/ancestor::p")
    private WebElement trendSpl;

    @FindBy(xpath = "//span[text()='数据集']/ancestor::p")
    private WebElement trendData;

    @FindBy(xpath = "//span[text()='统计类型']/ancestor::p")
    private WebElement trendChart;

    @FindBy(xpath = "//span[text()='名称']/following-sibling::span/input")
    private WebElement trendNameField;

    @FindBy(xpath = "//span[text()='描述']/following-sibling::span/input")
    private WebElement trendDescribeField;

    @FindBy(xpath = "//span[text()='搜索内容']/following-sibling::span/textarea")
    private WebElement trendSplField;

    @FindBy(xpath = "//span[text()='统计类型']/following-sibling::span/button")
    private WebElement trendChartType;

    @FindBy(xpath = "(//label[text()='参数设置'])[last()]")
    private WebElement parameterSetting;

    @FindBy(xpath = "(//div[contains(text(),'面积图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement areaChart;

    @FindBy(xpath = "//span[text()='取消']/ancestor::button")
    private WebElement cancelButton;



    public WebElement getChosenTrendLast(){
        return chosenTrendLast;
    }
    public WebElement getChosenTrendFirst(){
        return chosenTrendFirst;
    }
    public WebElement getLastTrendDelete() {
        return lastTrendDelete;
    }
    public WebElement getFirstTrendDelete() {
        return firstTrendDelete;
    }
    public WebElement getLastTrendUpTop() {
        return lastTrendUpTop;
    }
    public WebElement getFirstTrendDownBottom() {
        return firstTrendDownBottom;
    }
    public WebElement getLastTrendUp() {
        return lastTrendUp;
    }
    public WebElement getFirstTrendDown() {
        return firstTrendDown;
    }

    public WebElement getTrendDescription() {
        return trendDescription;
    }
    public WebElement getTrendSpl() {
        return trendSpl;
    }
    public WebElement getTrendData() {
        return trendData;
    }
    public WebElement getTrendChart() {
        return trendChart;
    }

    public WebElement getTrendNameField() {
        return trendNameField;
    }
    public WebElement getTrendDescribeField() {
        return trendDescribeField;
    }
    public WebElement getTrendSplField() {
        return trendSplField;
    }
    public WebElement getTrendChartType() {
        return trendChartType;
    }
    public WebElement getAreaChart() {
        return areaChart;
    }

    public WebElement getCancelButton() {
        return cancelButton;
    }

    public WebElement getApp() {
//        app.click();
//        return getDropdownList();
        return app;
    }

    public WebElement getTag() {
//        tag.click();
//        return getDropdownList();
        return tag;
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

    public WebElement getMessage() {
        return message;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
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
        reportTypeButton.click();
        return reportType;
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
        return subject;
    }

    public WebElement getSelectDay() {
        return selectDay;
    }

    public WebElement getEveryWeek(){
        period.click();
        return everyWeek;
    }

    public WebElement getEveryMonth(){
        period.click();
        return everyMonth;
    }

    public WebElement getHour() {
        return hour;
    }

    public WebElement getMinute() {
        return minute;
    }

    public WebElement getNextButton() {
        return nextButton;
    }

    public WebElement getFinishButton() {
        return finishButton;
    }

    public WebElement getEnsureButton() {
        return EnsureButton;
    }

//    public WebElement getChartList() throws InterruptedException {
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(chartList));
//        chartList.click();
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
//        return chartDropdownList;
//    }

    public WebElement getChartListButton() {
        return chartList;
    }

    public WebElement getListOfCharts(){
        return chartList;
    }
    public WebElement getChartList() {
        chartList.click();
        return chartDropdownList;
    }

    public WebElement getChart() {
        return chartList;
    }

    public WebElement getLayout1() {
        return layout1;
    }

    public WebElement getSave() {
        return save;
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
}
