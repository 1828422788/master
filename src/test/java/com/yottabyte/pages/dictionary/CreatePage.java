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

    public WebElement getGroup() {
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//label[text()='资源标签']/parent::div/following-sibling::div//input")
    private WebElement groupInput;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private  WebElement groupInputButton;

    @FindBy(xpath = "//div[text()='在线编辑']")
    private WebElement editOnline;

    @FindBy(xpath = "//textarea[@yotta-test='dictionary-editing-textarea']")
    private WebElement editOnlineArea;

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

    public WebElement getNext() {
        return getYottaButton("step-next-button");
    }

    public WebElement getFileName() {
        return fileName;
    }

    @FindBy(xpath = "//button[@yotta-test='dictionary-save-button']")
    private WebElement saveEdit;

    public WebElement getSaveEdit() {
        return saveEdit;
    }

    public WebElement getName() {
        return getYottaInput("dictionary-name-input");
    }

    public WebElement getTagList(){
        return dropdownUtils.getDropdownListByLabel("资源标签");
    }

    public WebElement getGroupInput() {
        return groupInput;
    }

    public WebElement getGroupInputButton() { return groupInputButton;}

    public WebElement getLastLine() {
        String xpath="//div[@id='hot']//td[text()='bubble.test^archiver.process.fds']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getDone() {
        return getYottaButton("step-done-button");
    }

    public WebElement getCell_A1() {
        return getCell(1,1);
    }

    public WebElement getCell_B1() {
        return getCell(1,2);
    }

    public WebElement getCell_A2() {
        return getCell(2,1);
    }

    public WebElement getCell_B2() {
        return getCell(2,2);
    }

    public WebElement getCell_A3() {
        return getCell(3,1);
    }

    public WebElement getCell_B3() {
        return getCell(3,2);
    }

    public WebElement getCell_C1() {
        return getCell(1,3);
    }

    public WebElement getCell_C2() {
        return getCell(2,3);
    }

    @FindBy(xpath = "//textarea[@class='handsontableInput']")
    private WebElement cellInput;
    public WebElement getCellInput() {
        return cellInput;
    }

    public WebElement getCell(int row, int column) {
        return webDriver.findElement(By.xpath("//tbody/tr[" + row + "]/td[" + column + "]"));
    }
}
