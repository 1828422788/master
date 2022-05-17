package com.yottabyte.pages.index;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    public WebElement getSinkswitch() {
        return super.getYottaCheckbox("indexsetting-index_sink-switch");
    }

    public WebElement getNext(){
        return super.getYottaButton("step-next-button");
    }

    public WebElement getFinish(){
        return super.getYottaButton("step-done-button");
    }

    public WebElement getDivideNumber() {
        return super.getYottaInput("indexsetting-number_of_shards-input");
    }

    public WebElement getDivideTimeDropDown() {
        return dropdownUtils.getDropdownListByLabel("切分时间");
    }

    public WebElement getSavedSizeButton() {
        return super.getYottaCheckbox("indexsetting-quota-switch");
    }

    public WebElement getCopySaveButton(){
        return super.getYottaInput("indexsetting-copy_retention-switch");
    }

    public WebElement getIndexFrezee() {
        return super.getYottaInput("indexsetting-index_freeze-switch");
    }

    public WebElement getColdTimeDropDown() {
        return dropdownUtils.getDropdownListByLabel("冷却时间");
    }

    public WebElement getSavedSizeDropDown() {
        String xpath = "//div[@yotta-test='indexsetting-quota_unit-select']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("//div[contains(@class,'yotta-select-menu')]"));
    }

    public WebElement getSavedTimeDropDown() {
        return dropdownUtils.getDropdownListByLabel("保存时间");
    }

    public WebElement getIndexDataDropDown() {
        return dropdownUtils.getDropdownListByLabel("索引数据");
    }

    public WebElement getSavedButton() {
        return super.getButton("保存");
    }

    public WebElement getName() {
        return super.getYottaInput("indexsetting-name-input");
    }

    public WebElement getDesc() {
        return super.getYottaTextarea("indexsetting-description-textarea");
    }

    public WebElement getSavedTime() {
        return super.getYottaInput("indexsetting-expired_time-input");
    }

    public WebElement getDivideTime() {
        return super.getYottaInput("indexsetting-rotation_period-input");
    }

    public WebElement getSavedSize() {
        return super.getYottaInput("indexsetting-quota-input");
    }

    public WebElement getSavedCopy() { return super.getYottaInput("indexsetting-discard_backup-input"); }

    public WebElement getFreeze() { return super.getYottaInput("indexsetting-freeze-input"); }

    public WebElement getSinkHDD() { return super.getYottaInput("indexsetting-sink_hdd-input");}

    public WebElement getSinkNAS() {
        return super.getYottaInput("indexsetting-sink_nas-input");
    }

    public WebElement getCreateButton() {
        return getButton("新建");
    }

    @FindBy(xpath = "//div[text()='接下来您可以：']/preceding-sibling::div")
    private WebElement message;

    public WebElement getMessage() {
        return message;
    }

    public WebElement getDialogMessage() {return super.getMessage();}

    public WebElement getCompactModel(){
            return super.getButtonsByText("压缩模式").get(0);
    }

    public WebElement getCustomModel(){
        return super.getButtonsByText("自定义模式").get(0);
    }

    public WebElement getNumbertModel(){
        return super.getButtonsByText("数值模式").get(0);
    }
    @FindBy(xpath = "//label[text()='高级配置']/../following-sibling::div//button")
    private WebElement AdvanceSetting;
    public WebElement getAdvanceSetting(){
        return AdvanceSetting;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return message;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/ancestor::div/following-sibling::div[1]//input[@class='yotta-input yotta-input-large']"));
    }

    public WebElement getReduceInnerFieldsSwitch(){
       return super.getYottaCheckbox("indexsetting-reduce_inner_fields-switch");
    }

    public WebElement getDataReduceSwitch(){
        return super.getYottaCheckbox("indexsetting-data_reduce-switch");
    }

    public WebElement getReduceAfterInput(){
        return super.getYottaInput("indexsetting-reduce_after-input");
    }

    public WebElement getAddAdvancedStrategy(){
        return super.getYottaButton("indexsetting-add_advanced_strategy-button");
    }

    @FindBy(xpath ="(//input[contains(@yotta-test,'indexsetting-strategy_fields_')])[last()]")
    private WebElement StrategyFieldsInput;
    public WebElement getStrategyFieldsInput(){
        return StrategyFieldsInput;
    }

    public WebElement getDataReduceMessage(){
        return getVerifyMessage("字段删减配置:");
    }

    public WebElement getReduceInnerFields(){
        return getVerifyMessage("丢弃部分内置字段:");
    }

    public WebElement getVerifyMessage(String name){
        return webDriver.findElement(By.xpath("//div[contains(text(),'"+name+"')]"));
    }

    public WebElement getSimpleStrategyList(){
        return dropdownUtils.getYottaDropdownList("indexsetting-simple_strategy-select");
    }

    public WebElement getAdvancedStrategyList(){
        return dropdownUtils.getDropdownListbyPath("(//div[contains(@yotta-test,'indexsetting-strategy_')])[last()]//span[@class='yotta-select-selection-icon']");
    }

}
