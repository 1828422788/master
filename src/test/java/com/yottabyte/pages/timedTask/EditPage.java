package com.yottabyte.pages.timedTask;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class EditPage extends PageTemplate {

    public EditPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//div[@yotta-test='schedule-runner-select']//input")
    private WebElement user;

    @FindBy(xpath = "//label[text()='数据集']/ancestor::div[1]/following-sibling::div//span")
    private WebElement dataset;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']")
    private WebElement taskGroup;

    @FindBy(xpath = "(//div[@yotta-test='resource_tag-change_resource_tag-select']//span[@class='yotta-tag-content'])[1]")
    private WebElement selectedGroup;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement taskGroupInput;

    @FindBy(xpath = "//div[text()='结果处理方式']")
    private WebElement resultHandling;

    @FindBy(xpath = "(//span[text()='确定']/ancestor::button)[last()]")
    private WebElement ensureButton;

    @FindBy(xpath = "(//span[text()='取消']/ancestor::button)[last()]")
    private WebElement cancel;

    @FindBy(xpath = "//span[text()='crontab']")
    private WebElement crontab;

    @FindBy(xpath = "//div[@yotta-test='schedule-runner-select']//span[@class='yotta-select-selection-value']")
    private WebElement selectedUser;

    @FindBy(xpath = "//label[text()='所属应用']/ancestor::div[1]/following-sibling::div//span[@class='yotta-select-selection-value']")
    private WebElement selectedApp;

    @FindBy(xpath = "//div[@yotta-test='schedule-jdbc_list-panel']//span[contains(@class,'header-text')]")
    private WebElement jdbc;

    @FindBy(xpath = "//label[text()='count']/following-sibling::div//input")
    private WebElement count;

    @FindBy(xpath = "//label[text()='percent']/following-sibling::div//input")
    private WebElement percent;

    @FindBy(xpath = "//label[text()='resplen' or text()='apache.resplen']/following-sibling::div//input")
    private WebElement resplen;

    @FindBy(xpath = "(//span[contains(@class,'yotta-menu-item')]/ancestor::ul[contains(@class,'yotta-menu')])")
    private WebElement savedSearchList;

    @FindBy(xpath = "//span[text()='点击解析']")
    private WebElement parse;

    @FindBy(xpath = "//span[text()='最近十次执行时间']/ancestor::div[1]/following-sibling::div[1]")
    private WebElement parseResult;

    @FindBy(xpath = "(//div[contains(@class,'help-text')])[1]")
    private WebElement tipText;

    @FindBy(xpath = "//span[@aria-label='CloseCircleFilled']/ancestor::div[1]/following-sibling::div/p")
    private WebElement errorMessage;

    @FindBy(xpath = "//input[@class='yotta-time-picker-input']")
    private WebElement startTimeInput;

    @FindBy(xpath = "//div[@yotta-test='schedule-time_range-date_time_picker']")
    private WebElement datePicker;

    @FindBy(xpath = "//div[@name='startTimeValue']/ancestor::div[contains(@class,'yotta-col')]/span")
    private WebElement whenToStart;

    public WebElement getWhenToStart() {
        return whenToStart;
    }

    public WebElement getDatePicker() {
        return datePicker;
    }

    public WebElement getStartTimeInput() {
        return startTimeInput;
    }

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
        getYottaDiv("schedule-saved_search-dropdown").click();
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
        return getYottaDropdownList("schedule-app-select");
    }

    public WebElement getSelectedApp() {
        return selectedApp;
    }

    public WebElement getSelectedUser() {
        return selectedUser;
    }

    public WebElement getUnit() {
        return getYottaDropdownList("schedule-frequency_unit-select");
    }

    public WebElement getTextarea() {
        return getYottaTextarea("schedule-query-input");
    }

    public WebElement getSearchTextarea() {
        return getYottaTextarea("schedule-query-input");
    }

    public WebElement getCrontabInput() {
        crontab.click();
        return getYottaInput("schedule-crontab-input");
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getCancel() {
        return cancel;
    }

    public WebElement getBasicSettings() {
        return getYottaDiv("schedule-nav_basic-dom");
    }

    public WebElement getDbType() {
        return getYottaDropdownList("schedule-jdbc_database_type-select");
    }

    public WebElement getAddJDBC() {
        return getYottaLabel("schedule-add_jdbc-dom");
    }

    public WebElement getJdbc() {
        return jdbc;
    }

    public WebElement getUserName() {
        return getYottaInput("schedule-jdbc_user_name-input");
    }

    public WebElement getPassword() {
        return getYottaInput("schedule-jdbc_password-input");
    }

    public WebElement getHost() {
        return getYottaInput("schedule-jdbc_host-input");
    }

    public WebElement getPort() {
        return getYottaInput("schedule-jdbc_port-input");
    }

    public WebElement getDbName() {
        return getYottaInput("schedule-jdbc_database_name-input");
    }

    public WebElement getTableName() {
        return getYottaInput("schedule-jdbc_database_table_name-input");
    }

    public WebElement getVerify() {
        return getYottaButton("schedule-verify_jdbc-button");
    }

    public WebElement getOK() {
        return getButton("知道了");
    }

    public WebElement getConnectName() {
        return getYottaInput("schedule-jdbc_connection_name-input");
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

    public WebElement getName() {
        return getYottaInput("schedule-name-input");
    }

    public WebElement getDescribe() {
        return getYottaTextarea("schedule-description-textarea");
    }

    public WebElement getNumber() {
        return getYottaInput("schedule-search_number-input");
    }

    public WebElement getSelectedGroup() {
        return selectedGroup;
    }

    public WebElement getTaskGroupInput() {
        taskGroup.click();
        return taskGroupInput;
    }

    public WebElement getTaskGroup() {
        return getYottaDropdownList("resource_tag-change_resource_tag-select");
    }

    public WebElement getPeriod() {
        return getYottaInput("schedule-frequency_value-input");
    }

    public WebElement getDataSet() {
        return dataset;
    }

    public WebElement getSubmit() {
        return getYottaButton("schedule-submit-button");
    }

    @FindBy(xpath = "//*[@yotta-test='schedule-app-select']/div")
    private WebElement DeleteAppicon;

    public WebElement getDeleteAppicon() {
        return DeleteAppicon;
    }

    @FindBy(xpath = "//span[@aria-label='CloseCircleFilled']")
    private WebElement deleteApp;

    public WebElement getDeleteApp() {
        return deleteApp;
    }
}
