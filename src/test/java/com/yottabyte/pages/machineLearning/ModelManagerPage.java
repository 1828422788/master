package com.yottabyte.pages.machineLearning;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ModelManagerPage extends PageTemplate {
    public ModelManagerPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-checkbox")
    private WebElement checkAllButton;

    @FindBy(xpath = "//div[@class='el-message-box__input']//input")
    private WebElement modelName;

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement ensureButton;

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getCheckAllButton() {
        return checkAllButton;
    }

    public WebElement getModelName() {
        return modelName;
    }

    public WebElement getImportAndExportButton() {
        return super.getButton("导入/导出");
    }

    public WebElement getExportButton() {
        return super.getButton("导出");
    }

    public WebElement getImportButton() {
        return super.getButton("导入");
    }

    public WebElement getEnsureExportButton() {
        return super.getButton("确认导出");
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }
}
