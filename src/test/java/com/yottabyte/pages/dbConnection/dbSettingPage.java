package com.yottabyte.pages.dbConnection;

import com.yottabyte.pages.DateEditorPage;
import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

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
        String xpath = "//label[contains(text(),'连接类型')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
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

    @FindBy(xpath = "//div[contains(text(),'数据库连接包含连接到远程数据库所需的信息')]/following::span/input[@placeholder='输入关键字']")
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

    //    @FindBy(xpath = "//div[@class='CodeMirror-code']/pre[@class='CodeMirror-line']/span/[@role='presentation']/span[@class='cm-variable']")
    @FindBy(className = "CodeMirror-code")
    private WebElement searchInput;

    public WebElement getSearchInput() {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(searchInput);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchInput;
    }

    @FindBy(className = "_3YkNGxdQeNWgUScXUAUj4D")
    private WebElement searchStatus;

    public WebElement getSearchStatus() {
        return searchStatus;
    }

//    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
//    private WebElement dateEditor;
//    public WebElement getDateEditor()
//    {
//        return dateEditor;
//    }
//
//    public WebElement getToday() {
//        return (new DateEditorPage(webDriver)).getToday();
//    }

    public WebElement getSearchButton() {
        return super.getButton("搜索");
    }

    public WebElement getNextStepButton() {
        return super.getButton("下一步");
    }

    public WebElement getDbLookupConnList() {
        String xpath = "//div[contains(text(),'连接')]/following-sibling::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbLookupDirList() {
        String xpath = "//div[contains(text(),'目录')]/following-sibling::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
//        WebElement element = webDriver.findElement(By.xpath(xpath));
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
//        ClickEvent.clickUnderneathButton(element);
//        return getLastDropdownList();
        return super.getLastDropdownListOnSendPolicyPage(xpath);

    }

    @FindBy(xpath = "//div[text()='表']/following-sibling::span/input[@placeholder='请输入']")
    private WebElement lookupDbTable;

    public WebElement getLookupDbTable() {
        return lookupDbTable;
    }

    @FindBy(xpath = "//div[text()='表']/following::input[@placeholder='请输入']/following::ul/li/a[text()='lookupsample']")
    private WebElement lookupDbTableLink;

    public WebElement getLookupDbTableLink() {
        return lookupDbTableLink;
    }

    @FindBy(xpath = "//span[contains(text(),'搜索字段映射')]/following::div/a[text()='添加映射']")
    private WebElement addFieldMap;

    public WebElement getAddFieldMap() {
        return addFieldMap;
    }

    public WebElement getDbLookupSearchFieldR1C1List() {
        String xpath = "//span[contains(text(),'搜索字段映射')]/following::span[contains(text(),'搜索字段')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbLookupSearchFieldR1C2List() {
        String xpath = "//span[contains(text(),'搜索字段映射')]/following::span[contains(text(),'表格列名称')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        return super.getLastDropdownListOnSendPolicyPage(xpath);
//        return getLastDropdownList();
    }

    @FindBy(xpath = "//span[contains(text(),'Lookup 字段')]/following::div/a[text()='添加字段']")
    private WebElement addLookupField;

    public WebElement getAddLookupField() {
        return addLookupField;
    }

    public WebElement getDbLookupLookupFieldR1C1List() {
        String xpath = "//span[contains(text(),'Lookup 字段')]/following::span[contains(text(),'表格列名称')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::input[@placeholder='请输入名称']")
    private WebElement dbLookupName;

    public WebElement getDbLookupName() {
        return dbLookupName;
    }

}
