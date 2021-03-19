package com.yottabyte.pages.app;

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

    @FindBy(xpath = "//input[@placeholder='请输入']")
    private WebElement getSearchInput;

    @FindBy(className = "el-table__empty-text")
    private WebElement emptyText;

    @FindBy(xpath = "//span[text()='名称']/following-sibling::span")
    private WebElement nameText;

    @FindBy(xpath = "//div/ul/li/span[text()='打开']")
    private WebElement open;

    @FindBy(xpath = "//div/ul/li[2]/span[text()='导出']")
    private WebElement export;

    @FindBy(xpath = "//div/ul/li[3]/span[text()='删除']")
    private WebElement delete;

    public WebElement getNameText() {
        return nameText;
    }

    public WebElement getEmptyText() {
        return emptyText;
    }

    public WebElement getOpen() {
        return open;
    }

    public WebElement getExport() {
        return export;
    }

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getCreateButton() {
        return super.getButton("制作");
    }

    public WebElement getInstallButton() {
        return super.getButton("安装");
    }

    public WebElement getGetSearchInput() {
        return getSearchInput;
    }
}
