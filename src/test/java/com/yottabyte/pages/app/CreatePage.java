package com.yottabyte.pages.app;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.stepDefs.ClickSomeButton;
import com.yottabyte.utils.ClickEvent;
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

    @FindBy(xpath = "//span[text()='菜单颜色']/following-sibling::div")
    private WebElement colorPicker;

    @FindBy(xpath = "//div[@class='flexbox-fix']//input")
    private WebElement colorValue;

    @FindBy(className = "el-color-dropdown__btn")
    private WebElement ensureColourButton;

    @FindBy(className = "el-message-box__wrapper")
    private WebElement fadeOut;

    @FindBy(className = "ant-select-arrow-icon")
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

    @FindBy(xpath = "//div[@class='el-dialog__wrapper yw-modal-form resource-config']")
    private WebElement resourceConfig;

    @FindBy(xpath = "//div[@class='el-dialog__wrapper yw-modal-form yw-new-modal-form dialog-fade-leave-active dialog-fade-leave-to']")
    private WebElement fadeLeave;

    @FindBy(className = "item-title-edit-group")
    private WebElement editGroup;

    @FindBy(xpath = "(//a[text()='添加子菜单'])[1]")
    private WebElement addSubmenu;

    @FindBy(xpath = "//span[text()='全局']")
    private WebElement overallSituation;

    @FindBy(className = "el-button--text")
    private WebElement sourceConfig;

    @FindBy(className = "el-loading-mask")
    private WebElement loading;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement message;

    @FindBy(xpath = "//a[text()='添加一级菜单']")
    private WebElement addMenu;

    @FindBy(xpath = "//input[@id='NavEdit_name']/ancestor::span/following-sibling::div")
    private WebElement nameMessage;

    @FindBy(xpath = "//input[@id='NavEdit_url']/ancestor::span/following-sibling::div")
    private WebElement urlMessage;

    @FindBy(xpath = "//a[text()='已选择 0 个资源']")
    private WebElement addResource;

    @FindBy(xpath = "//span[contains(@class,'ant-input-search')]/input")
    private WebElement searchResourceInput;

    @FindBy(xpath = "//*[@class='ant-spin-container ant-spin-blur']")
    private WebElement searchLoading;

    @FindBy(xpath = "//span[text()='事件操作']")
    private WebElement event;

    @FindBy(xpath = "//a[text()='添加']")
    private WebElement addKVStore;

    @FindBy(xpath = "(//label[text()='名称'])[last()]/following-sibling::input")
    private WebElement KVName;

    @FindBy(xpath = "(//label[text()='字段列表']/following-sibling::div//input)[last()]")
    private WebElement KVFieldInput;

    @FindBy(xpath = "//a[text()='添加字段']")
    private WebElement addKVField;

    @FindBy(xpath = "//div[@class='ant-modal-body']//i")
    private WebElement resourceType;

    @FindBy(className = "ant-message-custom-content")
    private WebElement messageContent;

    @FindBy(className = "css-nil")
    private WebElement kvDropdown;

    @FindBy(className = "ant-dropdown-menu")
    private WebElement kvDropdownList;

    @FindBy(className = "ant-select-search__field")
    private WebElement KVTag;

    @FindBy(xpath = "//div[text()='字段配置']")
    private WebElement fieldConfig;

    @FindBy(id = "FieldConfig_name")
    private WebElement fieldConfigName;

    @FindBy(id = "FieldAliasModal_name")
    private WebElement fieldAliasModalName;

    @FindBy(xpath = "(//input[contains(@id,'original')])[last()]")
    private WebElement originalField;

    @FindBy(xpath = "(//input[contains(@id,'alias')])[last()]")
    private WebElement fieldAlias;

    @FindBy(xpath = "//a[text()='添加别名映射']")
    private WebElement addAlias;

    @FindBy(xpath = "(//a[text()='删除'])[last()]")
    private WebElement deleteAlias;

    @FindBy(xpath = "//div[text()='字段查找']")
    private WebElement fieldSearch;

    @FindBy(xpath = "//div[text()='字段转换']")
    private WebElement fieldConvert;

    @FindBy(xpath = "//div[text()='字段萃取']")
    private WebElement fieldExtract;

    @FindBy(id = "FieldConfig_name")
    private WebElement fieldSearchName;

    @FindBy(id = "FieldConfig_csvPath")
    private WebElement csvPath;

    @FindBy(xpath = "(//input[contains(@id,'.input')])[last()]")
    private WebElement searchInputField;

    @FindBy(xpath = "(//input[contains(@id,'.event')])[last()]")
    private WebElement eventField;

    @FindBy(xpath = "(//div[contains(@id,'.match_type')])[last()]")
    private WebElement matchType;

    @FindBy(xpath = "//a[text()='添加查找输出字段']")
    private WebElement addOutputField;

    @FindBy(xpath = "(//input[contains(@id,'.output')])[last()]")
    private WebElement outputField;

    @FindBy(id = "FieldConfig_regex")
    private WebElement fieldConfigRegex;

    @FindBy(id = "FieldConfig_format")
    private WebElement fieldConfigFormat;

    @FindBy(partialLinkText = "添加字段转换")
    private WebElement addFieldConvertRule;

    @FindBy(xpath = "(//input[contains(@id,'.name')])[last()]")
    private WebElement lastNameInput;

    @FindBy(xpath = "(//div[@class='ant-select-selection__rendered'])[last()]")
    private WebElement fieldConvertRule;

    @FindBy(id = "FieldConfig_delims")
    private WebElement fieldConfigDelims;

    @FindBy(id = "FieldConfig_fields")
    private WebElement fieldConfigFields;

    @FindBy(xpath = "(//span[text()='保存'])[last()]/ancestor::button")
    private WebElement saveButton;

    @FindBy(className = "ant-form-explain")
    private WebElement warningInfo;

    public WebElement getWarningInfo() {
        return warningInfo;
    }

    public WebElement getFieldAliasModalName() {
        return fieldAliasModalName;
    }

    public WebElement getFieldConfigFields() {
        return fieldConfigFields;
    }

    public WebElement getFieldConfigDelims() {
        return fieldConfigDelims;
    }

    public WebElement getFieldConvertRule() {
        fieldConvertRule.click();
        return super.getLastDropdownList();
    }

    public WebElement getLastNameInput() {
        return lastNameInput;
    }

    public WebElement getAddFieldConvertRule() {
        return addFieldConvertRule;
    }

    public WebElement getFieldExtract() {
        return fieldExtract;
    }

    public WebElement getFieldConfigFormat() {
        return fieldConfigFormat;
    }

    public WebElement getFieldConfigRegex() {
        return fieldConfigRegex;
    }

    public WebElement getAddFieldConvert() {
        return super.getButton("添加字段转换");
    }

    public WebElement getFieldConvert() {
        return fieldConvert;
    }

    public WebElement getAddOutputField() {
        return addOutputField;
    }

    public WebElement getOutputField() {
        return outputField;
    }

    public WebElement getMatchType() {
        matchType.click();
        return super.getLastDropdownList();
    }

    public WebElement getAddFieldSearch() {
        return super.getButton("添加字段查找");
    }

    public WebElement getFieldSearchName() {
        return fieldSearchName;
    }

    public WebElement getCsvPath() {
        return csvPath;
    }

    public WebElement getSearchInputField() {
        return searchInputField;
    }

    public WebElement getEventField() {
        return eventField;
    }

    public WebElement getFieldSearch() {
        return fieldSearch;
    }

    public WebElement getDeleteAlias() {
        return deleteAlias;
    }

    public WebElement getAddAlias() {
        return addAlias;
    }

    public WebElement getFieldConfigName() {
        return fieldConfigName;
    }

    public WebElement getOriginalField() {
        return originalField;
    }

    public WebElement getFieldAlias() {
        return fieldAlias;
    }

    public WebElement getAddFieldAlias() {
        return super.getButton("添加字段别名");
    }

    public WebElement getFieldConfig() {
        return fieldConfig;
    }

    public WebElement getKVTag() {
        return KVTag;
    }

    public WebElement getChangeTag() {
        return this.getKVLi("变更标签");
    }

    public WebElement getDeleteKV() {
        return this.getKVLi("删除");
    }

    public WebElement getKVLi(String name) {
        String xpath = "//span[text()='" + name + "']//ancestor::li";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getEnsure() {
        return super.getButton("确定");
    }

    public WebElement getKVDropdownList() {
        return kvDropdownList;
    }

    public WebElement getKvDropdown() {
        return kvDropdown;
    }

    public WebElement getMessageContent() {
        return messageContent;
    }

    public WebElement getResourceType() {
        resourceType.click();
        return super.getLastDropdownList();
    }

    public WebElement getCreateKVStore() {
        return super.getButton("创建");
    }

    public WebElement getAddKVField() {
        return addKVField;
    }

    public WebElement getKVFieldInput() {
        return KVFieldInput;
    }

    public WebElement getKVName() {
        return KVName;
    }

    public WebElement getAddKVStore() {
        return addKVStore;
    }

    public WebElement getEvent() {
        return event;
    }

    public WebElement getSearchLoading() {
        return searchLoading;
    }

    public WebElement getSearchResourceInput() {
        return searchResourceInput;
    }

    public WebElement getAddResource() {
        return addResource;
    }

    public WebElement getUrlMessage() {
        return urlMessage;
    }

    public WebElement getNameMessage() {
        return nameMessage;
    }

    public WebElement getLoading() {
        return loading;
    }

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
        return addMenu;
    }

    public WebElement getSaveButton() {
        return saveButton;
    }

    public WebElement getImportButton() {
        return super.getContainsTextButton("导入");
    }

    public WebElement getExportButton() {
        return super.getButton("导出");
    }

    public WebElement getUrl() {
        return this.getElementById("NavEdit_url");
    }

    public WebElement getDefaultPage() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(dropdownArrow));
        ClickEvent.clickUnderneathButton(dropdownArrow);
        return super.getLastDropdownList();
    }

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

    public WebElement getCreateButton() {
        return super.getButton("保存");
    }

    public WebElement getNameInput() {
        return getInputElement("名称");
    }

    public WebElement getSaveMenuButton() {
        return super.getButton("确定");
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getErrorMessage() {
        return message;
    }

    public WebElement getUploadButton() {
        return uploadButton;
    }

    public WebElement getMenuName() {
        return this.getElementById("NavEdit_name");
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
        return this.getElementById("register_upload");
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
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/ancestor::div/following-sibling::div//input"));
    }

    public WebElement getElementById(String id) {
        return webDriver.findElement(By.id(id));
    }
}
