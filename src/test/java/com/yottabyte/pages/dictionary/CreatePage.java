package com.yottabyte.pages.dictionary;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;

public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "ant-select-search__field")
    private WebElement groupIunput;

    public WebElement getGroupInput() {
        return groupIunput;
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

    public WebElement getClearIcon1() {
        return super.getClearIcon("wymtest1");
    }

    public WebElement getClearIcon2() {
        return super.getClearIcon("wymtest2");
    }

    public WebElement getDeleteIcon1() throws InterruptedException {
        WebElement span = webDriver.findElement(By.xpath("//span[@title='wymdoubletest1.csv']"));
        Actions actions = new Actions(webDriver);
        actions.moveToElement(span).perform();
        return super.getDeleteIcon("wymdoubletest1.csv");
    }


    @FindBy(xpath = "//div[text()='在线编辑']")
    private WebElement editOnline;

    @FindBy(xpath = "//textarea[@class='ant-input css-pcxrzr _2naGD5U5UpRR3_1_pnJA4U']")
    private WebElement editOnlineArea;

    @FindBy(xpath = "//p[@class='_1JjlGgMGUnJmBrqR_9PZl8']")
    private WebElement message;

    @FindBy(className = "ant-upload-list-item-name")
    private WebElement fileName;

    @FindBy(xpath = "//span[text()='撤销修改']//ancestor::button/preceding-sibling::button")
    private WebElement saveEdit;

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
}
