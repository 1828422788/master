package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//label[text()='保存时间']/following-sibling::div//i")
    private WebElement savedTimeDropDown;

    @FindBy(xpath = "//label[text()='切分时间']/following-sibling::div//i")
    private WebElement divideTimeDropDown;

    @FindBy(xpath = "//label[text()='冷却时间']/following-sibling::div//i")
    private WebElement coldTimeDropDown;

    @FindBy(xpath = "//label[text()='保存大小']/following-sibling::div//i")
    private WebElement savedSizeDropDown;

    public WebElement getDivideTimeDropDown() {
        divideTimeDropDown.click();
        return getLastDropdownList();
    }

    public WebElement getColdTimeDropDown() {
        coldTimeDropDown.click();
        return getLastDropdownList();
    }

    public WebElement getSavedSizeDropDown() {
        savedSizeDropDown.click();
        return getLastDropdownList();
    }

    public WebElement getSavedTimeDropDown() {
        savedTimeDropDown.click();
        return getLastDropdownList();
    }

    public WebElement getSavedButton() {
        return super.getContainsTextButton("保存");
    }

    public WebElement getName() {
        return getInputElement("名称");
    }

    public WebElement getDesc() {
        return getInputElement("描述");
    }

    public WebElement getSavedTime() {
        return getInputElement("保存时间");
    }

    public WebElement getDivideTime() {
        return getInputElement("切分时间");
    }

    public WebElement getColdTime() {
        return getInputElement("冷却时间");
    }

    public WebElement getSavedSize() {
        return getInputElement("保存大小");
    }

    public WebElement getCreateButton() {
        return getContainsTextButton("新建");
    }

    @FindBy(xpath = "//div[@class='el-message-box__message']")
    private WebElement message;

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return message;
    }

    @Override
    public WebElement getMessage() {
        return super.getMessage();
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div//input"));
    }

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//ul[@class='ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical'])[last()]"));
    }
}
