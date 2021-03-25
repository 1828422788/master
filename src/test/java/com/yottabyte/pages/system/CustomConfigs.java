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
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//label[contains(text(),'黑名单地址')]/following-sibling::div//input[@class='el-select__input is-undefined']")
    private WebElement blacklistInput;

    @FindBy(xpath = "//span[text()='/knowledge/']")
    private WebElement liButton;

    @FindBy(xpath = "//span[text()='测试是否保存']")
    private WebElement test;

    @FindBy(className = "yotta-message-content")
    private WebElement message;

    @FindBy(xpath = "//span[text()='/knowledge/']/following-sibling::i")
    private WebElement close;

    @FindBy(xpath = "//span[text()='图表配置自动填充']/ancestor::label")
    private WebElement chartLabel;

    @FindBy(xpath = "//span[text()='报表趋势图个数限制']//ancestor::div[1]/following-sibling::input")
    private WebElement trendLimit;

    @FindBy(xpath = "//div[@class='_1o8bbS9akwRGJGcMWEWK1j']/a[contains(text(),'邮件服务器设置')]")
    private WebElement MailServerSet;

    public WebElement getMailServerSet() {
        return MailServerSet;
    }

    @FindBy(xpath = "//div[@class='_1o8bbS9akwRGJGcMWEWK1j']/a[contains(text(),'交易日功能')]")
    private WebElement trandateFeature;
    public WebElement getTrandateFeature() {
        return trandateFeature;
    }

    @FindBy(xpath = "//span[text()='SMTP服务器端口']/parent::div/following-sibling::input[@placeholder='请输入']")
    private WebElement SMTPPort;

    public WebElement getSMTPPort() {
        return SMTPPort;
    }

    @FindBy(xpath = "//span[text()='SMTP服务器地址']/parent::div/following-sibling::input[@placeholder='请输入']")
    private WebElement SMTPAddress;

    public WebElement getSMTPAddress() {
        return SMTPAddress;
    }

    @FindBy(xpath = "//span[text()='发送邮箱地址']/parent::div/following-sibling::input[@placeholder='请输入']")
    private WebElement SendEmail;

    public WebElement getSendEmail() {
        return SendEmail;
    }

    @FindBy(xpath = "//span[text()='发送邮箱密码']/parent::div/following-sibling::div/input[@placeholder='请输入']")
    private WebElement EmailPassword;

    public WebElement getEmailPassword() {
        return EmailPassword;
    }

    @FindBy(xpath = "//span[text()='发送邮箱名称']/parent::div/following-sibling::input[@placeholder='请输入']")
    private WebElement EmailLogName;

    public WebElement getEmailLogName() {
        return EmailLogName;
    }

    public WebElement getTrendLimit() {
        return trendLimit;
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

    //@FindBy(xpath = "//div[text()='交易日功能']/following::div/span[@class='ant-upload']/input")
    @FindBy(xpath = "//input[@yotta-test='system-tranaction_date_upload-file_upload']")
    private WebElement uploadTranDate;
    public WebElement getUploadTranDate() {
        return uploadTranDate;
    }

}
