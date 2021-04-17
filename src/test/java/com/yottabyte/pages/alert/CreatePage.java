package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.stepDefs.IChooseValueFromSelectList;
import com.yottabyte.stepDefs.SetKeyWithValue;
import com.yottabyte.stepDefs.WaitElement;
import com.yottabyte.utils.CheckSelectedFromDropdownList;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.GetLogger;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    CheckSelectedFromDropdownList check = new CheckSelectedFromDropdownList();
    List<String> list;
    List<String> tmpAlertTypes = new ArrayList<>();

    // tab页按钮
//    @FindBy(className = "el-tabs__item")
//    class="ant-tabs-nav-scroll"
//    ant-tabs-tab-active ant-tabs-tab
    @FindBy(className = "ant-tabs-tab")
    private List<WebElement> tabs;

    // 监控名称
    @FindBy(xpath = "//input[@yotta-test='alert-name-input']")
    private WebElement alertName;

    // 监控描述
    @FindBy(xpath = "//label[@class='el-form-item__label'][contains(text(),'描述')]/following-sibling::div//input")
    private WebElement alertDes;

    // 监控分组的按钮
    @FindBy(xpath = "//div[@class='el-select']//input[@placeholder='请选择分组']")
    private WebElement alertGroupButton;

    // 监控分组的下拉选框
    @FindBy(className = "group-popper")
    private WebElement alertGroupSelectors;

    // 运行用户的按钮
    @FindBy(xpath = "//label[text()='运行用户']/parent::div/following-sibling::div//span[@class='yotta-select-selection-value']")
    private WebElement alertUserButton;

    // 日志来源的按钮
    @FindBy(xpath = "//div[@class='el-select']//input[@placeholder='请选择日志来源']")
    private WebElement alertSourceButton;

    // 搜索内容
    @FindBy(xpath = "//textarea[@yotta-test='alert-query-textarea']")
    private WebElement searchContent;

    // 已存搜索按钮
    @FindBy(xpath = "//i[@class='iconfont icon-beizhu_icon graph-tips']/following-sibling::div/span")
    private WebElement savedSearchButton;

    // 启用/禁用按钮
    @FindBy(className = "el-switch")
    private WebElement alertEnable;

    // 监控类型的按钮
    @FindBy(xpath = "//div[@class='el-select']//input[@placeholder='请选择']")
    private WebElement alertTypeButton;

    // 触发条件的父级元素
    @FindBy(className = "alert-trigger")
    private WebElement alertTrigger;

    // 触发条件下拉选框
    @FindBy(className = "condition_select")
    private List<WebElement> conditionSelects;

    // 告警级别父元素
    @FindBy(className = "levels")
    private WebElement alertLevel;

    // 添加阈值按钮
    @FindBy(className = "add-threshold")
    private WebElement addThresholdButton;

    // 提示信息弹框
    @FindBy(className = "el-message-box__message")
    private WebElement message;

    // 高级配置tab的基础路径
    final private String ADVANCEDCONFIGPATH = "//form//*[text()='扩展搜索']/parent::*";

    // 扩展搜索搜索内容
    @FindBy(xpath = ADVANCEDCONFIGPATH + "//textarea")
    private WebElement exSearchContent;

    // 扩展搜索日志来源
    @FindBy(xpath = ADVANCEDCONFIGPATH + "//input[@placeholder='请选择日志来源']")
    private WebElement exAlertSourceButton;

    // 启用效果图
    @FindBy(xpath = "//span[@class='graph-switch-text']//following::label[1]")
    private WebElement graphEnable;

    // 告警抑制
    @FindBy(className = "suppression-radio-group")
    private WebElement suppressionAlertGroup;

    // 恢复提示
    @FindBy(xpath = "//label[contains(text(),'恢复提示')]/parent::*//label[@class='el-switch']")
    private WebElement recoverNote;

    // 抑制告警输入框
    @FindBy(xpath = ADVANCEDCONFIGPATH + "//div[@class='unit-input']")
    private List<WebElement> unitInputs;

    // 抑制告警下的复选框
    @FindBy(className = "el-checkbox__input")
    private WebElement checkBox;

    // 添加告警类型下拉框
    @FindBy(className = "add-config-dropdown-menu")
    private WebElement addAlertNoteTypeGroup;

    // 告警提醒类型父元素
    @FindBy(className = "el-collapse")
    private WebElement alertNoteFrame;

    @FindBy(xpath = "(//input[@placeholder='key'])[last()]")
    private WebElement key;

    @FindBy(xpath = "(//input[@placeholder='value'])[last()]")
    private WebElement value;

    @FindBy(xpath = "(//span[contains(text(),'已存搜索 +')])[2]")
    private WebElement advanceSavedSearch;

    @FindBy(xpath = "//span[text()='AutoTestRoleWithAllResource']/ancestor::li")
    private WebElement disabledLi;

    @FindBy(xpath = "(//li[text()='alertSavedSearch'])[last()]")
    private WebElement alertSavedSearch;

    @FindBy(xpath = "//h5[contains(text(),'添加告警方式')]/following-sibling::div//i")
    private WebElement addType;

    @FindBy(xpath = "//ul[@class='el-dropdown-menu add-config-dropdown-menu']/li")
    private WebElement dropdownMenu;

    @FindBy(xpath = "//h5[contains(text(),'添加告警方式')]/following-sibling::div//button")
    private WebElement iconRight;

    @FindBy(className = "add-config-dropdown-menu")
    private WebElement configDropdown;

    @FindBy(xpath = "(//span[text()='转发url地址'])[last()]/following-sibling::div/input")
    private WebElement url;

    @FindBy(xpath = "//label[contains(text(),'设备切分')]/following-sibling::div/label")
    private WebElement divide;

    @FindBy(xpath = "//input[@placeholder='请输入切分字段']")
    private WebElement divideInput;

    @FindBy(xpath = "(//*[@class='el-icon-circle-cross'])[last()]")
    private WebElement close;

    @FindBy(className = "el-dialog__body")
    private WebElement dialogBody;

    @FindBy(xpath = "//button[@class='el-button add-config-dropdown-button el-button--default']//i")
    private WebElement addAlert;

    @FindBy(className = "add-config-dropdown-menu")
    private WebElement alertDropdown;

    @FindBy(xpath = "//div[@class='el-form-item extend-sourcegroup-row']//i")
    private WebElement extendSourceGroup;

    @FindBy(xpath = "//span[@class='post-text']/preceding-sibling::div//input")
    private WebElement sendFirstAlert;

    @FindBy(xpath = "//span[text()='在']")
    private WebElement control;

    @FindBy(className = "el-select-dropdown__item")
    private WebElement dropdownItem;

    @FindBy(xpath = "//label[contains(text(),'监控分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement alertGroups;

    @FindBy(xpath = "(//p[@class='el-select-dropdown__empty'])[last()]")
    private WebElement emptyDropdown;

    @FindBy(xpath = "//input[@yotta-test='alert-statistical_period_num-input']")
    private WebElement timeInput;

    @FindBy(xpath = "//input[@yotta-test='alert-statistical_period_num-input']")
    private WebElement triggerInput;

    @FindBy(xpath = "//input[@yotta-test='alert-levels_value-input']")
    private WebElement triggerLevel;

    @FindBy(className = "anticon-loading")
    private WebElement loading;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//i")
    private WebElement app;

    @Override
    public WebElement getApp() {
        app.click();
        return super.getLastDropdownList();
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getTriggerLevel() {
        return triggerLevel;
    }

    public WebElement getTriggerInput() {
        return triggerInput;
    }

    public WebElement getTimeInput() {
        return timeInput;
    }

    public WebElement getEmptyDropdown() {
        return emptyDropdown;
    }

    public WebElement getControl() {
        return control;
    }

    public WebElement getSendFirstAlert() {
        return sendFirstAlert;
    }

    public WebElement getExtendSourceGroup() {
        extendSourceGroup.click();
        return super.getLastDropdownList();
    }

    public WebElement getAlertDropdown() {
        addAlert.click();
        return alertDropdown;
    }

    public WebElement getDialogBody() {
        return dialogBody;
    }

    public WebElement getClose() {
        return close;
    }

    public WebElement getDivideInput() {
        return divideInput;
    }

    public WebElement getDivide() {
        return divide;
    }

    public WebElement getIconRight() {
        return iconRight;
    }

    public WebElement getUrl() {
        return url;
    }

    public WebElement getConfigDropdown() {
        iconRight.click();
        return configDropdown;
    }

    public WebElement getAddType() {
        addType.click();
        return dropdownMenu;
    }

    public WebElement getAlertSavedSearch() {
        return alertSavedSearch;
    }

    public WebElement getDisabledLi() {
        return disabledLi;
    }

    public WebElement getPreviewButton() {
        return super.getButton("预览");
    }

    public WebElement getPreview() {
        return super.getButton("预览");
    }

    public WebElement getKey() {
        return key;
    }

    public WebElement getValue() {
        return value;
    }

    public WebElement getAddKeyValueButton() {
        return super.getContainsTextButton("+添加");
    }

    public WebElement getAdvanceSavedSearch() {
        return advanceSavedSearch;
    }

    // 基本配置tab
    public WebElement getBasicConfigTab() {
        return tabs.get(0);
    }

    // 高级配置tab
    @FindBy(xpath = "//a[@yotta-test='alert-extend-anchor_link']")
    private WebElement advancedConfigTab;

    public WebElement getAdvancedConfigTab() {
//        return tabs.get(1);
        return advancedConfigTab;
    }

    //    @FindBy(xpath = "//div[contains(text(),'告警方式')]")
    @FindBy(xpath = "//a[@yotta-test='alert-methods-anchor_link']")
    private WebElement alertNoteTypeTab;

    // 告警方式tab
    public WebElement getAlertNoteTypeTab() {
        return alertNoteTypeTab;
    }

    public WebElement getAlertName() {
        GetLogger.getLogger().info("alertName: " + alertName);
        return alertName;
    }

    public WebElement getAlertDes() {
        return alertDes;
    }

    public WebElement getAlertGroups() {
        alertGroups.click();
        WebElement lastDropdownList = super.getLastDropdownList();
        new WaitElement().waitUntilInvisible("(//p[@class='el-select-dropdown__empty'])[last()]");
//        WaitElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(emptyDropdown));
        return lastDropdownList;
    }

    public WebElement getAlertUsers() {
        return getSelectors(alertUserButton);
    }

    public WebElement getAlertSources() {
        return getSelectors(alertSourceButton);
    }

    public WebElement getSearchContent() {
        return searchContent;
    }

    public WebElement getSavedSearch() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(savedSearchButton));
        savedSearchButton.click();
        List<WebElement> list = webDriver.findElements(By.className("saved-search-dropdown-menu"));
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(list.get(list.size() - 1)));
        return list.get(list.size() - 1);
    }

    public WebElement getAlertEnable() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(alertEnable));
        return alertEnable;
    }

    public WebElement getAlertTypes() {
        return getSelectors(alertTypeButton);
    }

    //    @FindBy(xpath = "//span[@class='el-radio-button__inner'][text()='定时']")
//    @FindBy(xpath = "//label[text()='执行计划']/following-sibling::div/descendant::div[text()='定时']/parent::span")
    @FindBy(xpath = "//label[contains(text(),'执行计划')]/following::div[text()='定时']/parent::span/parent::label")
    private WebElement alertPlanTimingButton;

    public WebElement getAlertPlanTimingButton() {
        return alertPlanTimingButton;
    }

    // 执行计划-定时-输入框
    @FindBy(xpath = "//div[contains(text(),'监控执行')]/following::label[contains(text(),'执行计划')]/following::input[@placeholder='请输入']")
    private WebElement alertPlanTimeInput1;

    public WebElement getAlertPlanTimeInput1() {
        return alertPlanTimeInput1;
    }

    public WebElement getAlertPlanTimeInput() {
        if (alertPlanTimingButton.findElement(By.xpath("./parent::label")).getAttribute("class").contains("is-active")) {
            return alertPlanInputs.get(0);
        } else {
            throw new NoSuchElementException("定时按钮未激活");
        }
    }

    // 执行计划-定时-单位
    public WebElement getAlertPlanTimeUnits1() {
        String xpath = "//label[text()='执行计划']/following::div[text()='请选择']/parent::div[@class='ant-select-selection__rendered']";
        return getDropdownListbyPath(xpath);
    }

    public List<WebElement> getAlertPlanTimeUnits() {
        if (alertPlanTimingButton.findElement(By.xpath("./parent::label")).getAttribute("class").contains("is-active")) {
            return getSelectors(alertPlanInputs.get(1)).findElements(By.tagName("li"));
        } else {
            throw new NoSuchElementException("定时按钮未激活");
        }
    }

    // 通用-触发条件输入框，后面带时间单位
    public WebElement getAlertTriggerInput() {
        return alertTrigger.findElement(By.className("input-with-unit")).findElement(By.tagName("input"));
    }

    // 通用-触发条件时间单位下拉框
    public WebElement getAlertTriggerHourOrMinute() {
        return getSelectors(alertTrigger.findElement(By.className("el-select")));
    }

    // 监控类型选择事件数监控、字段统计监控、连续统计监控时，条件类型下拉框，如：计数、独立数等
    public List<WebElement> getConditionTypes() {
        if (tmpAlertTypes.size() == 0) {
            list = check.checkSelected(webDriver, alertTypeButton);
            tmpAlertTypes.addAll(list);
        }
        String tmp = tmpAlertTypes.get(0);
        if (tmp.equalsIgnoreCase("事件数监控") || tmp.equalsIgnoreCase("字段统计监控") || tmp.equalsIgnoreCase("连续统计监控")) {
            if (conditionSelects.size() == 2) {
                return getSelectors(conditionSelects.get(0)).findElements(By.tagName("li"));
            } else if (conditionSelects.size() == 1) {
                throw new NoSuchElementException("监控类型不正确，请检查，当前选择监控类型为： " + list.get(0));
            } else {
                throw new NoSuchElementException("存在多于2个下拉框或者没有下拉框，请检查，当前选择监控类型为： " + list.get(0));
            }
        } else if (tmp.equalsIgnoreCase("基线对比监控") || tmp.equalsIgnoreCase("Spl统计监控")) {
            throw new NoSuchElementException("监控类型不正确，当前选择监控类型为： " + list.get(0));
        } else {
            throw new NoSuchElementException("没有找到条件下拉框，当前选择监控类型为： " + list.get(0));
        }
    }

    // 监控类型选择字段统计监控、连续统计监控、基线对比监控时 左侧第一个输入框
    public WebElement getAlertTriggerFieldsInput() {
        if (tmpAlertTypes.size() == 0) {
            list = check.checkSelected(webDriver, alertTypeButton);
            tmpAlertTypes.addAll(list);
        }
        String tmp = tmpAlertTypes.get(0);
        if (tmp.equalsIgnoreCase("字段统计监控") || tmp.equalsIgnoreCase("连续统计监控") || tmp.equalsIgnoreCase("基线对比监控")) {
            return alertTrigger.findElement(By.className("condition-input")).findElement(By.tagName("input"));
        } else {
            throw new NoSuchElementException("监控类型不正确，当前选择监控类型为： " + list.get(0));
        }
    }

    // 监控类型选择连续统计监控、Spl统计监控时，左侧第二个输入框
    public WebElement getAlertTriggerRightInput() {
        if (tmpAlertTypes.size() == 0) {
            list = check.checkSelected(webDriver, alertTypeButton);
            tmpAlertTypes.addAll(list);
        }
        String tmp = tmpAlertTypes.get(0);
        if (tmp.equalsIgnoreCase("连续统计监控") || tmp.equalsIgnoreCase("Spl统计监控")) {
            return alertTrigger.findElement(By.className("condition-input-left")).findElement(By.tagName("input"));
        } else {
            throw new NoSuchElementException("监控类型不正确，当前选择监控类型为： " + list.get(0));
        }
    }

    // 监控类型选择基线对比监控时，基线时间下拉框
    public List<WebElement> getBaseLineTimeSelectors() {
        if (tmpAlertTypes.size() == 0) {
            list = check.checkSelected(webDriver, alertTypeButton);
            tmpAlertTypes.addAll(list);
        }
        String tmp = tmpAlertTypes.get(0);
        if (tmp.equalsIgnoreCase("基线对比监控")) {
            WebElement element = webDriver.findElement(By.xpath("//label[contains(text(),'基线时间')]/following-sibling::div//input"));
            com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
            return getSelectors(element).findElements(By.tagName("li"));
        } else {
            throw new NoSuchElementException("监控类型不正确，当前选择监控类型为： " + list.get(0));
        }
    }

    // 触发条件下拉框
    public List<WebElement> getConditions() {
        if (tmpAlertTypes.size() == 0) {
            list = check.checkSelected(webDriver, alertTypeButton);
            tmpAlertTypes.addAll(list);
        }
        String tmp = tmpAlertTypes.get(0);
        if (tmp.equalsIgnoreCase("事件数监控") || tmp.equalsIgnoreCase("字段统计监控") || tmp.equalsIgnoreCase("连续统计监控")) {
            if (conditionSelects.size() == 2) {
                return getSelectors(conditionSelects.get(1)).findElements(By.tagName("li"));
            } else {
                throw new NoSuchElementException("监控类型不正确或者没有下拉框，请检查，当前选择监控类型为： " + list.get(0));
            }
        } else if (tmp.equalsIgnoreCase("基线对比监控") || tmp.equalsIgnoreCase("Spl统计监控")) {
            if (conditionSelects.size() == 1) {
                return getSelectors(conditionSelects.get(0)).findElements(By.tagName("li"));
            } else {
                throw new NoSuchElementException("监控类型不正确或者没有下拉框，请检查，当前选择监控类型为： " + list.get(0));
            }
        } else {
            throw new NoSuchElementException("没有找到条件下拉框，当前选择监控类型为： " + list.get(0));
        }
    }

    // 告警级别输入框
    public WebElement getAlertLevelInput() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(alertLevel));
        return alertLevel.findElement(By.className("input-with-unit")).findElement(By.className("el-input__inner"));
    }

    // 选择基线对比监控时搜索结果选择在区间内/外时，右侧输入框
    public WebElement getBaseLineRightInput() {
        if (tmpAlertTypes.size() == 0) {
            list = check.checkSelected(webDriver, alertTypeButton);
            tmpAlertTypes.addAll(list);
        }
        String tmp = tmpAlertTypes.get(0);
        if ("基线对比监控".equalsIgnoreCase(tmp)) {
            String searchResult = check.checkSelected(webDriver, conditionSelects.get(0)).get(0);
            if (searchResult.contains("区间")) {
                return webDriver.findElement(By.className("baseline-right")).findElement(By.tagName("input"));
            } else {
                throw new NoSuchElementException("没有找到输入框，请检查");
            }
        } else {
            throw new NoSuchElementException("监控类型不正确，请检查！当前选择为：" + tmp);
        }
    }

    // 告警级别单位下拉框
    public List<WebElement> getAlertLevelUnit() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOfElementLocated(By.className("levels")));
        WebElement element = webDriver.findElement(By.className("levels")).findElement(By.className("input-with-unit")).findElement(By.className("level-select"));
        WebElement tmpElement = getSelectors(element);
        List<WebElement> elementList = tmpElement.findElements(By.tagName("li"));
        return elementList;
    }

    public WebElement getAddThresholdButton() {
        return addThresholdButton;
    }

    public WebElement getMiddleLevelInput() {
        if (alertLevel.findElements(By.className("input-with-unit")).size() >= 2) {
            return alertLevel.findElements(By.className("input-with-unit")).get(1).findElement(By.className("el-input__inner"));
        } else {
            throw new NoSuchElementException("请添加阈值");
        }
    }

    public WebElement getHighLevelInput() {
        if (alertLevel.findElements(By.className("input-with-unit")).size() >= 3) {
            return alertLevel.findElements(By.className("input-with-unit")).get(2).findElement(By.className("el-input__inner"));
        } else {
            throw new NoSuchElementException("请添加阈值");
        }
    }

    public WebElement getSaveButton() {
        return super.getButton("保存");
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getExSearchContent() {
        return exSearchContent;
    }

    public List<WebElement> getExAlertSources() {
        return getSelectors(exAlertSourceButton).findElements(By.tagName("li"));
    }

    public WebElement getGraphEnable() {
        return graphEnable;
    }

    public WebElement getNotSuppressButton() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(suppressionAlertGroup.findElements(By.className("el-radio__input")).get(0)));
        return suppressionAlertGroup.findElements(By.className("el-radio__input")).get(0);
    }

    public WebElement getSuppressButton() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(suppressionAlertGroup.findElements(By.className("el-radio__input")).get(1)));
        return suppressionAlertGroup.findElements(By.className("el-radio__input")).get(1);
    }

    // 发送第一次告警选项中的输入框
    public WebElement getFixedPeriodInput() {
        String tmp = getSuppressButton().getAttribute("class");
        if (tmp.contains("is-checked")) {
            return unitInputs.get(0).findElement(By.tagName("input"));
        } else {
            throw new ElementNotInteractableException("抑制告警选项未激活");
        }
    }

    // 发送第一次告警选项中的单位下拉框
    public List<WebElement> getFixedPeriodUnits() {
        WebElement tmp = unitInputs.get(0).findElement(By.className("el-select")).findElement(By.tagName("input"));
        return getSelectors(tmp).findElements(By.tagName("li"));
    }

    // 抑制告警中的复选框
    public WebElement getCheckBox() {
        return checkBox;
    }

    // 取消抑制的输入框
    public WebElement getCancelSuppressInput() {
        String tmp = getSuppressButton().getAttribute("class");
        String tmp1 = checkBox.getAttribute("class");
        if (tmp.contains("is-checked")) {
            if (tmp1.contains("is-checked")) {
                return unitInputs.get(1).findElement(By.tagName("input"));
            } else {
                throw new ElementNotInteractableException("取消抑制复选框选项未激活");
            }
        } else {
            throw new ElementNotInteractableException("抑制告警选项未激活");
        }
    }

    // 取消抑制的单位
    public List<WebElement> getCancelSuppressUnits() {
        WebElement tmp = unitInputs.get(1).findElement(By.className("el-select")).findElement(By.tagName("input"));
        return getSelectors(tmp).findElements(By.tagName("li"));
    }

    // 添加rsyslog告警方式
    public void rsyslogType(String address, List<String> protocol, List<String> level, String facility, List<String> condition, String content) {
        SetKeyWithValue set = new SetKeyWithValue();
        IChooseValueFromSelectList choose = new IChooseValueFromSelectList();
        try {
            choose.iChooseTheFromThe(new ArrayList<String>(Arrays.asList("rsyslog告警")), getAlertNoteTypes());
            List<String> titles = getAlertNoteTitle();
            for (int i = 0; i < titles.size(); i++) {
                if ("rsyslog告警".equals(titles.get(i))) {
                    WebElement fatherElement = alertNoteFrame.findElements(By.className("el-collapse-item")).get(i);
                    if (fatherElement.getAttribute("class").contains("is-active")) {
                        WebElement rsysAddress = fatherElement.findElements(By.className("el-input__inner")).get(0);
                        WebElement rsysProtocol = fatherElement.findElements(By.className("el-input__inner")).get(1);
                        WebElement rsysLevel = fatherElement.findElements(By.className("el-input__inner")).get(2);
                        WebElement rsysFacility = fatherElement.findElements(By.className("el-input__inner")).get(3);
                        WebElement rsysCondition = fatherElement.findElements(By.className("el-input__inner")).get(4);
                        WebElement rsysContent = fatherElement.findElement(By.className("el-textarea__inner"));
                        if (address != null && address.trim().length() != 0) {
                            set.iSetTheParameterWithValue(rsysAddress, address);
                        }
                        if (protocol != null && protocol.size() != 0 && !protocol.contains("")) {
                            choose.iChooseTheFromThe(protocol, getSelectors(rsysProtocol));
                        }
                        if (level != null && level.size() != 0 && !level.contains("")) {
                            choose.iChooseTheFromThe(level, getSelectors(rsysLevel));
                        }
                        if (facility != null && facility.trim().length() != 0) {
                            set.iSetTheParameterWithValue(rsysFacility, facility);
                        }
                        choose.iCancelAllSelectionExcept(getSelectors(rsysCondition), condition);
                        if (content != null && content.trim().length() != 0) {
                            set.iSetTheParameterWithValue(rsysContent, content);
                        }
                    }
                }
            }
        } catch (NoSuchElementException e) {
            throw new NoSuchElementException("没有选择告警方式");
        }
    }

    // 添加邮件告警方式
    public void emailType(String title, List<String> emails, List<String> condition, String content) {
        SetKeyWithValue set = new SetKeyWithValue();
        IChooseValueFromSelectList choose = new IChooseValueFromSelectList();
        try {
            choose.iChooseTheFromThe(new ArrayList<String>(Arrays.asList("邮件告警")), getAlertNoteTypes().findElements(By.tagName("li")));
            List<String> titles = getAlertNoteTitle();
            for (int i = 0; i < titles.size(); i++) {
                if ("邮件告警".equals(titles.get(i))) {
                    WebElement fatherElement = alertNoteFrame.findElements(By.className("el-collapse-item")).get(i);
                    if (fatherElement.getAttribute("class").contains("is-active")) {
                        WebElement emailTitle = fatherElement.findElements(By.className("el-input__inner")).get(0);
                        WebElement email = fatherElement.findElements(By.tagName("input")).get(1);
                        WebElement emailCondition = fatherElement.findElements(By.className("el-input__inner")).get(2);
                        WebElement emailContent = fatherElement.findElement(By.className("el-textarea__inner"));
                        if (title != null && title.trim().length() != 0) {
                            set.iSetTheParameterWithValue(emailTitle, title);
                        }
                        if (emails != null && emails.size() != 0 && !emails.contains("")) {
                            com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(email));
                            email.click();
                            set.iSetTheParameterWithValue(email, emails.get(0));
                            List<WebElement> list = webDriver.findElements(By.className("el-select-dropdown__list"));
                            com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(list.get(list.size() - 1)));
                            WebElement e = list.get(list.size() - 1);
                            choose.iChooseTheFromThe(emails, e.findElements(By.tagName("li")));
                        }
                        choose.iCancelAllSelectionExcept(getSelectors(emailCondition), condition);
                        if (content != null && content.trim().length() != 0) {
                            set.iSetTheParameterWithValue(emailContent, content);
                        }
                    }
                }
            }
        } catch (NoSuchElementException e) {
            throw new NoSuchElementException("没有选择告警方式");
        }
    }

    // 添加告警转发方式
    public void forwardType(String address, List<String> condition) {
        SetKeyWithValue set = new SetKeyWithValue();
        IChooseValueFromSelectList choose = new IChooseValueFromSelectList();
        try {
            choose.iChooseTheFromThe(new ArrayList<String>(Arrays.asList("告警转发")), getAlertNoteTypes().findElements(By.tagName("li")));
            List<String> titles = getAlertNoteTitle();
            for (int i = 0; i < titles.size(); i++) {
                if ("告警转发".equals(titles.get(i))) {
                    WebElement fatherElement = alertNoteFrame.findElements(By.className("el-collapse-item")).get(i);
                    if (fatherElement.getAttribute("class").contains("is-active")) {
                        WebElement forwardAddress = fatherElement.findElements(By.className("el-input__inner")).get(0);
                        WebElement forwardCondition = fatherElement.findElements(By.tagName("input")).get(1);
                        if (address != null && address.trim().length() != 0) {
                            set.iSetTheParameterWithValue(forwardAddress, address);
                        }
                        choose.iCancelAllSelectionExcept(getSelectors(forwardCondition), condition);
                    }
                }
            }
        } catch (NoSuchElementException e) {
            throw new NoSuchElementException("没有选择告警方式");
        }
    }

    // 添加ping主机方式
    public void pingHostType(String address, List<String> condition) {
        SetKeyWithValue set = new SetKeyWithValue();
        IChooseValueFromSelectList choose = new IChooseValueFromSelectList();
        try {
            choose.iChooseTheFromThe(new ArrayList<String>(Arrays.asList("ping主机")), getAlertNoteTypes().findElements(By.tagName("li")));
            List<String> titles = getAlertNoteTitle();
            for (int i = 0; i < titles.size(); i++) {
                if ("ping主机".equals(titles.get(i))) {
                    WebElement fatherElement = alertNoteFrame.findElements(By.className("el-collapse-item")).get(i);
                    if (fatherElement.getAttribute("class").contains("is-active")) {
                        WebElement hostAddress = fatherElement.findElements(By.className("el-input__inner")).get(0);
                        WebElement conditions = fatherElement.findElements(By.tagName("input")).get(1);
                        if (address != null && address.trim().length() != 0) {
                            set.iSetTheParameterWithValue(hostAddress, address);
                        }
                        choose.iCancelAllSelectionExcept(getSelectors(conditions), condition);
                    }
                }
            }
        } catch (NoSuchElementException e) {
            throw new NoSuchElementException("没有选择告警方式");
        }
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getMessage() {
        return super.getErrorMessage();
    }

    private WebElement getSelectors(WebElement element) {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        element.click();
//        List<WebElement> list = webDriver.findElements(By.className("el-select-dropdown__list"));
//        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(list.get(list.size() - 1)));
        return super.getLastDropdownList();
    }

    private List<String> getAlertNoteTitle() {
        List<String> list = new ArrayList<>();
        List<WebElement> webElements = alertNoteFrame.findElements(By.className("method-title"));
        int l = webElements.size();
        if (l == 0) {
            throw new NoSuchElementException("没有选择告警方式");
        } else {
            for (int i = 0; i < l; i++) {
                list.add(webElements.get(i).getText());
            }
            return list;
        }
    }

    // 添加告警类型下拉框按钮
    @FindBy(className = "add-config-dropdown-button")
    private WebElement addAlertNoteTypeButton;
    private WebElement getAlertNoteTypes() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(addAlertNoteTypeButton));
        addAlertNoteTypeButton.click();
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(webDriver.findElement(By.className("add-config-dropdown-menu"))));
        return webDriver.findElement(By.className("add-config-dropdown-menu"));
    }

    public void createAlert(String alertName, List<String> alertGroup, List<String> alertSource, List<String> alertLevel) {
        SetKeyWithValue setKey = new SetKeyWithValue();
        IChooseValueFromSelectList choose = new IChooseValueFromSelectList();
        setKey.iSetTheParameterWithValue(getAlertName(), alertName);
        choose.iChooseTheFromThe(alertGroup, getAlertGroups());
        choose.iChooseTheFromThe(alertSource, getAlertSources());
        setKey.iSetTheParameterWithValue(getSearchContent(), "*");
        setKey.iSetTheParameterWithValue(getAlertTriggerInput(), "5");
        switch (alertLevel.size()) {
            case 1:
                setKey.iSetTheParameterWithValue(getAlertLevelInput(), alertLevel.get(0));
                break;
            case 2:
                setKey.iSetTheParameterWithValue(getAlertLevelInput(), alertLevel.get(0));
                getAddThresholdButton().click();
                setKey.iSetTheParameterWithValue(getMiddleLevelInput(), alertLevel.get(1));
                break;
            case 3:
                setKey.iSetTheParameterWithValue(getAlertLevelInput(), alertLevel.get(0));
                getAddThresholdButton().click();
                setKey.iSetTheParameterWithValue(getMiddleLevelInput(), alertLevel.get(1));
                getAddThresholdButton().click();
                setKey.iSetTheParameterWithValue(getHighLevelInput(), alertLevel.get(2));
        }
        getSaveButton().click();
    }

//    public static void main(String args[]) throws InterruptedException {
//
//        SharedDriver driver = new SharedDriver();
//        ConfigManager c = new ConfigManager();
//        GetLogger.getLogger().debug("test");
//        GetLogger.getLogger().info("test");
//        GetLogger.getLogger().warn("test");
//        LoginBeforeAllTests login = new LoginBeforeAllTests(driver, c);
//        login.beforeScenario();
//        Thread.sleep(10000);
//        driver.get("http://alltest.rizhiyi.com/alerts/new/");
//        CreatePage p = new CreatePage(driver);
//        Thread.sleep(2000);
////        p.getCreateAlert().click();
////        Thread.sleep(10000);
////        new CreatePage(driver).tabs.get(2).click();
////        new CreatePage(driver).rsyslogType("192.168.1.82:514",
////                new ArrayList<String>(Arrays.asList("UDP")),
////                new ArrayList<String>(Arrays.asList("INFO")),"local0",
////                new ArrayList<String>(Arrays.asList("")),"{{ alert.name }}|{{ alert.strategy.trigger.start_time|date:\"Y-m-d H:i:s\" }}|{{ alert.strategy.trigger.end_time|date:\"Y-m-d H:i:s\" }}|{{ alert.search.query }}");
//        List list = new ArrayList<>();
//        List list1 = new ArrayList<>();
//        List list2 = new ArrayList<>();
//        list.add("default_Alert");
//        list1.add("所有日志");
//        list2.add("1");
//        list2.add("3");
//        list2.add("10");
//
//        new CreatePage(driver).createAlert("autotest", list, list1, list2);
//        driver.quit();
//    }


    @FindBy(xpath = "//span[text()='执行一次']//preceding-sibling::span/input[@placeholder='请输入']")
    private WebElement period;

    public WebElement getPeriod() {
        return period;
    }

    @FindBy(xpath = "//div[text()='crontab']/ancestor::span")
    private WebElement crontab;

    public WebElement getCrontab() {
        return crontab;
    }

    //    @FindBy(xpath = "//div[text()='crontab']/ancestor::span/ancestor::span/following-sibling::div//input")
    @FindBy(xpath = "//label[contains(text(),'执行计划')]/following::div[text()='crontab']/following::input[@placeholder='请输入']")
    private WebElement crontabInput;

    public WebElement getCrontabInput() {
        return crontabInput;
    }

    // 执行计划输入框 定时激活时为输入框和单位下拉框;crontab激活时为输入框
    @FindBy(xpath = "//div[@class='el-form-item__content']/div[@class='el-row']//input")
    private List<WebElement> alertPlanInputs;

    // 执行计划-crontab-输入框
    public WebElement getAlertPlanCrontabInput() {
        if (alertPlanCrontabButton.findElement(By.xpath("./parent::label")).getAttribute("class").contains("is-active")) {
            return alertPlanInputs.get(0);
        } else {
            throw new NoSuchElementException("crontab按钮未激活");
        }
    }

    // 执行计划-crontab按钮
//    @FindBy(xpath = "//span[@class='el-radio-button__inner'][text()='crontab']")
    @FindBy(xpath = "//label[contains(text(),'执行计划')]/following::div[text()='crontab']/parent::span/parent::label")
//    @FindBy(xpath = "//input[@name='frequencyRadio']/parent::span/parent::label")
    private WebElement alertPlanCrontabButton;

    public WebElement getAlertPlanCrontabButton() {
//        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(alertPlanCrontabButton));
        return alertPlanCrontabButton;
    }

    @FindBy(xpath = "//label[contains(text(),'接收者')]/following::div[@yotta-test='alert-alert_methods_email_account_group-select']")
    private WebElement mailReceiverButton;

    public WebElement getMailReceiverButton() {
        return mailReceiverButton;
    }

//    @FindBy(xpath = "//label[contains(text(),'接收者')]/following::input")
    @FindBy(xpath = "//label[contains(text(),'接收者')]/following::div[@yotta-test='alert-alert_methods_email_account_group-select']//input")
    private WebElement mailReceiver;

    public WebElement getMailReceiver() {
        return mailReceiver;
    }

//    @FindBy(xpath = "//label[contains(text(),'接收者')]/following::div[@class='ant-select-selection__rendered']/ul/li")
    @FindBy(xpath = "//label[contains(text(),'接收者')]/following::div[@yotta-test='alert-alert_methods_email_account_group-select']")
    private WebElement mailReceiverList;

    public WebElement getMailReceiverList() {
        mailReceiverList.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'接收者')]/parent::div")
    private WebElement mailReceiverLabel;

    public WebElement getMailReceiverLabel() {
        return mailReceiverLabel;
    }

    @FindBy(xpath = "//textarea[@yotta-test='alert-alert_methods_textarea-textarea']")
    private WebElement mailAlertContentPanel;

    public WebElement getMailAlertContentPanel() {
//        mailAlertContentPanel.sendKeys(Keys.END);
//        mailAlertContentPanel.sendKeys(Keys.BACK_SPACE);
//        mailAlertContentPanel.sendKeys(Keys.SHIFT, Keys.HOME);
        return mailAlertContentPanel;
    }

    //@FindBy(xpath = "//div[contains(text(),'邮件告警')][@class='ant-collapse-header']")
    @FindBy(xpath = "//div[@yotta-test='alert-alert_methods-panel']//span[contains(text(),'邮件告警')]")
    private WebElement mailAlertLabel;

    public WebElement getMailAlertLabel() {
        return mailAlertLabel;
    }

    @FindBy(xpath = "//div[@yotta-test='alert-alert_methods-panel']//span[contains(text(),'邮件告警')]/following-sibling::span[@yotta-test='alert-alert_methods_delete-icon']")
    private WebElement delMailAlertLabel;

    public WebElement getDelMailAlertLabel() {
        return delMailAlertLabel;
    }

    //预览窗口提示
    @FindBy(xpath = "//div[@yotta-test='alert-alert_methods_preview-modal']//span[contains(text(),'提示')]")
    private WebElement previewReminder;

    public WebElement getPreviewReminder() {
        return previewReminder;
    }

    //预览提示中监控名称
    @FindBy(xpath = "//div[@class='yotta-modal-body']/div[@class='HTIw3Zf6MVpXrv-OFu2L8']")
    private WebElement previewAlertReminderText;

    public WebElement getPreviewAlertReminderText() {
        return previewAlertReminderText;
    }

    @FindBy(xpath = "//span[text()='测试运行']/parent::button[@yotta-test='alert-alert_methods_attempt_run-button']")
    private WebElement testRunButton;
    public WebElement getTestRunButton() {
        return testRunButton;
    }

    //测试运行窗口提示
    @FindBy(xpath = "//div[@class='ant-modal-header']/div[@id='rcDialogTitle0'][@class='ant-modal-title'][contains(text(),'提示')]")
    private WebElement testRunReminder;

    public WebElement getTestRunReminder() {
        return testRunReminder;
    }

    //测试运行中监控名称
    @FindBy(xpath = "//div[@class='ant-modal-content']//p[@class='_1JjlGgMGUnJmBrqR_9PZl8'][contains(text(),'测试运行完成')]")
    private WebElement testRunReminderText;

    public WebElement getTestRunReminderText() {
        return testRunReminderText;
    }

    //确认
    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement affirmButton;

    public WebElement getAffirmButton() {
        return affirmButton;
    }

    //
    @FindBy(xpath = "//span[contains(text(),'添加告警方式')]")
    private WebElement addAlertTypeButton;
    public WebElement getAddAlertTypeButton()
    {
        return addAlertTypeButton;
    }

    private WebElement alertNoteTypeListButton;

    public WebElement getAlertNoteTypeListButton() {
        //String xpath = "//span[text()='添加告警方式']/following::span[text()='请选择类型']/following-sibling::i";
//      String xpath = "//ul[@yotta-test='alert-plugin_names-menu']";
        String xpath = "//span[contains(text(),'添加告警方式')]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getAlertNoteTypeDropdownList();
    }

    @FindBy(xpath = "//*[@yotta-test='alert-app-select']/div")
    private WebElement beforeDeleteApp;

    public WebElement getBeforeDeleteApp() {
        return beforeDeleteApp;
    }

    @FindBy(xpath = "//span[@aria-label='CloseCircleFilled']")
    private WebElement deleteApp;

    public WebElement getDeleteApp() {
        return deleteApp;
    }
}
