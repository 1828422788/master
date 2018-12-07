package com.yottabyte.pages.searchMacro;

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

    @FindBy(xpath = "//label[text()='定义']/following-sibling::div/textarea")
    private WebElement definition;

    @FindBy(className = "el-checkbox")
    private WebElement checkbox;

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
        return super.getInputElement("名称");
    }

    public WebElement getGroup() {
        return super.getDropdownList("分组");
    }

    public WebElement getSaveButton() {
        return super.getContainsTextButton("保存");
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
}
