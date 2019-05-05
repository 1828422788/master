package com.yottabyte.pages.topology;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.DateEditorPage;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class DetailPage extends PageTemplate {
    public DetailPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "icon-tianjiatubiaoxuanting_icon")
    private WebElement addButton;

    @FindBy(className = "icon-gengxinxuanting_icon")
    private WebElement refreshButton;

    @FindBy(className = "icon-bianji1")
    private WebElement switchButton;

    @FindBy(xpath = "//input[@placeholder='请输入节点名称']")
    private WebElement nodeName;

    @FindBy(xpath = "//input[@placeholder='请输入节点分组']")
    private WebElement nodeGroup;

    @FindBy(xpath = "//span[text()='添加节点']")
    private WebElement addNodeButton;

    @FindBy(className = "el-message-box__message")
    private WebElement alert;

    @FindBy(className = "leftright")
    private WebElement leftRightButton;

    @FindBy(xpath = "//span[text()='左值']")
    private WebElement leftValueButton;

    @FindBy(xpath = "//span[text()='右值']")
    private WebElement rightValueButton;

    @FindBy(xpath = "//span[text()='上值']")
    private WebElement topValueButton;

    @FindBy(xpath = "//span[text()='下值']")
    private WebElement lowerValueButton;

    @FindBy(xpath = "//span[text()='左下值']")
    private WebElement lowerLeft;

    @FindBy(xpath = "//span[text()='左上值']")
    private WebElement leftTop;

    @FindBy(xpath = "//span[text()='右下值']")
    private WebElement lowerRight;

    @FindBy(xpath = "//span[text()='右上值']")
    private WebElement rightTop;

    @FindBy(className = "icon-yejian")
    private WebElement nightMode;

    @FindBy(className = "icon-tianjia")
    private WebElement addInputButton;

    @FindBy(xpath = "//textarea[@placeholder='请输入搜索内容']")
    private WebElement textArea;

    @FindBy(xpath = "//input[@placeholder='请输入搜索时间范围']")
    private WebElement dateEditor;

    @FindBy(xpath = "//span[text()='搜索']")
    private WebElement searchButton;

    @FindBy(xpath = "//label[contains(text(),'标题')]/following-sibling::div//input")
    private WebElement title;

    @FindBy(xpath = "//label[contains(text(),'标识')]/following-sibling::div//input")
    private WebElement token;

    @FindBy(xpath = "//label[contains(text(),'默认值')]/following-sibling::div//input")
    private WebElement defaultValue;

    @FindBy(xpath = "//label[contains(text(),'输入类型')]/following-sibling::div//button")
    private WebElement inputType;

    @FindBy(xpath = "(//input[@placeholder='请选择展示字段']/preceding-sibling::i)[last()]")
    private WebElement filedInput;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//span[text()='展示单位']/ancestor::div/following-sibling::div/input")
    private WebElement unit;

    @FindBy(xpath = "//span[text()='应用']")
    private WebElement apply;

    @FindBy(xpath = "//div[@class='el-message__group']")
    private WebElement successMessage;

    @FindBy(xpath = "(//div[@class='el-message__group'])[2]")
    private WebElement message;

    @FindBy(xpath = "//p[text()='+ 添加']")
    private WebElement addColourButton;

    @FindBy(xpath = "//div[@class='color-value from el-input']/input")
    private WebElement fromInput;

    @FindBy(xpath = "//div[@class='color-value to el-input']/input")
    private WebElement toInput;

    @FindBy(xpath = "(//*[@class='el-color-picker__color-inner'])[last()]")
    private WebElement setColourButton;

    @FindBy(xpath = "(//*[@class='el-color-dropdown__value'])[last()]")
    private WebElement setColourInput;

    @FindBy(xpath = "(//*[@class='el-color-dropdown__btn'])[last()]")
    private WebElement ensureSetColourButton;

    @FindBy(xpath = "//span[text()='单值']")
    private WebElement singleValueButton;

    @FindBy(className = "topbottom")
    private WebElement topBottom;

    @FindBy(className = "topleftright")
    private WebElement topLeftRight;

    @FindBy(className = "leftrightbottom")
    private WebElement leftRightBottom;

    @FindBy(className = "lefttopbottom")
    private WebElement lefttopbottom;

    @FindBy(className = "topbottomright")
    private WebElement topbottomright;

    @FindBy(className = "all")
    private WebElement all;

    @FindBy(className = "yw-modal-btn-primary")
    private List<WebElement> ensureInputButton;

    @FindBy(xpath = "//label[contains(text(),'动态字段')]/following-sibling::div//input")
    private WebElement dynamicFields;

    @FindBy(xpath = "//label[contains(text(),'搜索内容')]/following-sibling::div//textarea")
    private WebElement searchInput;

    @FindBy(xpath = "//div[@class='el-form-item dynamic-search-btn']//span")
    private WebElement searchInputButton;

    @FindBy(xpath = "//label[contains(text(),'时间范围')]/following-sibling::div//input")
    private WebElement timeRange;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement add;

    @FindBy(xpath = "(//label[contains(text(),'可选值')]/following-sibling::div//input[@class='el-input__inner'])[last()]")
    private WebElement optional;

    @FindBy(className = "icon-bianji1")
    private WebElement edit;

    @FindBy(className = "el-switch__label--right")
    private WebElement openChart;

    @FindBy(xpath = "//input[@placeholder='请选择插图类型']/preceding-sibling::i")
    private WebElement chartType;

    public WebElement getChartType() {
        chartType.click();
        return super.getLastDropdownList();
    }

    public WebElement getOpenChart() {
        return openChart;
    }

    public WebElement getEdit() {
        return edit;
    }

    public WebElement getSetColourButton() {
        return setColourButton;
    }

    public WebElement getSetColourInput() {
        return setColourInput;
    }

    public WebElement getAdd() {
        return add;
    }

    public WebElement getPrefix() {
        return super.getInputElement("标识前缀");
    }

    public WebElement getPostfix() {
        return super.getInputElement("标识后缀");
    }

    public WebElement getDefaultValueDropdown() {
        return super.getDropdownList("默认值");
    }

    public WebElement getNodeGroup() {
        return nodeGroup;
    }

    public WebElement getRefreshButton() {
        return refreshButton;
    }

    public WebElement getAddButton() {
        return addButton;
    }

    // 添加输入项
    public WebElement getAddInputButton() {
        return addInputButton;
    }

    public WebElement getTextArea() {
        return textArea;
    }

    public WebElement getLowerValueButton() {
        return lowerValueButton;
    }

    public WebElement getTopValueButton() {
        return topValueButton;
    }

    public WebElement getLeftValueButton() {
        return leftValueButton;
    }

    public WebElement getLeftRightButton() {
        return leftRightButton;
    }

    public WebElement getAlert() {
        return alert;
    }

    public WebElement getAddNodeButton() {
        return addNodeButton;
    }

    public WebElement getNodeName() {
        return nodeName;
    }

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getNightMode() {
        return nightMode;
    }

    public WebElement getRightValueButton() {
        return rightValueButton;
    }

    public WebElement getRightTop() {
        return rightTop;
    }

    public WebElement getLeftTop() {
        return leftTop;
    }

    public WebElement getLowerLeft() {
        return lowerLeft;
    }

    public WebElement getLowerRight() {
        return lowerRight;
    }

    public WebElement getApply() {
        return apply;
    }

    public WebElement getDefaultValue() {
        return defaultValue;
    }

    public WebElement getToken() {
        return token;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    // 获取今天按钮
    public WebElement getToday() {
        return GetTime.getTime(webDriver, "Today");
    }

    // 获取昨天按钮
    public WebElement getYesterday() {
        return GetTime.getTime(webDriver, "Yesterday");
    }

    // 获取本周按钮
    public WebElement getThisWeek() {
        return GetTime.getTime(webDriver, "ThisWeek");
    }

    // 获取上周按钮
    public WebElement getLastWeek() {
        return GetTime.getTime(webDriver, "LastWeek");
    }

    // 获取本月按钮
    public WebElement getThisMonth() {
        return GetTime.getTime(webDriver, "ThisMonth");
    }

    // 获取上月按钮
    public WebElement getLastMonth() {
        return GetTime.getTime(webDriver, "LastMonth");
    }

    // 获取十分钟按钮
    public WebElement getTenMinutes() {
        return GetTime.getTime(webDriver, "RecentTenMinutes");
    }

    // 获取30分钟按钮
    public WebElement getHalfHour() {
        return GetTime.getTime(webDriver, "RecentHalfHour");
    }

    // 获取1小时按钮
    public WebElement getOneHour() {
        return GetTime.getTime(webDriver, "RecentOneHour");
    }

    // 获取1天按钮
    public WebElement getOneDay() {
        return GetTime.getTime(webDriver, "RecentOneDay");
    }

    // 获取2天按钮
    public WebElement getTwoDays() {
        return GetTime.getTime(webDriver, "RecentTwoDays");
    }

    // 获取7天按钮
    public WebElement getSevenDays() {
        return GetTime.getTime(webDriver, "RecentSevenDays");
    }

    // 获取全部时间
    public WebElement getWholeTime() {
        return GetTime.getTime(webDriver, "TopoWholeTime");
    }

    public void getSecondAgo() {
        DateEditorPage dateEditorPage = new DateEditorPage(webDriver);
        LoginBeforeAllTests.setPageFactory(dateEditorPage);
        dateEditorPage.getRecently("3", "");
        LoginBeforeAllTests.setPageFactory(this);
    }

    public void getMinuteAgo() {
        DateEditorPage dateEditorPage = new DateEditorPage(webDriver);
        LoginBeforeAllTests.setPageFactory(dateEditorPage);
        dateEditorPage.getRecently("3", "分钟前");
        LoginBeforeAllTests.setPageFactory(this);
    }

    public void getHourAgo() {
        DateEditorPage dateEditorPage = new DateEditorPage(webDriver);
        LoginBeforeAllTests.setPageFactory(dateEditorPage);
        dateEditorPage.getRecently("3", "小时前");
        LoginBeforeAllTests.setPageFactory(this);
    }

    public void getDayAgo() {
        DateEditorPage dateEditorPage = new DateEditorPage(webDriver);
        LoginBeforeAllTests.setPageFactory(dateEditorPage);
        dateEditorPage.getRecently("3", "天前");
        LoginBeforeAllTests.setPageFactory(this);
    }

    public void getCustomTime() {
        DateEditorPage dateEditorPage = new DateEditorPage(webDriver);
        LoginBeforeAllTests.setPageFactory(dateEditorPage);
        dateEditorPage.getCustomTime("00:00:00", "00:00:00", "2018-08-01", "2018-08-03");
        LoginBeforeAllTests.setPageFactory(this);
    }

    public WebElement getUnit() {
        return unit;
    }

    public WebElement getSearchButton() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(searchButton));
        return searchButton;
    }

    public WebElement getInputType() {
        inputType.click();
        return webDriver.findElement(By.className("filter-type-selection-menu"));
    }

    public WebElement getTitle() {
        return title;
    }

    public WebElement getFiledInput() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(filedInput));
        filedInput.click();
        return super.getLastDropdownList();
    }

    public WebElement getToInput() {
        return toInput;
    }

    public WebElement getFromInput() {
        return fromInput;
    }

    public WebElement getAddColourButton() {
        return addColourButton;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getEnsureSetColourButton() {
        return ensureSetColourButton;
    }

    public WebElement getTopBottom() {
        return topBottom;
    }

    public WebElement getSingleValueButton() {
        return singleValueButton;
    }

    public WebElement getTopLeftRight() {
        return topLeftRight;
    }

    public WebElement getLeftRightBottom() {
        return leftRightBottom;
    }

    public WebElement getLefttopbottom() {
        return lefttopbottom;
    }

    public WebElement getTopbottomright() {
        return topbottomright;
    }

    public WebElement getAll() {
        return all;
    }

    public WebElement getDynamicFields() {
        return dynamicFields;
    }

    public WebElement getEnsureInputButton() {
        return ensureInputButton.get(0);
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getSearchInputButton() {
        return searchInputButton;
    }

    public WebElement getTimeRange() {
        return timeRange;
    }

    // 动态菜单下的默认值
    public WebElement getDynamicDefault() {
        defaultValue.click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    public WebElement getOptional() {
        return optional;
    }

    public WebElement getSeparate() {
        return super.getInputElement("分隔符");
    }

    public WebElement getIdentityPrefix() {
        return super.getInputElement("标识值前缀");
    }
}
