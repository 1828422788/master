package com.yottabyte.pages.customcommand;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.gl.E;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[@yotta-test='customcommand-script-select']//span[text()='请选择程序名称']")
    private WebElement processName;

    @FindBy(xpath =  "//div[@yotta-test='customcommand-command_type-select']//span[text()='请选择指令类型']")
    private WebElement commandType;

    public WebElement getResourceTagInput() {
        String xpath = "//label[contains(text(),'资源标签')]/parent::div/following-sibling::div/";
        WebElement webElement = webDriver.findElement(By.xpath(xpath));
        return webElement;
    }

    public WebElement getResourceTagList(){
        String xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div[@class='yotta-select-selection']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }

    public WebElement getProgramparam() {
        String xpath = "//input[@yotta-test='customcommand-arguments-input']";
        WebElement webElement = webDriver.findElement(By.xpath(xpath));
        return webElement;
    }

    public WebElement getCmdChunked() {
        String xpath = "//input[@yotta-test='customcommand-chunked-switch']";
        WebElement webElement = webDriver.findElement(By.xpath(xpath));
        return webElement;
    }

    public WebElement getMaxinputs() {
        String xpath = "//input[@yotta-test='customcommand-maxinputs-input']";
        WebElement webElement = webDriver.findElement(By.xpath(xpath));
        return webElement;
    }

    @FindBy(xpath = "//span[text()='应用']")
    private WebElement apply;

    @FindBy(xpath = "//div[@yotta-test='dialog-content-dom']/p")
    private WebElement successMessage;

    public WebElement getSuccessMessage() { return successMessage; }

    public WebElement getApply() { return apply; }

    public WebElement getProcessName() {
        processName.click();
        return super.getLastDropdownList();
    }

    public WebElement getCommandType() {
        commandType.click();
        return super.getLastDropdownList();
    }

    public WebElement getCreate() {
        return this.getYottaButton("customcommand-create-button");
    }

    public WebElement getProcessManger() {
        return this.getYottaButton( "customcommand-program-button");
    }

    public WebElement getCommandName() {
        return this.getYottaInput("customcommand-name-input");
    }

    public WebElement getSave() {
        return this.getButton("yotta-button yotta-button-large yotta-button-primary css-8gkgwl");
    }

    public WebElement getConfirm() {
        return this.getYottaButton("dialog-confirm-button");
    }

    public WebElement getEnsure() { return this.getYottaButton("role_authorization-confirm-button"); }

    public WebElement getYottaButton(String name) {
        return webDriver.findElement(By.xpath("//button[@yotta-test='" + name + "']//ancestor::span[last()]"));
    }

    public WebElement getYottaInput(String name){
        return webDriver.findElement(By.xpath("//input[@yotta-test='" + name + "']"));
    }

    public WebElement getButton(String name){
        return webDriver.findElement(By.xpath("//button[@class='" + name + "']/span"));
    }

}
