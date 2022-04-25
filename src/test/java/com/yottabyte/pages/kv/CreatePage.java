package com.yottabyte.pages.kv;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends EditorPage {

    @FindBy(xpath = "//label[text()='名称']/following-sibling::input")
    private WebElement name;
    @FindBy(xpath = "//label[text()='字段列表']/following-sibling::div//input")
    private WebElement fieldList;
    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//div[@class='ant-select-selection__rendered']")
    private WebElement app;

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    public WebElement getApp() {
        app.click();
        return super.getLastDropdownList();
    }

    public WebElement getFieldList() {
        return fieldList;
    }

    public WebElement getName() {
        return name;
    }
}
