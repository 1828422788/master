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

   /* @FindBy(id = "register_name")
    private WebElement name;*/

   @FindBy(xpath = "//div/input[@name='name']")
    private WebElement name;

   // @FindBy(id = "register_url")
    @FindBy(xpath = "//div/textarea[@name='url']")
    private WebElement url;

   // @FindBy(id = "register_query")
   @FindBy(xpath = "//div/textarea[@name='query']")
    private WebElement spl;

    @FindBy(xpath = "//div/input[@name='apply']")
    private WebElement field;

   // @FindBy(id = "register_alias")
    @FindBy(xpath = "//input[@yotta-test='eventaction-alias-input']")
    private WebElement alias;

    @FindBy(xpath = "//input[@yotta-test='eventaction-apply_condition_field-input']")
    private WebElement conditionField;

    @FindBy(xpath = "//input[@yotta-test='eventaction-apply_condition_value-input']")
    private WebElement conditionValue;

    @FindBy(xpath = "//div[@yotta-test='eventaction-apply_condition_condition-select']/div")
    private WebElement selectCondition;

    @FindBy(xpath = "//div[text()='请输入链接']")
    private WebElement explain;

    public WebElement getMessage() { return getYottaDiv("dialog-content-dom"); }

    public WebElement getReturnList() { return getYottaButton("dialog-confirm-button");}

    public WebElement getExplain() { return explain; }

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
        return super.getButton("保存");
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
        return super.getButton("保存");
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
     //   String xpath = "//label[text()='" + name + "']/ancestor::div/following-sibling::div/div']";
        String xpath = "//label[text()='" + name + "']/ancestor::div[@class='yotta-col yotta-col-8 yotta-form-item-label yotta-form-item-label-required yotta-form-item-label-hasColon']/following-sibling::div//span";
        webDriver.findElement(By.xpath(xpath)).click();
        return super.getLastDropdownList();
    }
}
