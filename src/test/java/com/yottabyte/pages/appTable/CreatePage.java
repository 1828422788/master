package com.yottabyte.pages.appTable;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.GetTime;
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

    @Override
    public WebElement getInputElement(String text) {
        String xpath = "(//label[contains(text(),'" + text + "')])[last()]/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    @FindBy(xpath = "//label[contains(text(),'时间范围')]/following-sibling::div")
    private WebElement dateEditor;

    @FindBy(xpath = "//span[text()='+ 添加动态字段']")
    private WebElement addDynamicField;

    @FindBy(xpath = "//span[text()='+ 添加展示字段']")
    private WebElement addDisplayField;

    @FindBy(xpath = "//span[text()='+ 添加关联字段']")
    private WebElement addRelatedField;

    @FindBy(xpath = "//label[contains(text(),'关联字段')]/following-sibling::div//input")
    private WebElement relatedField;

    @FindBy(xpath = "//span[text()='使用下拉框']")
    private WebElement dropdown;

    public WebElement getFieldName() {
        return getInputElement("字段名");
    }

    public WebElement getAlias() {
        return getInputElement("别名");
    }

    public WebElement getWidth() {
        return getInputElement("列宽");
    }

    public WebElement getLocation() {
        return getInputElement("位置");
    }

    public WebElement getAddDynamicField() {
        return addDynamicField;
    }

    public WebElement getAddDisplayField() {
        return addDisplayField;
    }

    public WebElement getDisplayName() {
        return getInputElement("展示名");
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getToday() {
        return GetTime.getTime(webDriver, "Today");
    }

    public WebElement getName() {
        return getInputElement("名称");
    }

    public WebElement getDescribe() {
        return getInputElement("描述");
    }

    public WebElement getKeyword() {
        return getInputElement("关键字");
    }

    public WebElement getSave() {
        return super.getButton("保存");
    }

    public WebElement getAddRelatedField() {
        return addRelatedField;
    }

    public WebElement getRelatedField() {
        return relatedField;
    }

    public WebElement getDropdown() {
        return dropdown;
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }
}
