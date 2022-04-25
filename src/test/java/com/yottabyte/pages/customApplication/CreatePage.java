package com.yottabyte.pages.customApplication;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.GetTime;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @Override
    public WebElement getInputElement(String text) {
        String xpath = "(//label[text()='" + text + "'])[last()]/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    @Override
    public WebElement getContainsTextButton(String text) {
        String xpath = "(//span[contains(text(),'" + text + "')])[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

    @FindBy(className = "el-switch__label--right")
    private WebElement autoSearch;

    @FindBy(xpath = "(//div[@class='el-date-editor yw-system-table-time-picker el-input el-date-editor--datetimerange'])[last()]")
    private WebElement dateEditor;

    @FindBy(xpath = "(//input[@placeholder='步骤id'])[last()]")
    private WebElement stepId;

    @FindBy(className = "el-message__group")
    private WebElement message;

    @FindBy(className = "s-f-one-key")
    private List<WebElement> key;

    public List<WebElement> getKey() {
        return key;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getStepId() {
        return stepId;
    }

    public WebElement getParam() {
        return getInputElement("的参数");
    }

    public WebElement getPassParam() {
        return getInputElement("的值传递给");
    }

    public WebElement getRecentTwoDays() {
        return GetTime.getTime(webDriver, "RecentTwoDays");
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getAutoSearch() {
        return autoSearch;
    }

    public WebElement getName() {
        return getInputElement("名称");
    }

    public WebElement getDescribe() {
        return getInputElement("描述");
    }

    public WebElement getStepName() {
        return getInputElement("步骤名称");
    }

    public WebElement getKeyword() {
        return getInputElement("关键字");
    }

    public WebElement getFilter() {
        return getInputElement("过滤字段");
    }

    public WebElement getFieldName() {
        return getInputElement("字段名");
    }

    public WebElement getAlias() {
        return getInputElement("别名");
    }

    public WebElement getAddDisplayField() {
        return getContainsTextButton("添加展示字段");
    }

    public WebElement getAddReceiveField() {
        return getContainsTextButton("添加接收字段");
    }

    public WebElement getAddCollectField() {
        return getContainsTextButton("添加汇总字段");
    }

    public WebElement getField() {
        return getInputElement("字段");
    }

    public WebElement getCollectField() {
        return getInputElement("作为汇总字段");
    }

    public WebElement getAddStep() {
        return super.getButton("添加步骤");
    }

    public WebElement getSave() {
        return super.getButton("保存");
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSearch() {
        return super.getButton("开始搜索");
    }
}
