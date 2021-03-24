package com.yottabyte.pages.users;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement userName;

    @FindBy(xpath = "//input[@placeholder='请输入全名']")
    private WebElement fullName;

    @FindBy(xpath = "//input[@placeholder='请输入邮箱']")
    private WebElement email;

    @FindBy(xpath = "//input[@placeholder='请输入电话号码']")
    private WebElement telephone;

    @FindBy(xpath = "//input[@placeholder='请输入密码']")
    private WebElement password;

    @FindBy(className = "yw-select")
    private WebElement userGroupButton;

    @FindBy(className = "el-select-dropdown")
    private List<WebElement> selectors;

    @FindBy(className = "btn-submit")
    private WebElement createButton;

    @FindBy(xpath = "//*[@class='el-message-box__btns']//span[contains(text(),'确定')]")
    private WebElement OKButton;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(className = "yotta-select-selection-placeholder")
    private WebElement userGroup;

    @FindBy(className = "ant-form-explain")
    private WebElement explainMessage;

    public WebElement getEditButton() {
        return super.getButton("修改信息");
    }

    public WebElement getExplainMessage() {
        return explainMessage;
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

    public WebElement getPassword() {
        return password;
    }

    public WebElement getUserGroups() {
        userGroup.click();
        return super.getLastDropdownList();
    }

    public WebElement getRole() {
        return getDropdownList("角色");
    }

    public WebElement getManageRole() {
        return getDropdownList("可管理角色");
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getOKButton() {
        return OKButton;
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getErrorMessage() {
        return message;
    }

    public WebElement getDropdownList(String name) {
        String xpath = "//label[text()='" + name + "']/ancestor::div[1]/following-sibling::div//div[@yotta-test]";
        webDriver.findElement(By.xpath(xpath)).click();
        return this.getLastDropdownList();
    }
}
