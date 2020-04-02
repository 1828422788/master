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

    @FindBy(xpath = "//div[@class='ant-modal-body']//p | //div[@class='ant-message-custom-content ant-message-success']/span")
    private WebElement successMessage;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement message;

    @FindBy(xpath = "//span[text()='新建']/ancestor::button")
    private WebElement newReportButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensureButton;

    @FindBy(xpath= "//div[@class='ant-modal-content']")
    private WebElement tagPanel;

    @FindBy(xpath = "(//div[text()='标签'])[last()]/following-sibling::div[1]")
    private WebElement tagField;

    @FindBy(xpath = "//tr[@class='ant-table-row ant-table-row-level-0']/td[1]")
    private WebElement lastGeneratedReport;

    @FindBy(xpath = "//span[text()='报表文件列表']/ancestor::div/following-sibling::div[2]")
    private WebElement listOfReports;

    @FindBy(xpath = "//span[text()='报表文件列表']/ancestor::div//div[@class='ant-select-selection-selected-value']")
    private WebElement selectedReport;

    @FindBy(xpath = "//tr/th[1]/span")
    private WebElement firstColumnTitle;

    @FindBy(xpath = "//tr/th[2]/span")
    private WebElement secondColumnTitle;

    @FindBy(xpath = "//tr/th[3]/span")
    private WebElement thirdColumnTitle;

    @FindBy(xpath = "//tr/th[4]/span")
    private WebElement fourthColumnTitle;

    @FindBy(xpath = "//span[text()='取消']/ancestor::button")
    private WebElement cancel;

    @FindBy(xpath = "//span[text()='报表列表']/ancestor::div/div/span/input")
    private WebElement searchInput;

    @FindBy(xpath = "//tbody[@class='ant-table-tbody']/tr[last()]/td[2]//a")
    private  WebElement firstCreatedReport;

    @FindBy(xpath = "//span[text()='报表列表']/ancestor::div/div/div[2]/div")
    private  WebElement tagDropdown;


    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getReportListButton() {
        return super.getButton("已生成报表");
    }

    public WebElement getReturnList() {
        return super.getButton("返回列表");
    }
//
//    public WebElement getMessage() {
//        return super.getSuccessMessage();
//    }

    public WebElement getNewReportButton() {
        return newReportButton;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getTagPanel() {
        return tagPanel;
    }

    public WebElement getTagField() {
        tagField.click();
        return this.getLastDropdownList();
    }

    public WebElement getLastGeneratedReport() {
        return lastGeneratedReport;
    }

    public WebElement getListOfReports() {
        listOfReports.click();
        return this.getLastDropdownList();
    }

    public WebElement getSelectedReport() {
        return selectedReport;
    }

    public WebElement getFirstColumnTitle() {
        return firstColumnTitle;
    }

    public WebElement getSecondColumnTitle() {
        return secondColumnTitle;
    }

    public WebElement getThirdColumnTitle() {
        return thirdColumnTitle;
    }

    public WebElement getFourthColumnTitle() {
        return fourthColumnTitle;
    }

    public WebElement getCancel() {
        return cancel;
    }

    public WebElement searchInput() {
        return searchInput;
    }

    public WebElement getFirstCreatedReport() {
        return firstCreatedReport;
    }

    public WebElement getTagDropdown() {
        tagDropdown.click();
        return this.getLastDropdownList();
    }

}
