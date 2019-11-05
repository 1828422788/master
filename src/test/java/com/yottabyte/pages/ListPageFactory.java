package com.yottabyte.pages;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.LoadableComponent;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPageFactory extends LoadableComponent<ListPageFactory> {
    public static ConfigManager config = new ConfigManager();
    public WebDriver webDriver;

    @FindBy(className = "ant-input")
    private WebElement searchInput;

    @FindBy(className = "ant-select-dropdown-menu")
    private WebElement selectDropdownMenu;

    @FindBy(xpath = "//p[text()='获取角色列表失败: Api 没有权限错误']")
    private WebElement noAuth;

    public WebElement getNoAuth() {
        return noAuth;
    }

    public ListPageFactory(WebDriver driver) {
        this.webDriver = driver;
        PageFactory.initElements(driver, this);
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getTag() {
        return this.getInputElement("标签");
    }

    public WebElement getTagDropdown() {
        return selectDropdownMenu;
    }

    public WebElement getAppDropdown() {
        this.groupDropdownIcon("请选择应用").click();
        return this.lastDropdownMenu();
    }

    public WebElement getResourceDropdown() {
        this.groupDropdownIcon("全部资源").click();
        return this.lastDropdownMenu();
    }

    public WebElement getCreate() {
        return this.getButton("新建");
    }

    public WebElement getEnsure() {
        return this.getButton("确定");
    }

    public WebElement getButton(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']//ancestor::button"));
    }

    private WebElement groupDropdownIcon(String text) {
        return webDriver.findElement(By.xpath("//div[text()='" + text + "']/ancestor::div/following-sibling::span/i"));
    }

    private WebElement lastDropdownMenu() {
        return webDriver.findElement(By.xpath("(//ul[@class='ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical'])[last()]"));
    }

    public WebElement getInputElement(String text) {
        String xpath = "//div[text()='" + text + "']//following-sibling::div//input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getContainsTextButton(String text) {
        String xpath = "//span[contains(text(),'" + text + "')][not(@class)]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getSuccessMessage() {
        return webDriver.findElement(By.xpath("//p[text()='保存成功']"));
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

    @Override
    protected void load() {
        System.out.println("load方法运行！");
    }

    @Override
    protected void isLoaded() throws Error {
        System.out.println("isloaded方法运行！");
    }

    public WebElement getPlaceholderInput(String placeholder) {
        return webDriver.findElement(By.xpath("(//input[@placeholder='" + placeholder + "'])[last()]"));
    }
}
