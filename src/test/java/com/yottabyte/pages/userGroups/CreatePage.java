package com.yottabyte.pages.userGroups;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement userGroupName;

    @FindBy(xpath = "//input[@placeholder='请输入描述']")
    private WebElement userGroupDes;

    @FindBy(className = "yw-select-owner")
    private WebElement ownerButton;

    @FindBy(className = "yw-select-info")
    private WebElement roleButton;

    @FindBy(className = "el-select-dropdown")
    private List<WebElement> selectors;

    @FindBy(className = "el-input__icon")
    private WebElement dropdownIcon;

    @FindBy(className = "el-scrollbar__view")
    private WebElement dropdownList;

    @FindBy(className = "ant-form-explain")
    private WebElement explainMessage;

    @FindBy(xpath = "(//span[text()='保存']/ancestor::button)[last()]")
    private WebElement saveMember;

    @FindBy(className = "ant-message-success")
    private WebElement successOfMessage;

    @FindBy(partialLinkText = "添加管理员")
    private WebElement addAdmin;

    //点击非输入框的任何位置都会自动保存
    @FindBy(xpath = "//input[@yotta-test='usergroup-memo-input']")
    private WebElement comment;

    public WebElement getComment() { return comment; }

    public WebElement getMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getEnsure() {
        return super.getButton("确定");
    }

    public WebElement getAddAdmin() {
        return addAdmin;
    }

    public WebElement getSaveMember() {
        return saveMember;
    }

    public WebElement getExplainMessage() {
        return explainMessage;
    }

    public WebElement getUserGroupName() {
        return userGroupName;
    }

    public WebElement getUserGroupDes() {
        return userGroupDes;
    }

    public WebElement getUserGroupOwner() {
        return super.getDropdownList("拥有者");
    }

    public WebElement getUserGroupRole() {
        dropdownIcon.click();
        return dropdownList;
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getSuccessMessage() {
        return super.getMessage();
    }

    public WebElement getErrorMessage() {
        return super.getMessage();
    }

    private List<WebElement> getSelectorElements(WebElement e) {
        e.click();
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(selectors.get(1));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        List<WebElement> list = selectors.get(1).findElements(By.tagName("li"));
        return list;
    }


}

