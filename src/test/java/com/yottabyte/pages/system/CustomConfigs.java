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

    @FindBy(xpath = "//span[text()='/knowledge/']")
    private WebElement liButton;

    @FindBy(xpath = "//span[text()='测试是否保存']")
    private WebElement test;

    @FindBy(className = "ant-message-success")
    private WebElement successMessage;

    @FindBy(className = "ant-message-notice")
    private WebElement message;

    @FindBy(xpath = "//span[text()='/knowledge/']/following-sibling::i")
    private WebElement close;

    @FindBy(xpath = "//span[text()='图表配置自动填充']/ancestor::label")
    private WebElement chartLabel;

    public WebElement getSMTPPort() {
        return super.getInputElement("SMTP服务器端口");
    }

    public WebElement getSMTPAddress() {
        return super.getInputElement("SMTP服务器地址");
    }

    public WebElement getSendEmail() {
        return super.getInputElement("发送邮箱");
    }

    public WebElement getEmailLogName() {
        return super.getInputElement("发件箱登录名");
    }

    public WebElement getEmailPassword() {
        return super.getInputElement("邮箱密码");
    }

    public WebElement getTrendLimit() {
        return super.getInputElement("报表趋势图个数限制");
    }

    public WebElement getChartLabel() {
        return chartLabel;
    }

    public WebElement getTest() {
        return test;
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

    public WebElement getMessage() {
        return message;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getHomePage() {
        return super.getDropdownList("首页");
    }

    public WebElement getWholeTime() {
        return super.getInputElement("所有时间定义");
    }
}
