package com.yottabyte.pages.knowledge;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//i")
    private WebElement app;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement lastDropdown;

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(xpath = "//div[text()='附件: ']/ancestor::div[1]")
    private WebElement attachment;

    @FindBy(className = "ql-editor")
    private WebElement richEditor;

    @FindBy(xpath = "//div[@class='yotta-spinner-container']//p")
    private WebElement successAdd;

    @FindBy(className = "yotta-message-content")
    private WebElement errorMessage;

    @Override
    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getSuccessAdd() {
        return successAdd;
    }

    public WebElement getNext() {
        return super.getButton("下一步");
    }

    public WebElement getDone() {
        return super.getButton("完成");
    }

    public WebElement getDisableDone() {
        return webDriver.findElement(By.xpath("//button[contains(@class,'yotta-button-disabled')]"));
    }

    public WebElement getRichEditor() {
        return richEditor;
    }

    public WebElement getAttachment() {
        return attachment;
    }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getApp() {
        app.click();
        return lastDropdown;
    }

    public WebElement getEventCode() {
        return getInputElement("事件代码");
    }

    public WebElement getKnowledgeName() {
        return getInputElement("名称");
    }

    public WebElement getSave() {
        return getButton("保存");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/parent::div/following-sibling::div//div/input[contains(@class,'yotta-input yotta-input-large')]"));
    }

    public WebElement getResourceInput() {
        return this.getDropdownInput("资源标签");
    }

    public WebElement getDropdownInput(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div//div[@class='ant-select-selection__placeholder']"));
    }
}
