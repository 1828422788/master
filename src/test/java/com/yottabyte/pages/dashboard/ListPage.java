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

    @FindBy(className = "el-message-box__message")
    private WebElement errorMessage;

    @FindBy(xpath = "//span[contains(text(),'确定')]")
    private List<WebElement> ensureButtonList;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> groupInput;

    @FindBy(xpath = "//span[@class='link-label'][contains(text(),'返回列表')]")
    private WebElement returnList;

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
        return errorMessage;
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
