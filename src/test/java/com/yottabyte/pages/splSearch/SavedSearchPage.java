package com.yottabyte.pages.splSearch;

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
public class SavedSearchPage extends PageTemplate {
    public SavedSearchPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='全部资源']/preceding-sibling::i")
    private WebElement groupList;

    @FindBy(xpath = "(//*[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]")
    private WebElement dropdownMenu;

    @FindBy(className = "yw-modal-btn-primary")
    private WebElement ensure;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "//label[contains(text(),'分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement changeGroup;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//div[@class='el-message-box__btns']//span[contains(text(),'确定')]")
    private WebElement ensureDelete;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    public WebElement getMessage() {
        return message;
    }

    public WebElement getEnsureDelete() {
        return ensureDelete;
    }

    public WebElement getChangeGroup() {
        changeGroup.click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getEnsure() {
        return ensure;
    }

    public WebElement getGroupList() {
        groupList.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(dropdownMenu));
        return dropdownMenu;
    }

    public WebElement getSearchInput() {
        return super.getSearchInput();
    }

    public WebElement getSearchIcon() {
        return super.getSearchIcon();
    }
}
