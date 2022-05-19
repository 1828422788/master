package com.yottabyte.pages;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.constants.WebDriverConst;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.DropdownUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedCondition;
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

    public PageTemplate(WebDriver driver) {
        this.webDriver = driver;
        driver.manage().window().fullscreen();
        PageFactory.initElements(driver, this);
    }

    @Override
    protected void load() {
        webDriver.get("http://" + config.get("rizhiyi_server_host") + "/auth/login/");
        LoginBeforeAllTests.login();
        parentPageName = LoginBeforeAllTests.getPageFactory() == null ? "" : LoginBeforeAllTests.getPageFactory().getClass().getSimpleName();
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

    public WebElement getUsername() {
        return null;
    }

    public WebElement getPassword() {
        return null;
    }

    public WebElement getLoginButton() {
        return null;
    }

    public WebElement getEnsure() {
        return this.getButton("确定");
    }

    public WebElement getCancel() {
        return this.getButton("取消");
    }

    public WebElement getSave() {
        return this.getButton("保存");
    }

    public WebElement getReturn() {
        return getButton("返回");
    }

    public WebElement getComplete() {
        return getButton("完成");
    }

    public WebElement getApply() {
        return this.getButton("应用");
    }

    public WebElement getTagField() {
        return dropdownUtils.getYottaDropdownList("resource_tag-change_resource_tag-select");
    }

    //TODO:删除这个方法，在其他page中直接用dropdownUtils.getLastDropdownList()
    public WebElement getLastDropdownList() {
        return dropdownUtils.getLastDropdownList();
    }

    @FindBy(xpath = "//div[@class='yotta-modal-body']//p")
    private WebElement message;
    public WebElement getMessage() {
        return message;
    }

    @FindBy(className = "yotta-message-content")
    private WebElement successMessage;
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getErrorMessage() {
        return message;
    }

    @FindBy(xpath = "//div[@class='yotta-form-field-help-text']")
    private WebElement helpMessage;
    public WebElement getHelpMessage(){
        return helpMessage;
    }

    @FindBy(xpath = "//*[contains(text(),'暂无数据')]")
    private WebElement noData;
    public WebElement getNoData() {
        return noData;
    }

    public WebElement findElementByXpath(String Xpath){return webDriver.findElement(By.xpath(Xpath));}

    public WebElement getButton(String name) {
        return webDriver.findElement(By.xpath("(//span[text()='" + name + "']//ancestor::button)[last()]"));
    }

    public WebElement getContainsTextButton(String text) {
        String xpath = "//span[contains(text(),'" + text + "')]/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getButtonByClassName(String className) {
        String xpath = "//span[@class='" + className + "']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public List<WebElement> getButtonsByText(String text) {
        String xpath = "//span[text()='" + text + "']";
        return webDriver.findElements(By.xpath(xpath));
    }

    public WebElement getButtonByText(String text) {
        return webDriver.findElement(By.xpath("(//span[text()='" + text + "'])[last()]"));
    }

    public WebElement getInputByPlaceholder(String placeholder) {
        return webDriver.findElement(By.xpath("//input[@placeholder='" + placeholder + "']"));
    }

    public WebElement getInputByName(String name) {
        String xpath = "//input[@name='" + name + "']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaInput(String test) {
        String xpath = "(//input[@yotta-test='" + test +"'])[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getInputElement(String text) {
        String xpath = "//div[text()='" + text + "']//following-sibling::div//input";
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
        String xpath = "//input[@yotta-test='" + test +"' and @type='checkbox']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaRadio(String test) {
        String xpath = "//input[@yotta-test='" + test +"' and @type='radio']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaTab(String text) {
        String xpath = "//div[text()='" + text + "' and @role='tab']";
        return webDriver.findElement(By.xpath(xpath));
    }
}