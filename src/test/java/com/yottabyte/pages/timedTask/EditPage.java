package com.yottabyte.pages.timedTask;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class EditPage extends PageTemplate {

    @FindBy(xpath = "//input[@name='name']")
    private WebElement name;

    @FindBy(xpath = "//textarea[@name='description']")
    private WebElement describe;

    @FindBy(xpath = "//input[@name='size']")
    private WebElement number;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div/div/input")
    private WebElement user;

    @FindBy(xpath = "//label[text()='数据集']/ancestor::div[1]/following-sibling::div//span")
    private WebElement resource;

    @FindBy(xpath = "//label[text()='资源标签']/ancestor::div[1]/following-sibling::div")
    private WebElement taskGroup;

    @FindBy(xpath = "(//label[text()='资源标签']/ancestor::div[1]/following-sibling::div//span[@class='yotta-tag-content'])[1]")
    private WebElement selectedGroup;

    @FindBy(xpath = "//label[text()='资源标签']/ancestor::div[1]/following-sibling::div//input")
    private WebElement taskGroupInput;

    @FindBy(xpath = "//input[@name='frequencyValue']")
    private WebElement period;

    @FindBy(xpath = "//div[@class='custom']//input[@placeholder='请选择时间']")
    private WebElement startTime;

    @FindBy(xpath = "//div[text()='结果处理方式']")
    private WebElement resultHandling;

    @FindBy(xpath = "//label[text()='添加JDBC']")
    private WebElement addJDBC;

    @FindBy(xpath = "(//span[text()='JDBC'])[last()]")
    private WebElement jdbc;

    @FindBy(xpath = "(//input[contains(@name,'.name')])[last()]")
    private WebElement connectName;

    @FindBy(xpath = "(//input[contains(@name,'.user_name')])[last()]")
    private WebElement userName;

    @FindBy(xpath = "(//input[contains(@name,'.password')])[last()]")
    private WebElement password;

    @FindBy(xpath = "(//input[contains(@name,'.host')])[last()]")
    private WebElement host;

    @FindBy(xpath = "(//input[contains(@name,'.port')])[last()]")
    private WebElement port;

    @FindBy(xpath = "(//div[contains(@name,'.category')])[last()]")
    private WebElement databaseType;

    @FindBy(xpath = "(//input[contains(@name,'.database_name')])[last()]")
    private WebElement dbName;

    @FindBy(xpath = "(//input[contains(@name,'.table_name')])[last()]")
    private WebElement tableName;

    @FindBy(className = "el-message__group")
    private WebElement verifySuccessful;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensureButton;

    @FindBy(xpath = "//span[text()='crontab']")
    private WebElement crontab;

    @FindBy(xpath = "//input[@name='crontab']")
    private WebElement crontabInput;

    @FindBy(xpath = "//label[text()='搜索内容']/ancestor::div[1]/following-sibling::div//textarea")
    private WebElement textarea;

    @FindBy(xpath = "//div[@name='unit']")
    private WebElement unit;

    @FindBy(xpath = "//label[text()='运行用户']/ancestor::div[1]/following-sibling::div//span[@class='yotta-select-selection-value']")
    private WebElement selectedUser;

    @FindBy(xpath = "//label[text()='所属应用']/ancestor::div[1]/following-sibling::div")
    private WebElement appDropdown;

    @FindBy(xpath = "//label[text()='所属应用']/ancestor::div[1]/following-sibling::div//span[@class='yotta-select-selection-value']")
    private WebElement selectedApp;

    @FindBy(xpath = "//label[text()='count']/following-sibling::input")
    private WebElement count;

    @FindBy(xpath = "//label[text()='percent']/following-sibling::input")
    private WebElement percent;

    @FindBy(xpath = "(//label[text()='resplen']/following-sibling::input) | (//label[text()='apache.resplen']/following-sibling::input)")
    private WebElement resplen;

    @FindBy(xpath = "//span[contains(text(),'已存搜索')]")
    private WebElement savedSearch;

    @FindBy(xpath = "(//span[contains(@class,'yotta-menu-item')]/ancestor::ul[contains(@class,'yotta-menu')])")
    private WebElement savedSearchList;

    @FindBy(xpath = "//span[text()='点击解析']")
    private WebElement parse;

    @FindBy(xpath = "//span[text()='最近十次执行时间']/ancestor::div[1]/following-sibling::div[1]")
    private WebElement parseResult;

    @FindBy(xpath = "(//div[contains(@class,'help-text')])[1]")
    private WebElement tipText;

    @FindBy(xpath = "//span[@aria-label='CloseCircleFilled']/ancestor::div[1]/following-sibling::p")
    private WebElement errorMessage;

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getTipText() {
        return tipText;
    }

    public WebElement getParse() {
        return parse;
    }

    public WebElement getParseResult() {
        return parseResult;
    }

    public WebElement getSavedSearch() {
        savedSearch.click();
        return savedSearchList;
    }

    public WebElement getCount() {
        return count;
    }

    public WebElement getPercent() {
        return percent;
    }

    public WebElement getResplen() {
        return resplen;
    }

    public WebElement getAppDropdown() {
        appDropdown.click();
        return super.getLastDropdownList();
    }

    public WebElement getSelectedApp() {
        return selectedApp;
    }

    public WebElement getSelectedUser() {
        return selectedUser;
    }

    public WebElement getUnit() {
        unit.click();
        return getLastDropdownList();
    }

    public WebElement getTextarea() {
        return textarea;
    }

    public WebElement getSearchTextarea() {
        return textarea;
    }

    public WebElement getCrontabInput() {
        crontab.click();
        return crontabInput;
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getAlert() {
        return verifySuccessful;
    }

    public WebElement getDbType() {
        databaseType.click();
        return super.getLastDropdownList();
    }

    public WebElement getAddJDBC() {
        return addJDBC;
    }

    public WebElement getJdbc() {
        return jdbc;
    }

    public WebElement getUserName() {
        return userName;
    }

    public WebElement getPassword() {
        return password;
    }

    public WebElement getHost() {
        return host;
    }

    public WebElement getPort() {
        return port;
    }

    public WebElement getDbName() {
        return dbName;
    }

    public WebElement getTableName() {
        return tableName;
    }

    public WebElement getVerify() {
        return getButton("验证");
    }

    public WebElement getOK() {
        return getButton("知道了");
    }

    public WebElement getConnectName() {
        return connectName;
    }

    public WebElement getResultHandling() {
        return resultHandling;
    }

    public WebElement getSuccessMessage() {
        return super.getMessage();
    }

    public WebElement getMessage() {
        return super.getMessage();
    }

    public WebElement getSaveButton() {
        return super.getButton("保存");
    }

    public EditPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }


    public WebElement getName() {
        return name;
    }

    public WebElement getDescribe() {
        return describe;
    }

    public WebElement getNumber() {
        return number;
    }

    public WebElement getResource() {
        return resource;
    }

    public WebElement getSelectedGroup() {
        return selectedGroup;
    }

    public WebElement getTaskGroupInput() {
        taskGroup.click();
        return taskGroupInput;
    }

    public WebElement getTaskGroup() {
        taskGroup.click();
        return super.getLastDropdownList();
    }

    public WebElement getPeriod() {
        return period;
    }

    public WebElement getStartTime() {
        return startTime;
    }

    public WebElement getDataSet() {
        return resource;
    }


}
