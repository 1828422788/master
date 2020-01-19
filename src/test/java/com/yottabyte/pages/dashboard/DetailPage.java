package com.yottabyte.pages.dashboard;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.Paging;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
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

    @FindBy(className = "el-loading-mask")
    private WebElement loading;

    @FindBy(xpath = "//span[contains(text(),'确定')]")
    private List<WebElement> ensureList;

    @FindBy(className = "icon-guolvxuanting_icon")
    private WebElement showFilter;

    @FindBy(className = "control-panel-content")
    private WebElement filter;

    @FindBy(className = "el-switch__label--left")
    private WebElement clickableButton;

    @FindBy(className = "el-switch__label--right")
    private WebElement openEdit;

    @FindBy(className = "icon-tianjiatubiaoxuanting_icon")
    private WebElement addButton;

    @FindBy(className = "icon-yichuyiruxuanting_icon")
    private WebElement moveButton;

    @FindBy(className = "icon-gengxinxuanting_icon")
    private WebElement refreshButton;

    @FindBy(className = "icon-cunweibaobiao_icon")
    private WebElement saveAsReportButton;

    @FindBy(className = "icon-yejianxuanting_icon")
    private WebElement nightModeButton;

    @FindBy(className = "icon-quanpingxuanting_icon")
    private WebElement fullScreenButton;

    @FindBy(className = "el-checkbox")
    private List<WebElement> checkBox;

    @FindBy(className = "el-tabs__item")
    private List<WebElement> tabList;

    @FindBy(className = "icon-qiehuan1")
    private WebElement switchButton;

    @FindBy(className = "dash-switch-ul")
    private WebElement dropdownList;

    @FindBy(className = "icon-guanbianniu")
    private WebElement closeTag;

    @FindBy(className = "dropdown-link-btn")
    private WebElement dropDownLinkButton;

    @FindBy(xpath = "//span[contains(text(),'恢复')][@class='action']")
    private WebElement recoverTag;

    @FindBy(xpath = "//span[contains(text(),'移出')][@class='action']")
    private WebElement moveoutTag;

    @FindBy(className = "ant-message-success")
    private WebElement successMessage;

    @FindBy(xpath = "//span[contains(text(),'删除')][@class='action']")
    private WebElement deleteTag;

    @FindBy(xpath = "//i[@class='anticon css-ifnfqv ant-dropdown-trigger']")
    private WebElement addEventButton;

    @FindBy(className = "yw-dropdown-menu")
    private List<WebElement> eventList;

    @FindBy(xpath = "//label[contains(text(),'输入类型')]/following-sibling::div//button")
    private WebElement inputType;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement addChoiceValueButton;

    @FindBy(xpath = "//div[@class='el-form-item dynamic-search-btn']//span")
    private WebElement searchInputButton;

    @FindBy(xpath = "//label[contains(text(),'搜索内容')]/following-sibling::div//textarea")
    private WebElement searchInput;

    @FindBy(xpath = "//label[contains(text(),'标题')]/following-sibling::div//input[@class='el-input__inner']")
    private List<WebElement> titleList;

    @FindBy(xpath = "//div[@class='control']/following-sibling::span")
    private WebElement labelName;

    @FindBy(className = "yw-tab-header-content")
    private WebElement header;

    @FindBy(className = "circular")
    private WebElement circular;

    @FindBy(xpath = "//a[contains(text(),'UIautotest')]")
    private WebElement uiautotest;

    @FindBy(xpath = "//a[contains(text(),'测试标签页移出')]")
    private WebElement testMoveTag;

    @FindBy(className = "icon-tianjiatubiao_icon")
    private WebElement addTag;

    @FindBy(xpath = "//span[text()='单选']")
    private WebElement radio;

    @FindBy(xpath = "//span[text()='多选']")
    private WebElement multiSelect;

    @FindBy(xpath = "(//label[contains(text(),'可选值')]/following-sibling::div//input[@class='el-input__inner'])[last()]")
    private WebElement choiceValue;

    @FindBy(xpath = "//*[@placeholder='请输入趋势图名称']")
    private WebElement trendName;

    @FindBy(xpath = "//span[contains(text(),'仪表盘所用趋势图')]")
    private WebElement dashboardTrend;

    @FindBy(xpath = "//span[contains(text(),'仪表盘1669所用趋势图')]")
    private WebElement dashboardTrend1669;

    @FindBy(className = "icon-gengduopeizhi")
    private WebElement chartSetting;

    @FindAll({
            @FindBy(className = "yw-table-head"), @FindBy(className = "table-body-td")})
    private List<WebElement> tableList;

    @FindBy(className = "el-textarea__inner")
    private WebElement spl;

    @FindBy(xpath = "(//*[@class='el-dialog__body']/following-sibling::div//button/span[contains(text(),'确定')])[last()]")
    private WebElement settingEnsure;

    @FindBy(xpath = "//*[@class='img iconfont icon-shanchuxuanting_icon el-tooltip']")
    private WebElement deleteChart;

    @FindBy(xpath = "//div[text()='是否删除图表?']/ancestor::div[@class='el-dialog el-dialog--tiny']//button")
    private WebElement ensureDeleteChart;

    @FindBy(xpath = "//*[@class='img iconfont icon-shezhi_icon']")
    private WebElement setting;

    @FindBy(xpath = "//div[@class='settings-content']//i")
    private WebElement fieldValue;

    @FindBy(className = "widget-chart-settings-content")
    private WebElement content;

    @FindBy(className = "icon-gengduopeizhi")
    private WebElement config;

    @FindBy(tagName = "textarea")
    private WebElement textarea;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu yw-dropdown-menu'])[last()]//span[text()='通用配置']")
    private WebElement configs;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu yw-dropdown-menu'])[last()]//span[text()='高级编辑']")
    private WebElement edit;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu yw-dropdown-menu'])[last()]//span[text()='恢复初始']")
    private WebElement recover;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu yw-dropdown-menu'])[last()]//span[text()='钻取配置']")
    private WebElement drillSetting;

    @FindBy(xpath = "//span[contains(text(),'校验')]/ancestor::button/following-sibling::button")
    private WebElement ensureEdit;

    @FindBy(xpath = "//span[@class='trend-title']/span")
    private WebElement trendTitle;

    @FindBy(xpath = "//span[text()='second'][@class='main']")
    private WebElement main;

    @FindBy(xpath = "//div[@x-placement]")
    private WebElement remarkInfo;

    @FindBy(xpath = "//*[@class='img iconfont icon-beizhu_icon']")
    private WebElement remark;

    @FindBy(className = "el-pagination__total")
    private WebElement totalPage;

    @FindBy(xpath = "(//*[text()='{'])")
    private WebElement input;

    @FindBy(xpath = "//li[contains(text(),'清空JSON')]")
    private WebElement cleanJson;

    //    @FindBy(id = "jsoneditor")
    @FindBy(className = "ace_text-input")
    private WebElement jsonEditor;

    @FindBy(className = "el-icon-loading")
    private WebElement iconLoading;

    @FindBy(xpath = "//label[contains(text(),'默认值')]/following-sibling::div//i")
    private WebElement defaultValueIcon;

    @FindBy(xpath = "//td[@data-col-name='a_']")
    private WebElement singleChartFieldA;

    @FindBy(className = "yw-single-chart-static")
    private WebElement singleChartStatic;

    @FindBy(className = "widget-chartType-selection-popover")
    private WebElement selectionPopover;

    @FindBy(xpath = "//div[@class='el-dialog__wrapper yw-modal-plain yw-selection-modal dialog-fade-leave-active dialog-fade-leave-to']")
    private WebElement fadingLeave;

    @FindBy(xpath = "//span[contains(text(),'生成')]")
    private WebElement generate;

    @FindBy(className = "el-progress--line")
    private WebElement progress;

    @FindBy(xpath = "//span[text()='添加颜色范围']")
    private WebElement addColourRange;

    @FindBy(className = "chart-color-selector-trigger")
    private WebElement colorTrigger;

    @FindBy(xpath = "(//span[contains(@style,'background: rgb(37, 155, 36);')])[last()]")
    private WebElement green;

    @FindBy(className = "single-chart-background-base")
    private WebElement BackgroundColour;

    @FindBy(className = "main")
    private WebElement mainTitle;

    @FindBy(className = "yw-single-chart-container")
    private WebElement chartContainer;

    @FindBy(tagName = "table")
    private WebElement table;

    @FindBy(tagName = "thead")
    private WebElement tableHeader;

    @FindBy(xpath = "//i[@class='el-icon-check el-icon--right']")
    private WebElement checkRight;

    @FindBy(className = "drowdown-link")
    private WebElement dropdownLink;

    @FindBy(className = "message")
    private WebElement message;

    @FindBy(xpath = "//span[@class='img iconfont icon-beizhu_icon']")
    private WebElement describe;

    @FindBy(xpath = "//div[@x-placement]")
    private WebElement describeText;

    @FindBy(xpath = "//span[text()='操作']")
    private WebElement operate;

    @FindBy(xpath = "//span[text()='江苏']")
    private WebElement jiangsu;

    @FindBy(xpath = "//span[text()='南京市']")
    private WebElement nanjing;

    @FindBy(xpath = "//input[@placeholder='请选择钻取动作']/preceding-sibling::i")
    private WebElement drillAction;

    @FindBy(xpath = "//label[contains(text(),'自定义URL')]/following-sibling::div//textarea")
    private WebElement url;

    @FindBy(xpath = "//span[text()='自定义']")
    private WebElement custom;

    @FindBy(xpath = "(//input[@placeholder='请选择时间范围'])[last()]")
    private WebElement dateEditor;

    @FindBy(className = "el-cascader__label")
    private WebElement targetTag;

    @FindBy(className = "el-cascader-menu")
    private List<WebElement> menuList;

    @FindBy(xpath = "//label[contains(text(),'目标参数')]/following-sibling::div//i[@class='el-input__icon el-icon-arrow-up']")
    private WebElement targetParam;

    @FindBy(xpath = "(//ul[@class='el-select-group'])[1]")
    private WebElement inputGroup;

    @FindBy(xpath = "//span[text()='=']/following-sibling::div//i")
    private WebElement paramValue;

    @FindBy(className = "is-multiple")
    private WebElement paramDropdown;

    @FindBy(xpath = "//div[text()='${click.value2}']")
    private WebElement clickValue;

    @FindBy(xpath = "//td[@data-col-name='apache.geo.city']")
    private WebElement geoCity;

    @FindBy(xpath = "//span[contains(text(),'添加事件列表')]/ancestor::div[@class='el-dialog el-dialog--tiny']//button[@class='el-button yw-modal-btn yw-modal-btn-primary el-button--primary']")
    private WebElement addEventEnsure;

    @FindBy(className = "el-icon-caret-right")
    private WebElement iconRight;

    @FindBy(xpath = "//span[text()='apache.geo.city']/ancestor::td/following-sibling::td")
    private WebElement cityTd;

    @FindBy(xpath = "(//div[@class='filter-title']/following-sibling::div[@class='el-select'])[last()]")
    private WebElement filterDropdown;

    @FindBy(xpath = "//span[text()='filter']")
    private WebElement filterName;

    @FindBy(xpath = "(//span[text()='000000001203094955'])[2]")
    private WebElement entry;

    @FindBy(xpath = "(//a[@class='item-menu-btn iconfont icon-shezhixuanting_icon'])[last()]")
    private WebElement filterSetting;

    @FindBy(xpath = "(//a[@class='item-menu-btn iconfont icon-shanchuxuanting_icon'])[last()]")
    private WebElement filterDelete;

    @FindBy(xpath = "//span[contains(text(),'删除过滤项')]/ancestor::div[@class='el-dialog el-dialog--tiny']//button")
    private WebElement ensureDeleteFilter;

    @FindBy(xpath = "//span[contains(text(),'删除输入项')]/ancestor::div[@class='el-dialog el-dialog--tiny']//button")
    private WebElement ensureDeleteInput;

    @FindBy(xpath = "//span[text()='单选']/ancestor::label")
    private WebElement singleChoice;

    @FindBy(xpath = "(//div[@class='filter-title']/following-sibling::div//input)[last()]")
    private WebElement filterInput;

    @FindBy(xpath = "//span[text()='appname']")
    private WebElement appname;

    @FindBy(xpath = "//label[contains(text(),'预览')]/following-sibling::div")
    private WebElement preview;

    @FindBy(xpath = "//span[contains(text(),'仪表盘return')]/ancestor::div[@class='widget-control-panel']/following-sibling::div//*[@class='yw-table-head' or @class='table-body-td']")
    private List<WebElement> returnList;

    @FindBy(xpath = "//span[contains(text(),'仪表盘workflow')]/ancestor::div[@class='widget-control-panel']/following-sibling::div//*[@class='yw-table-head' or @class='table-body-td']")
    private List<WebElement> workflowList;

    @FindBy(xpath = "//i[@class='el-icon-search']")
    private WebElement openInSearch;

    @FindBy(xpath = "//span[text()='49']")
    private WebElement countNum;

    @FindBy(className = "custom-title")
    private WebElement customTitle;

    @FindBy(xpath = "//label[contains(text(),'图表描述')]/following-sibling::div//textarea")
    private WebElement chartDesc;

    @FindBy(className = "icon-fanyeqishangjiantou")
    private WebElement eventIcon;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu field-dropdown-menu'])[last()]/li[text()='仪表盘测试事件列表']")
    private WebElement event;

    @FindBy(xpath = "//span[text()='appname']")
    private WebElement eventAppname;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu field-dropdown-menu'])[last()]/li[text()='实时查看']")
    private WebElement realTime;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu field-dropdown-menu'])[last()]/li[text()='配置字段提取']")
    private WebElement createConfig;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu field-dropdown-menu'])[last()]/li[text()='添加到知识库']")
    private WebElement addKnowledge;

    @FindBy(xpath = "//div[@class='ant-dropdown ant-dropdown-placement-bottomRight']/ul")
    private WebElement addChartDropdown;

    @FindBy(xpath = "//i[@class='anticon css-ifnfqv']")
    private List<WebElement> iconList;

    public WebElement getType() {
        return iconList.get(3);
    }

    public WebElement getCreateConfig() {
        return createConfig;
    }

    public WebElement getAddKnowledge() {
        return addKnowledge;
    }

    public WebElement getRealTime() {
        return realTime;
    }

    public WebElement getEventAppname() {
        return eventAppname;
    }

    public WebElement getEvent() {
        return event;
    }

    public WebElement getEventIcon() {
        return eventIcon;
    }

    public WebElement getChartDesc() {
        return chartDesc;
    }

    public WebElement getCustomTitle() {
        return customTitle;
    }

    public WebElement getCountNum() {
        return countNum;
    }

    public WebElement getOpenInSearch() {
        return openInSearch;
    }

    public List<WebElement> getWorkflowList() {
        return workflowList;
    }

    public List<WebElement> getReturnList() {
        return returnList;
    }

    public WebElement getEntry() {
        return entry;
    }

    public WebElement getPreview() {
        return preview;
    }

    public WebElement getMultiSelect() {
        return multiSelect;
    }

    public WebElement getEnsureDeleteInput() {
        return ensureDeleteInput;
    }

    public WebElement getAppname() {
        return appname;
    }

    public WebElement getFilterInput() {
        return filterInput;
    }

    public WebElement getSingleChoice() {
        return singleChoice;
    }

    public WebElement getEnsureDeleteFilter() {
        return ensureDeleteFilter;
    }

    public WebElement getFilterDelete() {
        return filterDelete;
    }

    public WebElement getFilterSetting() {
        return filterSetting;
    }

    public WebElement getFilterName() {
        return filterName;
    }

    public WebElement getUpdate() {
        return super.getContainsTextButton("更新");
    }

    public WebElement getFilterDropdown() {
        filterDropdown.click();
        return this.getLastDropdownList();
    }

    public WebElement getCityTd() {
        return cityTd;
    }

    public WebElement getIconRight() {
        return iconRight;
    }

    public WebElement getAddEventEnsure() {
        return addEventEnsure;
    }

    public WebElement getGeoCity() {
        return geoCity;
    }

    public WebElement getClickValue() {
        return clickValue;
    }

    public WebElement getParamDropdown() {
        return paramDropdown;
    }

    public WebElement getParamValue() {
        return paramValue;
    }

    public WebElement getInputGroup() {
        return inputGroup;
    }

    public WebElement getTargetParam() {
        return targetParam;
    }

    public WebElement getNanjing() {
        return nanjing;
    }

    public WebElement getDashboardMenu() {
        return menuList.get(0);
    }

    public WebElement getTagMenu() {
        return menuList.get(1);
    }

    public WebElement getTargetTag() {
        return targetTag;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getDashboardTrend1669() {
        return dashboardTrend1669;
    }

    // 获取今天按钮
    public WebElement getToday() {
        return GetTime.getTime(webDriver, "Today");
    }

    public WebElement getCustom() {
        return custom;
    }

    public WebElement getUrl() {
        return url;
    }

    public WebElement getDrillAction() {
        return drillAction;
    }

    public WebElement getDrillSetting() {
        return drillSetting;
    }

    public WebElement getJiangsu() {
        return jiangsu;
    }

    public WebElement getDescribeText() {
        return describeText;
    }

    public WebElement getDescribe() {
        return describe;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getSearch() {
        return super.getContainsTextButton("搜索");
    }

    public WebElement getSearchLoading() {
        return super.getContainsTextButton("搜索中");
    }

    public WebElement getDropdownLink() {
        return dropdownLink;
    }

    public WebElement getCheckRight() {
        return checkRight;
    }

    public WebElement getTableHeader() {
        return tableHeader;
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getRecover() {
        return recover;
    }

    public WebElement getChartContainer() {
        return chartContainer;
    }

    public WebElement getMainTitle() {
        return mainTitle;
    }

    public WebElement getBackgroundColour() {
        return BackgroundColour;
    }

    public WebElement getGreen() {
        return green;
    }

    public WebElement getColorTrigger() {
        return colorTrigger;
    }

    public WebElement getBackground() {
        return this.getTagText("背景");
    }

    public WebElement getText() {
        return this.getTagText("字体");
    }

    public WebElement getStartColour() {
        return super.findInputByPlaceholder("开始");
    }

    public WebElement getEndColour() {
        return super.findInputByPlaceholder("结束");
    }

    public WebElement getAddColourRange() {
        return addColourRange;
    }

    public WebElement getRange() {
        return this.getTagText("按区间");
    }

    public WebElement getExhibition() {
        return this.getTagText("展示");
    }

    public WebElement getProgress() {
        return progress;
    }

    public WebElement getFadingLeave() {
        return fadingLeave;
    }

    public WebElement getSelectionPopover() {
        return selectionPopover;
    }

    public WebElement getSingle() {
        return this.getChart("single");
    }

    private WebElement getChart(String chartName) {
        return webDriver.findElement(By.xpath("(//div[@class='option-img " + chartName + "'])[last()]"));
    }

    public WebElement getSingleChartStatic() {
        return singleChartStatic;
    }

    public WebElement getSingleChartFieldA() {
        return singleChartFieldA;
    }

    public WebElement getIconLoading() {
        return iconLoading;
    }

    public WebElement getTestMoveTag() {
        return testMoveTag;
    }

    public WebElement getJsonEditor() {
        webDriver.findElement(By.id("jsoneditor")).click();
        return jsonEditor;
    }

    public WebElement getCleanJson() {
        return cleanJson;
    }

    public WebElement getOperate() {
        return operate;
    }

    public WebElement getInput() {
        return input;
    }

    public WebElement getTotalPage() {
        return totalPage;
    }

    public WebElement getRemark() {
        return remark;
    }

    public WebElement getRemarkInfo() {
        return remarkInfo;
    }

    public WebElement getMain() {
        return main;
    }

    public WebElement getTrendTitle() {
        return trendTitle;
    }

    public WebElement getCheck() {
        return super.getContainsTextButton("校验");
    }

    public WebElement getEnsureEdit() {
        return ensureEdit;
    }

    public WebElement getEdit() {
        return edit;
    }

    public WebElement getTextarea() {
        return textarea;
    }

    public WebElement getConfig() {
        return config;
    }

    public WebElement getContent() {
        return content;
    }

    public WebElement getGenerate() {
        return generate;
    }

    public WebElement getFieldValue() {
        fieldValue.click();
        return getLastDropdownList();
    }

    public WebElement getSetting() {
        return setting;
    }

    public WebElement getEnsureDeleteChart() {
        return ensureDeleteChart;
    }

    public WebElement getDeleteChart() {
        return deleteChart;
    }

    public WebElement getSettingEnsure() {
        return settingEnsure;
    }

    public WebElement getSpl() {
        return spl;
    }

    public WebElement getConfigs() {
        return configs;
    }

    public List<WebElement> getTableList() {
        return tableList;
    }

    public WebElement getChartSetting() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(chartSetting));
        return chartSetting;
    }

    public WebElement getDashboardTrend() {
        return dashboardTrend;
    }

    public WebElement getTrendName() {
        return trendName;
    }

    public WebElement getRadio() {
        return radio;
    }

    public WebElement getAddTag() {
        return addTag;
    }

    public WebElement getUIautotest() {
        return uiautotest;
    }

    public WebElement getCircular() {
        return circular;
    }

    public WebElement getHeader() {
        return header;
    }

    public WebElement getOpenEdit() {
        return openEdit;
    }

    public WebElement getLabelName() {
        return labelName;
    }

    public WebElement getInputTitle() {
        return titleList.get(titleList.size() - 1);
    }

    public WebElement getSearchInputButton() {
        return searchInputButton;
    }

    // 获取本月按钮
    public WebElement getThisMonth() {
        return GetTime.getTime(webDriver, "ThisMonth");
    }

    public WebElement getTimeRange() {
        return super.getInputElement("搜索时间");
    }

    public WebElement getDefaultDropdownList() {
        defaultValueIcon.click();
        return getLastDropdownList();
    }

    public WebElement getDynamicField() {
        return this.getInputElement("动态字段");
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getAddChoiceValueButton() {
        return addChoiceValueButton;
    }

    public WebElement getInputType() {
        inputType.click();
        return eventList.get(eventList.size() - 1);
    }

    public WebElement getFilterTitle() {
        return getInputElement("标题");
    }

    public WebElement getChoiceValue() {
        return choiceValue;
    }

    public WebElement getFilterToken() {
        return getInputElement("标识");
    }

    public WebElement getFilterField() {
        return getInputElement("过滤字段");
    }

    public WebElement getFilterDefaultValue() {
        return getInputElement("默认值");
    }

    public WebElement getPrefix() {
        return getInputElement("标识前缀");
    }

    public WebElement getPrefixValue() {
        return getInputElement("标识值前缀");
    }

    public WebElement getSuffixValue() {
        return getInputElement("标识值后缀");
    }

    public WebElement getSuffix() {
        return getInputElement("标识后缀");
    }

    public WebElement getSeparate() {
        return getInputElement("分隔符");
    }

    public WebElement getEventList() {
        return addChartDropdown;
    }

    public WebElement getAddEventButton() {
        return addEventButton;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getDeleteTag() {
        return deleteTag;
    }

    public WebElement getRecoverTag() {
        return recoverTag;
    }

    public WebElement getMoveoutTag() {
        return moveoutTag;
    }

    public WebElement getDropDownLinkButton() {
        return dropDownLinkButton;
    }

    public WebElement getCloseTag() {
        return closeTag;
    }

    public WebElement getDropdownList() {
        return dropdownList;
    }

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getTab() {
        return tabList.get(tabList.size() - 1);
    }

    public List<WebElement> getCheckBox() {
        return checkBox;
    }

    public WebElement getSaveAsReportButton() {
        return saveAsReportButton;
    }

    public WebElement getNightModeButton() {
        return nightModeButton;
    }

    public WebElement getFullScreenButton() {
        return fullScreenButton;
    }

    public WebElement getAddButton() {
        return addButton;
    }

    public WebElement getMoveButton() {
        return moveButton;
    }

    public WebElement getRefreshButton() {
        return refreshButton;
    }

    public WebElement getClickableButton() {
        return clickableButton;
    }

    public WebElement getFilter() {
        return filter;
    }

    public WebElement getShowFilter() {
        return showFilter;
    }

    public WebElement getTagName() {
        return getNewInputElement("名称");
    }

    public WebElement getEnsureCreateTagButton() {
        return super.getButton("确定");
    }

    public WebElement getEnsureMoveTagButton() {
        return ensureList.get(4);
    }

    public WebElement getEnsureDeleteTagButton() {
        return ensureList.get(6);
    }

    public WebElement getEnsureCreateFilter() {
        return ensureList.get(8);
    }

    public WebElement getEnsureCreateInput() {
        return ensureList.get(9);
    }

    public WebElement getChartTitle() {
        return this.getInputElement("图表标题");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/following-sibling::div//input"));
    }

    public WebElement getLastDropdownList() {
        String className = "el-select-dropdown__list";
        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        WebElement li = lastDropdownList.findElement(By.xpath(".//li"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return lastDropdownList;
    }

    private WebElement getTagText(String text) {
        return webDriver.findElement(By.xpath("//div[contains(text(),'" + text + "')]"));
    }

    private WebElement getNewInputElement(String name) {
        String xpath = "//span[contains(text(),'" + name + "')]/following-sibling::span/input";
        return webDriver.findElement(By.xpath(xpath));
    }
}
