package com.yottabyte.pages.configs;

import com.yottabyte.pages.DateEditorPage;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;


public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='保存']")
    private WebElement saveSearchLog;

    @FindBy(xpath = "//table[@yotta-test='config-eventlist-table']//tbody/tr/td[4]")
    private WebElement rawLog;

    @FindBy(className = "ReactCodeMirror")
    private WebElement searchInput;

    @FindBy(xpath = "//div[@class='yotta-date-time-picker']")
    private WebElement dateEditor;

    @FindBy(xpath = "//label[@class='yotta-date-time-picker-label' and text()='最近1小时']")
    private WebElement oneHour;

    @FindBy(xpath = "//table[@yotta-test='config-log_field-table']/thead/tr/th")
    private List<WebElement> fieldTitle;

    @FindBy(xpath = "//table[@yotta-test='config-log_field-table']/tbody/tr/td")
    private List<WebElement> fieldValue;

    @FindBy(xpath = "//table[@yotta-test='config-eventlist-table']/tbody/tr/td[1]")
    private WebElement status;

    @FindBy(xpath = "//table[@yotta-test='config-eventlist-table']//div[@class='yotta-table-placeholder']")
    private WebElement saveLogEmpty;

    @FindBy(xpath = "//div[@yotta-test='config-rule-list']/div")
    private List<WebElement> ruleList;

    @FindBy(xpath = "//span[contains(@class, 'yotta-modal-close-icon')]")
    private WebElement clearIcon;

    @FindBy(xpath = "//div[text()='新建成功' or text()='更新成功']")
    private WebElement configDone;

    @FindBy(className = "json-formatter-boolean")
    private List<WebElement> booleanList;

    @FindBy(className = "yw-extract-sample")
    private WebElement extractSample;

    @FindBy(id = "yw-extract-side-result")
    private WebElement result;

    @FindBy(xpath = "//span[text()='解析失败']")
    private WebElement failedMessage;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "//span[text()='解析成功']")
    private WebElement checkSuccess;

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(xpath = "(//span[text()='解析成功'])[2]")
    private WebElement checkSuccess2;

    @FindBy(xpath = "(//span[text()='解析成功'])[3]")
    private WebElement checkSuccess3;

    @FindBy(xpath = "(//span[text()='解析成功'])[4]")
    private WebElement checkSuccess4;

    @FindBy(xpath = "(//span[text()='解析失败])")
    private WebElement checkFailed;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement message;

    @FindBy(className = "ant-select-selection__clear")
    private WebElement deleteApp;

    @FindBy(xpath = "//div[@yotta-test='config-collapse-button']")
    private WebElement Collapse;

    @FindBy(xpath = "//div[@yotta-test='config-event_list-button']")
    private WebElement EventList;

    public WebElement getCollapse() {
        return Collapse;
    }

    public  WebElement getEventList() { return EventList; }

    public WebElement getCheckSuccess4() {
        return checkSuccess4;
    }

    public WebElement getCheckSuccess3() {
        return checkSuccess3;
    }

    public WebElement getCheckSuccess2() {
        return checkSuccess2;
    }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getCheckSuccess() {
        return checkSuccess;
    }

    public WebElement getFailedMessage() {
        return failedMessage;
    }

    public WebElement getErrorMessage() {
        return failedMessage;
    }

    public WebElement getExtractSample() { return extractSample; }

    public WebElement getConfigDone() {
        return configDone;
    }

    @Override
    public WebElement getDeleteApp() {
        return deleteApp;
    }

    public WebElement getApp() {
        return super.getDropdownList("应用");
    }

    public WebElement getGroup() {
        return super.getDropdownList("分组");
    }

    public WebElement getReturn() {
        return super.getYottaButtonByText("返回");
    }

    public WebElement getDone() {
        return super.getYottaButtonByText("完成");
    }

    public WebElement getTimeZone() {
        return super.getYottaDropdownList("config-timezone-select");
    }

    public WebElement getLanguage() {
        return super.getDropdownList("config-locale-select");
    }

    public WebElement getIntRadio() {
        return super.getYottaRadio("config-int-radio");
    }

    public WebElement getFloatRadio() { return super.getYottaRadio("config-float-radio"); }

    public WebElement getAddRule() {
        return super.getYottaButton("config-add-rule");
    }

    public WebElement getRuleName() { return super.getYottaDropdownList("config-custom_rule_type-select"); }

    public WebElement getRedirect() {
        return super.getYottaDropdownList("config-rule-select");
    }

    public WebElement getStruct() {
        return super.getYottaTextarea("config-struct_format-textarea");
    }

    public WebElement getPrefix() {
        return super.getYottaInput("config-prefix-input");
    }

    public WebElement getSuffix() {
        return super.getYottaInput("config-suffix-input");
    }

    public WebElement getChangeToJson() {
        return super.getYottaIcon("config-json_swap-icon");
    }

    public WebElement getCode() {
        return super.getYottaInput("config-codec-input");
    }

    public WebElement getDictionary() { return super.getYottaDropdownList("config-dict-select"); }

    public WebElement getBaseField() {
        return super.getYottaDropdownList("config-dict_basic_field-select");
    }

    public WebElement getExtendField() {
        return super.getYottaDropdownList("config-dict_extend_field-select");
    }

    public WebElement getMaxMatchLength() {
        return super.getYottaInput("config-max_match-input");
    }

    public WebElement getTimestampPrefix() {
        return super.getYottaInput("config-time_prefix-input");
    }

    public WebElement getAppName() {
        return super.getYottaInput("config-appname-input");
    }

    public WebElement getTag() {
        return super.getYottaInput("config-tag-input");
    }

    public WebElement getSwitchButton() {
        return super.getYottaInput("config-enable-switch");
    }

    public WebElement getNextButton() {
        return super.getYottaButtonByText("下一步");
    }

    public WebElement getKey() {
        return super.getYottaInput("config-field_name-input");
    }

    public WebElement getValue() {
        return super.getYottaInput("config-field_value-input");
    }

    public WebElement getAddField() {
        return super.getYottaButton("config-add_field-button");
    }

    public WebElement getName() {
        return super.getYottaInput("config-name-input");
    }

    public WebElement getLogtype() {
        return super.getYottaInput("config-logtype-input");
    }

    public WebElement getParseButton() {
        return super.getYottaButton("config-verify-button");
    }

    public WebElement getParseRule() {
        return super.getYottaDropdownList("config-rule_type-select");
    }

    public WebElement getSourceField() {
        return super.getYottaDropdownList("config-source-select");
    }

    public WebElement getFormatRule() {
        return super.getYottaInput("config-format_rule-input");
    }

    public WebElement getFieldSeparator() { return super.getYottaInput("config-field_split-input"); }

    public WebElement getKeyRegex() {
        return super.getYottaInput("config-key_reg-input");
    }

    public WebElement getValueRegex() {
        return super.getYottaInput("config-value_reg-input");
    }

    public WebElement getGroupRegex() {
        return super.getYottaInput("config-group_reg-input");
    }

    public WebElement getKVSeparator() { return super.getYottaInput("config-kv_split-input"); }

    public WebElement getKeepKey() {
        return super.getYottaInput("config-key_reserved-input");
    }

    public WebElement getDumpKey() {
        return super.getYottaInput("config-key_drop-input");
    }

    public WebElement getTimeFormat() {
        return super.getYottaInput("config-expression-input");
    }

    public WebElement getDecimal() {
        return super.getYottaDropdownList("config-radix-select");
    }

    public WebElement getSeparate() {
        return super.getYottaInput("config-expression-input");
    }

    public WebElement getFieldList() {
        return super.getYottaInput("config-names-input");
    }

    public WebElement getSourceFieldInput() {
        return super.getYottaInput("config-source-input");
    }

    public WebElement getTargetFieldInput() {
        return super.getYottaInput("config-target-input");
    }

    public WebElement getLogSample() {
        return super.getYottaTextarea("config-logsample-textarea");
    }

    public WebElement getLogSource() { return super.getYottaInput("config-log_source-input"); }

    public WebElement getLogHostname() { return super.getYottaInput("config-log_hostname-input"); }

    public WebElement getRegex() { return super.getYottaTextarea("config-expression-textarea"); }

    public WebElement getPathInput() {
        WebElement plusButton = super.getYottaButton("config-add_path-button");
        plusButton.click();
        return super.getYottaInput("config-path-input");
    }

    public WebElement getCheckbox() { return super.getYottaCheckbox("config-attach_root-checkbox"); }

    public WebElement getReplaceFirst() { return super.getYottaCheckbox("config-replace_first-checkbox"); }

    public WebElement getStrictMode() { return super.getYottaCheckbox("config-strict_mode-checkbox"); }

    public WebElement getStripField() { return super.getYottaCheckbox("config-strip_field-checkbox"); }

    public WebElement getReplaceContent() { return super.getYottaTextarea("config-replacement-textarea"); }

    public WebElement getEnsureAddParseRule() { return super.getYottaButtonByText("确定"); }

    public WebElement getRuleRemark() { return super.getYottaInput("config-another_name-input"); }

    public WebElement getMessage() { return message; }

    public WebElement getResult() { return result; }

    public WebElement getReadSavedLog() { return super.getYottaTab("读取已存日志"); }

    public WebElement getCreate() { return super.getYottaButton("config-create_log-button"); }

    public WebElement getEventListLogSample() { return super.getYottaTextarea("config-eventlist_logsample-textarea"); }

    public WebElement getEventListSource() { return super.getYottaInput("config-eventlist_log_source-input"); }

    @Override
    public WebElement getSave() { return super.getYottaButton("config-save_log-button"); }

    public WebElement getClearIcon() { return clearIcon; }

    public List<WebElement> getRuleList() { return ruleList; }

    public WebElement getAsLogSample() { return super.getYottaButton("config-as_logsample-button"); }

    public WebElement getUseCheckLog() { return super.getYottaButton("config-check_log-button"); }

    public WebElement getStatus() { return status; }

    public WebElement getField() { return super.getYottaButton("config-log_field-button"); }

    public WebElement getParseField() { return super.getYottaDropdownList("config-log_field-select"); }

    public List<WebElement> getFieldTitle() { return fieldTitle; }

    public List<WebElement> getFieldValue() { return fieldValue; }

    public WebElement getGoBack() { return super.getYottaButton("config-back_eventlist-button"); }

    public WebElement getDeleteLog() { return super.getYottaButton("config-delete-button"); }

    public WebElement getCancelDeleteLog() { return super.getYottaButton("config-cancel_delete-button"); }

    public WebElement getSaveLogEmpty() { return saveLogEmpty; }

    public WebElement getPopoverTip() { return super.getYottaPopover("config-delete-popover"); }

    @Override
    public WebElement getSearchInput() { return searchInput; }

    public WebElement getDateEditor() { return dateEditor; }

    public WebElement getRecentOneHour() {
        return oneHour;
//        return (new DateEditorPage(webDriver)).getOneHour();
    }

    public WebElement getSearchButton() { return super.getYottaButtonByText("搜索"); }

    public WebElement getRawLog() { return rawLog; }

    public WebElement getSaveSearchLog() { return super.getYottaButton("config-save_search_log-button"); }

    public WebElement getBoolean1() {
        return booleanList.get(0);
    }

    public WebElement getSuccessMessage() { return successMessage; }
}
