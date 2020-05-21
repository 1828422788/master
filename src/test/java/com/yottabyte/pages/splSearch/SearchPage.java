package com.yottabyte.pages.splSearch;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.DateEditorPage;
import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.*;
import com.yottabyte.webDriver.SharedDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
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

    public SearchPage(WebDriver driver) {
        super(driver);
        driver.manage().window().setPosition(new Point(0, 0));
        driver.manage().window().setSize(new Dimension(1800,970));
//      driver.manage().window().setSize(new Dimension(1200,900));
    }

    @FindBy(xpath = "//div[@class='_1RUvRKI62LgS00VRtmcaq']/div[1]")
    private WebElement result;

    @FindBy(xpath = "(//label[text()='资源标签'])[last()]/following-sibling::div")
    private WebElement groupComboBox;

    @FindBy(xpath = "(//label[text()='所属应用'])[last()]/following-sibling::div")
    private WebElement appComboBox;

    @FindBy(xpath = "//div[text()='统计']")
    private WebElement countButton;

    @FindBy(xpath = "//div[text()='模式']")
    private WebElement mode;

    public WebElement getCountButton() {
        return countButton;
    }

    //    @FindBy(xpath = "//div[@class='yw-searchbar__inner el-textarea']/textarea")
    @FindBy(className = "CodeMirror")
    private WebElement searchInput;

    @FindBy(xpath = "//span[text()='已存搜索']")
    private WebElement openSavedSearchButton;

    @FindBy(xpath = "//div[@class='yw-search-form-el-input normal-input margin-left el-input']/input")
    private WebElement searchSavedList;

    @FindBy(className = "yw-search-allfields")
    private WebElement allFields;

    @FindBy(className = "el-message__group")
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

    @FindBy(xpath = "//li[text()='查看上下文']")
    private WebElement context;

    @FindBy(xpath = "//span[text()='搜索']/ancestor::button/following-sibling::div//input")
    private WebElement timeRange;


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

    @FindBy(className = "_3YQ9T5DTgCrQ0NSzwkV6a5")
    private WebElement searchStatus;

    @FindBy(xpath = "//div[@class='yw-search-tabbar']//div[text()='统计']")
    private WebElement statisticalTab;

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

    @FindBy(xpath = "//li[text()='定时任务']")
    private WebElement timedTask;

    @FindBy(xpath = "//li[text()='趋势图']")
    private WebElement trend;

    @FindBy(xpath = "//label[text()='描述']/following-sibling::input")
    private WebElement describe;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div//div[@class='ant-select-selection-selected-value']")
    private WebElement selectedUser;

    @FindBy(xpath = "//input[@class='_11DWHviyrYqinGKO4nRa5o']")
    private WebElement period;

    @FindBy(className = "el-input__inner")
    private List<WebElement> selectList;

    @FindBy(xpath = "//span[text()='确定']")
    private List<WebElement> ensure;

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
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

    @FindBy(xpath = "//span[text()='确 定']/ancestor::button")
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

    @FindBy(xpath = "//span[text()='新建搜索']")
    private WebElement savedSearch;

    @FindBy(xpath = "//span[text()='新建监控']")
    private WebElement alert;

    @FindBy(xpath = "//button[@class='el-button el-button--primary']/span[text()='确定']")
    private List<WebElement> ensureList;

    @FindBy(xpath = "(//span[text()='确 定']/ancestor::button)[last()]")
    private WebElement deleteSavedSearch;

    public WebElement getDeleteSavedSearch() {
        return deleteSavedSearch;
    }

    @FindBy(xpath = "//i[@title='暂停']")
    private WebElement pause;

    @FindBy(xpath = "//i[@title='取消']")
    private WebElement cancle;

    @FindBy(xpath = "//span[text()='取消']/ancestor::button")
    private WebElement cancel;

    @FindBy(xpath = "//i[@title='恢复']")
    private WebElement recover;

    @FindBy(xpath = "//button[@class='el-button yw-search-pages-download el-button--default']/span")
    private WebElement download;

    @FindBy(xpath = "//label[contains(text(),'文件名称')]/following-sibling::input")
    private WebElement downloadName;

    @FindBy(xpath = "//label[contains(text(),'最大行数')]/following-sibling::div//i")
    private WebElement maxLineDropdown;

    @FindBy(xpath = "//button[@class='el-button yw-search-pages-download el-button--primary']/span")
    private WebElement downloadEvent;

    @FindBy(xpath = "//div[@class='yw-search-info-content error-status']/span")
    private WebElement noDataInfo;

    //@FindBy(className = "el-time-panel")
    @FindBy(xpath = "(//input[@placeholder='请选择时间']/ancestor::div[2])[last()]")
    private WebElement timePanel;

    @FindBy(xpath = "//div[@class='el-message-box']//span[contains(text(),'确定')]")
    private WebElement sourceEnsure;

    @FindBy(xpath = "//td[@data-col-name]/span")
    private List<WebElement> columnList;

    @FindBy(className = "_2dbwZ_u3soDYQC50Ls5yOo")
    private WebElement rightIcon;

    @FindBy(xpath = "//span[text()='x']/ancestor::td/following-sibling::td/span")
    private WebElement xValue;

    @FindBy(className = "icon-fanyeqishangjiantou")
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

    @FindBy(xpath = "(//span[text()='查询无结果。'])[1]")
    private WebElement noResult;

    @FindBy(xpath = "//div[@class='yw-searchbar__prepend el-dropdown']/following-sibling::sup")
    private WebElement sup;

    @FindBy(xpath = "(//tbody)[last()]")
    private WebElement table;

    @FindBy(xpath = "//td[text()='AutoTestUserCreate']/preceding-sibling::td/i")
    private WebElement star;

    @FindBy(xpath = "//div[@class='yw-search-tabbar-item']")
    private WebElement searchTabBar;

    @FindBy(xpath = "(//li[text()='AutoTest'])[last()]")
    private WebElement eventOperatorAutoTest;

    @FindBy(xpath = "//span[contains(text(),'raw_message')][@class='yw-search-event-json-key-item']")
    private WebElement rawMessage;

    @FindBy(xpath = "(//li[text()='查看上下文sample'])[last()]")
    private WebElement contextSample;

    @FindBy(xpath = "//span[text()='71.221.121.107']")
    private WebElement clientip;

    @FindBy(xpath = "//span[text()='sample04061424'][@class='yw-search-event-json-value-item']")
    private WebElement tag;

    @FindBy(xpath = "//li[text()='添加到搜索']")
    private WebElement addToSearch;

    @FindBy(xpath = "//li[text()='从搜索删除']")
    private WebElement removeFromSearch;

    @FindBy(xpath = "//span[text()='执行一次']/preceding-sibling::div")
    private WebElement executeTime;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement lastDropdown;

    @FindBy(xpath = "//div[text()='crontab']")
    private WebElement crontab;

    @FindBy(className = "_11DWHviyrYqinGKO4nRa5o")
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

    @FindBy(className = "_34z8Og_bzWmsjaI0u5wBOf")
    private WebElement firstArea;

    @FindBy(xpath = "//span[text()='保存为']")
    private WebElement saveAsOther;

    @FindBy(xpath = "//span[text()='保存为']")
    private WebElement saveAs;

    @FindBy(xpath = "//li[text()='趋势图']")
    private WebElement saveAsTrend;

    @FindBy(xpath = "//li[text()='定时任务']")
    private WebElement saveAsSchedule;

    @FindBy(xpath = "(//span[text()='确 定']/ancestor::button)[last()]")
    private WebElement ensureCrontab;

    @FindBy(xpath = "(//label[text()='所属应用']/ancestor::div//i[@class='anticon anticon-down ant-select-arrow-icon'])[last()]")
    private WebElement appIcon;

    @FindBy(xpath = "//div[text()='事件']/span")
    private WebElement eventNumber;

    @FindBy(className = "ant-message-success")
    private WebElement message;

    @FindBy(xpath = "//label[text()='搜索内容']/following-sibling::div")
    private WebElement searchContent;

    @FindBy(xpath = "//button[@class='ant-btn ant-btn-primary']")
    private WebElement ensureCreateTrend;

    @FindBy(xpath = "(//div[@class='_1KryJcLeSypo0Qh_wW6fOw']//span[text()='all']) | (//div[@class='_1KryJcLeSypo0Qh_wW6fOw']//span[text()='all_']) ")
    private WebElement resourceAll;



    public WebElement getResourceAll() {
        return resourceAll;
    }

    public WebElement getGroupComboBox() {
        groupComboBox.click();
        return super.getLastDropdownList();
    }

    public WebElement getAppComboBox() {
        appComboBox.click();
        return super.getLastDropdownList();
    }

    @FindBy(tagName = "table")
    private WebElement tableList;
    //数据集父子行为是继承的根节点的子节点
    @FindBy(xpath = "//span[text()='继承1']")
    private WebElement jiCheng;

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

    public WebElement getCrontab(){
        return crontab;
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

    public WebElement getContextSample() {
        return contextSample;
    }

    public WebElement getRawMessage() {
        return rawMessage;
    }

    public WebElement getEventOperatorAutoTest() {
        return eventOperatorAutoTest;
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

    public WebElement getNoDataInfo() {
        return noDataInfo;
    }

    public WebElement getSavedSearch() {
        return savedSearch;
    }

    public WebElement getDownloadEvent() {
        return downloadEvent;
    }

    public WebElement getMaxLineDropdown() {
        maxLineDropdown.click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    public WebElement getDownloadName() {
        return downloadName;
    }

    public WebElement getMaxLineNum() {
        return super.getInputElement("最大行数");
    }

    public WebElement getCreateDownloadTask() {
        return super.getButton("创建");
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

    public WebElement getEnsureCreateSavedSearch() {
        return super.getButton("确 定");
    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::input")
    private WebElement offlineTaskName;

    @FindBy(xpath = "//label[text()='名称']/following-sibling::input")
    private WebElement taskName;

    public WebElement getApplyButton() {
        return GetTime.getTime(webDriver, "ApplyButton");
    }

    public WebElement getApplyCustomTime() {
        return GetTime.getTime(webDriver, "ApplyCustomTime");
    }

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

    public WebElement getThirtySeconds() {
        return GetTime.getTime(webDriver, "ThirtySeconds");
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

    @FindBy(xpath = "//input[@class='ant-time-picker-panel-input']")
    private WebElement startTimeInput;

    @FindBy(xpath = "(//span[@class='_2x-YdNak-IrcZb4ybbyK1X'])[last()]")
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

    public WebElement getTimedTask() {
        return timedTask;
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

    @FindBy(xpath = "//div[@class='ant-tabs-nav-wrap']/div/div/div/div[3]")
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

    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
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

    public WebElement getSearchStatus() {
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

    public WebElement getDownloadButton() {
        return super.getButton("下载");
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

    //author_jnd

    //数据集父子行为是无的根节点的子节点
    @FindBy(xpath = "//span[text()='无1']")
    private WebElement fatherChildNull;
    //页面上方趋势图超链接
    @FindBy(xpath = "//a[contains(text(),'趋势图')]")
    private WebElement upperTrend;

    //数据集父子行为是汇聚的根节点
    @FindBy(xpath = "//span[text()='汇聚tree']")
    private WebElement huiJu;

    public WebElement getTableList() {
        return tableList;
    }

    public WebElement getFatherChildNull() {
        return fatherChildNull;
    }

    public WebElement getHuiJu() {
        return huiJu;
    }

    //数据集的展开按钮
    @FindBy(xpath = "//a[text()='展开']")
    private WebElement zhanKai;

    public WebElement getJiCheng() {
        return jiCheng;
    }

    //数据集的内容
    @FindBy(xpath = "//div[@class='haE36auAEA9saq70cDkWx']/span")
    private WebElement dataSetPosition;

    public WebElement getZhanKai() {
        return zhanKai;
    }

    //保存为定时任务成功之后弹窗上的确定按钮
    @FindBy(xpath = "//div[@class='minaCXZ5tceRilaw8FVvn']/button")
    private WebElement timeTaskEnsure;

    public WebElement getDataSetPosition() {
        return dataSetPosition;
    }

    //页面上方定时任务超链接
    @FindBy(xpath = "//a[contains(text(),'定时任务')]")
    private WebElement schedule;

    public WebElement getTimeTaskEnsure() {
        return super.getButton("确定");
    }

    //搜索页面保存为趋势图
    @FindBy(xpath = "//li[text()='趋势图']")
    private WebElement saveTrend;

    public WebElement getSchedule() {
        return schedule;
    }

    //保存为趋势图的名称
    @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::input")
    private WebElement trendName;

    public WebElement getSaveTrend() {
        return saveTrend;
    }


    //保存为趋势图成功之后提示弹窗中的确定按钮
    @FindBy(xpath = "//div[@class='minaCXZ5tceRilaw8FVvn']/button")
    private WebElement trendEnsureAfterEnsure;

    public WebElement getTrendName() {
        return trendName;
    }

    public WebElement getTrendEnsureAfterEnsure() {
        return super.getButton("确定");
    }

    public WebElement getUpperTrend() {
        return upperTrend;
    }


    //保存为定时任务弹窗中的【描述】
    @FindBy(xpath = "//label[text()='描述']/following-sibling::input")
    private WebElement scheduleDescribe;

    public WebElement getScheduleDescribe() {
        return scheduleDescribe;
    }

    public WebElement getResult() {
        return result;
    }

    @FindBy(xpath = "//div[@class='_2s3Fd-GN0DsYSjwg0ByfD1 yw-table']")
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

}
