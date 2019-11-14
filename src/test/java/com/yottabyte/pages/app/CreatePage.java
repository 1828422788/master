package com.yottabyte.pages.app;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "resource-config")
    private WebElement wrapper;

    @FindBy(xpath = "//span[text()='本地上传']")
    private WebElement uploadButton;

    @FindBy(xpath = "//span[text()='系统内选择']")
    private WebElement chooseFromSystemButton;

    @FindBy(xpath = "//div[text()='* 仅支持 .tar 格式文件']/preceding-sibling::div//input")
    private WebElement fileInput;

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']/span")
    private WebElement ensureButton;

    @FindBy(xpath = "//span[text()='上传logo']/ancestor::button/following-sibling::input")
    private WebElement logoInput;

    @FindBy(className = "el-color-picker__color-inner")
    private WebElement colorPicker;

    @FindBy(className = "el-color-dropdown__value")
    private WebElement colorValue;

    @FindBy(className = "el-color-dropdown__btn")
    private WebElement ensureColourButton;

    @FindBy(className = "el-message-box__wrapper")
    private WebElement fadeOut;

    @FindBy(xpath = "//form[@class='el-form el-form--label-right']//input")
    private WebElement menuName;

    @FindBy(className = "el-input__icon")
    private WebElement dropdownArrow;

    @FindBy(xpath = "//div[@class='el-dialog__wrapper yw-modal-form yw-new-modal-form']")
    private WebElement dialogWrapper;

    @FindBy(className = "el-color-svpanel__black")
    private WebElement panel;

    @FindBy(xpath = "//i[@class='el-input__icon el-icon-search']/following-sibling::input")
    private WebElement searchSource;

    @FindBy(className = "el-checkbox")
    private WebElement allCheck;

    // bug修复后删掉
    @FindBy(xpath = "(//label[@class='el-checkbox'])[2]")
    private WebElement tmpCheckBox;

    public WebElement getTmpCheckBox() {
        return tmpCheckBox;
    }

    @FindBy(className = "el-dialog__close")
    private WebElement closeDialog;

    @FindBy(xpath = "//span[text()='本APP']")
    private WebElement currentApp;

    @FindBy(xpath = "//button[@class='el-button yw-modal-btn yw-modal-btn-primary el-button--primary']/span")
    private WebElement saveMenuButton;

    @FindBy(xpath = "//div[@class='el-dialog__wrapper yw-modal-form resource-config']")
    private WebElement resourceConfig;

    @FindBy(xpath = "//div[@class='el-dialog__wrapper yw-modal-form yw-new-modal-form dialog-fade-leave-active dialog-fade-leave-to']")
    private WebElement fadeLeave;

    @FindBy(className = "item-title-edit-group")
    private WebElement editGroup;

    @FindBy(xpath = "//span[text()='添加子菜单']")
    private WebElement addSubmenu;

    @FindBy(xpath = "//span[text()='全局']")
    private WebElement overallSituation;

    @FindBy(className = "el-button--text")
    private WebElement sourceConfig;

    public WebElement getSourceConfig() {
        return sourceConfig;
    }

    public WebElement getOverallSituation() {
        return overallSituation;
    }

    public WebElement getFirstMenu() {
        return super.getButton("应用管理");
    }

    public WebElement getDescribeInput() {
        return getInputElement("描述");
    }

    public WebElement getChoiceButton() {
        return super.getButton("选择");
    }

    public WebElement getUploadFile() {
        return super.getButton("上传文件");
    }

    public WebElement getAddMenuButton() {
        return super.getButton("添加一级菜单");
    }

    public WebElement getSaveButton() {
        return super.getButton("保存");
    }

    public WebElement getImportButton() {
        return super.getContainsTextButton("导入");
    }

    public WebElement getExportButton() {
        return super.getButton("导出");
    }

    public WebElement getUrl() {
        return getInputElement("URL");
    }

    public WebElement getDefaultPage() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(dialogWrapper));
        dropdownArrow.click();
        return getLastDropdownList();
    }

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

    public WebElement getCreateButton() {
        return super.getButton("创建");
    }

    public WebElement getNameInput() {
        return getInputElement("名称");
    }

    public WebElement getSaveMenuButton() {
        return saveMenuButton;
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getUploadButton() {
        return uploadButton;
    }

    public WebElement getMenuName() {
        return menuName;
    }

    public WebElement getChooseFromSystemButton() {
        return chooseFromSystemButton;
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getFileInput() {
        return fileInput;
    }

    public WebElement getLogoInput() {
        return logoInput;
    }

    public WebElement getColorPicker() {
        return colorPicker;
    }

    public WebElement getColorValue() {
        return colorValue;
    }

    public WebElement getEnsureColourButton() {
        return ensureColourButton;
    }

    public WebElement getSearchSource() {
        return searchSource;
    }

    public WebElement getAllCheck() {
        return allCheck;
    }

    public WebElement getCloseDialog() {
        return closeDialog;
    }

    public WebElement getCurrentApp() {
        return currentApp;
    }

    public WebElement getDialogWrapper() {
        return dialogWrapper;
    }

    public WebElement getFadeOut() {
        return fadeOut;
    }

    public WebElement getResourceConfig() {
        return resourceConfig;
    }

    public WebElement getFadeLeave() {
        return fadeLeave;
    }

    public WebElement getEditGroup() {
        return editGroup;
    }

    public WebElement getAddSubmenu() {
        return addSubmenu;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/following-sibling::div//input"));
    }
}
