package com.yottabyte.pages.users;

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

    @FindBy(xpath = "//input[@placeholder='请输入用户名']")
    private WebElement userName;

    @FindBy(xpath = "//input[@placeholder='请输入全名']")
    private WebElement fullName;

    @FindBy(xpath = "//input[@placeholder='请输入邮箱地址']")
    private WebElement email;

    @FindBy(xpath = "//input[@placeholder='请输入电话号码']")
    private WebElement telephone;

    @FindBy(className = "yw-select")
    private WebElement groupButton;

    @FindBy(className = "el-select-dropdown")
    private WebElement selectors;

    @FindBy(className = "el-checkbox__inner")
    private WebElement modifyPassword;

    @FindBy(xpath = "//label[text()='新密码']//following-sibling::div//input[@type='password']")
    private WebElement newPassword;

    @FindBy(xpath = "//label[text()='重复密码']//following-sibling::div//input[@type='password']")
    private WebElement repeatPassword;

   // @FindBy(id = "AccountUpdate_authorizationRoles")
    @FindBy(xpath = "//div[@name='authorizationRoles']/div/span/span")
    private WebElement manageRole;

    @FindBy(xpath = "//div[@name='roles']/div/span/span")
    private WebElement roles;

    @FindBy(className = "yotta-message-manager")
    private WebElement successMessage;

    public WebElement getRoles() {
        roles.click();
        return super.getLastDropdownList();
    }


    public WebElement getManageRole() {
        manageRole.click();
        return super.getLastDropdownList();
    }

    public WebElement getEditInfoButton() {
        return super.getContainsTextButton("修改信息");
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getUserName() {
        return userName;
    }

    public WebElement getFullName() {
        return fullName;
    }

    public WebElement getEmail() {
        return email;
    }

    public WebElement getTelephone() {
        return telephone;
    }

    public List<WebElement> getUserGroups() {
        groupButton.click();
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(selectors);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return selectors.findElements(By.tagName("li"));
    }

    public WebElement getModifyPassword() {
        return modifyPassword;
    }

    public WebElement getNewPassword() {
        return newPassword;
    }

    public WebElement getRepeatPassword() {
        return repeatPassword;
    }

    public WebElement getSaveButton() {
        return super.getButton("保存");
    }

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }
}
