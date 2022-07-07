package com.yottabyte.pages.configs;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;


public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement tagInput;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tagToInput;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='授权']")
    private WebElement auth;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='复制']")
    private WebElement copy;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='标签']")
    private WebElement label;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='删除']")
    private WebElement delete;

    public WebElement getCopy() {
        return copy;
    }

    public WebElement getLabel() {
        return label;
    }

    public WebElement getAuth() {
        return auth;
    }

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getTagInput() {
        return tagInput;
    }

    public WebElement getTagToInput() {
        return tagToInput;
    }

    @FindBy(xpath = "//button[@yotta-test='batch_control-batch_operation-button']/preceding::input[@type='checkbox']/parent::span")
    private WebElement switchButton;
    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getErrorMessage() {
        return super.getMessage();
    }
}
