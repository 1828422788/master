package com.yottabyte.pages.splSearch;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.DateEditorPage;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.TakeScreenShot;
import com.yottabyte.utils.WaitForElement;
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
public class SearchPage extends PageTemplate {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    TakeScreenShot shot = SharedDriver.getScreenShot();
    ExpectedCondition expectedCondition;

    public SearchPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[text()='统计']")
    private WebElement countButton;

    public WebElement getCountButton() {
        return countButton;
    }

    @FindBy(xpath = "//div[@class='yw-searchbar__inner el-textarea']/textarea")
    private WebElement searchInput;

    @FindBy(className = "yw-searchbar__append")
    private WebElement searchButton;

    @FindBy(className = "icon-dakai_icon")
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

    @FindBy(xpath = "//div[@class='tree-item folder-item root-item']/span[text()='java']")
    private WebElement javaField;

    @FindBy(xpath = "//span[text()='appname']")
    private WebElement appName;

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
        return fieldsTree.findElements(By.xpath("./li")).get(1).findElement(By.tagName("ul"));
    }

    public WebElement getCloseAllFields() {
        return closeAllFields;
    }

    @Override
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

    @FindBy(className = "yw-search-tabbar-status")
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

    @FindBy(xpath = "//div[@class='yw-search-form-group']/label[text()='名称']/following-sibling::input")
    private WebElement taskName;

    @FindBy(xpath = "//div[@class='yw-search-form-group']/label[text()='描述']/following-sibling::input")
    private WebElement describe;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//div[@class='custom']//div[@class='value el-input']/input")
    private WebElement period;

    @FindBy(className = "el-input__inner")
    private List<WebElement> selectList;

    @FindBy(xpath = "//span[text()='确定']")
    private List<WebElement> ensure;

    @FindBy(className = "el-message-box__message")
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

    @FindBy(xpath = "//span[contains(text(),'生成')]")
    private WebElement generate;

    @FindBy(xpath = "//span[contains(text(),'权重')]")
    private WebElement weight;

    @FindBy(xpath = "//span[contains(text(),'展示')]")
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

    @FindBy(xpath = "//button[@class='el-time-panel__btn confirm']")
    private List<WebElement> ensureButton;

    @FindBy(className = "el-icon--right")
    private WebElement arrowDown;

    @FindBy(className = "el-tree-node__content")
    private List<WebElement> nodeList;

    @FindBy(xpath = "//i[@class='yw-search-control-icon iconfont icon-cunweibaobiao_icon']")
    private WebElement saveAsReport;

    @FindBy(className = "el-dropdown-menu")
    private List<WebElement> dropDownMenu;

    @FindBy(xpath = "//li[text()='离线任务']")
    private WebElement offlineTask;

    @FindBy(xpath = "//li[text()='已存搜索']")
    private WebElement savedSearch;

    @FindBy(xpath = "//button[@class='el-button el-button--primary']/span[text()='确定']")
    private List<WebElement> ensureList;

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement deleteSavedSearch;

    public WebElement getDeleteSavedSearch() {
        return deleteSavedSearch;
    }

    @FindBy(xpath = "//i[@title='暂停']")
    private WebElement pause;

    @FindBy(xpath = "//i[@title='取消']")
    private WebElement cancle;

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

    public WebElement getDocumentType() {
        return super.getDropdownList("文件类型");
    }

    public WebElement getDocumentEncode() {
        return super.getDropdownList("文件编码");
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
        return ensureList.get(3);
    }


    @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::input")
    private WebElement offlineTaskName;

    public WebElement getApplyButton() {
        return GetTime.getTime(webDriver, "ApplyButton");
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
        return ensureButton.get(ensureButton.size() - 1);
    }

    public WebElement getYaxis() {
        return yaxis.get(1);
    }

    public WebElement getActuralData() {
//        ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", dropdownList.get(dropdownList.size() - 1));

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
        return generate;
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
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(dropdownList.get(dropdownList.size() - 1)));
        return dropdownList.get(dropdownList.size() - 1);
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
        return ensure.get(1);
    }

    public WebElement getPeriod() {
        return period;
    }

    @FindBy(xpath = "//span[text()='开始']/preceding-sibling::div/input")
    private WebElement startTime;

    public WebElement getStartTime() {
        return startTime;
    }

    // 运行用户
    public List<WebElement> getUserComboBox() {
        runningUser.click();
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(dropdownList.get(dropdownList.size() - 1));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return this.dropdownList.get(dropdownList.size() - 1).findElements(By.tagName("li"));
    }

    // 分组
    public List<WebElement> getGroupComboBox() {
        group.click();
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(dropdownList.get(dropdownList.size() - 1));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return this.dropdownList.get(dropdownList.size() - 1).findElements(By.tagName("li"));
    }

    public WebElement getDescribe() {
        return describe;
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
        return buttons.get(3);
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

    public WebElement getThisMonth() {
        return GetTime.getTime(webDriver, "ThisMonth");
    }

    public void getCustomTime() {
//        DateEditorPage dateEditorPage = new DateEditorPage(webDriver);
//        LoginBeforeAllTests.setPageFactory(dateEditorPage);
//        dateEditorPage.getCustomTime("00:00:00", "00:00:00", "2016-08-01", "2018-08-03");
//        LoginBeforeAllTests.setPageFactory(this);
        GetTime.getTime(webDriver, "CustomTime");
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
        return GetTime.getTime(webDriver, "Today");
    }

    // 获取昨天按钮
    public WebElement getYesterday() {
        DateEditorPage dateEditorPage = new DateEditorPage(webDriver);
        LoginBeforeAllTests.setPageFactory(dateEditorPage);
        WebElement webElement = dateEditorPage.getYesterday();
        return webElement;
    }

    public WebElement getSearchTable() {
        return searchTable;
    }

    public WebElement getSearchInput() throws InterruptedException {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(searchInput);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchInput;
    }

    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
    private WebElement dateEditor;

    public WebElement getDateEditor() {
//        DateEditorPage date = new DateEditorPage(webDriver);
//        LoginBeforeAllTests.setPageFactory(date);
//        WebElement webElement = date.getPublicDateEditor();

        return dateEditor;
    }

    public WebElement getSearchButton() {
//        LoginBeforeAllTests.setPageFactory(this);
        expectedCondition = ExpectedConditions.elementToBeClickable(searchButton);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchButton;
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
}
