package com.yottabyte.pages.userGroups;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class EditPage extends PageTemplate {

    public EditPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-input__inner")
    private List<WebElement> inputs;

    @FindBy(className = "box")
    private List<WebElement> groups;

    @FindBy(className = "yw-select-info")
    private WebElement rolesButton;

    @FindBy(className = "el-select-dropdown")
    private WebElement selectors;

    @FindBy(className = "hoist-list")
    private WebElement selectedList;

    @FindBy(className = "el-message__group")
    private WebElement suspensionMessage;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(xpath = "(//span[contains(text(),'保存')][not(@class)])[last()]")
    private WebElement saveButton;

    @FindBy(xpath = "//div[text()='AutoTest']/ancestor::td/preceding-sibling::td//label")
    private WebElement checkBox;

    @FindBy(xpath = "(//span[contains(text(),'保存')])[last()]")
    private WebElement saveMember;

    public WebElement getSaveMember() {
        return saveMember;
    }

    public WebElement getEnsureButton() {
        return super.getButton("确定");
    }

    public WebElement getCheckBox() {
        return checkBox;
    }

    public WebElement getReturnList() {
        return super.getButton("返回列表");
    }

    public WebElement getAddMember() {
        return super.getContainsTextButton("添加成员");
    }

    public WebElement getUserGroupName() {
        return inputs.get(0);
    }

    public WebElement getUserGroupDes() {
        return inputs.get(1);
    }

    public WebElement getBasicSaveButton() {
        return groups.get(0).findElement(By.className("el-button"));
    }

    public WebElement getUserGroupRole() {
        return super.getDropdownList("角色");
    }

    public WebElement getAdvancedSaveButton() {
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(groups.get(1).findElement(By.className("el-button")));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return groups.get(1).findElement(By.className("el-button"));
    }

    public WebElement getSuccessMessage() {
        return suspensionMessage;
    }

    public WebElement getErrorMessage() {
        return message;
    }

    public WebElement getSaveButton() {
        return saveButton;
    }
}
