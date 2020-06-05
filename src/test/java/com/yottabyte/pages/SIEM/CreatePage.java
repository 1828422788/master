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

    @FindBy(xpath =  "//span[text()='新增资产']")
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

    public WebElement getOsKindValue() {
        return OsKindValue;
    }

    @FindBy(xpath = "//span[text()='系统类型']/following-sibling::div//div[@class='el-input']/input")
    private WebElement OsKindValue;


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

    @FindBy(xpath = "//div[@class='el-notification__content']")
    private WebElement Message;

    @FindBy(xpath = "(//span[text()='AutotestCompleteadd2']/ancestor::td/following-sibling::td)[5]/div")
    private WebElement IsImportantAssest;

    @FindBy(xpath = "//div[contains(text(),'添加应用')]")
    private WebElement AddApp;

    public WebElement getAddApp() {
        return AddApp;
    }

    public WebElement getIsImportantAssest() {
        return IsImportantAssest;
    }

    public WebElement getAssetNameComplete(){
        return getInputElement("资产名称");
    }

    public WebElement getAssetDescription(){
        return getInputElement("描述");
    }

    public WebElement getAssetMacAddress(){
        return getInputElement("MAC地址");
    }

    public WebElement getAssetOwner(){
        return getInputElement("责任人");
    }

    public WebElement getAssetZone(){
        return getInputElement("资产区域");
    }

    public WebElement getIpComplete(){
        return getInputElement("IP地址");
    }

    public WebElement getAppname2(){
        return getInputAppElement(5);
    }

    public WebElement getVersion2(){
        return getInputAppElement(6);
    }

    public WebElement getPort2(){
        return getInputAppElement(7);
    }

    public WebElement getProtocol2(){
        return getInputAppElement(8);
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

    public WebElement getOsKind(){
        return getDropDownListElement("系统类型");
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
