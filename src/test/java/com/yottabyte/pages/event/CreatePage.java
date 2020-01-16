package com.yottabyte.pages.event;

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

    @FindBy(xpath = "//label[contains(text(),'链接')]/following-sibling::div//textarea")
    private WebElement url;

    @FindBy(xpath = "//label[contains(text(),'搜索语句')]/following-sibling::div//textarea")
    private WebElement spl;

    @FindBy(className = "btn-submit")
    private WebElement createButton;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(xpath = "//*[@class='yw-btn']//span")
    private WebElement saveButton;

    public WebElement getName() {
        return getInputElement("名称");
    }

    public WebElement getAlias() {
        return getInputElement("别名");
    }

    public WebElement getField() {
        return getInputElement("应用字段");
    }

    public WebElement getDisplay() {
        return getDropdownList("显示于");
    }

    public WebElement getAction() {
        return getDropdownList("动作类型");
    }

    public WebElement getOpenUrl() {
        return getDropdownList("打开链接于");
    }

    public WebElement getEnsureButton() {
        return getContainsTextButton("确定");
    }

    public WebElement getSaveButton() {
        return saveButton;
    }

    public WebElement getDisplayMethod() {
        return getDropdownList("展示方式");
    }

    public WebElement getCreateButton() {
        return createButton;
    }

    public WebElement getUrl() {
        return url;
    }

    public WebElement getSpl() {
        return spl;
    }

    public WebElement getSuccessMessage() {
        return message;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div/input"));
    }

    public WebElement getDropdownList(String name) {
        String xpath = "//label[text()='" + name + "']//following-sibling::div//i";
        webDriver.findElement(By.xpath(xpath)).click();
        return super.getLastDropdownList();
    }
}
