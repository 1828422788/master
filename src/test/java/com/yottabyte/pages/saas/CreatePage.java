package com.yottabyte.pages.saas;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-switch")
    private WebElement switchButton;

    public WebElement getSwitchButton() {
        return switchButton;
    }

    @FindBy(xpath = "//input[@yotta-test='domainsystem-display_name-input']")
    private WebElement tenantName;

    public WebElement getTenantName() {
        return tenantName;
    }

    @FindBy(xpath = "//input[@yotta-test='domainsystem-name-input']")
    private WebElement domainName;

    public WebElement getDomainName() {
        return domainName;
    }

    public WebElement getSupportFeatureList() {
        String xpath = "//div[@yotta-test='domainsystem-feature-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//input[@yotta-test='domainsystem-daily_limit_num-input']")
    private WebElement dailyLimit;
    public WebElement getDailyLimit() {
        return dailyLimit;
    }

    @FindBy(xpath = "//input[@yotta-test='domainsystem-file_limit-input']")
    private WebElement uploadLimit;
    public WebElement getUploadLimit() {
        return uploadLimit;
    }

    @FindBy(xpath = "//input[@yotta-test='domainsystem-file_limit-input']")
    private WebElement excessLimit;

    public WebElement getExcessLimit() {
        return excessLimit;
    }

    public WebElement getExcessBehaviorList() {
        String xpath = "//div[@yotta-test='domainsystem-excess_action-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'管理员名称')]/following::input[@name='owner_name']")
    private WebElement managerName;

    public WebElement getManagerName() {
        return managerName;
    }

    @FindBy(xpath = "//input[@yotta-test='domainsystem-tenant_email-input']")
    private WebElement managerEmail;

    public WebElement getManagerEmail() {
        return managerEmail;
    }

    @FindBy(xpath = "//input[@yotta-test='domainsystem-new_password_1-input']")
    private WebElement managerPassword;

    public WebElement getManagerPassword() {
        return managerPassword;
    }

    @FindBy(xpath = "//input[@yotta-test='domainsystem-new_password_2-input']")
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
