package com.yottabyte.pages.event;

import com.yottabyte.pages.PageTemplate;
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

    @FindBy(xpath = "//label[contains(text(),'链接')]/following-sibling::div//textarea")
    private WebElement url;

    @FindBy(xpath = "//label[contains(text(),'搜索语句')]/following-sibling::div//textarea")
    private WebElement spl;

    @FindBy(className = "btn-submit")
    private WebElement createButton;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    public WebElement getName() {
        return super.getInputElement("名称");
    }

    public WebElement getAlias() {
        return super.getInputElement("别名");
    }

    public WebElement getField() {
        return super.getInputElement("应用字段");
    }

    public WebElement getDisplay() {
        return super.getDropdownList("显示于");
    }

    public WebElement getAction() {
        return super.getDropdownList("动作类型");
    }

    public WebElement getOpenUrl() {
        return super.getDropdownList("打开链接于");
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSaveButton() {
        return super.getContainsTextButton("保存");
    }

    public WebElement getDisplayMethod() {
        return super.getDropdownList("展示方式");
    }

    public WebElement getCreateButton() {
        return createButton;
    }

    public WebElement getUrl() {
        return url;
    }

    public WebElement getSpl() {
        return spl;
    }

    public WebElement getSuccessMessage() {
        return message;
    }
}
