package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.w3c.dom.html.HTMLInputElement;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//label[text()='保存时间']/ancestor::div[1]/following-sibling::div[1]//span[@class='yotta-select-selection-icon']")
    private WebElement savedTimeDropDown;

    @FindBy(xpath = "//input[@yotta-test='indexsetting-index_sink-switch']/ancestor::span")
    private WebElement sinkswitch;
    public WebElement getSinkswitch() {
        return sinkswitch;
    }

    @FindBy(xpath = "//button[@yotta-test='step-next-button']")
    private WebElement Next;
    public WebElement getNext(){
        return Next;
    }

    @FindBy(xpath = "//button[@yotta-test='step-done-button']")
    private WebElement finish;
    public WebElement getFinish(){
        return finish;
    }


    public WebElement getDivideNumber() {
        return super.getYottaInput("indexsetting-number_of_shards-input");
    }


    public WebElement getDivideTimeDropDown() {
        return dropdownUtils.getDropdownListByLabel("切分时间");
    }

    public WebElement getSavedSizeButton() {
        return SavedSizeButton;
    }

    @FindBy(xpath = "//input[@yotta-test='indexsetting-quota-switch']/ancestor::span")
    private WebElement SavedSizeButton;

    @FindBy(xpath = "//input[@yotta-test='indexsetting-index_sink-switch']/ancestor::span")
    private WebElement IndexSink;

    public WebElement getAdvance() {
        return getIndexSwitchButton("正排优化");
    }

    @FindBy(xpath = "//input[@yotta-test='indexsetting-index_freeze-switch']/ancestor::span")
    public WebElement IndexFrezee;

    @FindBy(xpath = "//input[@yotta-test='indexsetting-copy_retention-switch']/ancestor::span")
    public WebElement copySaveButton;
    public WebElement getCopySaveButton(){
        return copySaveButton;
    }



    public WebElement getIndexFrezee() {
        return IndexFrezee;
    }

    public WebElement getIndexSink() {
        return IndexSink;
    }

    public WebElement getOpenDataConf() {
        return getIndexSwitchButton("启用字段配置");
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

    @FindBy(xpath = "//label[text()='名称']/ancestor::div/following-sibling::div[1]//input" )
    private WebElement Name;

    public WebElement getName() {
        return Name;
    }

    @FindBy(xpath = "//label[text()='描述']/ancestor::div/following-sibling::div[1]//textarea" )
    private WebElement Desc;

    public WebElement getDesc() {
        return Desc;
    }

    public WebElement getSavedTime() {
        return super.getYottaInput("indexsetting-expired_time-input");
    }

    public WebElement getDivideTime() {
        return super.getYottaInput("indexsetting-rotation_period-input");
    }

    public WebElement getColdTime() {
        return getInputElement("冷却时间");
    }

    public WebElement getSavedSize() {
        return super.getYottaInput("indexsetting-quota-input");
    }

    public WebElement getSavedCopy() { return getInputElementWithoutLabel("天后删除副本"); }

    @FindBy(xpath = "//input[@yotta-test='indexsetting-freeze-input']")
    public WebElement Freeze;

    public WebElement getFreeze() { return Freeze; }

    @FindBy(xpath ="//input[@yotta-test='indexsetting-sink_hdd-input']")
    private WebElement SinkHDD;

    public WebElement getSinkHDD() { return SinkHDD;}

    @FindBy(xpath = "//input[@yotta-test='indexsetting-sink_nas-input']")
    private WebElement SinkNAS;

    public WebElement getSinkNAS() {
        return SinkNAS;
    }

    public WebElement getCreateButton() {
        return getButton("新建");
    }

    @FindBy(xpath = "//div[text()='接下来您可以：']/preceding-sibling::div")
    private WebElement message;

    public WebElement getMessage() {
        return message;
    }

    @FindBy(xpath = "//div[@class='yotta-form-field-help-text']")
    private WebElement helpMessage;
    public WebElement getHelpMessage(){
            return helpMessage;
        }

    @FindBy(xpath = "//span[text()='压缩模式']/preceding-sibling::span")
    private WebElement CompactModel;
    public WebElement getCompactModel(){
            return CompactModel;
    }
    @FindBy(xpath = "//span[text()='数值模式']/preceding-sibling::span")
    private WebElement NumbertModel;
    public WebElement getNumbertModel(){
        return NumbertModel;
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

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//div[@class='yotta-select-menu'])[last()]"));
    }

    public WebElement getInputElementWithoutLabel(String name) {
        return webDriver.findElement(By.xpath("//div[text()='" + name + "']/../../input"));
    }

    public WebElement getIndexSwitchButton(String name){
        return webDriver.findElement(By.xpath("//label[contains(text(),'" +name+ "')]/parent::div/following-sibling::div//span[@class='yotta-switch-input']"));
    }
}
