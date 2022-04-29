package com.yottabyte.pages.dashboard;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "(//*[contains(@class,'yotta-select-selection-value')])[last()]")
    private WebElement itemsPerPage;
    public WebElement getItemsPerPage() {
        return itemsPerPage;
    }

    @FindBy(xpath = "//span[text()='数据用户']/following-sibling::span[last()]")
    private WebElement empowerUser;
    public WebElement getEmpowerUser() { return empowerUser; }

    @FindBy(xpath = "//span[text()='编辑']/preceding-sibling::label")
    private WebElement empowerEdit;
    public WebElement getEmpowerEdit() { return empowerEdit; }

    @FindBy(xpath = "//span[text()='删除']/preceding-sibling::label")
    private WebElement empowerDelete;
    public WebElement getEmpowerDelete() { return empowerDelete; }

    public WebElement getAppField() {
        return dropdownUtils.getYottaDropdownList("dashboard-new_dashboard_app-select");
    }

    public WebElement getDataUser() { return dropdownUtils.getYottaDropdownList("dashboard-new_dashboard_user-select"); }

    public WebElement getDashBoardName() {
        return getYottaInput("dashboard-new_dashboard_name-input");
    }

    public WebElement getErrorMessage() {
        return super.getSuccessMessage();
    }

    @FindBy(xpath = "//div[@role='tab' and contains(text(),'我的收藏')]")
    private WebElement myCollection;
    public WebElement getMyCollection() {
        return myCollection;
    }

    public WebElement getFirstDashboardName() {
        return getDasboardNameInTheRow(1);
    }

    public WebElement getSecondDashboardName() {
        return getDasboardNameInTheRow(2);
    }

    public WebElement getThirdDashboardName() {
        return getDasboardNameInTheRow(3);
    }

    private WebElement getDasboardNameInTheRow(int row){
        return webDriver.findElement(By.xpath("//tr[" + row + "]//td[1]"));
    }
}