package com.yottabyte.pages.roles;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.stepDefs.LoadingPage;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

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

    @FindBy(className = "el-table_1_column_1")
    private List<WebElement> searchResultRows;

    @FindBy(className = "el-table__empty-text")
    private WebElement noSearchResultMessage;

    @FindBy(className = "el-message-box__content")
    private WebElement messageInfo;

    @FindBy(className = "el-message-box__btns")
    private WebElement messageBoxButtons;

    @FindBy(xpath = "(//div[@class='yw-nav-popover-items'])[10]")
    private WebElement source;

    @FindBy(className = "el-icon-search")
    private WebElement searchIcon;

    public WebElement getLoadingElement() {
        return loadingElement;
    }

    public WebElement getSource() {
        return source;
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getSearchResultTable() {
        return searchResultTable;
    }

    public WebElement getTableEditButton(int row) {
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'编辑')]"));
    }

    public WebElement getTableAuthorizeButton(int row) {
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'授权')]"));
    }

    public WebElement getTableCopyButton(int row) {
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'复制')]"));
    }

    public WebElement getTableDeleteButton(int row) {
        WebElement e = getTableRowButtons(row);
        return e.findElement(By.xpath("//button/span[contains(text(),'删除')]"));
    }

    private WebElement getTableRowButtons(int row) {
        WebElement table = searchResultTable;
        return table.findElements(By.className("el-table_1_column_3")).get(row - 1);
    }

    public WebElement getSearchIcon() {
        return searchIcon;
    }
}
