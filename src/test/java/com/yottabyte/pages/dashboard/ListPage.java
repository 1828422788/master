package com.yottabyte.pages.dashboard;

import com.yottabyte.constants.WebDriverConst;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.FluentWait;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//button[@class='el-button slot-button new-btn el-button--default']")
    private WebElement createButton;

    @FindBy(xpath = "//label[contains(text(),'分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement dashBoardGroup;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "//span[contains(text(),'确定')]")
    private List<WebElement> ensureButtonList;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> groupInput;

    @FindBy(xpath = "//span[@class='link-label'][contains(text(),'返回列表')]")
    private WebElement returnList;

    @FindBy(xpath = "//label[contains(text(),'分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement groupButton;

    @FindBy(xpath = "//div[@class='el-dialog__body']/div")
    private WebElement message;

    @FindBy(xpath = "//span[text()='全部资源']/preceding-sibling::i")
    private WebElement groupDropdown;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]")
    private WebElement groupDropdownList;

    @FindBy(xpath = "//div[@class='yw-table-group__basic el-input']/input")
    private WebElement searchInput;

    @FindBy(xpath = "//*[@class='el-input__icon el-icon-search is-clickable']")
    private WebElement search;

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getSearch() {
        return search;
    }

    public WebElement getGroupDropdown() {
        return groupDropdown;
    }

    public WebElement getGroupDropdownList() {
//        groupDropdown.click();
        return groupDropdownList;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getGroupButton() {
        return groupButton;
    }

    public WebElement getReturnList() {
        return returnList;
    }

    public WebElement getGroupInput() {
        dashBoardGroup.click();
        WaitForElement.waitUntilLoadingDisappear();
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return groupInput.get(groupInput.size() - 1);
    }

    public WebElement getCreateButton() {
        return createButton;
    }

    public WebElement getDashBoardName() {
        return super.getInputElement("名称");
    }


    public WebElement getDashBoardGroup() {
        return super.getDropdownList("分组");
    }


    public WebElement getSuccessMessage() {
        return successMessage;
    }


    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }


    public WebElement getEnsureCreateButton() {
        return ensureButtonList.get(0);
    }

    public WebElement getEnsureChangeGroupButton() {
        return ensureButtonList.get(1);
    }

    public WebElement getEnsureDeleteButton() {
        return ensureButtonList.get(4);
    }

    public WebElement getEnsureRenameButton() {
        return ensureButtonList.get(2);
    }

    public WebElement getEnsureSetDefaultButton() {
        return ensureButtonList.get(3);
    }

    public WebElement getDisabledLi() {
        return super.getDisabledLi();
    }

    @Override
    protected void isLoaded() throws Error {
        FluentWait wait = new FluentWait(webDriver)
                .withTimeout(8000, TimeUnit.MILLISECONDS)
                .pollingEvery(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS)
                .ignoring(NoSuchElementException.class);
        try {
            wait.until(new ExpectedCondition<Boolean>() {
                public Boolean apply(WebDriver driver) {
                    System.out.println("Waiting " + this.getClass().getName() + " Dom loading complete");
                    return ((JavascriptExecutor) driver).executeScript("return document.readyState").equals("complete");
                }
            });
        } catch (Exception e) {
            throw new Error("Can not locate " + this.getClass().getName() + "page");
        }
    }
}
