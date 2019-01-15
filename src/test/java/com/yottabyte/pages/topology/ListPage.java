package com.yottabyte.pages.topology;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "slot-button")
    private WebElement createButton;

    public WebElement getCreateButton() {
        return createButton;
    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement nameInput;

    public WebElement getNameInput() {
        return nameInput;
    }

    @FindBy(xpath = "//label[contains(text(),'分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement groupInput;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    public WebElement getGroupInput() {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        groupInput.click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    @FindBy(className = "yw-modal-btn-primary")
    private WebElement ensureButton;

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    @FindBy(className = "el-message-box__message")
    private WebElement errorMessage;

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement ensure;

    public WebElement getEnsure() {
        return ensure;
    }

    @FindBy(className = "yw-table-group__group-menu")
    private WebElement groupDropdownList;

    @FindBy(className = "el-icon-arrow-down")
    private WebElement searchGroupButton;

    public WebElement getGroupDropdownList() {
        searchGroupButton.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(groupDropdownList));
        return groupDropdownList;
    }

    public WebElement getDisabledLi() {
        return super.getDisabledLi();
    }

}
