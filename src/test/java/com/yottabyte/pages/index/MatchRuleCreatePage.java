package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class MatchRuleCreatePage extends PageTemplate {
    public MatchRuleCreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='appname']/ancestor::button/preceding-sibling::div//input")
    private WebElement appName;

    @FindBy(xpath = "//span[text()='tag']/ancestor::button/preceding-sibling::div//input")
    private WebElement tag;

    @FindBy(xpath = "//span[text()='匹配规则']/ancestor::button/preceding-sibling::div//input")
    private WebElement rule;

    public WebElement getAppName() {
        return appName;
    }

    public WebElement getTag() {
        return tag;
    }

    public WebElement getRule() {
        return rule;
    }

    public WebElement getIndexName() {
        return super.getDropdownList("索引名");
    }

    public WebElement getDesc() {
        return super.getInputElement("描述");
    }

    public WebElement getCreateButton() {
        return super.getContainsTextButton("新建");
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getSavedButton() {
        return super.getContainsTextButton("保存");
    }

}
