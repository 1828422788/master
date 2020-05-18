package com.yottabyte.pages.SIEM;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxc
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath =  "//li[text()='快速新增']")
    private WebElement Quickadd;

    public WebElement getCompleteadd() {
        return Completeadd;
    }

    @FindBy(xpath =  "//li[text()='完全创建']")
    private WebElement Completeadd;

    public WebElement getQuickadd() {
        return Quickadd;
    }

    public WebElement getAddAsset() {

        return AddAsset;
    }

    @FindBy(xpath =  "//span[text()='新增资产']/ancestor::button")
    private WebElement AddAsset;

    public WebElement getAssetName() {
        return AssetName;
    }

    @FindBy(xpath = "//label[contains(text(),'资产名称')]/following-sibling::div//input" )
    private WebElement AssetName;

    public WebElement getIpName() {
        return IpName;
    }

    @FindBy(xpath = "//label[contains(text(),'IP地址')]/following-sibling::div//input")
    private WebElement IpName;

    @FindBy(xpath = "//span[text()='资产类型']/following-sibling::div//div[@class='el-input']/input")
    private WebElement AssetKindValue;

    public WebElement getAssetKindValue() {
        return AssetKindValue;
    }

    public WebElement getSave() {
        return Save;
    }

    @FindBy(xpath = "(//span[contains(text(),'保存')][not(@class)]/ancestor::button)[1]")
    private WebElement Save;

    public WebElement getMessage() {
        return Message;
    }

    @FindBy(xpath = "//div[@class='el-notification']")
    private WebElement Message;

    public WebElement getAssetNameComplete(){
        return getInputElement("资产名称");
    }

    public WebElement getIpComplete(){
        return getInputElement("IP地址");
    }

    public WebElement getAppname(){
        return getInputAppElement(1);
    }

    public WebElement getVersion(){
        return getInputAppElement(2);
    }

    public WebElement getPort(){
        return getInputAppElement(3);
    }

    public WebElement getProtocol(){
        return getInputAppElement(4);
    }

    public WebElement getFailureMessage() {
        return FailureMessage;
    }

    public WebElement getAssetKind(){
        return getDropDownListElement("资产类型");
    }

    @FindBy(xpath ="//div[@class='el-message-box__message']/p" )
    private WebElement FailureMessage;

    @FindBy(xpath = "//div[@class='el-notification__content']" )
    private WebElement CompletaMessage;

    public WebElement getCompletaMessage() {
        return CompletaMessage;
    }

    public WebElement getInputElement(String text) {
        return webDriver.findElement(By.xpath("//span[text()='" + text + "']/following-sibling::div//input"));
    }

    public WebElement getInputAppElement(int num) {
        return webDriver.findElement(By.xpath("(//span[text()='应用']/following-sibling::div//input)[" + num + "]"));
    }
    public WebElement getDropDownListElement(String name) {
        DropdownUtils dropdownUtils = new DropdownUtils();
        WebElement element = webDriver.findElement(By.xpath("//span[text()='" + name + "']/following-sibling::div//div[@class='el-input']/i"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getLastDropdownList();
    }
}
