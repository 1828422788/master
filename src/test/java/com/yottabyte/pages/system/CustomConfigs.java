package com.yottabyte.pages.system;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CustomConfigs extends PageTemplate {
    public CustomConfigs(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//label[contains(text(),'黑名单地址')]/following-sibling::div//input[@class='el-select__input is-undefined']")
    private WebElement blacklistInput;

    @FindBy(xpath = "//span[text()='/knowledge']")
    private WebElement liButton;

    @FindBy(xpath = "//span[text()='/offlinetask']")
    private WebElement offlinetask;

    @FindBy(xpath = "//span[text()='测试是否保存']")
    private WebElement test;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "//span[text()='/knowledge']/following-sibling::i")
    private WebElement close;

    @FindBy(xpath = "//span[text()='/offlinetask']/following-sibling::i")
    private WebElement closeOfflinetask;

    public WebElement getTest() {
        return test;
    }

    public WebElement getCloseOfflinetask() {
        return closeOfflinetask;
    }

    public WebElement getOfflinetask() {
        return offlinetask;
    }

    public WebElement getClose() {
        return close;
    }

    public WebElement getLiButton() {
        return liButton;
    }

    public WebElement getBlacklistInput() {
        return blacklistInput;
    }

    public WebElement getBlacklist() {
        return super.getDropdownList("黑名单地址");
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getHomePage() {
        return super.getDropdownList("首页");
    }
}
