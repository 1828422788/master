package com.yottabyte.pages.report;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * 报表列表页
 */
public class ListPage extends ListPageFactory {

    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getSearchInput() {
        return super.getSearchInput();
    }

    public WebElement getSearch() {
        return super.getSearchIcon();
    }

    @FindBy(xpath = "//span[text()='已生成报表']")
    private WebElement existReportButton;

    public WebElement getExistReportButton() {
        return existReportButton;
    }

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement successMessage;

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    @FindBy(xpath = "//span[text()='已生成报表']")
    private WebElement report;

    public WebElement getReport() {
        return report;
    }

    @FindBy(xpath = "//span[text()='全部资源']/preceding-sibling::i")
    private WebElement groupList;

    @FindBy(xpath = "(//*[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]")
    private WebElement dropdownMenu;

    public WebElement getGroupList() {
        groupList.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(dropdownMenu));
        return dropdownMenu;
    }

    @FindBy(className = "switch-margin")
    private List<WebElement> searchList;

    public List<WebElement> getSearchList() {
        return searchList;
    }

//    public WebElement getDisabledLi() {
//        return super.getDisabledLi();
//    }

//    public WebElement getMessage() {
//        return super.getErrorMessage();
//    }
}
