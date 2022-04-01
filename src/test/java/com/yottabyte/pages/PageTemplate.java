package com.yottabyte.pages;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.constants.WebDriverConst;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.LoadableComponent;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 页面元素模板，每一个页面都需要继承该模板
 */
public class PageTemplate extends LoadableComponent<PageTemplate> {

    public static WebDriver webDriver;
    public static ConfigManager config = new ConfigManager();
    public String parentPageName;
    public DropdownUtils dropdownUtils = new DropdownUtils();

    public WebElement getUsername() {
        return null;
    }

    public WebElement getPassword() {
        return null;
    }

    public WebElement getLoginButton() {
        return null;
    }

    public PageTemplate(WebDriver driver) {
        this.webDriver = driver;
        PageFactory.initElements(driver, this);
        parentPageName = LoginBeforeAllTests.getPageFactory() == null ? "" : LoginBeforeAllTests.getPageFactory().getClass().getSimpleName();
    }

    @FindBy(xpath = "//div[@class='yotta-modal-body']//p")
    private WebElement message;

    @FindBy(xpath = "//span[text()='AutoTestRoleWithAllResource']/ancestor::li")
    private WebElement disabledLi;

    @FindBy(className = "ant-input-search-icon")
    private WebElement searchIcon;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//*[@class='ant-select-selection__clear']")
    private WebElement deleteApp;

    @FindBy(xpath = "//div[text()='所属应用']/following-sibling::div//i")
    private WebElement app;

    @FindBy(className = "yotta-message-content")
    private WebElement successMessage;

    @FindBy(xpath="//div[@class='yotta-empty-description']/div/div")
    private WebElement resultMessage;

    @FindBy(xpath = "//span[@class='ant-badge']/i")
    private WebElement userIcon;

    @FindBy(xpath = "//div[@class='ant-popover-inner-content']//p")
    private WebElement loginUserName;

    @FindBy(xpath = "//div[contains(@class,'spinner')]")
    private WebElement loading;

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getUserIcon() {
        return userIcon;
    }

    public WebElement getLoginUserName() {
        return loginUserName;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getSave() {
        return getButton("保存");
    }

    public WebElement getReturn() {
        return getButton("返回");
    }

    public WebElement getApp() {
        app.click();
        return dropdownUtils.getLastDropdownList();
    }

    public WebElement getDeleteApp() {
        return deleteApp;
    }

    public WebElement getSearchIcon() {
        return searchIcon;
    }

    public WebElement getSearchInput() {
        return getYottaInput("table-filter_text-input");
    }

    public WebElement getDisabledLi() {
        return disabledLi;
    }

    public WebElement getErrorMessage() {
        return message;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getResultMessage() {
        return resultMessage;
    }

    @Override
    protected void load() {
        webDriver.get("http://" + config.get("rizhiyi_server_host") + "/auth/login/");
        LoginBeforeAllTests.login();
    }

    @Override
    protected void isLoaded() throws Error {
        FluentWait wait = new FluentWait(webDriver)
                .withTimeout(WebDriverConst.WAIT_FOR_ELEMENT_TIMEOUT_WHEN_PAGE_LOADING, TimeUnit.MILLISECONDS)
                .pollingEvery(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS)
                .ignoring(NoSuchElementException.class);
        try {
            wait.until(new ExpectedCondition<Boolean>() {
                public Boolean apply(WebDriver driver) {
                    System.out.println("Waiting " + this.getClass().getName() + " Dom loading complete");
                    return ((JavascriptExecutor) driver).executeScript("return document.readyState").equals("complete");
                }
            });
        } catch (Exception e) {
            throw new Error("Can not locate " + this.getClass().getName() + "page");
        }
    }

    public WebElement getInputElement(String text) {
        String xpath = "//div[text()='" + text + "']//following-sibling::div//input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getButton(String text) {
        String xpath = "//span[text()='" + text + "']";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getClearIcon(String text){
        String xpath = "//div[contains(text(),'"+ text + "')]/following-sibling::span/i[@aria-label='图标: close']";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getDeleteIcon(String text){
        String xpath = "//span[@title='" + text + "']/following-sibling::span//i[@aria-label='图标: delete']";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getContainsTextButton(String text) {
        String xpath = "//span[contains(text(),'" + text + "')]/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getLastDropdownList() {
        return dropdownUtils.getLastDropdownList();
    }

    public WebElement findInputByPlaceholder(String placeholder) {
        return webDriver.findElement(By.xpath("//input[@placeholder='" + placeholder + "']"));
    }

    public WebElement getYottaInput(String test) {
        String xpath = "(//input[@yotta-test='" + test +"'])[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaTextarea(String test) {
        String xpath = "//textarea[@yotta-test='" + test +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaIcon(String test) {
        String xpath = "//span[@yotta-test='" + test +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaSwitch(String test) {
        String xpath = "//span[@yotta-test='" + test +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaButtonByText(String text) {
        String xpath = "//span[text()='" + text + "']//ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaButton(String test) {
        String xpath = "(//button[@yotta-test='"+ test +"'])[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaDiv(String text) {
        String xpath = "//div[@yotta-test='" + text +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaLabel(String text) {
        String xpath = "//label[@yotta-test='" + text +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaSpan(String text) {
        String xpath = "//span[@yotta-test='" + text +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaTable(String text) {
        String xpath = "//table[@yotta-test='" + text +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaCheckbox(String test) {
        String xpath = "//input[@yotta-test='" + test +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaRadio(String test) {
        String xpath = "//input[@yotta-test='" + test +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaTab(String text) {
        String xpath = "//div[text()='" + text + "' and @role='tab']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaPopover(String test) {
        String xpath = "//div[@yotta-test='" + test +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public static WebElement getNextPageButton() {
        String xpath = "//div[@class='yotta-pagination-pages yotta-pagination-elements']/span[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

}
