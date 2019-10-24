package com.yottabyte.pages.dictionary;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
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

    @FindBy(className = "ant-upload-list-item-name")
    private WebElement fileName;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement successMessage;

    @FindBy(className = "el-table__empty-text")
    private WebElement emptyText;

    @FindBy(xpath = "//div[@class='ant-modal-footer']//button")
    private WebElement ensureUpload;

    @FindBy(xpath = "//div[@class='ant-modal-body']//button")
    private WebElement ensureDelete;

    public WebElement getEnsureDelete() {
        return ensureDelete;
    }

    public WebElement getEnsureUpload() {
        return ensureUpload;
    }

    public WebElement getEmptyText() {
        return emptyText;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getFileName() {
        return fileName;
    }

    public WebElement getUploadButton() {
        return super.getButton("上传");
    }

    public WebElement getGroupInput() {
        return super.getInputElement("字典标签");
    }

    public WebElement getGroup() {
        return super.getLastDropdownList();
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getUpdate() {
        return super.getContainsTextButton("更新");
    }

}
