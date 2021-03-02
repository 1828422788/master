package com.yottabyte.pages.splSearch;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class dbsettingPage extends ListPageFactory {
    public dbsettingPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getCreateDbConn() {
        return super.getButton("新建连接");
    }


    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement newDbConnName;

    public WebElement getNewDbConnName() {
        return newDbConnName;
    }

    @FindBy(xpath = "//input[@placeholder='请输入账户名']")
    private WebElement newDbUserName;

    public WebElement getNewDbUserName() {return newDbUserName;

    }

    @FindBy(xpath = "//input[@placeholder='请输入密码']")
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
        String xpath = "//span[contains(text(),'连接类型')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//input[@placeholder='请输入主机']")
    private WebElement newDbConnHost;

    public WebElement getNewDbConnHost() {
        return newDbConnHost;
    }

    @FindBy(xpath = "//input[@placeholder='请输入端口']")
    private WebElement newDbConnPort;

    public WebElement getNewDbConnPort() {
        return newDbConnPort;
    }

    @FindBy(xpath = "//input[@placeholder='请输入默认数据库']")
    private WebElement newConnDefaultDb;

    public WebElement getNewConnDefaultDb() {
        return newConnDefaultDb;
    }

    public WebElement getSaveButton() {
        return super.getButton("保存");
    }


}
