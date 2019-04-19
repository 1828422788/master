package com.yottabyte.pages.dictionary;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//button[@class='el-button el-button--primary']/span[text()='上传'][not(@class)]")
    private WebElement uploadFile;

    @FindBy(className = "el-upload-list__item-name")
    private WebElement fileName;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "//label[contains(text(),'字典分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement groupInput;

    @FindBy(className = "el-table__empty-text")
    private WebElement emptyText;

    public WebElement getEmptyText() {
        return emptyText;
    }

    public WebElement getGroupInput() {
        return groupInput;
    }

    public WebElement getDisabledLi() {
        return super.getDisabledLi();
    }

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getFileName() {
        return fileName;
    }

    public WebElement getUploadFile() {
        return uploadFile;
    }

    public WebElement getUploadButton() {
        return super.getButton("上传");
    }

    public WebElement getGroup() {
        return super.getDropdownList("字典分组");
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getUpdate() {
        return super.getContainsTextButton("更新");
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }
}
