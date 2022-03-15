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

    @FindBy(xpath = "//label[text()='资源标签']/parent::div/following-sibling::div//input")
    private WebElement groupInput;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private  WebElement groupInputButton;

    @FindBy(xpath = "//input[@yotta-test='dictionary-name-input']")
    private WebElement name;

    @FindBy(xpath = "//button[@yotta-test='step-next-button']/span")
    private WebElement next;

    @FindBy(xpath = "//button[@yotta-test='step-done-button']/span")
    private WebElement done;

    @FindBy(className = "ant-select-selection__choice__content")
    private WebElement resourceTag;

    @FindBy(xpath = "//div[text()='在线编辑']")
    private WebElement editOnline;

    @FindBy(xpath = "//textarea[@yotta-test='dictionary-editing-textarea']")
    private WebElement editOnlineArea;

    @FindBy(xpath = "//p[text()='添加成功']")
    private WebElement message;

    @FindBy(xpath = "//span[@class='yotta-typography-text css-16briua yotta-file-upload-text']")
    private WebElement fileName;

    @FindBy(xpath = "//span[@aria-label='CloseCircleFilled']")
    private WebElement deleteApp;

    @Override
    public WebElement getDeleteApp() {
        return deleteApp;
    }

    @FindBy(xpath = "//span[text()='ConfigsApp']/parent::div")
    private WebElement deleteAppName;

    public WebElement getDeleteAppName() {
        return deleteAppName;
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

    public WebElement getNext() { return next; }

    public WebElement getDone() { return done; }

    public WebElement getFileName() {
        return fileName;
    }

    @FindBy(xpath = "//button[@yotta-test='dictionary-save-button']")
    private WebElement saveEdit;

    public WebElement getSaveEdit() {
        return saveEdit;
    }

    public WebElement getResourceTag() {
        return resourceTag;
    }

    public WebElement getName() {
        return name;
    }
    
    @FindBy(xpath = "//div[@yotta-test='dialog-container-modal']//h4[text()='提示']")
    private WebElement Tip;
    public WebElement getTip() {
        return Tip;
    }

    public WebElement getTagList(){
        return dropdownUtils.getDropdownListByLabel("资源标签");
    }

    public WebElement getGroupInput() {
        return groupInput;
    }

    public WebElement getGroupInputButton() { return groupInputButton;}

    public WebElement getLastLine()
    {
        String xpath="//div[@id='hot']//td[text()='bubble.test^archiver.process.fds']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    public WebElement getDoneButton() {
        String xpath="//span[text()='完成']/parent::button";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    public WebElement getBackButton() {
        String xpath="//span[text()='返回']/parent::button";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

}
