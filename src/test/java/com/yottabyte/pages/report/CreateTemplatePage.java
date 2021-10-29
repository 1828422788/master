package com.yottabyte.pages.report;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;


public class CreateTemplatePage extends PageTemplate {

    public CreateTemplatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1200, 900));
    }

    public WebElement getNewTemplate() {
        return getButton("新建");
    }

    public WebElement getNext() {
        return getButton("下一步");
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement templateName;
    public WebElement getTemplateName() {
        return templateName;
    }

    @FindBy(xpath = "//div[contains(@class,'help')]")
    private WebElement tipText;
    public WebElement getTipText() {
        return tipText;
    }

    @FindBy(xpath = "//span[contains(@class,'upload-tip') and text()='上传中'] ")
    private WebElement uploadingProgress;
    public WebElement getUploadingProgress() {
        return uploadingProgress;
    }
}