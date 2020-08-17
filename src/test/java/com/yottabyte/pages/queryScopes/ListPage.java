package com.yottabyte.pages.queryScopes;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement successMessage;

    @FindBy(className = "ant-modal-content")
    private WebElement modalContent;

    @FindBy(xpath = "//td[text()='SearchAuth']/ancestor::tr//label")
    private WebElement searchAuth;

    @FindBy(xpath = "//div[text()='请选择用户']")
    private WebElement authUser;

    @FindBy(id = "ConfigModify_expiredTime")
    private WebElement expiredTime;

    @FindBy(className = "ant-calendar-input")
    private WebElement calendarInput;

    @FindBy(className = "ant-calendar-ok-btn")
    private WebElement calendarEnsure;

    @FindBy(xpath = "(//input[@id='ConfigModify_desensiveChecked']/ancestor::span)[last()]")
    private WebElement desensiveChecked;

    public WebElement getDesensiveChecked() {
        return desensiveChecked;
    }

    public WebElement getCalendarEnsure() {
        return calendarEnsure;
    }

    public WebElement getCalendarInput() {
        return calendarInput;
    }

    public WebElement getExpiredTime() {
        return expiredTime;
    }

    public WebElement getModalContent() {
        return modalContent;
    }

    public WebElement getName() {
        return super.getPlaceholderInput("请输入名称");
    }

    public WebElement getDescribe() {
        return super.getPlaceholderInput("请输入描述");
    }

    public WebElement getSourceTag() {
        return super.getPlaceholderInput("请输入标签名称");
    }

    public WebElement getHostname() {
        return super.getPlaceholderInput("请输入 Hostname");
    }

    public WebElement getTag() {
        return super.getPlaceholderInput("请输入 Tag");
    }

    public WebElement getAppname() {
        return super.getPlaceholderInput("请输入 Appname");
    }

    public WebElement getFilter() {
        return super.getPlaceholderInput("请输入过滤条件");
    }

    public WebElement getMessage() {
        return successMessage;
    }

    public WebElement getTempAuth() {
        return super.getButton("临时授权");
    }

    public WebElement getAuth() {
        return super.getButton("授权");
    }

    public WebElement getSearchAuth() {
        return searchAuth;
    }

    public WebElement getAuthUser() {
        authUser.click();
        return super.getLastDropdownList();
    }
}
