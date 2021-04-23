package com.yottabyte.pages.dbConnectionPre;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class dbSettingPage extends PageTemplate {
    public dbSettingPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//div[contains(text(),'连接配置')]")
    private WebElement dbConnConfig;

    public WebElement getDbConnConfig() {
        return dbConnConfig;
    }

    public WebElement getCreateDbConn() {
        return super.getButton("新建连接");
    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/following::input[@placeholder='请输入名称']")
    private WebElement newDbConnName;

    public WebElement getNewDbConnName() {
        return newDbConnName;
    }

    @FindBy(xpath = "//label[contains(text(),'账户名')]/following::input[@placeholder='请输入账户名']")
    private WebElement newDbUserName;

    public WebElement getNewDbUserName() {
        return newDbUserName;
    }

    @FindBy(xpath = "//label[contains(text(),'密码')]/following::input[@placeholder='请输入密码']")
    private WebElement newDbUserPassword;

    public WebElement getNewDbUserPassword() {
        return newDbUserPassword;
    }

    @FindBy(xpath = "//input[@placeholder='请输入获取行数']")
    private WebElement newDbRetLines;

    public WebElement getNewDbRetLines() {
        return newDbRetLines;
    }

    public WebElement getNewDbConnTypeList() {
//        return super.getYottaDropdownList("config-rule_type-select");
        String xpath = "//label[contains(text(),'连接类型')]/parent::div/following::div[@class='yotta-select yotta-select-large']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'主机')]/following::input[@placeholder='请输入主机']")
    private WebElement newDbConnHost;

    public WebElement getNewDbConnHost() {
        return newDbConnHost;
    }

    @FindBy(xpath = "//label[contains(text(),'端口')]/following::input[@placeholder='请输入端口']")
    private WebElement newDbConnPort;

    public WebElement getNewDbConnPort() {
        return newDbConnPort;
    }

    @FindBy(xpath = "//label[contains(text(),'默认数据库')]/following::input[@placeholder='请输入默认数据库']")
    private WebElement newConnDefaultDb;

    public WebElement getNewConnDefaultDb() {
        return newConnDefaultDb;
    }

    public WebElement getNewButtton() {
        return super.getButton("新建");
    }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement dbConnNameSearchInput;

    public WebElement getDbConnNameSearchInput() {
        return dbConnNameSearchInput;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement delDbConnNameButton;

    public WebElement getDelDbConnNameButton() {
        return delDbConnNameButton;
    }

    public WebElement getAffirmDelDbConnNameButton() {
        return super.getButton("确定");
    }

    @FindBy(xpath = "//span[contains(text(),'编辑')]/parent::button")
    private WebElement editDbConnNameButton;

    public WebElement getEditDbConnNameButton() {
        return editDbConnNameButton;
    }

    @FindBy(xpath = "//span[contains(text(),'保存')]/parent::button")
    private WebElement saveButton;

    public WebElement getSaveButton() {
        return saveButton;
    }

    /**
     * 配置数据库查找
     */

    @FindBy(xpath = "//div[contains(text(),'数据库查找')]")
    private WebElement dbLookupConfig;

    public WebElement getDbLookupConfig() {
        return dbLookupConfig;
    }

    @FindBy(xpath = "//span[contains(text(),'新建查找对象')]/parent::button")
    private WebElement newDbLookup;

    public WebElement getNewDbLookup() {
        return newDbLookup;
    }

    //    @FindBy(className = "CodeMirror-code")
    @FindBy(className = "CodeMirror")
    private WebElement searchInput;

    public WebElement getSearchInput() {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(searchInput);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchInput;
    }

    @FindBy(className = "yotta-search-control-text")
    private WebElement searchStatus;

    public WebElement getSearchStatus() {
        return searchStatus;
    }

//    @FindBy(xpath = "//div[@yotta-test='search_bar-time-date_time_picker']")
//    private WebElement dateEditor;
//
//    public WebElement getDateEditor() {
//        return dateEditor;
//    }

    public WebElement getToday() {
        return GetTime.getTime(webDriver, "Today");
    }

    @FindBy(xpath = "//button[@yotta-test='search_bar-submit-button']")
    private WebElement searchbutton;

    public WebElement getSearchButton() {
        return searchbutton;
    }

    @FindBy(xpath = "//span[contains(text(),'下一步')]/parent::button")
    private WebElement nextStepButton;

    public WebElement getNextStepButton() {
        return nextStepButton;
//        return super.getButton("下一步");
    }

    public WebElement getDbLookupConnList() {
        String xpath = "//div[contains(text(),'连接')]/following-sibling::div[@yotta-test='dbsettings-connection-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbLookupDirList() {
        String xpath = "//div[contains(text(),'目录')]/following-sibling::div[@yotta-test='dbsettings-database-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//div[text()='表']/following-sibling::span/input[@placeholder='请输入']")
    private WebElement lookupDbTable;

    public WebElement getLookupDbTable() {
        return lookupDbTable;
    }

    @FindBy(xpath = "//div[text()='表']/following-sibling::div//a[text()='lookupsample']")
    private WebElement lookupDbTableLink;

    public WebElement getLookupDbTableLink() {
        return lookupDbTableLink;
    }

    @FindBy(xpath = "//span[contains(text(),'字段映射')]/following::div/a[text()='添加映射']")
    private WebElement addFieldMap;

    public WebElement getAddFieldMap() {
        return addFieldMap;
    }

    public WebElement getDbLookupSearchFieldR1C1List() {
        String xpath = "//span[contains(text(),'字段映射')]/following::span[contains(text(),'搜索字段')]/following-sibling::div/div[@class='yotta-select-selection']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbLookupSearchFieldR1C2List() {
        String xpath = "//span[contains(text(),'字段映射')]/following::span[contains(text(),'表格列名称')]/following-sibling::div/div[@class='yotta-select-selection']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//span[contains(text(),'Lookup 字段')]/following::div/a[text()='添加字段']")
    private WebElement addLookupField;

    public WebElement getAddLookupField() {
        return addLookupField;
    }

    public WebElement getDbLookupLookupFieldR1C1List() {
        String xpath = "//span[contains(text(),'Lookup 字段')]/following::span[contains(text(),'表格列名称')]/following-sibling::div/div[@class='yotta-select-selection']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/parent::div/following-sibling::div/input[@placeholder='请输入名称']")
    private WebElement dbLookupName;

    public WebElement getDbLookupName() {
        return dbLookupName;
    }

    @FindBy(xpath = "//div[contains(text(),'数据库查找可以利用数据库来丰富日志易中的数据')]/following::span/input[@placeholder='输入关键字']")
    private WebElement dbLookupSearchInput;

    public WebElement getDbLookupSearchInput() {
        return dbLookupSearchInput;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement delDbLookupButton;

    public WebElement getDelDbLookupButton() {
        return delDbLookupButton;
    }

    public WebElement getAffirmDelDbLookupButton() {
        return super.getButton("确定");
    }

    //测试运行窗口提示
    @FindBy(xpath = "//div[@class='ant-modal-header']/div[@class='ant-modal-title'][@id='rcDialogTitle0'][contains(text(),'提示')]")
    private WebElement reminderBoxTitle;

    public WebElement getTestRunReminder() {
        return reminderBoxTitle;
    }

    //确认
    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement affirmButton;

    public WebElement getAffirmButton() {
        return affirmButton;
    }

    @FindBy(xpath = "//span[contains(text(),'完成')]/parent::button")
    private WebElement doneButton;

    public WebElement getDoneButton() {
        return doneButton;
    }

}
