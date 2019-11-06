package com.yottabyte.pages.searchMacro;

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

    @FindBy(xpath = "//label[text()='定义']/following-sibling::div/textarea")
    private WebElement definition;

    @FindBy(className = "el-checkbox")
    private WebElement checkbox;

    @FindBy(xpath = "//span[contains(text(),'保存')]//ancestor::button")
    private WebElement save;

    public WebElement getDefinition() {
        return definition;
    }

    public WebElement getParam() {
        return super.getInputElement("参数");
    }

    public WebElement getValidateExpression() {
        return super.getInputElement("验证表达式");
    }

    public WebElement getValidateFalseInfo() {
        return super.getInputElement("验证错误信息");
    }

    public WebElement getName() {
        return getInputElement("名称");
    }

    public WebElement getGroup() {
        return super.getDropdownList("分组");
    }

    public WebElement getSave() {
        return save;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getCheckbox() {
        return checkbox;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div/*"));
    }
}
