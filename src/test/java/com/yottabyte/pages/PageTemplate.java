package com.yottabyte.pages;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.constants.WebDriverConst;
import com.yottabyte.hooks.LoginBeforeAllTests;
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

    public WebDriver webDriver;
    public static ConfigManager config = new ConfigManager();
    public String parentPageName;

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

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(xpath = "//span[text()='AutoTestRoleWithAllResource']/ancestor::li")
    private WebElement disabledLi;

    @FindBy(className = "ant-input")
    private WebElement searchInput;

    @FindBy(className = "ant-input-search-icon")
    private WebElement searchIcon;

    public WebElement getSearchIcon() {
        return searchIcon;
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getDisabledLi() {
        return disabledLi;
    }

    protected WebElement getErrorMessage() {
        return message;
    }

    protected WebElement getSuccessMessage() {
        if (ElementExist.isElementExist(webDriver, By.className("el-message__group"))) {
            return webDriver.findElement(By.className("el-message__group"));
        } else {
            return message;
        }
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
        String xpath = "//label[contains(text(),'" + text + "')]/following-sibling::div//input[@class='el-input__inner']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getDropdownList(String text) {
        String xpath = "//div[contains(text(),'" + text + "')]/following-sibling::div//div[@class='ant-select-selection__rendered']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }

    public WebElement getButton(String text) {
        String xpath = "//span[text()='" + text + "']//ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getContainsTextButton(String text) {
        String xpath = "//span[contains(text(),'" + text + "')][not(@class)]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getLastDropdownList() {
        List<WebElement> list = webDriver.findElements(By.className("ant-select-dropdown-menu-root"));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        WebElement li = lastDropdownList.findElement(By.xpath(".//li"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return lastDropdownList;
    }

    public WebElement getGroupDropdownList() {
        WebElement searchGroupButton = webDriver.findElement(By.xpath("//span[text()='全部资源']/preceding-sibling::i"));
        searchGroupButton.click();
        WebElement groupDropdownList = webDriver.findElement(By.xpath("//li[contains(text(),'全部资源')]"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(groupDropdownList));
        return this.lastGroupDropdownList();
    }

    public WebElement lastGroupDropdownList() {
        WebElement element = webDriver.findElement(By.xpath("(//ul[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]"));
        return element;
    }

    public WebElement findInputByPlaceholder(String placeholder) {
        return webDriver.findElement(By.xpath("//input[@placeholder='" + placeholder + "']"));
    }

    public WebElement getTagInput(String text) {
        return webDriver.findElement(By.xpath("//div[text()='" + text + "']/following-sibling::div//input"));
    }
}
