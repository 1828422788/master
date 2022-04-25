package com.yottabyte.pages.autoProps;

/**
 * @author L.N
 * @creat 2022-02-14-下午2:43
 */
import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;


public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[text()='字段别名']")
    private WebElement alias;

    @FindBy(xpath = "//div[text()='字段查找']")
    private WebElement lookup;

    @FindBy(xpath = "//div[text()='字段转换']")
    private WebElement transform;

    @FindBy(xpath = "//div[text()='字段萃取']")
    private WebElement extract;

    @FindBy(xpath = "//div[@class='yotta-form-field-help-text']")
    private WebElement warningInfo;

    @FindBy(xpath = "//td[text()='AutoAlias']/following-sibling::td[1]")
    private WebElement AliasMapping;

    @FindBy(xpath = "//td[text()='AutoAlias']/following-sibling::td[2]")
    private WebElement AliasGlobal;

    @FindBy(xpath = "//td[text()='NewLookup']/following-sibling::td[3]")
    private WebElement LookupGlobal;

    @FindBy(xpath = "//td[text()='AutoLookup']/following-sibling::td[2]")
    private WebElement LookupMapping;

    @FindBy(xpath = "//td[text()='AutoFind']/following-sibling::td[2]")
    private WebElement FindMapping;

    @FindBy(xpath = "//td[text()='NewLookup']/following-sibling::td[2]")
    private WebElement NewLookupMapping;

    @FindBy(xpath = "//div[@class='yotta-dialog-content']")
    private WebElement EnsureText;

    @FindBy(xpath = "//input[contains(@yotta-test,'public-switch')]/..")
    private WebElement GlobalShared;

    @FindBy(xpath = "//label[text()='创建多值字段']")
    private WebElement MultiValueText;

    @FindBy(xpath = "//label[text()='自动清理字段名称']")
    private WebElement ClearFieldText;

    @FindBy(xpath = "//label[text()='kv_mode']")
    private WebElement KVText;

    @FindBy(xpath = "//input[@value='AutoTest']/ancestor::div[@class='yotta-form-field']/following-sibling::div[2]/span")
    private WebElement AutoTestGlobal;

    @FindBy(xpath = "//input[@value='AutoExtract']/ancestor::div[@class='yotta-form-field']/following-sibling::div[2]/span")
    private WebElement AutoExtractGlobal;

    @FindBy(xpath = "(//input[@yotta-test='application-field_extract_eval_keys_name-input'])[1]")
    private WebElement EvalName;

    @FindBy(xpath = "(//input[@yotta-test='application-field_extract_eval_keys_name-input'])[3]")
    private WebElement EvalName2;

    @FindBy(xpath = "//input[@value='autoeval']/ancestor::div[@class='yotta-form-field']/following-sibling::div[3]/span")
    private WebElement AutoEvalGlobal;

    public WebElement getAlias(){
        return alias;
    }

    public WebElement getAliasName(){
        return super.getYottaInput("application-field_alias_name-input");
    }

    public WebElement getAliasMapping() {
        return AliasMapping;
    }

    public WebElement getOriginalField(){
        return super.getYottaInput("application-field_alias_mappings_original-input");
    }

    public WebElement getFieldAlias(){
        return super.getYottaInput("application-field_alias_mappings_alias-input");
    }

    public WebElement getWarningInfo(){
        return warningInfo;
    }

    public WebElement getEventOutPutField() {
        return super.getYottaInput("application-field_lookup_output_fields_event-input");
    }

    public WebElement getFindMapping() {
        return FindMapping;
    }

    public WebElement getGlobalShared(){
        return GlobalShared;
    }

    public WebElement getAddLookup(){
        return this.getButton("添加字段查找");
    }

    public WebElement getLookupName(){
        return super.getYottaInput("application-field_lookup_name-input");
    }

    public WebElement getCsvPath(){
        return super.getYottaInput("application-field_lookup_csv_path-input");
    }

    public WebElement getSearchInputField(){
        return super.getYottaInput("application-field_lookup_input_fields_input-input");
    }

    public WebElement getLookupGlobal() {
        return LookupGlobal;
    }

    public WebElement getEventInputField(){
        return super.getYottaInput("application-field_lookup_input_fields_event-input");
    }

    public WebElement getAliasGlobal() {
        return AliasGlobal;
    }

    public WebElement getMatchType(){
        return super.getYottaDiv("application-field_lookup_input_fields_match_type-select");
    }

    public WebElement getLookupMapping(){
        return LookupMapping;
    }

    public WebElement getNewLookupMapping() {
        return NewLookupMapping;
    }

    public WebElement getSavedButton(){
        return super.getContainsTextButton("确定");
    }

    public WebElement getAddAliasMap(){
        return super.getButton("添加别名映射");
    }

    public WebElement getAddOutputField(){
        return super.getYottaButton("application-field_lookup_output_fields_add-button");
   }

    public WebElement getAddInputField(){
        return super.getYottaButton("application-field_lookup_input_fields_add-button");
    }

    public WebElement getOutputField() {
        return super.getYottaInput("application-field_lookup_output_fields_output-input");
    }

    public WebElement getLookup(){
        return lookup;
    }

    public WebElement getTransform(){
        return transform;
    }

    public WebElement getExtract(){
        return extract;
    }

    public WebElement getAliasMappingDelete(){
        return this.getMappingDelete("CITY");
    }

    public WebElement getLookupInputMappingDelete(){
        return this.getMappingDelete("info2");
    }

    public WebElement getMappingDelete(String name){
        return webDriver.findElement(By.xpath("//input[@value='"+name+"']/ancestor::div[@class='yotta-form-field']/following-sibling::div//button[contains(@yotta-test,'delete-button')]"));
    }

    public WebElement getCaseSensitive(){
        return super.getYottaInput("application-field_lookup_case_sensitive-switch");
    }

    public WebElement getAppName(){
        return dropdownUtils.getDropdownListbyPath("//div[@class='yotta-modal-body']/form/div/div[2]");
    }

    public WebElement getEnsureDelete(){
        return super.getButton("确定");
    }

    public WebElement getEnsureText(){
        return EnsureText;
    }

    public WebElement getAddAlias(){
        return super.getButton("添加字段别名");
    }

    public WebElement getConvertRule(){
        return dropdownUtils.getDropdownListbyPath("//div[@yotta-test='application-field_transform_rule-select']//div[contains(@class,'yotta-select-selection-content')]");
    }

    public WebElement getTransformName(){ return super.getYottaInput("application-field_transform_name-input");}

    public WebElement getAddTransform(){
        return this.getButton("添加字段转换");
    }

    public WebElement getSourceField(){
        return super.getYottaInput("application-field_transform_delims_source_field-input");
    }

    public WebElement getSeparator(){
        return super.getYottaInput("application-field_transform_delims-input");
    }

    public WebElement getFieldList(){
        return super.getYottaInput("application-field_transform_fields-input");
    }

    public WebElement getAutoTransformRule(){
        return this.getTransformationRule("AutoTransform");
    }

    public WebElement getRegexSourceField(){
        return super.getYottaInput("application-field_transform_regex_source_field-input");
    }

    public WebElement getTransformFormat(){
        return super.getYottaInput("application-field_transform_format-input");
    }

    public WebElement getAutoTransformNumRule(){
        return this.getTransformationRule("AutoTransformNum");
    }

    public WebElement getAutoTransformQuRule(){
        return  this.getTransformationRule("AutoTransformQu");
    }

    public WebElement getAutoTransformInNumRule(){
        return  this.getTransformationRule("AutoTransformInNum");
    }

    public WebElement getAutoTransformInQuRule(){
        return  this.getTransformationRule("AutoTransformInQu");
    }

    public WebElement getAutoChangeRule(){
        return  this.getTransformationRule("AutoChange");
    }

    public WebElement getTransformationRule(String text){
        return webDriver.findElement(By.xpath("//td[text()='"+text+"']/following-sibling::td[1]"));
    }

    public WebElement getCanonicalParse(){
        return super.getYottaInput("application-field_transform_regex-input");
    }
    public WebElement getAutoTransformFieldSource(){
        return this.getTransformationSource("AutoTransform");
    }

    public WebElement getAutoTransformNumSource(){
        return this.getTransformationSource("AutoTransformNum");
    }

    public WebElement getAutoTransformQuSource(){
        return this.getTransformationSource("AutoTransformQu");
    }

    public WebElement getAutoTransformInNumSource(){
        return this.getTransformationSource("AutoTransformInNum");
    }

    public WebElement getAutoTransformInQuSource(){
        return this.getTransformationSource("AutoTransformInQu");
    }

    public WebElement getAutoChangeSource(){
        return this.getTransformationSource("AutoChange");
    }

    public WebElement getTransformationSource(String text){
        return webDriver.findElement(By.xpath("//td[text()='"+text+"']/following-sibling::td[2]"));
    }

    public WebElement getAddExtract_ts(){
        return super.getYottaButton("application-field_extract_report_array_add-button");
    }

    public WebElement getExtract_ts_name(){
        return super.getYottaInput("application-field_extract_report_array_name-input");
    }

    public WebElement getFieldConvertRule(){
        return dropdownUtils.getDropdownListbyPath("//div[@yotta-test='application-field_extract_report_array_transforms-select']//div[contains(@class,'yotta-select-selection-content')]");
    }

    public WebElement getAutoTransformInNum_ch(){
        return super.getButton("AutoTransformInNum");
    }

    public WebElement getAutoTransformInQu_ch(){
        return super.getButton("AutoTransformInQu");
    }

    public WebElement getAutoChange_ch(){
        return super.getButton("AutoChange");
    }

    public WebElement getAutoTransform_ch(){
        return super.getButton("AutoTransform");
    }

    public WebElement getMultiValueSwitch(){
        return super.getYottaCheckbox("application-field_transform_create_multivalued_fields-switch");
    }

    public WebElement getMultiValueText(){
        return MultiValueText;
    }

    public WebElement getClearFieldText() {
        return ClearFieldText;
    }

    public WebElement getClearFieldSwitch(){
        return super.getYottaCheckbox("application-field_transform_auto_clean_field_names-switch");
    }

    public WebElement getAutoTransformGlobalShared(){
        return super.getYottaCheckbox("application-field_extract_report_array_public-switch");
    }

    public WebElement getKVSwitch(){
        return super.getYottaCheckbox("application-field_extract_kv_mode-switch");
    }

    public WebElement getKVText() {
        return KVText;
    }

    public WebElement getKVMode(){
        return dropdownUtils.getDropdownListbyPath("//div[contains(@class,'yotta-select-selection yotta-select')]");
    }

    public WebElement getAutoTestDelete(){
        return super.getYottaButton("application-field_extract_report_array_delete-button");
    }

    public WebElement getAddExtract_regex(){
        return super.getYottaButton("application-field_extract_extract_array_add-button");
    }

    public WebElement getRegexName(){
        return super.getYottaInput("application-field_extract_extract_array_name-input");
    }

    public WebElement getRegexExpression(){
        return super.getYottaInput("application-field_extract_extract_array_regex-input");
    }

    public WebElement getAutoRegexDelete(){
        return super.getYottaButton("application-field_extract_extract_array_delete-button");
    }

    public WebElement getAutoExtractGlobalShared(){
        return super.getYottaCheckbox("application-field_extract_extract_array_public-switch");
    }

    public WebElement getAutoTestGlobal() {
        return AutoTestGlobal;
    }

    public WebElement getAutoExtractGlobal() {
        return AutoExtractGlobal;
    }

    public WebElement getAddExtract_eval(){
        return super.getYottaButton("application-field_extract_eval_keys_add-button");
    }

    public WebElement getEvalName(){
        return EvalName;
    }

    public WebElement getEvalField(){
        return super.getYottaInput("application-field_extract_eval_keys_name-input");
    }

    public WebElement getEvalValue(){
        return super.getYottaInput("application-field_extract_eval_keys_expression-input");
    }

    public WebElement getEvalName2() {
        return EvalName2;
    }

    public WebElement getAutoEvalDelete(){
        return super.getYottaButton("application-field_extract_eval_keys_delete-button");
    }

    public WebElement getAutoEvalGlobalShared(){
        return super.getYottaCheckbox("application-field_extract_eval_keys_public-switch");
    }

    public WebElement getAutoEvalGlobal(){
        return AutoEvalGlobal;
    }
}
