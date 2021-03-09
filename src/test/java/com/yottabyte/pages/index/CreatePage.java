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

    @FindBy(xpath = "//label[text()='保存时间']/ancestor::div[1]/following-sibling::div[1]//span[@class='yotta-select-selection-icon']")
    private WebElement savedTimeDropDown;

    @FindBy(xpath = "//label[text()='切分时间']/ancestor::div[1]/following-sibling::div[1]//span[@class='yotta-select-selection-icon']")
    private WebElement divideTimeDropDown;

    @FindBy(xpath = "//label[text()='冷却时间']/following-sibling::div//i")
    private WebElement coldTimeDropDown;

    @FindBy(xpath = "//label[text()='保存大小']/following-sibling::div//i")
    private WebElement savedSizeDropDown;

    @FindBy(xpath = "//label[text()='索引数据']/following-sibling::div//i")
    private WebElement indexDataDropDown;

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

    public WebElement getIndexDataDropDown() {
        indexDataDropDown.click();
        return getLastDropdownList();
    }

    public WebElement getSavedButton() {
        return super.getContainsTextButton("保存");
    }

    @FindBy(xpath = "//label[text()='名称']/ancestor::div/following-sibling::div[1]//input" )
    private WebElement Name;

    public WebElement getName() {
        return Name;
    }

    @FindBy(xpath = "//label[text()='描述']/ancestor::div/following-sibling::div[1]//textarea" )
    private WebElement Desc;

    public WebElement getDesc() {
        return Desc;
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

    public WebElement getSavedCopy() { return getInputElementWithoutLabel("天后删除副本"); }
//    public WebElement getFreeze() { return getInputElementWithoutLabel("天前的索引拒绝入库"); }

//    public WebElement getFreeze() { return getInputElementWithoutLabel("天后拒绝入库"); }
//
//    public WebElement getSinkHDD() { return getInputElementWithoutLabel("天后下沉到HDD"); }

    public WebElement getFreeze() { return getInputElementWithoutLabel("天后拒绝入库"); }
    public WebElement getSinkHDD() { return getInputElementWithoutLabel("天后下沉到HDD"); }
    public WebElement getSinkNAS() { return getInputElementWithoutLabel("天后下沉到NAS"); }

    public WebElement getCreateButton() {
        return getButton("新建");
    }

    @Override
    public WebElement getMessage() {
        return message;
    }

    @FindBy(xpath = "//p[@class='yotta-dialog-contenttext']")
    private WebElement message;

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return message;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/ancestor::div/following-sibling::div[1]//input"));
    }

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//div[@class='yotta-select-menu'])[last()]"));
    }

    public WebElement getInputElementWithoutLabel(String name) {
        return webDriver.findElement(By.xpath("//div[text()='" + name + "']/input"));
    }
}
