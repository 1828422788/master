package com.yottabyte.pages.customcommand;

import com.yottabyte.pages.PageTemplate;
import org.apache.xpath.res.XPATHErrorResources;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1200, 900));
    }

    @FindBy(xpath = "//span[@class='yotta-filepicker-input']/input")
    private WebElement localUpload;

    @FindBy(xpath = "//span[text()='上传完成']")
    private WebElement verifyText;

    @FindBy(xpath = "//button[@class='yotta-button yotta-button-large yotta-button-primary css-naifsn']/span[text()='上传']")
    private WebElement confirmUpload;

    @FindBy(xpath = "//p[text()='创建成功']")
    private WebElement successMessage;

    public WebElement getSuccessMessage() { return successMessage; }

    public WebElement getLocalUpload() { return localUpload; }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getConfirmUpload() { return confirmUpload; }
    public WebElement getName() {
        return this.getYottaInput("customcommand-name-input");
    }

    public WebElement getScriptName() {
        return this.getYottaInput("customcommand-script_name-input");
    }

    public WebElement getUpload() { return this.getYottaButton( "customcommand-create-button"); }

    public WebElement getYottaButton(String name) {
        return webDriver.findElement(By.xpath("//button[@yotta-test='" + name + "']//ancestor::span[last()]"));
    }

    public WebElement getYottaInput(String name){
        return webDriver.findElement(By.xpath("//input[@yotta-test='" + name + "']"));
    }
}
