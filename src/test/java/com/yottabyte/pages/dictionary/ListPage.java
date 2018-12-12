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
}
