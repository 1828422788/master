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

    @FindBy(xpath = "//input[@placeholder='请输入节点分组']")
    private WebElement nodeGroup;

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

    @FindBy(xpath = "//button[@yotta-test='topology_opt-show-param-button']/span")
    private WebElement addInputButton;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv'])[3]")
    private WebElement editNode;

    @FindBy(xpath = "(//textarea[@placeholder='请输入语句'])[last()]")
    private WebElement textArea;

    @FindBy(xpath = "(//input[contains(@class,'ant-input css-pcxrzr')])[last()]")
    private WebElement dateEditor;

    @FindBy(xpath = "//input[contains(@class,'ant-input css-pcxrzr')]")
    private WebElement firstDateEditor;

    @FindBy(id = "optionValues")
    private WebElement defaultValue;

    @FindBy(xpath = "//div[@yotta-test='topology_param-type-select']")
    private WebElement inputType;

    @FindBy(xpath = "(//span[text()='展示字段'])[last()]/ancestor::div/following-sibling::div")
    private WebElement filedInput;

    @FindBy(xpath = "//input[@placeholder='请选择展示字段']/preceding-sibling::i")
    private WebElement filedValue;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//span[text()='展示单位']/ancestor::div/following-sibling::div/input")
    private WebElement unit;

    @FindBy(xpath = "//div[@class='ant-message-custom-content']")
    private WebElement successMessage;

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

    @FindBy(xpath = "//span[text()='搜索内容']/following-sibling::textarea")
    private WebElement searchInput;

    @FindBy(xpath = "//input[@placeholder='请选择时间范围']")
    private WebElement timeRange;

    @FindBy(xpath = "(//input[@placeholder='请输入可选值'])[last()]")
    private WebElement optional;

    @FindBy(className = "icon-bianji1")
    private WebElement edit;

    @FindBy(xpath = "(//button[@class='ant-switch'])[last()]")
    private WebElement openChart;

    @FindBy(xpath = "//input[@placeholder='请选择插图类型']/preceding-sibling::i")
    private WebElement chartType;

    @FindBy(xpath = "//canvas[@style='position: absolute; top: 0px; left: 0px; z-index: 2; user-select: none; width: 1126px; height: 289px; cursor: auto;']")
    private WebElement canvas;

    @FindBy(xpath = "//span[text()='+ 添加值']")
    private WebElement addValue;

    @FindBy(xpath = "(//div[@class='ant-collapse-header'])[last()]")
    private WebElement valueHeader;

    @FindBy(className = "yotta-message-content")
    private WebElement message;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv'])[3]")
    private WebElement addNode;

    @FindBy(id = "topo-container")
    private WebElement container;

    @FindBy(xpath = "(//button[text()='今天'])[last()]")
    private WebElement today;

    @FindBy(xpath = "(//span[text()='搜 索']//ancestor::button)[last()]")
    private WebElement searchButton;

    @FindBy(xpath = "(//span[text()='应 用']//ancestor::button)[last()]")
    private WebElement apply;

    @FindBy(className = "value")
    private List<WebElement> valueList;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement addAlert;

    @FindBy(xpath = "(//input[@placeholder='min'])[1]")
    private WebElement higherMin;

    @FindBy(xpath = "(//input[@placeholder='min'])[2]")
    private WebElement MediumMin;

    @FindBy(xpath = "(//input[@placeholder='min'])[3]")
    private WebElement LowerMin;

    @FindBy(xpath = "(//input[@placeholder='max'])[1]")
    private WebElement higherMax;

    @FindBy(xpath = "(//input[@placeholder='max'])[2]")
    private WebElement MediumMax;

    @FindBy(xpath = "(//input[@placeholder='max'])[3]")
    private WebElement lowerMax;

    @FindBy(xpath = "//*[@id='defs_1']/following-sibling::*/*/*/*")
    private WebElement alertNode;

    @FindBy(xpath = "(//button[@class='ant-btn']/i)[1]/ancestor::button")
    private WebElement deleteAlert;

    @FindBy(xpath = "(//div[@class='ant-collapse-content-box']//img/ancestor::div)[last()]")
    private WebElement image;

    @FindBy(xpath = "//div[@id='topo-container']//img")
    private WebElement imgNode;

    @FindBy(xpath = "//span[text()='图标']//ancestor::label")
    private WebElement icon;

    @FindBy(xpath = "(//div[@class='ant-collapse-content-box']//img/ancestor::div)[last()]/following-sibling::div")
    private WebElement exchangeMachine;

    @FindBy(className = "jiaohuanji")
    private WebElement exchangeMachineIcon;

    @FindBy(xpath = "//div[text()='无钻取动作']")
    private WebElement drilldown;

    @FindBy(xpath = "//h5[text()='自定义URL']/following-sibling::textarea")
    private WebElement URL;

    @FindBy(xpath = "(//div[@class='value'])[last()]")
    private WebElement nodeValue;

    @FindBy(xpath = "(//div[@class='value'])[2]")
    private WebElement nodeValue2;

    @FindBy(xpath = "//div[@yotta-test='topology_opt-show-dropdwon']/button")
    private WebElement setting;

    public WebElement getNodeType() {
        return getYottaDropdownList("topology_gui-type-select");
    }

    public WebElement getEditTopologySwitch() {
        return getYottaInput("toplogy_opt-edit-switch");
        }

    public WebElement getSetting() { return setting;}

    public WebElement getNodeValue2() {
        return nodeValue2;
    }

    @FindBy(className = "topology-node-title")
    private WebElement nodeTitle;

    public WebElement getEditNode() {
        return editNode;
    }

    public WebElement getNodeTitle() {
        return nodeTitle;
    }

    public WebElement getNodeValue() {
        return nodeValue;
    }

    public WebElement getURL() {
        return URL;
    }

    public WebElement getDrilldown() {
        drilldown.click();
        return super.getLastDropdownList();
    }

    public WebElement getFirstDateEditor() {
        return firstDateEditor;
    }

    public WebElement getExchangeMachineIcon() {
        return exchangeMachineIcon;
    }

    public WebElement getUpdateNode() {
        return super.getButton("更新节点");
    }

    public WebElement getExchangeMachine() {
        return exchangeMachine;
    }

    public WebElement getImgNode() {
        return imgNode;
    }

    public WebElement getImage() {
        return image;
    }

    public WebElement getIcon() {
        return icon;
    }

    public WebElement getDeleteAlert() {
        return deleteAlert;
    }

    public WebElement getAlertNode() {
        return alertNode;
    }

    public WebElement getHigherMin() {
        return higherMin;
    }

    public WebElement getMediumMin() {
        return MediumMin;
    }

    public WebElement getLowerMin() {
        return LowerMin;
    }

    public WebElement getHigherMax() {
        return higherMax;
    }

    public WebElement getMediumMax() {
        return MediumMax;
    }

    public WebElement getLowerMax() {
        return lowerMax;
    }

    public WebElement getAddAlert() {
        return addAlert;
    }

    public List<WebElement> getValueList() {
        return valueList;
    }

    public WebElement getMultiChoice() {
        return super.getButton("多 选");
    }

    public WebElement getContainer() {
        return container;
    }

    public WebElement getAddNode() {
        return addNode;
    }

    public WebElement getValueHeader() {
        return valueHeader;
    }

    public WebElement getAddValue() {
        return addValue;
    }

    public WebElement getSave() {
        return super.getButton("保存");
    }

    public WebElement getUpdate() {
        return super.getButton("更新节点");
    }

    public WebElement getCanvas() {
        return canvas;
    }

    public WebElement getFiledValue() {
        filedValue.click();
        return super.getLastDropdownList();
    }

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
        return super.getButton("添加");
    }

    public WebElement getPrefix() {
        return getInput("标识前缀");
    }

    public WebElement getPostfix() {
        return getInput("标识后缀");
    }

    public WebElement getIconNodeName() {
        return getYottaInput("节点标签：");
    }

    public WebElement getDefaultValueDropdown() {
        defaultValue.click();
        return super.getLastDropdownList();
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

    public WebElement getAddNodeButton() {
        return super.getButton("新建");
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
        return this.getYottaCheckbox("topology_param-template-标识：-input");
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    // 获取今天按钮
    public WebElement getToday() {
        return today;
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
        return searchButton;
    }

    public WebElement getInputType() {
        inputType.click();
        return super.getLastDropdownList();
    }

    public WebElement getTitle() {
        return this.getYottaCheckbox("topology_param-template-标题：-input");
    }

    public WebElement getFiledInput() {
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
        return this.getInput("动态字段");
    }

    public WebElement getEnsureInputButton() {
        return super.getButton("确 定");
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getTimeRange() {
        return timeRange;
    }

    // 动态菜单下的默认值
    public WebElement getDynamicDefault() {
        defaultValue.click();
        return super.getLastDropdownList();
    }

    public WebElement getOptional() {
        return optional;
    }

    public WebElement getSeparate() {
        return getInput("分隔符");
    }

    public WebElement getIdentityPrefix() {
        return getInput("标识值前缀");
    }

    public WebElement getInputElement(String name) {
        String xpath = "//span[text()='" + name + "']/ancestor::span/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaInput(String name) {
        String xpath = "//div[text()='" + name + "']/parent::div//following-sibling::div/input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getInput(String name) {
        String xpath = "//span[text()='" + name + "']/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }
}
