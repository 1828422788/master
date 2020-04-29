package com.yottabyte.pages.timedTask;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class EditPage extends PageTemplate {

    @FindBy(xpath = "//label[text()='名称']/following-sibling::input")
    private WebElement name;

    @FindBy(xpath = "//label[text()='描述']/following-sibling::input")
    private WebElement describe;

    @FindBy(xpath = "//label[text()='搜索条数']/following-sibling::input")
    private WebElement number;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div/div/input")
    private WebElement user;

    @FindBy(xpath = "//div[@class='el-select-dropdown__wrap el-scrollbar__wrap']//li[@class = 'el-select-dropdown__item selected hover']/span")
    private WebElement userChosen;

    //@FindBy(xpath = "//label[text()='日志来源']/following-sibling::div//input")
    @FindBy(xpath = "//label[text()='数据集']/following-sibling::span")
    private WebElement resource;

    //@FindBy(xpath = "//label[text()='任务分组']/following-sibling::div//input")
    @FindBy(xpath = "(//label[text()='资源标签'][last()])/following-sibling::div[1]")
    private WebElement taskGroup;

    @FindBy(xpath = "(//label[text()='所属应用'][last()])/following-sibling::div[1]")
    private WebElement taskApp;

    @FindBy(xpath = "//li[@class='el-select-dropdown__item']/ancestor::ul")
    private WebElement appDropdownList;

    @FindBy(xpath = "//span[text()='执行一次']//preceding-sibling::input[@placeholder='请输入']")
    private WebElement period;

    @FindBy(xpath = "//div[@class='custom']//input[@placeholder='请选择时间']")
    private WebElement startTime;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownLists;

    @FindBy(xpath = "//div[text()='结果处理方式']")
    private WebElement resultHandling;

    @FindBy(xpath = "//label[text()='添加jdbc']")
    private WebElement addJDBC;

    @FindBy(xpath = "(//div[text()='JDBC'])[last()]")
    private WebElement jdbc;

    @FindBy(xpath = "//label[contains(text(),'连接名称')]/following-sibling::input")
    private WebElement connectName;

    @FindBy(xpath = "//label[contains(text(),'用户名')]/following-sibling::input")
    private WebElement userName;

    @FindBy(xpath = "//label[contains(text(),'密码')]/following-sibling::input")
    private WebElement password;

    @FindBy(xpath = "//label[contains(text(),'主机')]/following-sibling::input")
    private WebElement host;

    @FindBy(xpath = "//label[contains(text(),'端口')]/following-sibling::input")
    private WebElement port;

    @FindBy(xpath = "//label[text()='数据库类型']/following-sibling::div")
    private WebElement databaseType;

    @FindBy(xpath = "//label[contains(text(),'数据库名')]/following-sibling::input")
    private WebElement dbName;

    @FindBy(xpath = "//label[contains(text(),'数据库表名称')]/following-sibling::input")
    private WebElement tableName;

    @FindBy(xpath = "//span[text()='验证']/ancestor::button")
    private WebElement verify;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> selectLists;

    @FindBy(className = "el-message__group")
    private WebElement verifySuccessful;

    @FindBy(className = "column-value")
    private List<WebElement> dataMappings;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensureButton;

    @FindBy(xpath = "//div[text()='crontab']/ancestor::span")
    private WebElement crontab;

    @FindBy(xpath = "//div[text()='crontab']/ancestor::span/ancestor::span/following-sibling::div/input")
    private WebElement crontabInput;

    @FindBy(xpath = "//label[text()='搜索内容']/following-sibling::textarea")
    private WebElement textarea;

    @FindBy(className = "unit")
    private WebElement unit;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div//div[@class='ant-select-selection-selected-value']")
    private WebElement selectedUser;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div/div")
    private WebElement appDropdown;

    public WebElement getAppDropdown() {
        appDropdown.click();
        return super.getLastDropdownList();
    }

    public WebElement getSelectedUser() {
        return selectedUser;
    }

    public WebElement getUnit() {
        unit.click();
        return getLastDropdownList();
    }

    public WebElement getUserChosen() {
        return userChosen;
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

    public WebElement getFirstDataMapping() {
        return dataMappings.get(0).findElement(By.tagName("input"));
    }

    public WebElement getSecondDataMapping() {
        return dataMappings.get(1).findElement(By.tagName("input"));
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
        return verify;
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

    public WebElement getUser() {
        user.click();
        return dropdownLists.get(dropdownLists.size() - 1);
    }

    public WebElement getResource() {
        return resource;
    }


    public WebElement getTaskGroup() {
        taskGroup.click();
        return super.getLastDropdownList();
    }

    public WebElement getTaskApp() {
        taskApp.click();
        return super.getLastDropdownList();
    }

    public WebElement getPeriod() {
        return period;
    }

    public WebElement getStartTime() {
        return startTime;
    }


    //author_jnd
    //定时任务编辑页的数据集
    @FindBy(xpath = "//label[text()='数据集']/following-sibling::span")
    private WebElement dataSet;

    public WebElement getDataSet() {
        return dataSet;
    }


}
