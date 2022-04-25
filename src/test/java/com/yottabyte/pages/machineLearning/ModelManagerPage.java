package com.yottabyte.pages.machineLearning;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class ModelManagerPage extends EditorPage {
    public ModelManagerPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-checkbox")
    private WebElement checkAllButton;

    @FindBy(xpath = "//div[@class='el-message-box__input']//input")
    private WebElement modelName;

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement ensureButton;

    @FindBy(className = "col-edit-btn")
    private WebElement edit;

    @FindBy(xpath = "//span[text()='ops']")
    private List<WebElement> lineList;

    @FindBy(className = "confirm_icon")
    private WebElement confirm;

    @FindBy(className = "model_name")
    private WebElement nameInput;

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(xpath = "//i[@class='el-icon-circle-check']/following-sibling::span")
    private WebElement importSuccess;

    @FindBy(xpath = "//i[@class='el-input__icon el-icon-search']/following-sibling::input")
    private WebElement searchInput;

    @FindBy(className = "el-tooltip")
    private WebElement focus;

    public WebElement getFocus() {
        return focus;
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getImportSuccess() {
        return importSuccess;
    }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getNameInput() {
        return nameInput;
    }

    public WebElement getConfirm() {
        return confirm;
    }

    public WebElement getLine1() {
        return lineList.get(0);
    }

    public WebElement getLine2() {
        return lineList.get(2);
    }

    public WebElement getLine3() {
        return lineList.get(4);
    }

    public WebElement getLine4() {
        return lineList.get(6);
    }

    public WebElement getLine5() {
        return lineList.get(8);
    }

    public WebElement getEdit() {
        return edit;
    }

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

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }
}
