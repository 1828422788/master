package com.yottabyte.pages.roles;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class CreatePage extends EditorPage {

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-checkbox__input")
    private WebElement resourceGroupCheckbox;

    @FindBy(className = "checkbox-group")
    private WebElement checkBoxs;

    @FindBy(xpath = "//div/input[@yotta-test='role-name-input']")
    private WebElement roleName;

    @FindBy(xpath = "//*[@class='el-message-box__btns']//span[contains(text(),'确定')]")
    private WebElement OKButton;

    @FindBy(xpath = "//*[@yotta-test='role-memo-input']")
    private WebElement roleDes;

    @FindBy(className = "ant-form-explain")
    private WebElement explainMessage;

    @FindBy(className = "yotta-dialog-contenttext")
    private WebElement explainErrorMessage;

    public WebElement getExplainErrorMessage() { return explainErrorMessage; }

    public WebElement getExplainMessage() {
        return explainMessage;
    }

    public WebElement getRoleName() {
        return roleName;
    }

    public WebElement getRoleDes() {
        return getYottaInput("role-memo-input");
    }

    public List<WebElement> getResourceGroupCheckbox() {
        resourceGroupCheckbox.click();
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(checkBoxs);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return checkBoxs.findElements(By.tagName("label"));
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getOKButton() {
        return OKButton;
    }

    public WebElement getSave() {
        return super.getButton("保存");
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getCopy() {
        return super.getButton("复制");
    }
}
