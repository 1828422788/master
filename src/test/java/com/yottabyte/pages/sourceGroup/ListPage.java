package com.yottabyte.pages.sourceGroup;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends EditorPage {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='新建']")
    private WebElement createButton;

    @FindBy(className = "el-message-box__message")
    private WebElement errorMessage;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "//label[contains(text(),'分组')]/following-sibling::div//input")
    private WebElement groupInput;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownLists;

    @FindBy(xpath = "//button[@class='el-button yw-modal-btn yw-modal-btn-primary el-button--primary']/span[contains(text(),'确定')]")
    private WebElement ensureButton;

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']/span[contains(text(),'确定')]")
    private WebElement ensure;

    @FindBy(className = "yw-table-group__group-menu")
    private WebElement GroupDropdownList;

    @FindBy(className = "el-icon-arrow-down")
    private WebElement arrowDown;

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(xpath = "//span[@class='name']/following-sibling::div//input")
    private WebElement recentDays;

    @FindBy(xpath = "//div[@class='yw-table-group__basic el-input']/input")
    private WebElement searchInput;

    @FindBy(xpath = "(//label[@class='el-checkbox'])[4]")
    private WebElement firstCheckbox;

    @FindBy(xpath = "//label[contains(text(),'提权用户')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement user;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement select;

    @FindBy(xpath = "//button[@class='el-button yw-modal-btn yw-modal-btn-normal el-button--default']//span[contains(text(),'回收')]")
    private WebElement retrieve;

    @FindBy(className = "el-table__empty-text")
    private WebElement emptyText;

    @FindBy(className = "el-icon-arrow-up")
    private WebElement arrowUp;

    @FindBy(xpath = "//input[@placeholder='提权人用户名']")
    private WebElement name;

    public WebElement getName() {
        return name;
    }

    public WebElement getResource() {
        arrowUp.click();
        return super.getLastDropdownList();
    }

    public WebElement getEmptyText() {
        return emptyText;
    }

    public WebElement getRetrieve() {
        return retrieve;
    }

    public WebElement getSaveButton() {
        return super.getContainsTextButton("保存");
    }

    public WebElement getValidTime() {
        return super.getInputElement("有效时长");
    }

    public WebElement getUser() {
        user.click();
        return select;
    }

    public WebElement getAuth() {
        return super.getButton("授权");
    }

    public WebElement getFirstCheckbox() {
        return firstCheckbox;
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getRecentDays() {
        return recentDays;
    }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getTag() {
        return super.getInputElement("Tag");
    }

    public WebElement getAppname() {
        return super.getInputElement("Appname");
    }

    public WebElement getUploadButton() {
        return super.getButton("上传");
    }

    public WebElement getGroupDropdownList() {
        arrowDown.click();
        return GroupDropdownList;
    }

    public WebElement getEnsure() {
        return ensure;
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getGroupInput() {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        groupInput.click();
        return dropdownLists.get(dropdownLists.size() - 1);
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getCreateButton() {
        return createButton;
    }

    public WebElement getAuthorize() {
        return super.getButton("临时授权");
    }

    public WebElement getManageAuthorize() {
        return super.getButton("授权管理");
    }

    public WebElement getMessage() {
        return errorMessage;
    }
}
