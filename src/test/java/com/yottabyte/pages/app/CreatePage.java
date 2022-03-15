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

    @FindBy(xpath = "//div[@yotta-test='application-open_color_picker-dom']")
    private WebElement colorPicker;

    @FindBy(xpath = "//span[text()='#']/following-sibling::input")
    private WebElement colorValue;

    @FindBy(className = "el-color-dropdown__btn")
    private WebElement ensureColourButton;

    @FindBy(className = "el-message-box__wrapper")
    private WebElement fadeOut;

    @FindBy(className ="yotta-select-selection-content")
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

    @FindBy(xpath = "//span[text()='事件操作']/following-sibling::p/span[contains(@class, 'yotta-icon-AddCircle')]")
    private WebElement addSubmenu;

    @FindBy(xpath = "//span[text()='全局']")
    private WebElement overallSituation;

    @FindBy(className = "el-button--text")
    private WebElement sourceConfig;

    @FindBy(className = "el-loading-mask")
    private WebElement loading;

    @FindBy(xpath = "//div[@class='yotta-dialog-content']//p")
    private WebElement message;

    @FindBy(xpath = "//span[text()='添加一级菜单']")
    private WebElement addMenu;

    @FindBy(xpath = "//input[@yotta-test='application-nav_modal_name-input']/parent::div/following-sibling::div")
    private WebElement nameMessage;

    @FindBy(xpath = "//input[@yotta-test='application-nav_modal_name-input']")
    private WebElement menuName;

    @FindBy(xpath = "//input[@yotta-test='application-nav_modal_url-input']")
    private WebElement url;

    @FindBy(xpath = "//input[@yotta-test='application-nav_modal_url-input']/parent::div/following-sibling::div")
    private WebElement urlMessage;

    @FindBy(xpath = "//span[text()='已选择 0 个资源']")
    private WebElement addResource;

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement searchResourceInput;

    @FindBy(xpath = "//*[@class='ant-spin-container ant-spin-blur']")
    private WebElement searchLoading;

    @FindBy(xpath = "//span[text()='事件操作']")
    private WebElement event;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement addKVStore;

    @FindBy(xpath = "//input[@yotta-test='application-kvstore_modal_name-input']")
    private WebElement KVName;

    @FindBy(xpath = "//div[@class='d1ba667c0198c8a39f8bf7f9563eb67e'][1]//input")
    private WebElement KVFieldInput1;

    @FindBy(xpath = "//div[@class='d1ba667c0198c8a39f8bf7f9563eb67e'][2]//input")
    private WebElement KVFieldInput2;

    @FindBy(xpath = "//div[@class='d1ba667c0198c8a39f8bf7f9563eb67e'][3]//input")
    private WebElement KVFieldInput3;

    @FindBy(xpath = "//span[text()='添加字段']")
    private WebElement addKVField;

    @FindBy(xpath = "//*[@yotta-test='application-resource_modal_filter_type-select']/div")
    private WebElement resourceType;

    @FindBy(className = "yotta-message-content")
    private WebElement messageContent;

    @FindBy(xpath = "//span[@yotta-test='application-kvstore_operation-icon']")
    private WebElement kvDropdown;

    @FindBy(xpath = "//span/div[@yotta-test='application-kvstore_operation-dropdown']")
    private WebElement kvDropdownList;

    @FindBy(className = "yotta-select-selection-placeholder")
    private WebElement KVTag;

    @FindBy(className = "yotta-select-selection-search")
    private WebElement KVTagInput;

    @FindBy(xpath = "//div[text()='字段配置']")
    private WebElement fieldConfig;

    @FindBy(xpath = "//*[@yotta-test='application-field_transform_name-input']")
    private WebElement fieldConfigName;

    @FindBy(xpath = "//*[@yotta-test='application-field_alias_name-input']")
    private WebElement fieldAliasModalName;

    @FindBy(xpath = "(//input[@yotta-test='application-field_alias_mappings_original-input'])[last()]")
    private WebElement originalField;

    @FindBy(xpath = "(//input[@yotta-test='application-field_alias_mappings_alias-input'])[last()]")
    private WebElement fieldAlias;

    @FindBy(xpath = "//span[text()='添加别名映射']")
    private WebElement addAlias;

    @FindBy(xpath = "(//span[text()='删除'])[last()]")
    private WebElement deleteAlias;

    @FindBy(xpath = "//div[text()='字段查找']")
    private WebElement fieldSearch;

    @FindBy(xpath = "//div[text()='字段转换']")
    private WebElement fieldConvert;

    @FindBy(xpath = "//div[text()='字段萃取']")
    private WebElement fieldExtract;

   // @FindBy(id = "FieldConfig_name")
    @FindBy(xpath = "//input[@yotta-test='application-field_lookup_name-input']")
    private WebElement fieldSearchName;

  //  @FindBy(id = "FieldConfig_csvPath")
    @FindBy(xpath = "//input[@yotta-test='application-field_lookup_csv_path-input']")
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

    @FindBy(xpath = "(//*[@yotta-test='application-field_transform_regex-input'])[last()]")
    private WebElement fieldConfigRegex;

    @FindBy(xpath = "(//*[@yotta-test='application-field_transform_format-input'])[last()]")
    private WebElement fieldConfigFormat;

    @FindBy(xpath = "//*[@yotta-test='application-field_extract_report_array_add-button']")
    private WebElement addFieldConvertRule;

    @FindBy(className = "yotta-select-selection-placeholder")
    private WebElement fieldConvertRule;

    @FindBy(xpath = "//div[@yotta-test='application-field_transform_rule-select']")
    private WebElement convertRule;

    @FindBy(xpath = "//input[@yotta-test='application-field_transform_delims-input']")
    private WebElement fieldConfigDelims;

    @FindBy(xpath = "//input[@yotta-test='application-field_transform_fields-input']")
    private WebElement fieldConfigFields;

    @FindBy(xpath = "//div[@class='yotta-col yotta-col-18 yotta-form-item-content']/button[@yotta-test='application-save-button']")
    private WebElement saveButton;

    @FindBy(xpath = "//button[@yotta-test='application-field_extract_save-button']")
    private WebElement saveFieldButton;

    @FindBy(className = "ant-form-explain")
    private WebElement warningInfo;

    @FindBy(xpath = "//span[text()='来源字段']/parent::span/following-sibling::input")
    private WebElement fieldSource;

    @FindBy(xpath = "//div[@class='yotta-modal-footer yotta-modal-footer-with-divider']//span[text()='保存']")
    private WebElement fieldSavedButton;

    @FindBy(xpath = "//p[@class='yotta-dialog-contenttext']")
    private WebElement updatemessage;

    @FindBy(xpath = "//td[text()='AutoAlias']/following-sibling::td[2]")
    private WebElement AliasGlobal;

    @FindBy(xpath = "//td[text()='NewLookup']/following-sibling::td[3]")
    private WebElement LookupGlobal;

    @FindBy(xpath = "//input[@value='AutoTest']/ancestor::div[@class='yotta-form-field']/following-sibling::div[2]/span")
    private WebElement AutoTestGlobal;

    @FindBy(xpath = "//input[@value='AutoExtract']/ancestor::div[@class='yotta-form-field']/following-sibling::div[2]/span")
    private WebElement AutoExtractGlobal;

    @FindBy(xpath = "//input[@value='autoeval']/ancestor::div[@class='yotta-form-field']/following-sibling::div[3]/span")
    private WebElement AutoEvalGlobal;

    public WebElement getUpdatemessage() { return updatemessage; }

    public WebElement getFieldSavedButton() { return fieldSavedButton; }

    public WebElement getKVTagInput() { return KVTagInput; }

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

    public WebElement getFieldSource() {
        return fieldSource;
    }

    public WebElement getConvertRule() {
        convertRule.click();
        return super.getLastDropdownList();
    }

    public WebElement getFieldConvertRule() {
        fieldConvertRule.click();
        return super.getLastDropdownList();
    }

    public WebElement getLookupGlobal() {
        return LookupGlobal;
    }

    public WebElement getLastNameInput() {
        return  getYottaInput("application-field_extract_report_array_name-input");
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
        kvDropdownList.click();
        return dropdownUtils.getMenuList();
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

    public WebElement getKVFieldInput1() {
        return KVFieldInput1;
    }

    public WebElement getKVFieldInput2() {
        return KVFieldInput2;
    }

    public WebElement getKVFieldInput3() {
        return KVFieldInput3;
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

    public WebElement  getSaveFieldButton() { return saveFieldButton; }

    public WebElement getImportButton() {
        return super.getContainsTextButton("导入");
    }

    public WebElement getExportButton() {
        return super.getButton("导出");
    }

    public WebElement getUrl() {
        return url;
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

    public WebElement getMessage() { return message; }

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

    public WebElement getAliasGlobal() {
        return AliasGlobal;
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

    @FindBy(xpath = "//input[@yotta-test='application-logo-file_upload']")
    private WebElement logoInput;

    public WebElement getLogoInput() {
        return logoInput;
    }

    @FindBy(xpath = "//span[@class='yotta-file-upload-error']")
    private WebElement logoMessage;

    public WebElement getLogoMessage() {
        return logoMessage;
    }

    public WebElement getAutoTestGlobal(){
        return AutoTestGlobal;
    }

    public WebElement getAutoExtractGlobal() {
        return AutoExtractGlobal;
    }

    public WebElement getAutoEvalGlobal() {
        return AutoEvalGlobal;
    }
}
