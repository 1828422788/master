package com.yottabyte.pages.dashboard;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//label[contains(text(),'分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement dashBoardGroup;

    @FindBy(xpath = "//span[contains(text(),'确定')]")
    private List<WebElement> ensureButtonList;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> groupInput;

    @FindBy(xpath = "//span[@class='link-label'][contains(text(),'返回列表')]")
    private WebElement returnList;

    @FindBy(xpath = "//label[contains(text(),'分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement groupButton;

    @FindBy(xpath = "//span[text()='全部资源']/preceding-sibling::i")
    private WebElement groupDropdown;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]")
    private WebElement groupDropdownList;

    @FindBy(xpath = "(//div[@class='ant-modal-body']//p)[1]")
    private WebElement errorMessage;

    @FindBy(xpath = "//span[text()='所属应用']/following-sibling::span//i")
    private WebElement appIcon;

    @FindBy(xpath = "//span[text()='名称']/following-sibling::span/input")
    private WebElement dashBoardName;

    public WebElement getApp() {
        appIcon.click();
        return super.getLastDropdownList();
    }

    public WebElement getGroupDropdown() {
        return groupDropdown;
    }

    public WebElement getGroupDropdownList() {
//        groupDropdown.click();
        return groupDropdownList;
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


    public WebElement getDashBoardName() {
        return dashBoardName;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }
}
