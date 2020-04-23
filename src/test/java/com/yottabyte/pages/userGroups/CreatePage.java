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

    @FindBy(id = "UserGroupUpdate_name")
    private WebElement userGroupName;

    @FindBy(id = "UserGroupUpdate_memo")
    private WebElement userGroupDes;

    @FindBy(className = "yw-select-owner")
    private WebElement ownerButton;

    @FindBy(className = "yw-select-info")
    private WebElement roleButton;

    @FindBy(className = "el-select-dropdown")
    private List<WebElement> selectors;

    @FindBy(xpath = "//*[@class='el-message-box__btns']//span[contains(text(),'确定')]")
    private WebElement OKButton;

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

    public WebElement getOKButton() {
        return OKButton;
    }

    private List<WebElement> getSelectorElements(WebElement e) {
        e.click();
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(selectors.get(1));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        List<WebElement> list = selectors.get(1).findElements(By.tagName("li"));
        return list;
    }


}

