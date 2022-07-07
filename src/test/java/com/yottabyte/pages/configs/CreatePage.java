package com.yottabyte.pages.configs;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;


public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//span[text()='保存']")
    private WebElement saveSearchLog;

    @FindBy(xpath = "//table[@yotta-test='config-eventlist-table']//tbody/tr/td[4]")
    private WebElement rawLog;

    @FindBy(className = "ReactCodeMirror")
    private WebElement searchInput;

    @FindBy(xpath = "//table[@yotta-test='config-eventlist-table']/thead/tr/th")
    private List<WebElement> fieldTitle;

    @FindBy(xpath = "//table[@yotta-test='config-log_field-table']/tbody/tr/td")
    private List<WebElement> fieldValue;

    @FindBy(xpath = "//table[@yotta-test='config-eventlist-table']/tbody/tr/td[1]")
    private WebElement status;

    @FindBy(xpath = "//table[@yotta-test='config-eventlist-table']//div[@class='yotta-table-placeholder']")
    private WebElement saveLogEmpty;

    @FindBy(xpath = "//div[@yotta-test='config-rule-list']/div")
    private List<WebElement> ruleList;

    @FindBy(id = "yw-extract-side-result")
    private WebElement result;

    @FindBy(xpath = "//span[text()='解析失败']")
    private WebElement failedMessage;

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

    @FindBy(className = "yotta-select-selection-icon")
    private WebElement deleteAppicon;

    @FindBy(xpath = "//span[@aria-label='CloseCircle']")
    private WebElement deleteApp;

    @FindBy(xpath = "//span[@aria-label='Shrink']")
    private WebElement Collapse;

    public WebElement getCollapse() {
        return Collapse;
    }

    public WebElement getEventList() {
        return getYottaButton("config-event_list-button");
    }

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

    public WebElement getDeleteApp() {
        return deleteApp;
    }

    public WebElement getDeleteAppicon() {
        return deleteAppicon;
    }

    public WebElement getReturn() {
        return super.getYottaButtonByText("返回");
    }

    public WebElement getDone() {
        return super.getYottaButtonByText("完成");
    }

    public WebElement getTimeZone() {
        return dropdownUtils.getYottaDropdownList("config-timezone-select");
    }

    public WebElement getLanguage() {
        return dropdownUtils.getYottaDropdownList("config-locale-select");
    }

    public WebElement getIntRadio() {
        return super.getYottaRadio("config-int-radio");
    }

    public WebElement getFloatRadio() {
        return super.getYottaRadio("config-float-radio");
    }

    public WebElement getAddRule() {
        return super.getYottaButton("config-add-rule");
    }

    public WebElement getRuleName() {
        return dropdownUtils.getYottaDropdownList("config-custom_rule_type-select");
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
        return super.getYottaSpan("config-json_swap-icon");
    }

    public WebElement getCode() {
        return super.getYottaInput("config-codec-input");
    }

    public WebElement getDictionary() {
        return dropdownUtils.getYottaDropdownList("config-dict-select");
    }

    public WebElement getBaseField() {
        return dropdownUtils.getYottaDropdownList("config-dict_basic_field-select");
    }

    public WebElement getExtendField() {
        return dropdownUtils.getYottaDropdownList("config-dict_extend_field-select");
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
        return dropdownUtils.getYottaDropdownList("config-rule_type-select");
    }

    public WebElement getSourceField() {
        return dropdownUtils.getYottaDropdownList("config-source-select");
    }

    public WebElement getFormatRule() {
        return super.getYottaInput("config-format_rule-input");
    }

    public WebElement getFieldSeparator() {
        return super.getYottaInput("config-field_split-input");
    }

    public WebElement getKeyRegex() {
        return super.getYottaInput("config-key_reg-input");
    }

    public WebElement getValueRegex() {
        return super.getYottaInput("config-value_reg-input");
    }

    public WebElement getGroupRegex() {
        return super.getYottaInput("config-group_reg-input");
    }

    public WebElement getKVSeparator() {
        return super.getYottaInput("config-kv_split-input");
    }

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
        return dropdownUtils.getYottaDropdownList("config-radix-select");
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

    public WebElement getLogSource() {
        return super.getYottaInput("config-log_source-input");
    }

    public WebElement getLogHostname() {
        return super.getYottaInput("config-log_hostname-input");
    }

    public WebElement getAppname() {
        return super.getYottaInput("config-log_appname-input");
    }

    public WebElement getRegex() {
        return super.getYottaTextarea("config-expression-textarea");
    }

    public WebElement getPathInput() {
        super.getYottaButton("config-add_path-button").click();
        return super.getYottaInput("config-path-input");
    }

    public WebElement getCheckbox() {
        return super.getYottaCheckbox("config-attach_root-checkbox");
    }

    public WebElement getReplaceFirst() {
        return super.getYottaCheckbox("config-replace_first-checkbox");
    }

    public WebElement getStrictMode() {
        return super.getYottaCheckbox("config-strict_mode-checkbox");
    }

    public WebElement getStripField() {
        return super.getYottaCheckbox("config-strip_field-checkbox");
    }

    public WebElement getReplaceContent() {
        return super.getYottaTextarea("config-replacement-textarea");
    }

    public WebElement getEnsureAddParseRule() {
        return super.getYottaButtonByText("确定");
    }

    public WebElement getRuleRemark() {
        return super.getYottaInput("config-another_name-input");
    }

    public WebElement getResult() {
        return result;
    }

    public WebElement getReadSavedLog() {
        return super.getYottaTab("读取已存日志");
    }

    public WebElement getCreate() {
        return super.getYottaButton("config-create_log-button");
    }

    public WebElement getEventListLogSample() {
        return super.getYottaTextarea("config-eventlist_logsample-textarea");
    }

    public WebElement getEventListSource() {
        return super.getYottaInput("config-eventlist_log_source-input");
    }

    @Override
    public WebElement getSave() {
        return super.getYottaButton("config-save_log-button");
    }

    public List<WebElement> getRuleList() {
        return ruleList;
    }

    public WebElement getAsLogSample() {
        return super.getYottaButton("config-as_logsample-button");
    }

    public WebElement getUseCheckLog() {
        return super.getButtonByText("使用当前日志验证");
    }

    public WebElement getStatus() {
        return status;
    }

    public WebElement getField() {
        return super.getButtonByText("查看字段结果");
    }

    public WebElement getParseField() {
        return dropdownUtils.getYottaDropdownList("config-log_field-select");
    }

    public List<WebElement> getFieldTitle() {
        return fieldTitle;
    }

    public List<WebElement> getFieldValue() {
        return fieldValue;
    }

    public WebElement getGoBack() {
        return super.getYottaButton("config-back_eventlist-button");
    }

    public WebElement getDeleteLog() {
        return super.getYottaButton("config-delete-button");
    }

    public WebElement getCancelDeleteLog() {
        return super.getYottaButton("config-cancel_delete-button");
    }

    public WebElement getSaveLogEmpty() {
        return saveLogEmpty;
    }

    public WebElement getPopoverTip() {
        return super.getYottaDiv("config-delete-popover");
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getSearchButton() {
        String xpath = "//span[text()='搜索']/parent::button[@yotta-test='search_bar-submit-button']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    public WebElement getRawLog() {
        return rawLog;
    }

    public WebElement getSaveSearchLog() {
        return super.getYottaButton("config-save_search_log-button");
    }

    public WebElement getAnotherName() {
        return getYottaInput("config-another_name-input");
    }

    public WebElement getRedirectList(){
        return dropdownUtils.getYottaDropdownList("config-rule-select");
    }

}
