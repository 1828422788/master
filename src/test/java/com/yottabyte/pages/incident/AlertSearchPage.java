package com.yottabyte.pages.incident;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.TakeScreenShot;
import com.yottabyte.utils.WaitForElement;
import com.yottabyte.webDriver.SharedDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import com.yottabyte.pages.DateEditorPage;


import java.util.List;

/**
 * 合并策略界面元素定位
 */

public class AlertSearchPage extends ListPageFactory {

    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    TakeScreenShot shot = SharedDriver.getScreenShot();
    ExpectedCondition expectedCondition;

    public AlertSearchPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(className = "_3YQ9T5DTgCrQ0NSzwkV6a5")
    private WebElement searchStatus;
    public WebElement getSearchStatus() {
        return searchStatus;
    }

    @FindBy(className = "CodeMirror")
    private WebElement searchInput;
    public WebElement getSearchInput() {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(searchInput);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchInput;
    }

    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
    private WebElement dateEditor;
    public WebElement getDateEditor() {
        return dateEditor;
    }

    // 获取今天按钮
    public WebElement getToday() {
        return (new DateEditorPage(webDriver)).getToday();
    }

    public WebElement getSearchButton() {
        return super.getButton("搜索");
    }

    public WebElement getDownloadButton() {
        return super.getButton("下载");
    }

    @FindBy(xpath = "//label[contains(text(),'文件名称')]/following-sibling::input")
    private WebElement downloadName;
    public WebElement getDownloadName() {
        return downloadName;
    }

    public WebElement getMaxLineNum() {
        String xpath = "//label[text()='最大行数']//following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getDocumentTypeList() {
        String xpath = "//div/label[contains(text(),'文件类型')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDocumentEncodeList() {
        String xpath = "//div/label[contains(text(),'文件编码')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getCreateDownloadTask() {
        return super.getButton("确 定");
    }

    public WebElement getAcceptCreateDownloadTask() {
        return super.getButton("确定");
    }

    @FindBy(xpath = "//div[text()='事件']/span")
    private WebElement eventNumber;
    public WebElement getEventNumber() {
        return eventNumber;
    }


}
