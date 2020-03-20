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

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement successMessage;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement message;

    @FindBy(xpath = "//span[text()='新建']/ancestor::button")
    private WebElement newReportButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensureButton;

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getReport() {
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
}
