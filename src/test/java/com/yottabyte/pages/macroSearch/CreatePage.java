package com.yottabyte.pages.macroSearch;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.stepDefs.WaitElement;
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

    @FindBy(xpath = "//label[text()='名称']/following-sibling::input[@placeholder='请输入宏的名称']")
    private WebElement macroName;

    public WebElement getMacroName() {
        return macroName;
    }

    @FindBy(xpath = "//label[text()='定义']/following-sibling::textarea[@placeholder='请输入在其他搜索中引用搜索宏时该搜索宏扩展到的字符串']")
    private WebElement definition;
    public WebElement getDefinition() {
        return definition;
    }

    @FindBy(xpath = "//label[text()='参数']/following-sibling::input")
    private WebElement MacroParam;

    public WebElement getMacroParam() {
        return MacroParam;
    }

    @FindBy(xpath = "//label[text()='验证表达式']/following-sibling::input")
    private WebElement ValidateExpression;
    public WebElement getValidateExpression() {
        //return super.getInputElement("验证表达式");
        return ValidateExpression;
    }

    @FindBy(xpath = "//label[text()='验证错误信息']/following-sibling::input")
    private WebElement ValidateFalseInfo;
    public WebElement getValidateFalseInfo() {
        // return super.getInputElement("验证错误信息");
        return ValidateFalseInfo;
    }

    @FindBy(xpath = "//span[contains(text(),'使用基于eval的定义')]/preceding-sibling::label/span[@class='ant-checkbox']")
    private WebElement MacroEvalCheckbox;
    public WebElement getMacroEvalCheckbox() {
        return MacroEvalCheckbox;
    }

    @FindBy(xpath = "//span[contains(text(),'保存')]//ancestor::button")
    private WebElement save;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//i")

    private WebElement app;
    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement lastDropdown;

    @FindBy(xpath = "//label[contains(text(),'资源标签')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement macroResTag;

    @FindBy(xpath = "//label[contains(text(),'所属应用')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement belongToApps;

    @FindBy(xpath = "//span[text()='保存']/parent::button")
    private WebElement saveMacroButton;
    public WebElement getSaveMacroButton() {
        return saveMacroButton;
    }

    @Override
    public WebElement getApp() {
        app.click();
        return lastDropdown;
    }

    public WebElement getMacroResTag() {
        macroResTag.click();
        WebElement lastDropdownList = super.getLastDropdownList();
        new WaitElement().waitUntilInvisible("(//p[@class='el-select-dropdown__empty'])[last()]");
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(emptyDropdown));
        return lastDropdownList;
    }

    public WebElement getBelongToApps() {
        belongToApps.click();
        WebElement lastDropdownList = super.getLastDropdownList();
        //new WaitForElementVisible().waitUntilInvisible("(//p[@class='el-select-dropdown__empty'])[last()]");
        // WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(emptyDropdown));
        new WaitElement().waitUntilInvisible("(//p[@class='el-input__inner'])[last()]");

        return lastDropdownList;
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

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div/*"));
    }

}
