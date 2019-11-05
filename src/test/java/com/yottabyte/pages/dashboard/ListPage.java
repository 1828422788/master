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

    @FindBy(className = "ant-message-success")
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

    @FindBy(xpath = "//p[text()='获取角色列表失败: Api 没有权限错误']")
    private WebElement noAuth;

    public WebElement getNoAuth() {
        return noAuth;
    }

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


    public WebElement getDashBoardName() {
        return super.getPlaceholderInput("请输入名称");
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

}
