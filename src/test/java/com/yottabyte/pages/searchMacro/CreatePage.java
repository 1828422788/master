package com.yottabyte.pages.searchMacro;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-checkbox")
    private WebElement checkbox;

    @FindBy(xpath = "//span[contains(text(),'保存')]//ancestor::button")
    private WebElement save;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//i")
    private WebElement app;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement lastDropdown;

    @FindBy(xpath = "//div[@yotta-test='dialog-content-dom']//p")
    private WebElement successMessage;

    @FindBy(xpath = "//input[@yotta-test='macro-name-input']")
    private WebElement name;

    public WebElement getApp() {
        app.click();
        return lastDropdown;
    }

    public WebElement getDefinition() {
        return getInputElement("定义");
    }

    public WebElement getParam() {
        return getInputElement("参数");
    }

    public WebElement getValidateExpression() {
        return getInputElement("验证表达式");
    }

    public WebElement getValidateFalseInfo() {
        return getInputElement("验证错误信息");
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getGroup() {
        return dropdownUtils.getDropdownListByLabel("分组");
    }

    public WebElement getSave() {
        return save;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getCheckbox() {
        return checkbox;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::*"));
    }


}
