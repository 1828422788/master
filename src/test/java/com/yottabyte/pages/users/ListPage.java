package com.yottabyte.pages.users;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.*;

import javax.annotation.Nullable;
import java.util.List;

public class ListPage extends ListPageFactory {

    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-loading-mask")
    private WebElement loadingElement;

    @FindBys({
            @FindBy(className = "yw-table-group__basic"),
            @FindBy(className = "el-input__inner")
    })
    private WebElement searchInput;

    @FindBy(className = "el-table__body")
    private WebElement searchResultTable;
    // 搜索结果 (只搜索显示出来的元素)
    @FindBy(xpath = "//div[@class='runner-cell']/*[not(@style='display: none;')]")
    private List<WebElement> searchResultRows;

    @FindBy(className = "el-table__empty-text")
    private WebElement noSearchResultMessage;

    @FindBy(className = "el-message-box__content")
    private WebElement messageInfo;

    @FindBy(className = "el-message-box__btns")
    private WebElement messageBoxButtons;

    @FindBy(className = "el-dialog")
    private WebElement dialog;

    @FindBy(className = "group-modal-select")
    private WebElement changeGroupButton;

    @FindBy(className = "el-select-dropdown")
    private List<WebElement> dropdownLists;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(xpath = "//span[text()='SuccessEditAutoTest'][@class='runner-banned-name']/following-sibling::span")
    private WebElement userStatus;

    @FindBy(xpath = "//div[text()='分组']/following-sibling::div")
    private WebElement groupIcon;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement ul;

    @FindBy(xpath = "//span[text()=' __user_AutoTest__ ']")
    private WebElement role;

    @FindBy(xpath = "//span[text()='__user_AutoTestAuth__']")
    private WebElement roleAuth;

    @FindBy(xpath = "//label[text()='所拥有角色']")
    private WebElement roleText;

    @FindBy(xpath = "//li[@yotta-test='account-delete-button']/span")
    private WebElement delete;

    public WebElement getDelete() { return delete; }

    public WebElement getRoleText() {
        return roleText;
    }

    public WebElement getCreateUser() {
        return super.getButton("新建");
    }

    public WebElement getRoleAuth() {
        return roleAuth;
    }

    public WebElement getRole() {
        return role;
    }

    public WebElement getEnsureButton() {
        return super.getButton("确定");
    }

    public WebElement getSearchInput() {
        ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(loadingElement);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchInput;
    }

    public WebElement getSearchResult() {
        if (searchResultRows.size() >= 1) {
            List<WebElement> list = searchResultRows.get(0).findElements(By.tagName("span"));
            if (list.size() >= 1) {
                return list.get(0);
            } else {
                return searchResultRows.get(0);
            }
        } else {
            ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(noSearchResultMessage);
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
            return noSearchResultMessage;
        }
    }

    public WebElement getUserStatus() {
        return userStatus;
    }

    public WebElement getSearchResultTable() {
        return searchResultTable;
    }

    public WebElement getTableSeeDetailButton(int row) {
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'查看')]"));
    }

    public WebElement getTableChangeGroupButton(int row) {
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'分组')]"));
    }

    public WebElement getTableDeleteButton(int row) {
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'删除')]"));
    }

    public WebElement getTableDisableButton(int row) {
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'禁用')]"));
    }

    public WebElement getTableEnableButton(int row) {
        ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(loadingElement);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'启用')]"));
    }

    public WebElement getUserGroups() {
        groupIcon.click();
        return super.getLastDropdownList();
    }

    public WebElement getConfirmButton() {
        return dialog.findElement(By.xpath("//button//span[contains(text(),'确定')]"));
    }

    public WebElement getMessageBoxButtons() {
        return messageBoxButtons;
    }

    public WebElement getMessageBoxOKButton() {
        ExpectedCondition expectedCondition = ExpectedConditions.textToBePresentInElement(messageInfo, "将删除");
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        List<WebElement> list = getMessageBoxButtons().findElements(By.tagName("button"));
        for (WebElement e : list) {
            if ("确定".equals(e.getText())) {
                return e;
            }
        }
        return null;
    }

    public WebElement getErrorMessage() {
        return message;
    }

    public void thereIsAUser(String userName, String fullName, String email, String telephone, String password, List<String> userGroup) {
//        ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(loadingElement);
//        WaitElement.waitForElementWithExpectedCondition(webDriver,expectedCondition);
//        getSearchInput().sendKeys(Keys.END);
//        getSearchInput().sendKeys(Keys.SHIFT, Keys.HOME);
//        getSearchInput().sendKeys(Keys.BACK_SPACE);
//        getSearchInput().sendKeys(userName);
//        String text = getSearchResult().getText();
//        if ("暂无数据".equals(text)){
//            getCreateUser().click();
//            LoadingPage page = new LoadingPage();
//            page.iWillSeeNewPage("users.CreatePage");
//            CreatePage createPage = new CreatePage(webDriver);
//            createPage.createAUser(userName,fullName,email,telephone,password,userGroup);
//            page.iWillSeeNewPage("users.CreatePage");
//        }else if (text.equals(userName)){
//            System.out.println("There is a user");
//            getSearchInput().sendKeys(Keys.END);
//            getSearchInput().sendKeys(Keys.SHIFT, Keys.HOME);
//            getSearchInput().sendKeys(Keys.BACK_SPACE);
//        }
//        CreatePage createPage = new CreatePage(webDriver);
//        createPage.creatAUserWithSql(userName, fullName, email, telephone, password, userGroup);
    }

    public void thereIsNoUser(String userName) {
        ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(loadingElement);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        getSearchInput().sendKeys(Keys.END);
        getSearchInput().sendKeys(Keys.SHIFT, Keys.HOME);
        getSearchInput().sendKeys(Keys.BACK_SPACE);
        getSearchInput().sendKeys(userName);
        String text = getSearchResult().getText();
        if (text.equals(userName)) {
            getTableDeleteButton(1).click();
            ExpectedCondition e = ExpectedConditions.elementToBeClickable(getMessageBoxOKButton());
            WaitForElement.waitForElementWithExpectedCondition(webDriver, e);
            getMessageBoxOKButton().click();
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
            webDriver.navigate().refresh();
        }
    }


    private WebElement getTableRowButtons(int row) {
        WebElement table = getSearchResultTable();
        return table.findElements(By.className("el-table_1_column_4")).get(row - 1);
    }

}
