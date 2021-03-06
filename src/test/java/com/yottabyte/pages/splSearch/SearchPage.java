package com.yottabyte.pages.splSearch;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.DateEditorPage;
import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.*;
import com.yottabyte.webDriver.SharedDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 搜索页面页面元素
 */
public class SearchPage extends ListPageFactory {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    TakeScreenShot shot = SharedDriver.getScreenShot();
    ExpectedCondition expectedCondition;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//*[@class='ant-select-selection__clear']")
    private WebElement deleteApp;

    @FindBy(xpath = "(//div[@class='event-item'])[1]")
    private WebElement result;

    @FindBy(xpath = "//label[text()='资源标签']/ancestor::div[1]/following-sibling::div/div")
    private WebElement groupComboBox;

    @FindBy(xpath = "//label[text()='资源标签']/ancestor::div[1]/following-sibling::div/div//span[@class='yotta-tag-content']")
    private WebElement selectedTag;

    @FindBy(xpath = "//label[text()='所属应用']/ancestor::div[1]/following-sibling::div/div")
    private WebElement appComboBox;

    @FindBy(xpath = "//label[text()='所属应用']/ancestor::div[1]/following-sibling::div/div//span[@class='yotta-select-selection-value']")
    private WebElement selectedApp;

    @FindBy(xpath = "//div[text()='统计']")
    private WebElement countButton;

    @FindBy(xpath = "//div[text()='模式']")
    private WebElement mode;

    public WebElement getCountButton() {
        return countButton;
    }

    //@FindBy(xpath = "//div[@class='yw-searchbar__inner el-textarea']/textarea")
    @FindBy(className = "CodeMirror")
    private WebElement searchInput;

    /**
     * 已存搜索相关
     */
    @FindBy(xpath = "//span[text()='已存搜索']")
    private WebElement savedSearch;

//    public WebElement getSavedSearch() {
//        return savedSearch;
//    }

    @FindBy(xpath = "//span[text()='已存搜索']")
    private WebElement openSavedSearchButton;

    public WebElement getSavedSearchList() {
//        String xpath = "//div[@yotta-test='search-search_option-dom']/span/span[@aria-label='PlusDown']";
        String xpath = "//span[text()='已存搜索']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getParentElementOfMenuList();
    }

    @FindBy(xpath = "//li/span[text()='新建']")
    private WebElement newSavedSearch;

    public WebElement getNewSavedSearch() {
        openSavedSearchButton.click();
        return newSavedSearch;
    }

    @FindBy(xpath = "//span[contains(@class,'events-title')]")
    private WebElement EventsTitle;

    public WebElement getEventsTitle() {
        return EventsTitle;
    }

    @FindBy(xpath = "//div[@class='yotta-tabs-tab-btn']")
    private WebElement eventButton;

    public WebElement getEventButton() {
        return eventButton;
    }

    @FindBy(xpath = "//li/span[text()='打开列表']")
    private WebElement openSavedSearchList;

    public WebElement getOpenSavedSearchList() {
        openSavedSearchButton.click();
        return openSavedSearchList;
    }

    @FindBy(xpath = "//div[@class='_-0CoYehrr7DsLtA_JylyV']")
    private WebElement chosenSavedSearch;

    public WebElement getChosenSavedSearch() {
        return chosenSavedSearch;
    }

    //    @FindBy(xpath = "//input[@placeholder='请输入已存搜索名称']")
    @FindBy(xpath = "//input[@yotta-test='search-new_savedsearch_name-input']")
    private WebElement savedSearchName;

    public WebElement getSavedSearchName() {
        return savedSearchName;
    }

    public WebElement getEnsureCreateSavedSearch() {
        return super.getButton("确定");
    }

    public WebElement getCancelButton() {
        return super.getButton("取 消");
    }

    @FindBy(className = "yotta-dialog-title")
    private WebElement confirmMessage;

    public WebElement getConfirmMessage() {
        return confirmMessage;
    }

    @FindBy(xpath = "(//div[contains(@class,'help-text')])[1]")
    private WebElement tipText;

    public WebElement getTipText() {
        return tipText;
    }

    @FindBy(xpath = "//div[@class='yw-search-form-el-input normal-input margin-left el-input']/input")
    private WebElement searchSavedList;

    @FindBy(className = "yw-search-allfields")
    private WebElement allFields;

    @FindBy(className = "yotta-dialog-content")
    private WebElement errorMessage;

    @FindBy(xpath = "//div[@class='dialog-title']/i")
    private WebElement closeAllFields;

    @FindBy(className = "yw-fields-tree")
    private WebElement fieldsTree;

    @FindBy(xpath = "//span[text()='java']")
    private WebElement javaField;

    @FindBy(xpath = "//span[text()='appname']")
    private WebElement appName;

    @FindBy(xpath = "//span[text()='apache.resp_len']")
    private WebElement timestamp;

    @FindBy(xpath = "//span[text()='TOP10字段']")
    private List<WebElement> topTen;

    @FindBy(xpath = "//span[text()='去重数']")
    private List<WebElement> removeDuplicate;

    @FindBy(xpath = "//span[text()='总数时序图']")
    private List<WebElement> totalSequence;

    @FindBy(xpath = "//span[text()='过滤选中字段值']")
    private List<WebElement> fileterField;

    @FindBy(xpath = "//span[text()='屏蔽选中字段值']")
    private List<WebElement> shieldField;

    @FindBy(xpath = "(//span[text()='最大值'])[last()]")
    private WebElement maxValue;

    @FindBy(xpath = "(//span[text()='最小值'])[last()]")
    private WebElement minValue;

    @FindBy(xpath = "(//span[text()='平均值统计图'])[last()]")
    private WebElement avgStats;

    @FindBy(xpath = "(//span[text()='平均值时序图'])[last()]")
    private WebElement avgSequential;

    @FindBy(xpath = "//span[text()='全部字段']/following-sibling::i")
    private WebElement closeAllField;

    @FindBy(className = "el-loading-spinner")
    private WebElement loadingSpinner;

    @FindBy(className = "cm-operator")
    private WebElement searchInputValue;

    @FindBy(xpath = "//span[text()='查看上下文']")
    private WebElement context;

    @FindBy(xpath = "//span[text()='搜索']/ancestor::button/preceding-sibling::div//span[@class='yotta-date-time-picker-text']")
    private WebElement timeRange;

    @FindBy(tagName = "thead")
    private WebElement thead;

    @FindBy(xpath = "//span[@yotta-test='search_control-failed-icon']")
    private WebElement errorIcon;

    public WebElement getErrorIcon() {
        return errorIcon;
    }

    public WebElement getSavedSearch() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(openSavedSearchButton));
        openSavedSearchButton.click();
        //List<WebElement> list = webDriver.findElements(By.className("ant-dropdown-menu-item"));
        List<WebElement> list = webDriver.findElements(By.className("yotta-menu-item-primary"));
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(list.get(list.size() - 1)));
        return list.get(list.size() - 1);
    }

    @FindBy(xpath = "//*[@yotta-test='search-new_savedsearch_app-select']/div")
    private WebElement appIcon;

    @FindBy(xpath = "//tbody/tr")
    private List<WebElement> trList;

    public List<WebElement> getTrList() {
        return trList;
    }

    public WebElement getThead() {
        return thead;
    }

    public WebElement getTimeRange() {
        return timeRange;
    }

    public WebElement getContext() {
        return context;
    }

    public WebElement getMode() {
        return mode;
    }

    public WebElement getSearchInputValue() {
        return searchInputValue;
    }

    public WebElement getLoadingSpinner() {
        return loadingSpinner;
    }

    public WebElement getCloseAllField() {
        return closeAllField;
    }

    public WebElement getMaxValue() {
        return maxValue;
    }

    public WebElement getMinValue() {
        return minValue;
    }

    public WebElement getAvgStats() {
        return avgStats;
    }

    public WebElement getAvgSequential() {
        return avgSequential;
    }

    public WebElement getTimestamp() {
        return timestamp;
    }

    public WebElement getShieldField() {
        return shieldField.get(shieldField.size() - 1);
    }

    public WebElement getTotalSequence() {
        return totalSequence.get(totalSequence.size() - 1);
    }

    public WebElement getFileterField() {
        return fileterField.get(fileterField.size() - 1);
    }

    @FindBy(className = "yw-all-fields-list-item")
    private List<WebElement> fieldCheckbox;

    public List<WebElement> getFieldCheckbox() {
        return fieldCheckbox;
    }

    public WebElement getRemoveDuplicate() {
        return removeDuplicate.get(removeDuplicate.size() - 1);
    }

    public WebElement getTopTen() {
        return topTen.get(topTen.size() - 1);
    }

    public WebElement getAppName() {
        return appName;
    }

    public WebElement getJavaField() {
        return javaField;
    }

    public WebElement getSavedFields() {
        return fieldsTree.findElements(By.xpath("./li")).get(0).findElement(By.tagName("ul"));
    }

    public WebElement getUnsavedFields() {
        return fieldsTree.findElements(By.xpath("./li")).get(2).findElement(By.tagName("ul"));
    }

    public WebElement getCloseAllFields() {
        return closeAllFields;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getAllFields() {
        return allFields;
    }

    public WebElement getSearchSavedList() {
        return searchSavedList;
    }

    public WebElement getOpenSavedSearchButton() {
        return openSavedSearchButton;
    }

    // 搜索历史下拉框
    @FindBy(className = "el-collapse-item__wrap")
    private WebElement searchHistoryWindow;

    @FindBy(xpath = "//span[@yotta-test='search_control-message-text']")
    private WebElement searchErrorStatus;

    @FindBy(xpath = "//span[@yotta-test='search_control-time_cost-text']")
    private WebElement searchStatus;

    @FindBy(xpath = "//div[@class='yw-search-tabbar']//div[text()='统计']")
    private WebElement statisticalTab;

    @FindBy(xpath = "//div[@role='tab' and contains(text(),'统计')]")
    private WebElement statsNum;

    @FindBy(xpath = "//div[@class='yw-search-tabbar']//div[text()='事件']")
    private WebElement eventTab;

    @FindBy(xpath = "//div[contains(@class,'yw-search-tabbar-item')]//span")
    private WebElement eventCount;

    @FindBy(xpath = "//div[@class='yw-search-events']/div[@class='yw-search-info']//span")
    private WebElement eventWarningMessage;

    @FindBy(xpath = "//div[contains(@class,'yw-search-stats')]/div[@class='yw-search-info']//span")
    private WebElement statsWarningMessage;

    @FindBy(className = "detail-table")
    private WebElement detailTable;

    @FindBy(className = "yw-search-pages-table")
    private WebElement searchTable;

    @FindBy(className = "yw-search-stats-charts-title-label")
    private List<WebElement> buttons;

    @FindBy(xpath = "//li/span[text()='定时任务']")
    private WebElement timedTask;

    public WebElement getTimedTask() {
        return timedTask;
    }


    @FindBy(xpath = "//li/span[text()='趋势图']")
    private WebElement trend;

    @FindBy(xpath = "//label[text()='描述']/ancestor::div[1]/following-sibling::div//input")
    private WebElement describe;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//label[text()='运行用户']/ancestor::div[1]/following-sibling::div//span[@class='yotta-select-selection-value']")
    private WebElement selectedUser;

    @FindBy(xpath = "//input[@name='frequencyValue']")
    private WebElement period;

    @FindBy(className = "el-input__inner")
    private List<WebElement> selectList;

    @FindBy(xpath = "//span[text()='确定']")
    private List<WebElement> ensure;

    // @FindBy(xpath = "(//span[@aria-label='CheckCircleFilled']/ancestor::div[1]/following-sibling::div//p) | (//span[@aria-label='CheckCircleFilled']/following-sibling::span[@class='yotta-message-content'])")
    @FindBy(xpath = "//div[@yotta-test='dialog-content-dom']/p")
    private WebElement successMessage;

    @FindBy(xpath = "//span[contains(text(),'类型')]")
    private WebElement type;

    @FindBy(className = "yw-search-stats-charts-title-label")
    private List<WebElement> setting;

    @FindBy(xpath = "//div[contains(text(),'复合')]")
    private WebElement compound;

    @FindBy(className = "line")
    private WebElement line;

    @FindBy(className = "icon-sousuowanchengduigou_icon")
    private WebElement searchComplete;

    @FindBy(xpath = "//div[contains(text(),'序列')]")
    private WebElement order;

    @FindBy(xpath = "//div[contains(text(),'其他')]")
    private WebElement other;

    @FindBy(xpath = "//div[contains(text(),'维度')]")
    private WebElement dimension;

    @FindBy(xpath = "//div[contains(text(),'关系')]")
    private WebElement connection;

    @FindBy(className = "wordcloud")
    private WebElement wordcloud;

    @FindBy(className = "single")
    private WebElement single;

    @FindBy(className = "liquidfill")
    private WebElement liquidfill;

    @FindBy(className = "area")
    private WebElement area;

    @FindBy(className = "column")
    private WebElement column;

    // 散点图
    @FindBy(className = "scatter")
    private WebElement scatter;

    @FindBy(className = "rose")
    private WebElement rose;

    // 和弦图
    @FindBy(className = "chord")
    private WebElement chord;

    @FindBy(className = "sankey")
    private WebElement sankey;

    // 力图
    @FindBy(className = "force")
    private WebElement force;

    // 多Y轴图
    @FindBy(className = "multiaxis")
    private WebElement multiaxis;

    // 区间图
    @FindBy(className = "rangeline")
    private WebElement rangeline;

    @FindBy(className = "yw-search-setting-select")
    private WebElement selectData;

    @FindBy(xpath = "//div[contains(text(),'来源')]")
    private WebElement source;

    @FindBy(xpath = "//div[contains(text(),'目标')]")
    private WebElement target;

    @FindBy(xpath = "//div[contains(text(),'切分')]")
    private WebElement cut;

//    @FindBy(xpath = "//span[contains(text(),'生成')]")
//    private WebElement generate;

    @FindBy(xpath = "//div[contains(text(),'权重')]")
    private WebElement weight;

    @FindBy(xpath = "//div[contains(text(),'展示')]")
    private WebElement show;

    @FindBy(className = "sequence")
    private WebElement sequence;

    @FindBy(xpath = "//div[@class='form-label']/following-sibling::div")
    private WebElement startColour;

    @FindBy(xpath = "//span[@style='background: rgb(233, 30, 99);']")
    private WebElement pink;

    @FindBy(xpath = "//div[contains(text(),'标记')]")
    private WebElement mark;

    @FindBy(className = "popover-setting-group-item")
    private List<WebElement> yaxis;

    @FindBy(className = "yw-search-setting-select")
    private List<WebElement> yaxisGroup;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div")
    private WebElement runningUser;

    @FindBy(xpath = "//label[text()='分组']/following-sibling::div")
    private WebElement group;

    @FindBy(xpath = "(//span[text()='确定']/ancestor::button)[last()]")
    private WebElement ensureButton;

    @FindBy(className = "el-icon--right")
    private WebElement arrowDown;

    @FindBy(className = "el-tree-node__content")
    private List<WebElement> nodeList;

    @FindBy(xpath = "//i[@class='yw-search-control-icon iconfont icon-cunweibaobiao_icon']")
    private WebElement saveAsReport;

    @FindBy(className = "el-dropdown-menu")
    private List<WebElement> dropDownMenu;

    @FindBy(xpath = "//span[text()='新建离线任务']")
    private WebElement offlineTask;
    @FindBy(className = "yotta-dropdown-menu")
    private WebElement dropdownMenu;

    @FindBy(xpath = "//span[text()='新建监控']")
    private WebElement alert;

    @FindBy(xpath = "//button[@class='el-button el-button--primary']/span[text()='确定']")
    private List<WebElement> ensureList;

    @FindBy(xpath = "//button[@yotta-test='dialog-confirm-button']/span")
    private WebElement deleteSavedSearch;

    public WebElement getDeleteSavedSearch() {
        return deleteSavedSearch;
    }

    @FindBy(xpath = "//i[@title='暂停']")
    private WebElement pause;

    @FindBy(xpath = "//i[@title='取消']")
    private WebElement cancle;

    @FindBy(xpath = "(//span[text()='取消']/ancestor::button)[last()]")
    private WebElement cancel;

    @FindBy(xpath = "//i[@title='恢复']")
    private WebElement recover;

    @FindBy(xpath = "//button[@class='el-button yw-search-pages-download el-button--default']/span")
    private WebElement download;

    @FindBy(xpath = "//label[contains(text(),'最大行数')]/following-sibling::div//i")
    private WebElement maxLineDropdown;

    @FindBy(xpath = "//div[contains(text(),'下载任务')]")
    private WebElement downloadTipsText;

    public WebElement getDownloadTipsText() {
        return downloadTipsText;
    }

    //@FindBy(className = "el-time-panel")
    @FindBy(xpath = "(//input[@placeholder='请选择时间']/ancestor::div[2])[last()]")
    private WebElement timePanel;

    @FindBy(xpath = "//div[@class='el-message-box']//span[contains(text(),'确定')]")
    private WebElement sourceEnsure;

    @FindBy(xpath = "//td[@data-col-name]/span")
    private List<WebElement> columnList;

    @FindBy(xpath = "(//*[@yotta-test='event_list-expand-icon'])[1]")
    private WebElement rightIcon;

    @FindBy(xpath = "//span[text()='x:']/following-sibling::span/span")
    private WebElement xValue;

    //    @FindBy(xpath = "//span[text()='事件操作']/i")
    @FindBy(xpath = "//button[@yotta-test='event_list-event_action-button']/span")
    private WebElement eventOperate;

    @FindBy(xpath = "//li[text()='配置字段提取']")
    private WebElement configField;

    @FindBy(xpath = "(//span[text()='无可展示数据～'])[last()]")
    private WebElement noneData;

    @FindBy(xpath = "(//canvas)[last()]")
    private WebElement canvas;

    @FindBy(xpath = "//span[text()='sunxjautotest']")
    private WebElement sunxjautotest;

    @FindBy(xpath = "//span[text()='AutoTestLogSource']")
    private WebElement autoTestLogSource;

    @FindBy(className = "basic-item-value")
    private List<WebElement> valueList;

    @FindBy(xpath = "(//span[text()='搜索无数据'])[1]")
    private WebElement noResult;

    @FindBy(xpath = "//div[@class='yw-searchbar__prepend el-dropdown']/following-sibling::sup")
    private WebElement sup;

    @FindBy(xpath = "(//tbody)[last()]")
    private WebElement table;

    @FindBy(xpath = "//td[text()='AutoTestUserCreate']/preceding-sibling::td/i")
    private WebElement star;

    @FindBy(xpath = "//div[@class='yw-search-tabbar-item']")
    private WebElement searchTabBar;

    @FindBy(xpath = "//li[@yotta-test='event_list-event_action-menu_item']/span[text()='AutoTest']")
    private WebElement eventOperatorAutoTest;

    //  @FindBy(xpath = "//span[@class='event-action-field-dropdown']")
    @FindBy(xpath = "//span[text()='raw_message']")
    private WebElement rawMessage;

    @FindBy(xpath = "(//span[text()='查看上下文sample'])[last()]")
    private WebElement contextSample;

    @FindBy(xpath = "(//span[text()='测试应用条件'])[last()]")
    private WebElement condition;

    @FindBy(xpath = "//div/div[2]/span//span[text()='hostname:']/parent::span//span[@yotta-test='event_list-field_value-dom']")
    private WebElement clientip;

    @FindBy(xpath = "//div/div[2]/span//span[contains(text(),'appname')]//ancestor::span//span[@yotta-test='event_list-field_value-dom']")
    private WebElement appname;

    @FindBy(xpath = "//div/div[2]/span//span[text()='tag:']/parent::span//span[@yotta-test='event_list-field_value-dom']")
    private WebElement tag;

    @FindBy(xpath = "//div[text()='添加到搜索']")
    private WebElement addToSearch;

    @FindBy(xpath = "//div[text()='从搜索删除']")
    private WebElement removeFromSearch;

    @FindBy(xpath = "//div[@yotta-test='search-schedule_frequency_unit-select']/div[@class='yotta-select-selection']")
    private WebElement executeTime;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement lastDropdown;

    @FindBy(xpath = "//span[text()='crontab']")
    private WebElement crontab;

    @FindBy(xpath = "//input[@name='crontab']")
    private WebElement crontabInput;

    @FindBy(xpath = "//span[text()='test.date']/ancestor::td/following-sibling::td")
    private WebElement otherDate;

    @FindBy(xpath = "//span[text()='test.time']/ancestor::td/following-sibling::td")
    private WebElement otherTime;

    @FindBy(xpath = "//span[text()='timestamp']/ancestor::td/following-sibling::td")
    private WebElement resultTimestamp;

    @FindBy(xpath = "//span[text()='other.key']/ancestor::td/following-sibling::td/span")
    private WebElement otherKey;

    @FindBy(xpath = "//span[text()='apache.request_query']")
    private WebElement requestQuery;

    //@FindBy(className = "_34z8Og_bzWmsjaI0u5wBOf")
    @FindBy(className = "event-item")
    private WebElement firstArea;

    @FindBy(xpath = "//span[text()='保存为']")
    private WebElement saveAsOther;

    @FindBy(xpath = "//span[text()='保存为']")
    private WebElement saveAs;

    public WebElement getSaveAs() {
        return saveAs;
    }

    public WebElement getSaveAsList() {
        String xpath = "//span[text()='保存为']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getParentElementOfMenuList();
    }

    @FindBy(xpath = "//li[text()='趋势图']")
    private WebElement saveAsTrend;

    @FindBy(xpath = "//li[text()='定时任务']")
    private WebElement saveAsSchedule;

    @FindBy(xpath = "//span[@yotta-test='event_list-event_action-icon']")
    private WebElement expand;

    public WebElement getExpand() {
        return expand;
    }

    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-DownloadOutlined']")
    private WebElement downloadButton;

    public WebElement getDownloadButton() {
        saveAsOther.click();
        return downloadButton;
    }

    // @FindBy(xpath = "(//span[text()='确 定']/ancestor::button)[last()]")
    @FindBy(xpath = "//button[@yotta-test='schedule-submit-button']/span")
    private WebElement ensureCrontab;

    @FindBy(xpath = "//div[contains(text(),'事件')]")
    private WebElement eventNumber;

    @FindBy(className = "yotta-message-content")
    private WebElement message;

    //@FindBy(xpath = "//label[text()='搜索内容']/parent::div/following-sibling::div")
    @FindBy(xpath = "//textarea[@yotta-test='schedule-query-input']")
    private WebElement searchContent;

    @FindBy(xpath = "//button[@class='ant-btn ant-btn-primary']")
    private WebElement ensureCreateTrend;

    @FindBy(xpath = "//div[@type='dataset']//span[text()='all_']")
    private WebElement resourceAll;

    @FindBy(xpath = "(//label[contains(text(),'资源标签')][last()])/ancestor::div/following-sibling::div//input")
    private WebElement tagInput;

    @FindBy(xpath = "(//span[@class='yotta-select-option-label'])[1]")
    private WebElement selectAddedTag;

    @FindBy(xpath = "//label[text()='文件类型']/parent::div/following-sibling::div")
    private WebElement fileType;

    @FindBy(xpath = "(//span[contains(text(),'schedule_name:')]/following-sibling::span)[1]")
    private WebElement scheduleNameDetail;

    @FindBy(xpath = "//*[text()='更多历史']")
    private WebElement searchHistory;

    @FindBy(xpath = "//div[text()='搜索历史']/ancestor::div[1]/following-sibling::div//input")
    private WebElement searchHistoryInput;

    @FindBy(className = "_3ypJz01M3kc-hjWPSkSN0v")
    private WebElement searchHistoryResult;

    public WebElement getSearchHistoryResult() {
        return searchHistoryResult;
    }

    public WebElement getSearchHistoryInput() {
        return searchHistoryInput;
    }

    public WebElement getSearchHistory() {
        return searchHistory;
    }

    public WebElement getScheduleNameDetail() {
        return scheduleNameDetail;
    }

    @FindBy(xpath = "//div[@title='居左']")
    private WebElement tableAlignment;

    @FindBy(xpath = "//th[text()='hostname']/i")
    private WebElement icon;

    public WebElement getIcon() {
        return icon;
    }

    @FindBy(xpath = "//li[text()='居中']")
    private WebElement middle;
    @FindBy(xpath = "(//td[@class='_2y26OafmVfXbjbPLoZ-NYG'])[3]")
    private WebElement targetValue;
    @FindBy(xpath = "//span[@class='t4zheDaX0848mtd_e7LDW ant-input-group-wrapper']//input")
    private WebElement colWidth;
    @FindBy(xpath = "//button[@class='ant-btn ant-btn-primary']")
    private WebElement confirm;

    public WebElement getCondition() {
        return condition;
    }

    public WebElement getTableAlignment() {
        return tableAlignment;
    }

    public WebElement getMiddle() {
        return middle;
    }

    public WebElement getConfirm() {
        return confirm;
    }

    public WebElement getTargetValue() {
        return targetValue;
    }

    public WebElement getColWidth() {
        return colWidth;
    }

    @FindBy(xpath = "//th[@title='hostname']")
    private WebElement targetWidth;

    public WebElement getTargetWidth() {
        return targetWidth;
    }

    @FindBy(xpath = "//div[text()='请选择']")
    private WebElement textStyle;

    public WebElement getTextStyle() {
        return textStyle;
    }

    @FindBy(xpath = "//li[text()='斜体']")
    private WebElement italic;

    public WebElement getItalic() {
        return italic;
    }

    @FindBy(xpath = "//span[@class='_2yG4RqCR3-owuoI9z87xoo css-j4ndc3']")
    private WebElement colorPicker;

    public WebElement getColorPicker() {
        return colorPicker;
    }

    @FindBy(xpath = "(//div[@class='css-1kx576s'])[1]/input")
    private WebElement colorInput;

    public WebElement getColorInput() {
        return colorInput;
    }

    public SearchPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
//        driver.manage().window().setSize(new Dimension(1800, 970));
//        driver.manage().window().setPosition(new Point(0, 0));

    }

    public WebElement getDeleteApp() {
        return deleteApp;
    }

    public WebElement getFileType() {
        fileType.click();
        return super.getLastDropdownList();
    }

    public WebElement getResourceAll() {
        return resourceAll;
    }

    public WebElement getGroupComboBox() {
        groupComboBox.click();
        return super.getLastDropdownList();
    }

    public WebElement getSelectedTag() {
        return selectedTag;
    }

    public WebElement getTagInput() {
        groupComboBox.click();
        return tagInput;
    }

    public WebElement getSelectAddedTag() {
        return selectAddedTag;
    }

    public WebElement getAppComboBox() {
        appComboBox.click();
        return super.getLastDropdownList();
    }

    public WebElement getSelectedApp() {
        return selectedApp;
    }

    @FindBy(tagName = "table")
    private WebElement tableList;

    public WebElement getSearchContent() {
        return searchContent;
    }

    public WebElement getEventNumber() {
        return eventNumber;
    }

    public WebElement getAppDropdown() {
        appIcon.click();
        return super.getLastDropdownList();
    }

    public WebElement getTrend() {
        return trend;
    }

    public WebElement getRequestQuery() {
        return requestQuery;
    }

    public WebElement getOtherKey() {
        return otherKey;
    }

    public WebElement getOtherDate() {
        return otherDate;
    }

    public WebElement getOtherTime() {
        return otherTime;
    }

    public WebElement getResultTimestamp() {
        return resultTimestamp;
    }

    public WebElement getCrontabInput() {
        crontab.click();
        return crontabInput;
    }

    public WebElement getDropdownMenu() {
        return dropdownMenu;
    }

    public WebElement getExecuteTime() {
        executeTime.click();
        return this.getLastDropdownList();
    }

    public WebElement getTag() {
        return tag;
    }

    public WebElement getAddToSearch() {
        return addToSearch;
    }

    public WebElement getRemoveFromSearch() {
        return removeFromSearch;
    }

    public WebElement getClientip() {
        return clientip;
    }

    public WebElement getAppname() {
        return appname;
    	    }

    public WebElement getContextSample() {
        return contextSample;
    }

    public WebElement getRawMessage() {
        return rawMessage;
    }

    public WebElement getEventOperatorAutoTest() {
        return eventOperatorAutoTest;
    }

    public WebElement getStatsNum() {
        return statsNum;
    }

    public WebElement getSearchTabBar() {
        return searchTabBar;
    }

    public WebElement getStar() {
        return star;
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getSup() {
        return sup;
    }

    public WebElement getAutoTestLogSource() {
        return autoTestLogSource;
    }

    public WebElement getNoResult() {
        return noResult;
    }

    public WebElement getAppnameValue() {
        return valueList.get(0);
    }

    public WebElement getTagValue() {
        return valueList.get(3);
    }

    public WebElement getSunxjautotest() {
        return sunxjautotest;
    }

    public WebElement getResourceGroup() {
        return super.getLastDropdownList();
    }

    public WebElement getAlert() {
        return alert;
    }

    public WebElement getCanvas() {
        return canvas;
    }

    public WebElement getNoneData() {
        return noneData;
    }

    public WebElement getConfigField() {
        return configField;
    }

    public WebElement getEventOperate() {
        return eventOperate;
    }

    public WebElement getXValue() {
        return xValue;
    }

    public WebElement getRightIcon() {
        firstArea.click();
        return rightIcon;
    }

    public WebElement getColumn1() {
        return columnList.get(0);
    }

    public WebElement getColumn2() {
        return columnList.get(1);
    }

    public WebElement getColumn3() {
        return columnList.get(2);
    }

    public WebElement getSourceEnsure() {
        return sourceEnsure;
    }

    public WebElement getTimePanel() {
        return timePanel;
    }

    @FindBy(xpath = "//div[@class='yotta-tabs-content']//div[contains(text(),'搜索无数据')]")
    private WebElement noDataInfo;

    public WebElement getNoDataInfo() {
        return noDataInfo;
    }

    public WebElement getMaxLineDropdown() {
        maxLineDropdown.click();
        return dropdownList.get(dropdownList.size() - 1);
    }
    @FindBy(xpath = "//a[text()='search']")
    private WebElement Search;
    public WebElement getSearch(){
        return Search;
    }

    @FindBy(xpath = "//label[contains(text(),'文件名称')]/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement downloadName;

    public WebElement getDownloadName() {
        return downloadName;
    }

    public WebElement getMaxLineNum() {
        String xpath = "//label[contains(text(),'最大行数')]/parent::div/following-sibling::div//input[@placeholder='请输入']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getDocumentTypeList() {
//      String xpath = "//label[contains(text(),'文件类型')]/parent::div/following-sibling::div//div[@class='yotta-select-selection']";
        String xpath = "//label[contains(text(),'文件类型')]/parent::div/following::div[@yotta-test='search-download_type-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDocumentEncodeList() {
//      String xpath = "//label[contains(text(),'文件编码')]/parent::div/following-sibling::div//div[@class='yotta-select-selection']";
        String xpath = "//label[contains(text(),'文件编码')]/following::div[@yotta-test='search-download_code-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement createDownloadTask;

    public WebElement getCreateDownloadTask() {
        return createDownloadTask;
    }

    @FindBy(xpath = "//div[@class='yotta-tabs-nav-list']/div[1]//div[@role='tab']")
    private WebElement EventNumbers;

    public WebElement getEventNumbers() {
        return EventNumbers;
    }

    public WebElement getAcceptCreateDownloadTask() {
        return super.getButton("确定");
    }

    public WebElement getDownload() {
        return download;
    }

    public WebElement getRecover() {
        return recover;
    }

    public WebElement getCancle() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(cancle));
        return cancle;
    }

    public WebElement getCancel() {
        return cancel;
    }

    @FindBy(className = "status-text")
    private WebElement statusText;

    public WebElement getStatusText() {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return statusText;
    }

    public WebElement getPause() {
        return pause;
    }

    public WebElement getWholeTime() {
        return GetTime.getTime(webDriver, "WholeTime");
    }

    public WebElement getEnsureCreateOfflineTask() {
        return ensureList.get(4);
    }

    // @FindBy(xpath = "//label[text()='名称']/ancestor::div[1]/following-sibling::div//input")
    @FindBy(xpath = "//input[@yotta-test='schedule-name-input']")
    private WebElement taskName;

    public WebElement getApplyButton() {
        return GetTime.getTime(webDriver, "ApplyButton");
    }

    public WebElement getApplyCustomTime() {
        return GetTime.getTime(webDriver, "ApplyCustomTime");
    }

    // @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::input")
    @FindBy(xpath = "//input[@yotta-test='search-new_savedsearch_name-input']")
    private WebElement offlineTaskName;

    public WebElement getOfflineTaskName() {
        return offlineTaskName;
    }

    public WebElement getTimeInput() {
        return GetTime.getTime(webDriver, "TimeInput");
    }

    public WebElement getOfflineTask() {
        return offlineTask;
    }

    public WebElement getSaveAsReport() {
        return saveAsReport;
    }

    public List<WebElement> getNodeList() {
        return nodeList;
    }

    // 日志来源下拉菜单
    public WebElement getArrowDown() {
        return arrowDown;
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getYaxis() {
        return yaxis.get(1);
    }

    public WebElement getActuralData() {
        yaxisGroup.get(0).click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    public WebElement getPredictData() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(yaxisGroup.get(1)));
        yaxisGroup.get(1).click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    public WebElement getTopLimit() {
        yaxisGroup.get(2).click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    public WebElement getLowerLimit() {
        yaxisGroup.get(3).click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    public WebElement getStartColour() {
        return startColour;
    }

    public WebElement getPink() {
        return pink;
    }

    public WebElement getWeight() {
        return weight;
    }

    public WebElement getShow() {
        return show;
    }

    public WebElement getSequence() {
        return sequence;
    }

    public WebElement getGenerate() {
        return super.getContainsTextButton("生成");
    }

    public WebElement getSource() {
        return source;
    }

    public WebElement getTarget() {
        return target;
    }

    public WebElement getCut() {
        return cut;
    }

    public WebElement getMark() {
        return mark;
    }

    public WebElement getSelectData() {
        selectData.click();
        return super.getLastDropdownList();
    }

    public WebElement getSetting() {
        return setting.get(2);
    }

    public WebElement getCompound() {
        return compound;
    }

    public WebElement getMultiaxis() {
        return multiaxis;
    }

    public WebElement getRangeline() {
        return rangeline;
    }

    public WebElement getConnection() {
        return connection;
    }

    public WebElement getChord() {
        return chord;
    }

    public WebElement getSankey() {
        return sankey;
    }

    public WebElement getForce() {
        return force;
    }

    public WebElement getRose() {
        return rose;
    }

    public WebElement getBar() {
        return bar;
    }

    @FindBy(className = "bar")
    private WebElement bar;

    public WebElement getDimension() {
        return dimension;
    }

    public WebElement getPie() {
        return pie;
    }

    @FindBy(className = "pie")
    private WebElement pie;

    public WebElement getScatter() {
        return scatter;
    }

    public WebElement getColumn() {
        return column;
    }

    public WebElement getArea() {
        return area;
    }

    public WebElement getLiquidfill() {
        return liquidfill;
    }

    public WebElement getSingle() {
        return single;
    }

    public WebElement getWordcloud() {
        return wordcloud;
    }

    public WebElement getOther() {
        return other;
    }

    public WebElement getOrder() {
        return order;
    }

    public WebElement getSearchComplete() {
        return searchComplete;
    }

    public WebElement getLine() {
        return line;
    }

    public WebElement getType() {
        return type;
    }

    public WebElement getEnsure() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(ensureButton));
        return ensure.get(1);
    }

    public WebElement getEnsureCrontab() {
        return ensureCrontab;
    }

    public WebElement getEnsureCreateTask() {
        return ensure.get(1);
    }

    public WebElement getEnsureCreateTrend() {
        return ensureCreateTrend;
    }

    public WebElement getPeriod() {
        return period;
    }

    @FindBy(xpath = "//span[text()='开始']/preceding-sibling::span/input")
    private WebElement startTime;

    @FindBy(xpath = "//span[text()='明天开始']/preceding-sibling::input")
    private WebElement startTomorrow;

    @FindBy(xpath = "//input[@class='yotta-time-picker-input']")
    private WebElement startTimeInput;

    @FindBy(xpath = "//div[@name='startTimeValue']/ancestor::div[4]//div[@class='_3Tj0m5K3SbyYyuceSTvQ2b']")
    private WebElement whenToStart;

    public WebElement getWhenToStart() {
        return whenToStart;
    }

    public WebElement getStartTomorrow() {
        return startTomorrow;
    }

    public WebElement getStartTime() {
        return startTime;
    }

    public WebElement getStartTimeInput() {
        return startTimeInput;
    }

    // 运行用户
    public List<WebElement> getUserComboBox() {
        runningUser.click();
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(dropdownList.get(dropdownList.size() - 1));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return this.dropdownList.get(dropdownList.size() - 1).findElements(By.tagName("li"));
    }

    public WebElement getDescribe() {
        return describe;
    }

    public WebElement getSelectedUser() {
        return selectedUser;
    }

    public WebElement getTaskName() {
        return taskName;
    }


    public WebElement getDetailTable() {
        return detailTable;
    }

    // 保存为
    public WebElement getSaveAsOther() {
        return saveAsOther;
    }

    public WebElement getSaveAsTrend() {
        saveAs.click();
        return saveAsTrend;
    }

    public WebElement getSaveAsSchedule() {
        saveAs.click();
        return saveAsSchedule;
    }

    public WebElement getDaysDropDown() {
        return GetTime.getTime(webDriver, "DaysDropDown");
    }

    // 获取最近7天按钮
    public WebElement getRecentSevenDay() {
        return GetTime.getTime(webDriver, "RecentSevenDay");
    }

    public WebElement getRecentlyRadioButton() {
        return GetTime.getTime(webDriver, "RecentlyRadioButton");
    }

    public WebElement getRealTimeButton() {
        return GetTime.getTime(webDriver, "RealTimeButton");
    }

    @FindBy(xpath = "//div[text()='自定义时间范围']")
    private WebElement customTimeTab;

    public WebElement getCustomTimeTab() {
        return customTimeTab;
    }

    public void getCustomTime() {
        GetTime.getTime(webDriver, "CustomTime");
    }

    public WebElement getStartTimeField() {
        return GetTime.getTime(webDriver, "StartTimeInput");
    }

    public WebElement getEndTimeField() {
        return GetTime.getTime(webDriver, "EndTimeInput");
    }

    public WebElement getStartDateField() {
        return GetTime.getTime(webDriver, "StartDateInput");
    }

    public WebElement getEndDateField() {
        return GetTime.getTime(webDriver, "EndDateInput");
    }

    /**
     * 获取每一页的td数据
     *
     * @return
     */
    public List<Map<String, String>> getTdList() {
        List<WebElement> list;
        List<Map<String, String>> data = new ArrayList<>();
        WebElement nextPage = webDriver.findElements(By.className("btn-next")).get(1);
        List<WebElement> pages = webDriver.findElements(By.className("number"));
        int totalPageNum = Integer.parseInt(pages.get(pages.size() - 1).getText());
        list = this.getDetailTable().findElements(By.tagName("td"));
        for (WebElement webElement : list) {
            Map<String, String> map = new HashMap<>();
            map.put(webElement.getAttribute("data-col-name"), webElement.getText());
            data.add(map);
        }
        if (pages.size() != 1) {
            for (int i = 0; i < totalPageNum - 1; i++) {
                nextPage.click();
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                list = this.getDetailTable().findElements(By.tagName("td"));
                for (WebElement webElement : list) {
                    Map<String, String> map = new HashMap<>();
                    map.put(webElement.getAttribute("data-col-name"), webElement.getText());
                    data.add(map);
                }
            }
        }
        return data;
    }

    // 获取今天按钮
    public WebElement getToday() {
        return (new DateEditorPage(webDriver)).getToday();
    }

    public WebElement getThisWeek() {
        return (new DateEditorPage(webDriver)).getThisWeek();
    }

    public WebElement getThisMonth() {
        return (new DateEditorPage(webDriver)).getThisMonth();
    }

    public WebElement getLastWeek() {
        return (new DateEditorPage(webDriver)).getLastWeek();
    }

    public WebElement getLastMonth() {
        return (new DateEditorPage(webDriver)).getLastMonth();
    }

    public WebElement getOneDay() {
        return (new DateEditorPage(webDriver)).getOneDay();
    }

    public WebElement getTwoDays() {
        return (new DateEditorPage(webDriver)).getTwoDays();
    }

    public WebElement getSevenDays() {
        return (new DateEditorPage(webDriver)).getSevenDays();
    }

    public WebElement getThirtySeconds() {
        return (new DateEditorPage(webDriver)).getThirtySeconds();
    }

    public WebElement getTenSeconds() {
        return (new DateEditorPage(webDriver)).getTenSeconds();
    }

    // 获取昨天按钮
    public WebElement getYesterday() {
        return (new DateEditorPage(webDriver)).getYesterday();
    }

    public WebElement getSearchTable() {
        return searchTable;
    }

    public WebElement getSearchInput() {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(searchInput);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchInput;
    }

    public void getPastYears() {
        new DateEditorPage(webDriver).getCustomTime("00:00:00", "00:00:00", "2015-01-23", "2015-01-25");
    }

    @FindBy(className = "yotta-date-time-picker")
    private WebElement dateEditor;

    @FindBy(xpath = "//div[contains(text(),'自定义时间范围')]")
    private WebElement CustomizeTimeField;

    @FindBy(xpath = "//input[@placeholder='开始日期']")
    private WebElement startDate;

    @FindBy(xpath = "//input[@placeholder='结束日期']")
    private WebElement endDate;

    @FindBy(xpath = "//input[@placeholder='开始时间']")
    private WebElement startTimes;

    @FindBy(xpath = "//input[@placeholder='结束时间']")
    private WebElement endTimes;

    @FindBy(xpath = "//button[text()='应用']")
    private WebElement apply;


    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getSearchButton() {
        return super.getButton("搜索");
    }

    public WebElement getSearchErrorStatus() throws InterruptedException {
        Thread.sleep(1000);
        return searchErrorStatus;
    }

    public WebElement getSearchStatus() throws InterruptedException {
        Thread.sleep(1000);
        return searchStatus;
    }

    public WebElement getSearchResult() {
        WebElement searchResult = null;
        String sp = File.separator;
        String path = System.getProperty("user.dir") + sp + "target" + sp +
                "cucumber-html-reports" + sp + "embeddings";
//        System.out.println("webDriver:  "+ webDriver);
        int warningMessageCount = webDriver.findElements(By.className("yw-search-info-content")).size();
//        System.out.println("warningMessageCount:  "+ warningMessageCount);
        if (ElementExist.isElementExist(webDriver, eventCount)) {
            System.out.println("event count is : " + eventCount);
            searchResult = eventCount;
        } else if (warningMessageCount == 2 && statsWarningMessage.isDisplayed()) {
            System.out.println("warningMessageCount=2  and statsWarningMessage: " + statsWarningMessage);
            searchResult = statsWarningMessage;
        } else if (warningMessageCount == 2 && eventWarningMessage.isDisplayed()) {
            System.out.println("warningMessageCount=2  and eventWarningMessage: " + eventWarningMessage);
            searchResult = eventWarningMessage;
        } else if (warningMessageCount == 1 && statisticalTab.isDisplayed()) {
            System.out.println("warningMessageCount=1  and statisticalTab is displayed: " + eventWarningMessage.getText());
            shot.screenShot();
            eventTab.click();
            searchResult = eventWarningMessage;
        } else if (warningMessageCount == 1 && eventTab.isDisplayed()) {
            System.out.println("warningMessageCount=1  and eventTab is displayed: " + eventWarningMessage.getText());
            shot.screenShot();
            statisticalTab.click();
            searchResult = statsWarningMessage;
        }

        return searchResult;
    }

    public TakeScreenShot getShot() {
        return shot;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getMessage() {
        return message;
    }

    @FindBy(xpath = "//span[contains(text(),'事件列表')]/following-sibling::span[@yotta-test='event_list-download-dom']")
    private WebElement downloadEvent;

    public WebElement getDownloadEvent() {
        return downloadEvent;
    }

    public WebElement getCustomizeTimeField() {
        return CustomizeTimeField;
    }

    public WebElement getStartDate() {
        return startDate;
    }

    public WebElement getStartTimes() {
        return startTimes;
    }

    public WebElement getEndDate() {
        return endDate;
    }

    public WebElement getEndTimes() {
        return endTimes;
    }

    public WebElement getApply() {
        return apply;
    }

//author_jnd about dataset

    //页面上方趋势图超链接
    @FindBy(xpath = "//a[contains(text(),'趋势图')]")
    private WebElement upperTrend;

    public WebElement getTableList() {
        return tableList;
    }

    //有字段的数据集
    @FindBy(xpath = "//span[text()='hrfield']")
    private WebElement hrField;

    public WebElement getCrontab() {
        return crontab;
    }

    public WebElement getHrField() {
        return hrField;
    }

    //验证字段列表
    @FindBy(xpath = "//span[text()='#']/following-sibling::span")
    private WebElement fieldOne;

    public WebElement getFieldOne() {
        return fieldOne;
    }

    @FindBy(xpath = "//span[text()='A']/following-sibling::span")
    private WebElement fieldTwo;

    public WebElement getFieldTwo() {
        return fieldTwo;
    }

    //数据集的展开按钮
//    @FindBy(xpath = "//a[text()='展开']")
    @FindBy(xpath = "//span[text()='展开']")
    private WebElement zhanKai;

    //数据集的内容
//    @FindBy(xpath = "//div[@class='haE36auAEA9saq70cDkWx']/span")
    @FindBy(xpath = "//span[@yotta-test='search-dataset_query-tag']")
    private WebElement dataSetPosition;

    public WebElement getDataSetPosition() {
        return dataSetPosition;
    }

    public WebElement getZhanKai() {
        return zhanKai;
    }

    //保存为定时任务成功之后弹窗上的确定按钮
    @FindBy(xpath = "//div[@class='minaCXZ5tceRilaw8FVvn']/button")
    private WebElement timeTaskEnsure;

    //页面上方定时任务超链接
    @FindBy(xpath = "//a[contains(text(),'定时任务')]")
    private WebElement schedule;

    public WebElement getTimeTaskEnsure() {
        return super.getButton("确定");
    }

    //搜索页面保存为趋势图
//    @FindBy(xpath = "//li/span[text()='趋势图']")
    @FindBy(xpath = "//li/span[text()='趋势图']")
    private WebElement saveTrend;

    public WebElement getSaveTrend() {
        return saveTrend;
    }

    public WebElement getSchedule() {
        return schedule;
    }

    //保存为趋势图的名称
    @FindBy(xpath = "//input[@yotta-test='search-trend_name-input']")
    private WebElement trendName;

    public WebElement getTrendName() {
        return trendName;
    }

    //保存为趋势图成功之后提示弹窗中的确定按钮
    @FindBy(xpath = "//div[@class='minaCXZ5tceRilaw8FVvn']/button")
    private WebElement trendEnsureAfterEnsure;

    public WebElement getTrendEnsureAfterEnsure() {
        return super.getButton("确定");
    }

    public WebElement getUpperTrend() {
        return upperTrend;
    }

    //保存为定时任务弹窗中的【描述】
    @FindBy(xpath = "//label[text()='描述']/ancestor::div[1]/following-sibling::div//input")
    private WebElement scheduleDescribe;

    public WebElement getScheduleDescribe() {
        return scheduleDescribe;
    }

    public WebElement getResult() {
        return result;
    }

    @FindBy(xpath = "//div[@class='_2s3Fd-GN0DsYSjwg0ByfD1 yw-table']")
//    @FindBy(xpath = "//div[@class='_2s3Fd-GN0DsYSjwg0ByfD1']")
    private WebElement splStatsRetTable;

    public WebElement getSplStatsRetTable() {
        return splStatsRetTable;
    }

    @FindBy(xpath = "//div[@class='eua4mwMYB7k125sVmyyzn']")
    private WebElement splChartRetView;

    public WebElement getSplChartRetView() {
        return splChartRetView;
    }

    @FindBy(xpath = "//div[@class='_1RUvRKI62LgS00VRtmcaq']")
    private WebElement splTransactionRetView;

    public WebElement getSplTransactionRetView() {
        return splTransactionRetView;
    }

    @FindBy(xpath = "//div[@class='_284Y6gRNbLs9PP8RvGX76B Fqdex4rec8vrc91HwX3oB']/span")
    private WebElement splStatsRetNum;

    public WebElement getSplStatsRetNum() {
        return splStatsRetNum;
    }

    @FindBy(xpath = "//div[@class='_284Y6gRNbLs9PP8RvGX76B']/span")
    private WebElement splEventRetNum;

    public WebElement getSplEventRetNum() {
        return splEventRetNum;
    }

    @FindBy(xpath = "//span[@yotta-test='search-dataset_resize_handler-dom']")
    private WebElement searchPageSvg;

    public WebElement getSearchPageSvg() {
        return searchPageSvg;
    }

    //  @FindBy(xpath = "//svg[@href='#icon-sousuoyeyemiantuozhuai']")
    @FindBy(xpath = "//svg[@id='icon-sousuoyeyemiantuozhuai']")
    private WebElement searchPageSvg1;

    public WebElement getSearchPageSvg1() {
        return searchPageSvg1;
    }

    @FindBy(xpath = "//aside[@class='_2GaHYplAvgzSUrZjcyaHYW css-eavujn ant-layout-sider ant-layout-sider-dark ant-layout-sider-collapsed']")
    private WebElement searchPageLeft;

    public WebElement getSearchPageLeft() {
        return searchPageLeft;
    }

    @FindBy(xpath = "//div[@class='_3jCwU33luOoDfATyPI4BPZ']")
    private WebElement searchPageLeft1;

    public WebElement getSearchPageLeft1() {
        return searchPageLeft1;
    }

    @FindBy(xpath = "//span[text()='创建输入项']")
    private WebElement createInputItem;

    public WebElement getCreateInputItem() {
        return createInputItem;
    }

    @FindBy(xpath = "//label[text()='标识']/parent::div/following-sibling::div//input")
    private WebElement filterToken;

    public WebElement getFilterToken() {
        return filterToken;
    }

    @FindBy(xpath = "//div[@class='yotta-form-field']//span[@class='yotta-select-selection-value']")
    private WebElement inputType;

    public WebElement getInputType() {
        inputType.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "(//span[text()='filter'])[2]")
    private WebElement inputItem;

    public WebElement getInputItem() {
        return inputItem;
    }

    @FindBy(xpath = "//*[@yotta-test='search_bar-param_setting-icon']")
    private WebElement inputItemEditor;

    public WebElement getInputItemEditor() {
        return inputItemEditor;
    }

    @FindBy(xpath = "(//*[@yotta-test='search_bar-delete_param-icon'])[last()]")
    private WebElement inputItemDelete;

    public WebElement getInputItemDelete() {
        return inputItemDelete;
    }

    public WebElement getPrefix() {
        return getInput("标识前缀");
    }

    public WebElement getPrefixValue() {
        return getInput("标识值前缀");
    }

    public WebElement getSuffixValue() {
        return getInput("标识值后缀");
    }

    public WebElement getSuffix() {
        return getInput("标识后缀");
    }

    public WebElement getSeparate() {
        return getInput("分隔符");
    }

    @FindBy(xpath = "//*[@yotta-test='search_bar-param_field_value-input']")
    private WebElement dynamicField;

    public WebElement getDynamicField() {
        return dynamicField;
    }

    private WebElement getInput(String name) {
        String xpath = "//label[text()='" + name + "']/ancestor::div/following-sibling::div//input";
        return webDriver.findElement(By.xpath(xpath));
    }

    @FindBy(xpath = "//*[@yotta-test='search_bar-add_list_option-icon']")
    private WebElement addChoiceValueButton;

    public WebElement getAddChoiceValueButton() {
        return addChoiceValueButton;
    }

    @FindBy(xpath = "//*[@yotta-test='search_bar-param_value-select']/div")
    private WebElement defaultValueIcon;

    public WebElement getDefaultDropdownList() {
        defaultValueIcon.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//span[text()='单选']")
    private WebElement singleChoice;

    public WebElement getSingleChoice() {
        return singleChoice;
    }

    @FindBy(xpath = "//input[@placeholder='请输入选项值']")
    private WebElement choiceValue;

    public WebElement getChoiceValue() {
        return choiceValue;
    }

    @FindBy(xpath = "//span[text()='多选']")
    private WebElement multiSelect;

    public WebElement getMultiSelect() {
        return multiSelect;
    }

    @FindBy(xpath = "//textarea[contains(@yotta-test,'query-textarea')]")
    private WebElement inputItemSpl;

    public WebElement getInputItemSpl() {
        return inputItemSpl;
    }

    @FindBy(xpath = "//*[@yotta-test='search_bar-param-select']/div")
    private WebElement filterDropdown;

    public WebElement getFilterDropdown() {
        filterDropdown.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//*[@yotta-test='search_bar-param_time-date_time_picker']")
    private WebElement inputItemDateEditor;

    public WebElement getInputItemDateEditor() {
        return inputItemDateEditor;
    }

    @FindBy(xpath = "//*[@yotta-test='date_time_picker-select_shortcut_今天-dom']")
    private WebElement inputDateToday;

    public WebElement getInputDateToday() {
        return inputDateToday;
    }

    @FindBy(className = "yotta-dialog-content")
    private WebElement alertMessage;

    public WebElement getAlertMessage() {
        return alertMessage;
    }

    @FindBy(xpath = "//*[@yotta-test='search_bar-expand_codemirror-icon']")
    private WebElement openSplIcon;

    public WebElement getOpenSplIcon() {
        return openSplIcon;
    }

    @FindBy(xpath = "//*[@yotta-test='search_bar-collapse_codemirror-icon']")
    private WebElement hideSplIcon;

    public WebElement getHideSplIcon() {
        return hideSplIcon;
    }

    @FindBy(xpath = "//div[@class='ant-tooltip-inner']")
    private WebElement openAndHideTip;

    public WebElement getOpenAndHideTip() {
        return openAndHideTip;
    }

    @FindBy(xpath = "//span[text()='搜索配置']")
    private WebElement searchSetting;

    public WebElement getSearchSetting() {
        return searchSetting;
    }

    @FindBy(xpath = "//span[text()='索引模式']")
    private WebElement indexMode;

    public WebElement getIndexMode() {
        return indexMode;
    }

    @FindBy(xpath = "//span[text()='极简模式']")
    private WebElement sampleMode;

    public WebElement getSampleMode() {
        return sampleMode;
    }

    @FindBy(xpath = "//label[contains(text(),'每个分片取样')]/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement fenPianQuYang;

    public WebElement getFenPianQuYang() {
        return fenPianQuYang;
    }

    //    @FindBy(xpath = "(//button[@class='ant-modal-close'])[last()]")
    @FindBy(xpath = "(//div[@class='yotta-modal-header yotta-modal-header-with-divider']//span)[last()]")
    private WebElement closeBtn;

    public WebElement getCloseBtn() {
        return closeBtn;
    }

    @FindBy(xpath = "//div[text()='事件']/span")
    private WebElement searchEventCount;

    public WebElement getSearchEventCount() {
        return searchEventCount;
    }

    @FindBy(xpath = "(//span[text()='GET'])[2]")
    private WebElement highLightGet;

    public WebElement getHighLightGet() {
        return highLightGet;
    }

    @FindBy(xpath = "//*[@class='vx-group']")
    private WebElement timeLine;

    public WebElement getTimeLine() {
        return timeLine;
    }

    //    @FindBy(xpath = "//span[text()='感兴趣的字段']/parent::div/following-sibling::ul/li")
    @FindBy(xpath = "//span[text()='感兴趣的字段']/parent::div/following-sibling::ul/li")
    private WebElement leftList;

    public WebElement getLeftList() {
        return leftList;
    }

    //聚类展示模式搜索
    @FindBy(xpath = "//span[text()='无模式搜索结果！']/following-sibling::span[text()='搜索']")
    private WebElement modeSearch;

    public WebElement getModeSearch() {
        return modeSearch;
    }

    @FindBy(xpath = "//td/div[@yotta-test='search-reduce_detail-dom'][text()='90']")
    private WebElement count90;

    public WebElement getCount90() {
        return count90;
    }

    @FindBy(xpath = "//td/div[@yotta-test='search-reduce_detail-dom']")
    private WebElement countBtn;

    public WebElement getCountBtn() {
        return countBtn;
    }

    //@FindBy(xpath = "//span[text()='归并设置']")
    @FindBy(xpath = "//button[@yotta-test='search-reduce_config-button']")

    private WebElement mergeSetting;

    public WebElement getMergeSetting() {
        return mergeSetting;
    }

    //@FindBy(xpath = "//span[text()='归并']")
    @FindBy(xpath = "//button[@yotta-test='search-reduce_converge-button']")
    private WebElement mergeBtn;

    public WebElement getMergeBtn() {
        return mergeBtn;
    }

    //@FindBy(xpath = "//span[text()='后退']")
    @FindBy(xpath = "//button[@yotta-test='search-reduce_back-button']")
    private WebElement backoffBtn;

    public WebElement getBackoffBtn() {
        return backoffBtn;
    }

    @FindBy(xpath = "//tbody/tr[1]/td[last()]/i")
    private WebElement segmentationIcon;

    public WebElement getSegmentationIcon() {
        return segmentationIcon;
    }

//    @FindBy(xpath = "//span[text()='层级']")
    @FindBy(xpath = "//div[text()='层级']")
    private WebElement hierarchy;

    public WebElement getHierarchy() {
        return hierarchy;
    }

    @FindBy(xpath = "//li[text()='第2层']")
    private WebElement secondHierarchy;

    public WebElement getSecondHierarchy() {
        return secondHierarchy;
    }

    @FindBy(xpath = "//label[text()='initial_dist']/following-sibling::input")
    private WebElement initialDistValue;

    public WebElement getInitialDistValue() {
        return initialDistValue;
    }

    @FindBy(xpath = "//label[text()='alpha']/following-sibling::input")
    private WebElement alphaValue;

    public WebElement getAlphaValue() {
        return alphaValue;
    }

    @FindBy(xpath = "//label[text()='stop_threshold']/following-sibling::input")
    private WebElement stopThreshold;

    public WebElement getStopThreshold() {
        return stopThreshold;
    }

    @FindBy(xpath = "//label[text()='multi_align_threshold']/following-sibling::input")
    private WebElement multiAlignThreshold;

    public WebElement getMultiAlignThreshold() {
        return multiAlignThreshold;
    }

    @FindBy(xpath = "//label[text()='pattern_discover_align_threshold']/following-sibling::input")
    private WebElement patternDiscoverAlignThreshold;

    public WebElement getPatternDiscoverAlignThreshold() {
        return patternDiscoverAlignThreshold;
    }

    @FindBy(xpath = "//label[text()='find_cluster_align_threshold']/following-sibling::input")
    private WebElement findClusterAlignThresholdValue;

    public WebElement getFindClusterAlignThresholdValue() {
        return findClusterAlignThresholdValue;
    }

    @FindBy(xpath = "//span[text()='IP']")
    private WebElement mergeIP;

    public WebElement getMergeIP() {
        return mergeIP;
    }

    @FindBy(xpath = "//span[text()='URL']")
    private WebElement mergeURL;

    public WebElement getMergeURL() {
        return mergeURL;
    }

    @FindBy(xpath = "//span[text()='删除']")
    private WebElement delete;

    public WebElement getDelete() {
        return delete;
    }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement savedSearchInput;

    public WebElement getSavedSearchInput() {
        return savedSearchInput;
    }

    public WebElement getResourceGroupList() {
        String xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div")
    private WebElement resourceTagDiv;

    public WebElement getResourceTagDiv() {
        return resourceTagDiv;
    }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement resourceTagInput;

    public WebElement getResourceTagInput() {
        return resourceTagInput;
    }

}
