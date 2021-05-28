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

    public WebElement getDropdownList(String name) {
        String xpath = "//label[contains(text(),'" + name + "')]/parent::div/following-sibling::div//span[@class='yotta-select-selection-icon']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("(//div[@class='yotta-select-menu css-1hq8cx5'])[last()]"));
    }

    public WebElement getSinkswitch() {
        return sinkswitch;
    }

    @FindBy(xpath = "//input[@yotta-test='indexsetting-index_sink-switch']/ancestor::span")
    private WebElement sinkswitch;

    public WebElement getDivideTimeDropDown() {
        return getDropdownList("切分时间");
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
        return getDropdownList("冷却时间");
    }

    public WebElement getSavedSizeDropDown() {
        String xpath = "//div[@yotta-test='indexsetting-quota_unit-select']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("(//div[@class='yotta-select-menu css-1hq8cx5'])[last()]"));
    }

    public WebElement getSavedTimeDropDown() {
        return getDropdownList("保存时间");
    }

    public WebElement getIndexDataDropDown() {
        return getDropdownList("索引数据");
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

    @Override
    public WebElement getMessage() {
        return message;
    }

    @FindBy(xpath = "//p[@class='yotta-dialog-contenttext']")
    private WebElement message;

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
        return webDriver.findElement(By.xpath("//div[text()='" + name + "']/input"));
    }

    public WebElement getIndexSwitchButton(String name){
        return webDriver.findElement(By.xpath("//label[contains(text(),'" +name+ "')]/parent::div/following-sibling::div//span[@class='yotta-switch-input']"));
    }
}
