package com.yottabyte.pages;

import com.yottabyte.stepDefs.ClickSomeButton;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * 列表页面的公共的元素
 */
public class ListPageFactory extends PageTemplate {

    public ListPageFactory(WebDriver driver) {
        super(driver);
    }

    public WebElement getTagFilter() {
        return dropdownUtils.getYottaDropdownList("table-filter_tag-select");
    }

    public WebElement getAppFilter() {
        return dropdownUtils.getYottaDropdownList("table-filter_app-select");
    }

    public WebElement getSearchInput() {
        return getYottaInput("table-filter_text-input");
    }

    public WebElement getCreate() {
        return this.getButton("新建");
    }

    public WebElement getTagField() {
        return dropdownUtils.getYottaDropdownList("resource_tag-change_resource_tag-select");
    }

    @FindBy(xpath = "(//tr[contains(@class,'expansion')]//td[@class='yotta-table-cell'])[last()]")
    private WebElement expandedRow;
    public WebElement getExpandedRow() {
        return expandedRow;
    }

    @FindBy(xpath = "//div[@class='yotta-modal-body']//div[contains(@class,'yotta-dropdown')]")
    private WebElement authDropdown;
    public WebElement getAuthDropdown() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(authDropdown));
        authDropdown.click();
        return dropdownUtils.getParentElementOfMenuList();
    }

    @FindBy(xpath = "//thead//span[@class='yotta-checkbox-check']")
    private WebElement selectAll;
    public WebElement getSelectAll() {
        return selectAll;
    }

    public WebElement getBatchControl() {
        return this.getButton("批量操作");
    }

    public WebElement getBatchOperation() {
        return dropdownUtils.getParentElementOfMenuListByXpath("//div[@yotta-test='batch_control-selection-dropdown']/span");
    }

    //TODO:删除下面的AppDropdown,ResourceDropdown,groupDropdownIcon，在用例中可以用TagFilter和AppFilter
    public WebElement getAppDropdown() {
        this.groupDropdownIcon("请选择应用").click();
        return dropdownUtils.getLastDropdownList();
    }
    public WebElement getResourceDropdown() {
        this.groupDropdownIcon("请选择标签").click();
        return dropdownUtils.getLastDropdownList();
    }
    public WebElement groupDropdownIcon(String text) {
        return webDriver.findElement(By.xpath("//*[text()='" + text + "']/ancestor::div[2]"));
    }

    //TODO:删除这个tag元素，在用例中用tagField元素（dropdownlist）
    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement tag;
    public WebElement getTag() {
        return tag;
    }
    public WebElement getTagDropdown() {
        return dropdownUtils.getLastDropdownList();
    }

    //TODO:调查下面的两个元素是否可以删除
    @FindBy(xpath = "//span[@aria-label='Search']")
    private WebElement search;
    public WebElement getSearch() {
        return search;
    }

    @FindBy(xpath = "//*[text()='请选择应用']")
    private WebElement app;
    public WebElement getApp() {
        app.click();
        return dropdownUtils.getLastDropdownList();
    }
}