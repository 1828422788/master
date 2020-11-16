package com.yottabyte.pages.event;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(id = "register_name")
    private WebElement name;

    @FindBy(id = "register_url")
    private WebElement url;

    @FindBy(id = "register_query")
    private WebElement spl;

    @FindBy(id = "register_apply")
    private WebElement field;

    @FindBy(id = "register_alias")
    private WebElement alias;

    @FindBy(id = "register_conditionField")
    private WebElement conditionField;

    @FindBy(id = "register_conditionValue")
    private WebElement conditionValue;

    @FindBy(className = "ant-select-selection__rendered")
    private WebElement selectCondition;

    public WebElement getSelectCondition() {
        selectCondition.click();
        return super.getLastDropdownList();
    }

    public WebElement getConditionField() {
        return conditionField;
    }

    public WebElement getConditionValue() {
        return conditionValue;
    }

    public WebElement getSave() {
        return super.getButton("保 存");
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getAlias() {
        return alias;
    }

    public WebElement getField() {
        return field;
    }

    public WebElement getDisplay() {
        return getDropdownList("显示于");
    }

    public WebElement getAction() {
        return getDropdownList("动作类型");
    }

    public WebElement getOpenUrl() {
        return getDropdownList("打开链接于");
    }

    public WebElement getEnsureButton() {
        return getContainsTextButton("确定");
    }

    public WebElement getDisplayMethod() {
        return getDropdownList("展示方式");
    }

    public WebElement getCreateButton() {
        return super.getButton("保 存");
    }

    public WebElement getUrl() {
        return url;
    }

    public WebElement getSpl() {
        return spl;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div/input"));
    }

    public WebElement getDropdownList(String name) {
        String xpath = "//label[text()='" + name + "']/ancestor::div/following-sibling::div";
        webDriver.findElement(By.xpath(xpath)).click();
        return super.getLastDropdownList();
    }
}
