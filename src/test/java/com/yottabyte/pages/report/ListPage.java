package com.yottabyte.pages.report;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * 报表列表页
 */
public class ListPage extends ListPageFactory {

    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//button[@yotta-test='report-new-button']")
    private WebElement newReportButton;

    @FindBy(xpath = "//li[@yotta-test='report-normal_report-menu_item']")
    private WebElement startFromEmpty;

    @FindBy(xpath = "//li[@yotta-test='report-template_report-menu_item']")
    private WebElement newReportUsingTemplate;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensureButton;

    @FindBy(className = "yotta-modal")
    private WebElement tagPanel;

    @FindBy(xpath = "//div[contains(@yotta-test,'resource_tag-change_resource_tag-select')]//div[contains(@class,'yotta-select-selection')]")
    private WebElement tagField;

    @FindBy(xpath = "(//tbody//tr[contains(@class,'yotta-table-row')])[1]/td[1]")
    private WebElement lastGeneratedReport;

    @FindBy(xpath = "(//tbody//tr[contains(@class,'yotta-table-row')])[last()]//td[1]")
    private WebElement firstGeneratedReport;

    @FindBy(xpath = "//div[@yotta-test='report-filter-select']//div[contains(@class,'yotta-select-selection')]")
    private WebElement listOfReports;

    @FindBy(xpath = "//div[@yotta-test='report-filter-select']//span[@class='yotta-select-selection-value']")
    private WebElement selectedReport;

    @FindBy(xpath = "//tr/th[1]//span")
    private WebElement firstColumnTitle;

    @FindBy(xpath = "//tr/th[2]")
    private WebElement secondColumnTitle;

    @FindBy(xpath = "//tr/th[3]//span")
    private WebElement thirdColumnTitle;

    @FindBy(xpath = "//tr/th[4]")
    private WebElement fourthColumnTitle;

    @FindBy(className = "ant-select-selection-selected-value")
    private WebElement pagination;

    @FindBy(xpath = "//div[@yotta-test='table-filter_app-select']/div")
    private WebElement appDropdown;

    @FindBy(xpath = "(//span[contains(@class,'expansion-icon')])[last()]")
    private WebElement expandLastItem;

    @FindBy(xpath = "(//tr[contains(@class,'expansion')]//div[contains(text(),'资源标签......')])[last()]")
    private WebElement tagOfTheLastItem;

    @FindBy(xpath = "(//tr[contains(@class,'expansion')]//div[contains(text(),'所属应用......')])[last()]")
    private WebElement appOfTheLastItem;

    @FindBy(xpath = "(//span[text()='下载'])[1]")
    private WebElement download;

    @FindBy(xpath = "(//span[text()='查看'])[1]")
    private WebElement check;

    @FindBy(xpath = "(//span[text()='删除'])[1]")
    private WebElement deleteReport;

    @FindBy(xpath = "//div/ul/li/span[text()='授权']")
    private WebElement auth;

    @FindBy(xpath = "//div/ul/li/span[text()='删除']")
    private WebElement delete;

    @FindBy(xpath = "//div/ul/li/span[text()='标签']")
    private WebElement label;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//span[@class='yotta-select-selection-placeholder']")
    private WebElement tagToInput;

    @FindBy(className = "yotta-pageheader-title")
    private WebElement hideElement;

    @FindBy(xpath = "//li[@yotta-test='report-generated_report-button']")
    private WebElement reportListButton;

    @FindBy(xpath = "//li[@yotta-test='report-report_template_management-button']")
    private WebElement templateManager;

    @FindBy(xpath = "//span[contains(@aria-label,'Information')]")
    private WebElement tooltip;

    @FindBy(xpath = "//div[@role='tooltip']")
    private WebElement tooltipElement;

    @FindBy(xpath = "//li[@yotta-test='report-generated_report-button']/span")
    private WebElement generateReport;

    public WebElement getTooltipElement() {
        return tooltipElement;
    }

    public WebElement getTooltip() {
        return tooltip;
    }

    public WebElement getHideElement() {
        hideElement.click();
        return hideElement;
    }

    public WebElement getTagToInput() {
        return tagToInput;
    }

    public WebElement getLabel() {return label;}

    public WebElement getAuth() {return auth;}

    public WebElement getDelete() {return delete;}

    public WebElement getExpandLastItem() {
        return expandLastItem;
    }

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

    public WebElement getReportListButton() {
        webDriver.findElement(By.xpath("//span[text()='其他']")).click();
        return reportListButton;
    }

    public WebElement getTemplateManager() {
        webDriver.findElement(By.xpath("//span[text()='其他']")).click();
        return templateManager;
    }

    public WebElement getReturnList() {
        return super.getButton("返回");
    }

    public WebElement getNewReportButton() {
        newReportButton.click();
        return startFromEmpty;
//        return newReportButton;
    }

    public WebElement getNewReportUsingTemplate() {
        newReportButton.click();
        return newReportUsingTemplate;
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

    public WebElement getFirstGeneratedReport() {
        return firstGeneratedReport;
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

    public WebElement getReport() {
        webDriver.findElement(By.xpath("//span[text()='其他']")).click();
        return generateReport;
    }

    public WebElement getDownload() {
        return download;
    }

    public WebElement getCheck() {
        return check;
    }

    public WebElement getDeleteReport() {
        return deleteReport;
    }
}
