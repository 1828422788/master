package com.yottabyte.pages.alert;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.stepDefs.SetKeyWithValue;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.GetLogger;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;

import java.util.List;

public class ListPage extends ListPageFactory {

    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(className = "el-loading-mask")
    private WebElement loadingElement;

    // 无搜索结果
    @FindBy(className = "el-table__empty-text")
    private WebElement noSearchResultMessage;

    // 搜索结果表格
    @FindBy(className = "el-table__body")
    private WebElement searchResult;

    @FindBy(xpath = "//span[contains(text(),'最新状态')]")
    private WebElement latestStatus;

    @FindBy(xpath = "//span[contains(text(),'今日待处理全部告警')]")
    private WebElement pending;

    @FindBy(xpath = "//span[contains(text(),'今日已处理全部告警')]")
    private WebElement handled;

    @FindBy(xpath = "//span[contains(text(),'其中高级告警')]")
    private WebElement highAlert;

    @FindBy(xpath = "//span[text()='处理及时率']")
    private WebElement workLoads;

    @FindBy(xpath = "//span[text()='全部资源']/preceding-sibling::i")
    private WebElement dropdownButton;

    @FindBy(xpath = "//input[@placeholder='筛选分组']/ancestor::ul")
    private WebElement dropdownMenu;

    @FindBy(xpath = "(//span[contains(text(),'确定')])[last()]")
    private WebElement ensureDeleteButton;

    @FindBy(xpath = "//span[@style='padding-right: 0.1px;']")
    private WebElement splSearchInput;

    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
    private WebElement dateEditor;

    @FindBy(xpath = "//span[text()='AutoTestRoleWithAllResource']/ancestor::li")
    private WebElement disabledLi;

    @FindBy(xpath = "//span[text()='维护期']")
    private WebElement maintenance;

    @FindBy(className = "title")
    private List<WebElement> titleList;

    @FindBy(className = "border-round")
    private WebElement border;

    @FindBy(className = "view")
    private WebElement view;

    @FindBy(xpath = "//*[@class='el-input__icon el-icon-search is-clickable']")
    private WebElement search;

    @FindBy(xpath = "(//span[@class='status-number hover-number'])[last()]")
    private WebElement alertNum;

    @FindBy(xpath = "(//span[@class='ant-switch-inner']/parent::button")
//    @FindBy(xpath = "(//button[@class='css-18vwpo7 ant-switch-small ant-switch']")
    private WebElement alertTurnOn;
    public WebElement getAlertTurnOn() {
        return alertTurnOn;
    }

    @FindBy(className = "ant-empty-description")
    private WebElement noneData;

    @FindBy(xpath = "//li[@yotta-test='alert-authorize-button']/span")
    private WebElement auth;

    @FindBy(xpath = "//li[@yotta-test='alert-tags-button']/span")
    private WebElement label;

    @FindBy(xpath = "//li[@yotta-test='alert-copy-button']/span")
    private WebElement copy;

    @FindBy(xpath = "//li[@yotta-test='alert-delete-button']/span")
    private WebElement delete;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tagToInput;

    public WebElement getTagToInput() {
        return tagToInput;
    }

    public WebElement getLabel() { return label; }

    public WebElement getCopy() { return copy; }

    public WebElement getDelete() { return delete; }

    public WebElement getAuth() { return auth; }

    public WebElement getLoadingElement() {
        return loadingElement;
    }

    public WebElement getNoneData() {
        return noneData;
    }

    public WebElement getAlertPlugin() {
        return super.getButton("告警插件");
    }

    public WebElement getAlertNum() {
        return alertNum;
    }

    public WebElement getSearch() {
        return search;
    }

    public WebElement getView() {
        return view;
    }

    public WebElement getBorder() {
        return border;
    }

    public List<WebElement> getTitleList() {
        return titleList;
    }

    public WebElement getMaintenance() {
        return maintenance;
    }

    public WebElement getDisabledLi() {
        return disabledLi;
    }

    public WebElement getNoSearchResultMessage() {
        return noSearchResultMessage;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getSplSearchInput() {
        return splSearchInput;
    }

    public WebElement getEnsureDeleteButton() {
        return ensureDeleteButton;
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSearchInputElement() {
        return searchInputElement;
    }

    @FindBy(xpath = "//div[@class='yw-table-group__basic el-input']/input")
    private WebElement searchInputElement;

    // 搜索输入框
    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement alertListSearchInput;
    public WebElement getAlertListSearchInput() {
        return alertListSearchInput;
    }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement searchInputName; //名称

    public WebElement getSearchInputName() {
        return searchInputName;
    }

    // 搜索输入框
    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']/following-sibling::span")
    private WebElement alertListSearchInputButton;
    public WebElement getAlertListSearchInputButton() {
        return alertListSearchInputButton;
    }

    public WebElement getDropdownMenu() {
        dropdownButton.click();
        return dropdownMenu;
    }

    public WebElement getWorkLoads() {
        return workLoads;
    }

    public WebElement getHighAlert() {
        return highAlert;
    }

    public WebElement getHandled() {
        return handled;
    }

    public WebElement getPending() {
        return pending;
    }

    public WebElement getLatestStatus() {
        return latestStatus;
    }

    public WebElement getTableDeleteButton(int row) {
        WebElement element = getSearchResult();
        if (element.findElements(By.tagName("tr")).size() > 0) {
            return element.findElements(By.tagName("tr")).get(row - 1).findElement(By.xpath("//td[@class='el-table_1_column_5']//span[contains(text(),'删除')]"));
        } else if (noSearchResultMessage.isDisplayed()) {
//            GetLogger.getLogger().error("没有搜索结果");
            throw new NoSuchElementException("没有搜索结果");
        } else {
//            GetLogger.getLogger().error("请检查输入");
            throw new NoSuchElementException("请检查输入");
        }
    }

    public WebElement getCreateAlert() {
        return super.getButton("新建");
    }

    public WebElement getSearchResult() {
        if (ElementExist.isElementExist(webDriver, searchResult)) {
            return searchResult;
        } else if (ElementExist.isElementExist(webDriver, noSearchResultMessage)) {
            return noSearchResultMessage;
        } else {
//            GetLogger.getLogger().error("请检查输入");
            throw new NoSuchElementException("请检查输入");
        }
    }

    void thereIsAnAlert(String alertName, List<String> alertGroup, List<String> alertSource, List<String> alertLevel) {
        new SetKeyWithValue().clearElementValue(getSearchInput());
        getSearchInput().sendKeys(alertName);
        if (ElementExist.isElementExist(webDriver, noSearchResultMessage)) {
            getCreateAlert().click();
            new CreatePage(webDriver).createAlert(alertName, alertGroup, alertSource, alertLevel);
        } else {
            System.out.println("do not need create");
        }
    }

    @Override
    protected void load() {
        if (LoginBeforeAllTests.getCookie() != null) {
            webDriver.get("http://" + config.get("rizhiyi_server_host") + "/alerts");
            webDriver.manage().addCookie(LoginBeforeAllTests.getCookie());
        } else {
            LoginBeforeAllTests.login();
        }
    }

//    @Override
//    protected void isLoaded() throws Error {
//        super.isLoaded();
//        try {
//            WaitElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loadingElement));
//        } catch (Exception e) {
//            GetLogger.getLogger().error("can not load % with error %", this.getClass().getSimpleName(), e);
//        }
//    }

//    public static void main(String args[]) throws InterruptedException {
//        SharedDriver driver = new SharedDriver();
//        ConfigManager c = new ConfigManager();
//        List list = new ArrayList<>();
//        List list1 = new ArrayList<>();
//        List list2 = new ArrayList<>();
//        list.add("default_Alert");
//        list1.add("所有日志");
//        list2.add("1");
//        list2.add("3");
//        list2.add("10");
//        LoginBeforeAllTests login = new LoginBeforeAllTests(driver, c);
//        login.beforeScenario();
//        Thread.sleep(5000);
//        driver.get("http://" + config.get("rizhiyi_server_host") + "/alerts");
////        CreatePage p = new CreatePage(driver);
////        p.deleteAlert("AutoTest");
////        p.thereIsAnAlert("AutoTest", list, list1, list2);
//    }

    @FindBy(xpath = "(//a[contains(text(),'删除')])")
    private WebElement alertListDeleteButton;
    public WebElement getAlertListDeleteButton() throws InterruptedException {
        Thread.sleep(2000);
        return alertListDeleteButton;
    }

    @FindBy(xpath = "(//span[text()='操作']/following::td[@class='ant-table-row-cell-break-word']/span/a[@class='_3ubOsxW59qVzx3_uFMqnCR css-19iea6n'][contains(text(),'编辑')])")
    private WebElement alertListEditButton;
    public WebElement getAlertListEditButton() throws InterruptedException {
        Thread.sleep(2000);
        return alertListEditButton;
    }

    @FindBy(className = "ant-btn-primary")
    private WebElement confirmDelAlertButton;
    public WebElement getConfirmDelAlertButton() throws InterruptedException {
        Thread.sleep(2000);
        return confirmDelAlertButton;
    }

    @FindBy(xpath = "(//div[text()='正在维护'])")
    private WebElement maintainFlag;
    public WebElement getMaintainFlag()
    {
        return maintainFlag;
    }

    public WebElement getMultiOperate(){
        return super.getButton("批量操作");
    }

    public WebElement getMultiChooseButton(){
        return super.getButton("请选择");
    }

    @FindBy(xpath = "//span[text()='启动']")
    private WebElement multiStart;
    public WebElement getMultiStart() {
        return multiStart;
    }

    @FindBy(xpath = "//span[text()='添加资源标签']")
    private WebElement multiAddResourceTag;
    public WebElement getMultiAddResourceTag() {
        return multiAddResourceTag;
    }

    @FindBy(xpath = "//span[text()='删除']")
    private WebElement multiDelete;
    public WebElement getMultiDelete() {
        return multiDelete;
    }

    @FindBy(xpath = "(//tbody[@class='ant-table-tbody']/tr/td[@class='ant-table-selection-column']//span)[1]")
    private WebElement listItemOne;

    @FindBy(xpath = "(//tbody[@class='ant-table-tbody']/tr/td[@class='ant-table-selection-column']//span)[4]")
    private WebElement listItemTwo;

    @FindBy(xpath = "(//tbody[@class='ant-table-tbody']/tr/td[@class='ant-table-selection-column']//span)[7]")
    private WebElement listItemThree;

    public WebElement getListItemOne() { return listItemOne; }

    public WebElement getListItemTwo() { return listItemTwo; }

    public WebElement getListItemThree() { return listItemThree; }

    @FindBy(xpath = "(//button[contains(@class,'ant-switch')])[1]")
    private WebElement switchOne;

    @FindBy(xpath = "(//button[contains(@class,'ant-switch')])[2]")
    private WebElement switchTwo;

    @FindBy(xpath = "(//button[contains(@class,'ant-switch')])[3]")
    private WebElement switchThree;

    @FindBy(xpath = "(//button[contains(@class,'ant-switch')])[10]")
    private WebElement switchTen;

    public WebElement getSwitchOne() { return switchOne; }

    public WebElement getSwitchTwo() { return switchTwo; }

    public WebElement getSwitchThree() { return switchThree; }

    public WebElement getSwitchTen() { return switchTen; }

    @FindBy(xpath = "//thead[@class='ant-table-thead']/tr/th[@class='ant-table-selection-column']//span[@class='ant-checkbox']")
    private WebElement listHeadCheckbox;

    public WebElement getListHeadCheckbox() { return listHeadCheckbox; }

    @FindBy(xpath = "//li/a[text()='2']")
    private WebElement pageTwo;

    public WebElement getPageTwo() { return pageTwo; }

    @FindBy(xpath = "//div[text()='请输入标签名称']")
    private WebElement multiAddTag;

    public WebElement getMultiAddTag() {
        multiAddTag.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//span[text()='api00_all_事件计数_设备切分ip_扩展chart_all_交易日']/parent::button[@yotta-test='alert-name-button']")
    private WebElement alertNameButton;

    public WebElement getAlertNameButton() {
        return alertNameButton;
    }

}
