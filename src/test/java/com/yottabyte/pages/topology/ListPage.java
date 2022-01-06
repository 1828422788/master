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

    @FindBy(xpath = "//input[@class='yotta-select-selection-search']")
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

    @FindBy(xpath = "//*[@yotta-test='topology-list_app-select']/div")
    private WebElement belongApp;

    @FindBy(xpath = "//*[@yotta-test='resource_tag-change_resource_tag-select']/div")
    private WebElement resourceTag;

    @FindBy(className = "yotta-message-content")
   // @FindBy(className = "yotta-dialog-contenttext")
    private WebElement message;

    @FindBy(xpath = "//button[@yotta-test='topology-list_confirm-upload-imng-button']/span")
    private WebElement confirmOfPicture;

    @FindBy(className = "WfkOIgvty6FIMcbgKUiqd")
    private WebElement uploadSuccess;

    public WebElement getUploadSuccess() { return uploadSuccess; }

    public WebElement getConfirmOfPicture() { return confirmOfPicture; }

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

    public WebElement getClickUpload() { return this.getYottaButton("topology-list_upload-img-item-input"); }

    public WebElement getNameInput() {
        return getInputElement("名称");
    }

    public WebElement getPictureGallary() {
        return this.getYottaButton("topology-list_img-lib-button");
    }

    @FindBy(xpath = "//span[@aria-label='UploadAlternative']")
    private WebElement upload;

    @FindBy(xpath = "//span[@class='ddea1def741c815a328e60677e364a3b']")
    private WebElement manager;

    public WebElement getUpload() {
        return upload;
    }

    public WebElement getManager() {
        return manager;
    }

    public WebElement getMessage() { return message; }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//div[text()='名称：']/following::input"));
    }

    public WebElement getYottaButton(String name){
        return webDriver.findElement(By.xpath("//*[@yotta-test='" + name + "']"));
    }

    public WebElement getPictureChoose(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']"));
    }

    public WebElement getPictureToDelete() { return this.getPictureChoose("delete"); }

    public WebElement getResourceTag() {
        resourceTag.click();
        return super.getLastDropdownList();
    }

    public WebElement getPictureName() {
        return webDriver.findElement(By.xpath("//div[text()='smallRobbot']"));
    }

    public WebElement getBelongApp() {
        belongApp.click();
        return super.getLastDropdownList();
    }
}
