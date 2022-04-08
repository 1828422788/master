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

    @FindBy(xpath = "//div[@class='yotta-modal-body']//p")
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

    @FindBy(className = "yotta-button-content")
    private WebElement calendarEnsure;

    @FindBy(xpath = "(//input[@id='ConfigModify_desensiveChecked']/ancestor::span)[last()]")
    private WebElement desensiveChecked;

    @FindBy(xpath = "//span[text()='授权']")
    private WebElement auth;

    @FindBy(xpath = "//li[@yotta-test='queryscope-delete-button']/span")
    private WebElement delete;

    public WebElement getDelete() { return delete; }

    public WebElement getMoreOfAuth() { return auth; }

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

    @FindBy(xpath = "//input[@yotta-test='queryscope-name-input']")
    private WebElement name;
    public WebElement getName() {
        return name;
    }

    @FindBy(xpath = "//input[@yotta-test='queryscope-description-input']")
    private WebElement describe;
    public WebElement getDescribe() {
        return describe;
    }

    @FindBy(xpath = "//input[@yotta-test='queryscope-hostname-input']")
    private WebElement hostname;
    public WebElement getHostname() {
        return hostname;
    }

    @FindBy(xpath = "//input[@yotta-test='queryscope-tag-input']")
    private WebElement tag;
    public WebElement getTag() {
        return tag;
    }

    @FindBy(xpath = "//input[@yotta-test='queryscope-appname-input']")
    private WebElement appname;
    public WebElement getAppname() {
        return appname;
    }

    @FindBy(xpath = "//input[@yotta-test='queryscope-filters-input']")
    private WebElement filter;
    public WebElement getFilter() {
        return filter;
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
