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

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tag;

    @FindBy(xpath = "//span[text()='请输入标签名称']")
    private WebElement tagInput;

    @FindBy(className = "yotta-message-content")
    private WebElement errorMessage;

    @FindBy(xpath = "//li[@yotta-test='topology-list_tag-button']/span")
    private WebElement label;

    @FindBy(xpath = "//li[@yotta-test='topology-list_authorize-button']/span[text()='授权']")
    private WebElement auth;

    @FindBy(xpath = "//li[@yotta-test='topology-list_rename-button']/span")
    private WebElement rename;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//span[@class='yotta-select-selection-placeholder']")
    private WebElement tagToInput;

    @FindBy(className = "_2Nx4n7Ix35X7-zjayRNUAi")
    private WebElement clickUpload;

    @FindBy(xpath = "//*[@yotta-test='topology-list_app-select']/div")
    private WebElement belongApp;

    @FindBy(xpath = "//*[@yotta-test='resource_tag-change_resource_tag-select']/div")
    private WebElement resourceTag;

    @FindBy(className = "yotta-message-content")
    private WebElement message;

    @FindBy(xpath = "//span[text()='确定']")
    private WebElement ensure;

    public WebElement getEnsure() { return ensure; }

    public WebElement getTagToInput() {
        return tagToInput;
    }

    public WebElement getAuth() { return auth; }

    public WebElement getRename() { return rename; }

    public WebElement getLabel() { return label; }

    public WebElement getDelete() { return getButton("删除"); }

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

    public WebElement getClickUpload() { return clickUpload; }

    public WebElement getNameInput() {
        return getInputElement("名称");
    }

    public WebElement getPictureGallary() {
        return this.getButton("图片库");
    }

    public WebElement getUpload() {
        return this.getButton("上传");
    }

    public WebElement getMessage() { return message; }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//div[text()='名称：']/following::input"));
    }

    public WebElement getPictureChoose(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']//ancestor::label//input"));
    }

    public WebElement getPictureToDelete() { return this.getPictureChoose("delete"); }

    public WebElement getResourceTag() {
        resourceTag.click();
        return super.getLastDropdownList();
    }

    public WebElement getBelongApp() {
        belongApp.click();
        return super.getLastDropdownList();
    }
}
