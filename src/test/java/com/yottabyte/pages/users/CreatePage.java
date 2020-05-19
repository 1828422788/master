package com.yottabyte.pages.users;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.stepDefs.ClickSomeButton;
import com.yottabyte.stepDefs.IChooseValueFromSelectList;
import com.yottabyte.stepDefs.SetKeyWithValue;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(id = "AccountUpdate_name")
    private WebElement userName;

    @FindBy(id = "AccountUpdate_fullName")
    private WebElement fullName;

    @FindBy(id = "AccountUpdate_email")
    private WebElement email;

    @FindBy(id = "AccountUpdate_phone")
    private WebElement telephone;

    @FindBy(xpath = "//label[contains(text(),'密码')]/ancestor::div/following-sibling::div//input")
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

    @FindBy(className = "ant-select-selection__rendered")
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

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getOKButton() {
        return OKButton;
    }

    public WebElement getErrorMessage() {
        return message;
    }

    public WebElement getDropdownList(String name) {
        String xpath = "//label[text()='" + name + "']/following-sibling::div//i";
        webDriver.findElement(By.xpath(xpath)).click();
        return this.getLastDropdownList();
    }
}
