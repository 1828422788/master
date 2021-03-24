package com.yottabyte.pages.dictionary;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.DropdownUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;

public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    public WebElement getSaveButton() {
        return super.getButton("保存");
    }

    public WebElement getEnsureButton() {
        return super.getButton("确定");
    }

    public WebElement getCancelButton() {
        return super.getButton("撤销修改");
    }

    public WebElement getGroup() {
        return super.getLastDropdownList();
    }

    public WebElement getClearIconOld() {
        return super.getClearIcon("old");
    }

    public WebElement getClearIconFirst() {
        return super.getClearIcon("first");
    }

    public WebElement getClearIconSecond() {
        return super.getClearIcon("second");
    }

    public WebElement getDeleteIcon1() throws InterruptedException {
        WebElement span = webDriver.findElement(By.xpath("//span[@title='wymdoubletest1.csv']"));
        Actions actions = new Actions(webDriver);
        actions.moveToElement(span).perform();
        return super.getDeleteIcon("wymdoubletest1.csv");
    }

    @FindBy(xpath = "//div[text()='资源标签']/following-sibling::span[1]//input")
    private WebElement groupInput;

    @FindBy(xpath = "//div[text()='提示']")
    private WebElement Tip;

    @FindBy(xpath = "//input[@yotta-test='dictionary-name-input']")
    private WebElement name;

    @FindBy(className = "ant-select-selection__choice__content")
    private WebElement resourceTag;

    @FindBy(xpath = "//div[text()='在线编辑']")
    private WebElement editOnline;

    @FindBy(xpath = "//textarea[@yotta-test='dictionary-editing-textarea']")
    private WebElement editOnlineArea;

    @FindBy(xpath = "//p[@class='_1JjlGgMGUnJmBrqR_9PZl8']")
    private WebElement message;

    @FindBy(className = "ant-upload-list-item-name")
    private WebElement fileName;

    @FindBy(xpath = "//span[text()='撤销修改']//ancestor::button/preceding-sibling::button")
    private WebElement saveEdit;

    @FindBy(xpath = "//div[text()='所属应用']/following-sibling::div//*[contains(@class,'ant-select-clear-icon')]")
    private WebElement deleteApp;

    @Override
    public WebElement getDeleteApp() {
        return deleteApp;
    }

    public WebElement getEditOnline() {
        return editOnline;
    }

    public WebElement getEditOnlineArea() {
        return editOnlineArea;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getFileName() {
        return fileName;
    }

    public WebElement getSaveEdit() {
        return saveEdit;
    }

    public WebElement getResourceTag() {
        return resourceTag;
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getTip() {
        return Tip;
    }

    public WebElement getTagList(){
        return super.getDropdownList("资源标签");
    }

    public WebElement getGroupInput() {
        return groupInput;
    }
}
