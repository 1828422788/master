package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-input__inner")
    private WebElement name;

    @FindBy(xpath = "(//div[@class='screenshot'])[2]")
    private WebElement bank;

    @FindBy(xpath = "(//div[@class='screenshot'])[4]")
    private WebElement test;

    @FindBy(xpath = "//li[contains(text(),'图表')]")
    private WebElement chart;

    @FindBy(className = "line")
    private WebElement line;

    @FindBy(xpath = "//div[text()='数据']")
    private WebElement data;

    @FindBy(xpath = "(//span[contains(text(),'搜索')][not(@class)])[last()]")
    private WebElement search;

    @FindBy(xpath = "//label[text()='X轴']/following-sibling::div//i")
    private WebElement xaxis;

    @FindBy(xpath = "//label[text()='Y轴']/following-sibling::div//i")
    private WebElement yaxis;

    @FindBy(className = "download")
    private WebElement download;

    @FindBy(className = "delete")
    private WebElement delete;

    @FindBy(xpath = "(//span[contains(text(),'确定')][not(@class)])[last()]")
    private WebElement ensureDelete;

    @FindBy(className = "el-upload--text")
    private WebElement upload;

    public WebElement getUpload() {
        return upload;
    }

    public WebElement getEnsureDelete() {
        return ensureDelete;
    }

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getDownload() {
        return download;
    }

    public WebElement getSearchTip() {
        return super.getContainsTextButton("搜索中");
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSaveAsTemplate() {
        return super.getButton("保存为模版");
    }

    public WebElement getXaxis() {
        xaxis.click();
        return super.getLastDropdownList();
    }

    public WebElement getYaxis() {
        yaxis.click();
        return super.getLastDropdownList();
    }

    public WebElement getSearch() {
        return search;
    }

    public WebElement getData() {
        return data;
    }

    public WebElement getLine() {
        return line;
    }

    public WebElement getChart() {
        return chart;
    }

    public WebElement getBank() {
        return bank;
    }

    public WebElement getTest() {
        return test;
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getCreate() {
        return super.getButton("创建");
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSave() {
        return super.getButton("保存");
    }
}
