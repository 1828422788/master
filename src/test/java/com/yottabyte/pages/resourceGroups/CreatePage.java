package com.yottabyte.pages.resourceGroups;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindAll({
            @FindBy(className = "el-input__inner")
    })
    private List<WebElement> inputs;

    @FindAll({
            @FindBy(className = "el-scrollbar__view")
    })
    private List<WebElement> selectors;

    @FindBy(xpath = "//span[text()='新建']")
    private WebElement createButton;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(xpath = "//*[@class='el-message-box__btns']//span[contains(text(),'确定')]")
    private WebElement OKButton;

    public WebElement getApp() {
        return super.getDropdownList("所属应用");
    }

    public WebElement getResourceGroupName() {
        return inputs.get(0);
    }

    public WebElement getResourceGroupType() {
        return super.getDropdownList("分组类型");
    }

    public WebElement getResourceGroupDes() {
        return super.getInputElement("描述");
    }

    public WebElement getResourceGroupOwner() {
        return super.getDropdownList("分配角色");
    }

    public WebElement getAddResourceMemberButton() {
        return super.getButton("添加资源成员");
    }

    public WebElement getEnsureButton() {
        return super.getButton("确定");
    }

    public WebElement getCreateButton() {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(createButton);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return createButton;
    }

    public WebElement getSuccessMessage() {
        return message;
    }

    public WebElement getErrorMessage() {
        return message;
    }

    public WebElement getOKButton() {
        return OKButton;
    }
}
