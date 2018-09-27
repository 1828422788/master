package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
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
        return super.getInputElement("名称");
    }

    public WebElement getDesc() {
        return super.getInputElement("描述");
    }

    public WebElement getSavedTime() {
        return super.getInputElement("保存时间");
    }

    public WebElement getDivideTime() {
        return super.getInputElement("切分时间");
    }

    public WebElement getColdTime() {
        return super.getInputElement("冷却时间");
    }

    public WebElement getSavedSize() {
        return super.getInputElement("保存大小");
    }

    public WebElement getCreateButton() {
        return super.getContainsTextButton("新建");
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }
}
