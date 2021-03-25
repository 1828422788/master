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
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//div[contains(@class,'ant-message-success')]")
    private WebElement successMessage;

    @FindBy(xpath = "//button[@yotta-test='report-new-button']")
    private WebElement newReportButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensureButton;

    @FindBy(xpath = "//div[@class='ant-modal-content']")
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
    private WebElement firstCreatedReport;

    @FindBy(xpath = "//div[text()='全部资源']/ancestor::div[2]")
    private WebElement tagDropdown;

    @FindBy(xpath = "//span[@class = 'ant-spin-dot ant-spin-dot-spin']")
    private WebElement loading;

    @FindBy(xpath = "//span[contains(text(),'添加资源标签')]")
    private WebElement multiTag;

    @FindBy(xpath = "//span[contains(text(),'删除')]")
    private WebElement multiDelete;

    @FindBy(xpath = "//span[contains(text(),'启动')]")
    private WebElement multiSwitch;

    @FindBy(xpath = "//p[text()='暂无数据']")
    private WebElement noData;

    @FindBy(className = "ant-select-selection-selected-value")
    private WebElement pagination;

    @FindBy(xpath = "//div[text()='请选择应用']/ancestor::div[2]")
    private WebElement appDropdown;

    @FindBy(xpath = "(//tr)[last()]/td[7]")
    private WebElement tagOfTheLastItem;

    @FindBy(xpath = "(//tr)[last()]/td[6]")
    private WebElement appOfTheLastItem;

    public WebElement getAppOfTheLastItem() {
        return appOfTheLastItem;
    }

    public WebElement getTagOfTheLastItem() {
        return tagOfTheLastItem;
    }

    public WebElement getAppDropdown() {
        appDropdown.click();
        return this.getLastDropdownList();
    }

    public WebElement getPagination() {
        pagination.click();
        return this.getLastDropdownList();
    }

    public WebElement getNoData() {
        return noData;
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getReportListButton() {
        return super.getButton("已生成报表");
    }

    public WebElement getReturnList() {
        return super.getButton("返回列表");
    }

    public WebElement getNewReportButton() {
        return newReportButton;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
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

    public WebElement getReport() {
        return super.getButton("已生成报表");
    }

    //download the last generated report
    @FindBy(xpath = "(//a[text()='下载'])[1]")
    private WebElement download;

    public WebElement getDownload() {
        return download;
    }

    public WebElement getMultiButton() {
        return super.getButton("批量操作");
    }

    public WebElement getSelectAction() {
        return super.getButton("请选择");
    }

    public WebElement getFinish() {
        return super.getButton("完成");
    }

    public WebElement getMultiTag() {
        return multiTag;
    }

    public WebElement getMultiDelete() {
        return multiDelete;
    }

    public WebElement getMultiSwitch() {
        return multiSwitch;
    }
}
