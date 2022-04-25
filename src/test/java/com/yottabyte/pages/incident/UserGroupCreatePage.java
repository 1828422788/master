package com.yottabyte.pages.incident;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class UserGroupCreatePage extends EditorPage {

    public UserGroupCreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement userGroupName;

    @FindBy(xpath = "//input[@placeholder='请输入描述']")
    private WebElement userGroupDes;

    @FindBy(xpath = "//input[@placeholder='请输入用户名']")
    private WebElement userName;

    @FindBy(xpath = "//input[@placeholder='请输入全名']")
    private WebElement fullName;

    @FindBy(xpath = "//input[@placeholder='请输入邮箱地址']")
    private WebElement email;

    @FindBy(id = "AccountUpdate_phone")
    private WebElement telephone;

    // @FindBy(xpath = "//label[contains(text(),'密码')]/ancestor::div/following-sibling::div//input")
    @FindBy(xpath = "//input[@placeholder='长度8到16个字符，至少包含数字和字母']")
    private WebElement password;

    @FindBy(className = "yw-select")
    private WebElement userGroupButton;

    @FindBy(className = "el-select-dropdown")
    private List<WebElement> selectors;

    @FindBy(xpath = "//span[contains(text(),'新建')]/ancestor::button")
    private WebElement createButton;

    public WebElement getCreateButton() {
        return createButton;
    }

    //@FindBy(xpath = "//span[contains(text(),'确定')]/parent::button")
    //@FindBy(xpath = "(//span[text()='确定']/parent::button)[last()]")
    @FindBy(xpath = "//div[@class='ant-modal-body']/div/button[@class='ant-btn _3aTYSyOZTloazTQBYnBoxo css-hz5ttt ant-btn-primary']")
    private WebElement oKButton;

    public WebElement getOKButton() {
        return oKButton;
//        return super.getButton("确定");
    }

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
        return dropdownUtils.getDropdownListByLabel("角色");
    }

    @FindBy(xpath = "//button[@yotta-test='usergroup-add_administrators-button']")
    private WebElement addAdmin;
    public WebElement getAddAdmin() {
        return addAdmin;
    }

    @FindBy(xpath = "//button[@yotta-test='usergroup-add_members-button']")
    private WebElement addMember;

    public WebElement getAddMember() {
        return addMember;
    }

    @FindBy(xpath = "(//span[text()='新建']/parent::button)[last()]")
    private WebElement saveMember;

    public WebElement getSaveMember() {
        return saveMember;
    }

    public WebElement getEnsure() {
        return super.getButton("确定");
    }


    @FindBy(className = "yw-select-owner")
    private WebElement ownerButton;

    @FindBy(className = "yw-select-info")
    private WebElement roleButton;

    @FindBy(className = "el-input__icon")
    private WebElement dropdownIcon;

    @FindBy(className = "el-scrollbar__view")
    private WebElement dropdownList;

    public WebElement getUserGroupName() {
        return userGroupName;
    }

    public WebElement getUserGroupDes() {
        return userGroupDes;
    }

    public WebElement getUserGroupOwner() {
        return dropdownUtils.getDropdownListByLabel("拥有者");
    }

    public WebElement getUserGroupRole() {
        dropdownIcon.click();
        return dropdownList;
    }

}
