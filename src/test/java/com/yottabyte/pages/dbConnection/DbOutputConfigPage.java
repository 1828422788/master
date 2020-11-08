package com.yottabyte.pages.dbConnection;

import com.yottabyte.pages.PageTemplate;
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
public class DbOutputConfigPage extends PageTemplate {
    public DbOutputConfigPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    /**
     * 配置数据库查找
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

    public WebElement getDbOutputConnList() {
        String xpath = "//div[contains(text(),'连接')]/following-sibling::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbOutputDirList() {
        String xpath = "//div[contains(text(),'目录')]/following-sibling::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
//        WebElement element = webDriver.findElement(By.xpath(xpath));
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
//        ClickEvent.clickUnderneathButton(element);
//        return getLastDropdownList();
        return super.getLastDropdownListOnSendPolicyPage(xpath);

    }

    @FindBy(xpath = "//div[text()='表']/following-sibling::span/input[@placeholder='请输入']")
    private WebElement OutputDbTable;

    public WebElement getOutputDbTable() {
        return OutputDbTable;
    }

    @FindBy(xpath = "//div[text()='表']/following::input[@placeholder='请输入']/following::ul/li/a[text()='Outputsample']")
    private WebElement OutputDbTableLink;

    public WebElement getOutputDbTableLink() {
        return OutputDbTableLink;
    }

    @FindBy(xpath = "//span[contains(text(),'搜索字段映射')]/following::div/a[text()='添加映射']")
    private WebElement addFieldMap;

    public WebElement getAddFieldMap() {
        return addFieldMap;
    }

    public WebElement getDbOutputSearchFieldR1C1List() {
        String xpath = "//span[contains(text(),'搜索字段映射')]/following::span[contains(text(),'搜索字段')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDbOutputSearchFieldR1C2List() {
        String xpath = "//span[contains(text(),'搜索字段映射')]/following::span[contains(text(),'表格列名称')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        return super.getLastDropdownListOnSendPolicyPage(xpath);
//        return getLastDropdownList();
    }

    @FindBy(xpath = "//span[contains(text(),'Output 字段')]/following::div/a[text()='添加字段']")
    private WebElement addOutputField;

    public WebElement getAddOutputField() {
        return addOutputField;
    }

    public WebElement getDbOutputOutputFieldR1C1List() {
        String xpath = "//span[contains(text(),'Output 字段')]/following::span[contains(text(),'表格列名称')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::input[@placeholder='请输入名称']")
    private WebElement dbOutputName;

    public WebElement getDbOutputName() {
        return dbOutputName;
    }

    @FindBy(xpath = "//div[contains(text(),'数据库输出会将数据从日志易推送至数据库')]/following::span/input[@placeholder='输入关键字']")
    private WebElement dbOutputSearchInput;

    public WebElement getDbOutputSearchInput() {
        return dbOutputSearchInput;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement delDbOutputButton;

    public WebElement getDelDbOutputButton() {
        return delDbOutputButton;
    }

    public WebElement getAffirmDelDbOutputButton() {
        return super.getButton("确定");
    }

}
