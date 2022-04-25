package com.yottabyte.pages.topology;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.By;
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

    @FindBy(xpath = "//input[@class='yotta-select-selection-search']")
    private WebElement tag;

    @FindBy(className = "yotta-message-content")
    private WebElement errorMessage;

    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-Close yotta-tag-close']")
    private WebElement deleteTag;
    public WebElement getDeleteTag() {
        return deleteTag;
    }
    @FindBy(xpath = "//*[@yotta-test='topology-list_app-select']/div")
    private WebElement belongApp;

    @FindBy(xpath = "//*[@yotta-test='resource_tag-change_resource_tag-select']/div")
    private WebElement resourceTag;

    @FindBy(className = "yotta-message-content")
    private WebElement message;

    @FindBy(xpath = "//button[@yotta-test='topology-list_confirm-upload-imng-button']/span")
    private WebElement confirmOfPicture;

    @FindBy(className = "WfkOIgvty6FIMcbgKUiqd")
    private WebElement uploadSuccess;

    public WebElement getUploadSuccess() { return uploadSuccess; }

    public WebElement getConfirmOfPicture() { return confirmOfPicture; }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement tagInput;
    public WebElement getTagInput() {
        webDriver.findElement(By.xpath("//div[@yotta-test='resource_tag-change_resource_tag-select']")).click();
        return tagInput;
    }

    public WebElement getDelete() { return getButton("删除"); }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    @Override
    public WebElement getTag() {
        return tag;
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
