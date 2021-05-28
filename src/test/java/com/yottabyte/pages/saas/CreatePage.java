package com.yottabyte.pages.tenant;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-switch")
    private WebElement switchButton;

    public WebElement getSwitchButton() {
        return switchButton;
    }

    @FindBy(xpath = "//label[text()='名称：']/following-sibling::div/input[@placeholder='请输入']")
    private WebElement tenantName;

    public WebElement getTenantName() {
        return tenantName;
    }

    @FindBy(xpath = "//label[text()='域名：']/following-sibling::div/input[@placeholder='请输入']")
    private WebElement domainName;

    public WebElement getDomainName() {
        return domainName;
    }

    public WebElement getSupportFeatureList() {
        String xpath = "//label[text()='支持特性：']/following-sibling::div//div[@class='ant-select-selection__rendered']/div/following-sibling::ul/li";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//label[text()='每日限额：']/following-sibling::div//input")
    private WebElement dailyLimit;

    public WebElement getDailyLimit() {
        return dailyLimit;
    }

    @FindBy(xpath = "//label[text()='文件上传限制：']/following-sibling::div//input")
    private WebElement uploadLimit;

    public WebElement getUploadLimit() {
        return uploadLimit;
    }

    @FindBy(xpath = "//label[text()='超额次数限定：']/following-sibling::div//input")
    private WebElement excessLimit;

    public WebElement getExcessLimit() {
        return excessLimit;
    }

    public WebElement getExcessBehaviorList() {
        String xpath = "//label[text()='超额行为：']/following-sibling::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//label[text()='管理员名称：']/following-sibling::div//input")
    private WebElement managerName;

    public WebElement getManagerName() {
        return managerName;
    }

    @FindBy(xpath = "//label[text()='管理员邮箱：']/following-sibling::div//input")
    private WebElement managerEmail;

    public WebElement getManagerEmail() {
        return managerEmail;
    }

    @FindBy(xpath = "//label[text()='管理员密码：']/following-sibling::div//input")
    private WebElement managerPassword;

    public WebElement getManagerPassword() {
        return managerPassword;
    }

    @FindBy(xpath = "//label[text()='管理员密码：']/following-sibling::div//input[@placeholder='请再次输入']")
    private WebElement inputAgain;

    public WebElement getInputAgain() {
        return inputAgain;
    }

    @FindBy(xpath = "//span[text()='保存']/parent::button")
    private WebElement saveButton;

    public WebElement getSaveButton() {
        return saveButton;
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }


}
