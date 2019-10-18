package com.yottabyte.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.LoadableComponent;

/**
 * @author sunxj
 */
public class ListPageFactory extends LoadableComponent<ListPageFactory> {
    WebDriver webDriver;

    @FindBy(className = "ant-input")
    private WebElement searchInput;

    public ListPageFactory(WebDriver driver) {
        this.webDriver = driver;
        PageFactory.initElements(driver, this);
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getAppDropdown() {
        this.dropdownIcon("请选择应用").click();
        return this.lastDropdownMenu();
    }

    public WebElement getResourceDropdown() {
        this.dropdownIcon("全部资源").click();
        return this.lastDropdownMenu();
    }

    public WebElement getCreate() {
        return this.getButton("新建");
    }

    public WebElement getButton(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']//ancestor::button"));
    }

    private WebElement dropdownIcon(String text) {
        return webDriver.findElement(By.xpath("//div[text()='" + text + "']/ancestor::div//i"));
    }

    private WebElement lastDropdownMenu() {
        return webDriver.findElement(By.xpath("(//ul[@class='ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical'])[last()]"));
    }

    @Override
    protected void load() {
        System.out.println("load方法运行！");
    }

    @Override
    protected void isLoaded() throws Error {
        System.out.println("isloaded方法运行！");
    }
}
