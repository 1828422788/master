package com.yottabyte.pages.dbConnectionPre;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
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
public class DbOutputPage extends EditorPage {
    public DbOutputPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    /**
     * 配置数据库输出
     */

    @FindBy(xpath = "//div[contains(text(),'数据库输出')]")
    private WebElement dbOutputConfig;

    public WebElement getDbOutputConfig() {
        return dbOutputConfig;
    }

    @FindBy(xpath = "//span[contains(text(),'新建输出')]/parent::button")
    private WebElement newDbOutputButton;

    public WebElement getNewDbOutputButton() {
        return newDbOutputButton;
    }

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

    @FindBy(xpath = "//button[@yotta-test='search_bar-submit-button']")
    private WebElement searchButton;
    public WebElement getSearchButton() {
//        return super.getButton("搜索");
        return searchButton;
    }

    @FindBy(xpath = "//span[contains(text(),'下一步')]/parent::button")
    private WebElement nextStepButton;
    public WebElement getNextStepButton() {
        return nextStepButton;
    }

    public WebElement getDbOutputConnList() {
//        String xpath = "//div[contains(text(),'连接')]/following-sibling::div/div[@class='yotta-select-selection']";
        String xpath = "//div[@yotta-test='dbsettings-connection-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbOutputDirList() {
        String xpath = "//div[@yotta-test='dbsettings-database-select']/div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

//    @FindBy(xpath = "//div[text()='表']/following-sibling::span/input[@placeholder='请输入']")
    @FindBy(xpath = "//input[@yotta-test='dbsettings-filter-input']")
    private WebElement OutputDbTable;

    public WebElement getOutputDbTable() {
        return OutputDbTable;
    }

    @FindBy(xpath = "//div[text()='表']/following-sibling::div//a[text()='outsample']")
    private WebElement OutputDbTableLink;

    public WebElement getOutputDbTableLink() {
        return OutputDbTableLink;
    }

    @FindBy(xpath = "//span[contains(text(),'字段映射')]/parent::div/following-sibling::div//div[contains(text(),'添加映射')]")
    private WebElement addFieldMap;

    public WebElement getAddFieldMap() {
        return addFieldMap;
    }

    public WebElement getDbOutputSearchField0List() {
//        String xpath = "//span[contains(text(),'字段映射')]/following::span[contains(text(),'搜索字段')]/following-sibling::div/div[@class='yotta-select-selection']";
        String xpath = "//div[@yotta-test='dbsettings-search_field_0-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbOutputSearchField1List() {
        String xpath = "//div[@yotta-test='dbsettings-search_field_1-select']/div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    public WebElement getDbOutputSearchField2List() {
        String xpath = "//div[@yotta-test='dbsettings-search_field_2-select']/div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    public WebElement getDbOutputSearchField3List() {
        String xpath = "//div[@yotta-test='dbsettings-search_field_3-select']/div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    public WebElement getDbOutputDbField0List() {
//        String xpath = "//span[contains(text(),'字段映射')]/following::span[contains(text(),'表格列名称')]/following-sibling::div/div[@class='yotta-select-selection']";
        String xpath = "//div[@yotta-test='dbsettings-db_field_0-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbOutputDbField1List() {
        String xpath = "//div[@yotta-test='dbsettings-db_field_1-select']/div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    public WebElement getDbOutputDbField2List() {
        String xpath = "//div[@yotta-test='dbsettings-db_field_2-select']/div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    public WebElement getDbOutputDbField3List() {
        String xpath = "//div[@yotta-test='dbsettings-db_field_3-select']/div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }


    public WebElement getSearchFieldList() {
        String xpath = "//span[contains(text(),'字段映射')]/following::span[contains(text(),'搜索字段')]/following-sibling::div//span[text()='请选择']/parent::div/parent::div[@class='yotta-select-selection']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getTableColNameList() {
        String xpath = "//span[contains(text(),'字段映射')]/following::span[contains(text(),'表格列名称')]/following-sibling::div//span[text()='请选择']/parent::div/parent::div[@class='yotta-select-selection']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/parent::div/following-sibling::div/input[@placeholder='请输入名称']")
    private WebElement dbOutputName;
    public WebElement getDbOutputName() {
        return dbOutputName;
    }

    @FindBy(xpath = "//div[contains(text(),'数据库输出会将数据从日志易推送至数据库')]/following::span/input[@placeholder='输入关键字']")
    private WebElement dbOutputSearchInput;
    public WebElement getDbOutputSearchInput() {
        return dbOutputSearchInput;
    }

    @FindBy(xpath = "//input[@yotta-test='dbsettings-update-switch']")
    private WebElement updateInsertButton;
    public WebElement getUpdateInsertButton() {
        return updateInsertButton;
    }

    public WebElement getDbOutputKeyList() {
        String xpath = "//div[@yotta-test='dbsettings-update_key-select']/div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement delDbOutputButton;

    public WebElement getDelDbOutputButton() {
        return delDbOutputButton;
    }

    public WebElement getAffirmDelDbOutputButton() {
        return super.getButton("确定");
    }

    @FindBy(xpath = "//span[contains(text(),'完成')]/parent::button")
    private WebElement doneButton;
    public WebElement getDoneButton() {
        return doneButton;
    }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement searchNameInput; //名称

    public WebElement getSearchNameInput() {
        return searchNameInput;
    }


    @FindBy(xpath = "//button[@yotta-test='dbsettings-output_edit-button']")
    private WebElement editButton; //名称

    public WebElement getEditButton() {
        return editButton;
    }

}
