package com.yottabyte.pages.topology;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//label[text()='标签']/parent::div/following-sibling::div//input")
    private WebElement tag;

    @FindBy(xpath = "//label[@title='资源标签']/ancestor::div/following-sibling::div//input")
    private WebElement tagInput;

    @FindBy(className = "ant-form-explain")
    private WebElement errorMessage;

    @FindBy(xpath = "//div/ul/li[3]/span[text()='删除']")
    private WebElement delete;

    @FindBy(xpath = "//li[@yotta-test='topology-list_tag-button']/span")
    private WebElement label;

    @FindBy(xpath = "//li[@yotta-test='topology-list_authorize-button']/span[text()='授权']")
    private WebElement auth;

    @FindBy(xpath = "//li[@yotta-test='topology-list_rename-button']/span")
    private WebElement rename;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//span[@class='yotta-select-selection-placeholder']")
    private WebElement tagToInput;

    public WebElement getTagToInput() {
        return tagToInput;
    }

    public WebElement getAuth() { return auth; }

    public WebElement getRename() { return rename; }

    public WebElement getLabel() { return label; }

    public WebElement getDelete() { return delete; }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    @Override
    public WebElement getTag() {
        return tag;
    }

    public WebElement getTagInput() {
        return tagInput;
    }

    public WebElement getNameInput() {
        return getInputElement("名称");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//div[text()='名称：']/following::input"));
    }
}
