package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
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
        return getDropdownList("索引名");
    }

    public WebElement getTopicName() {
        return getDropdownList("Topic名");
    }

    public WebElement getDesc() {
        return getInputElement("描述");
    }

    public WebElement getCreateButton() {
        return getContainsTextButton("新建");
    }

    public WebElement getSuccessMessage() {
        return getErrorMessage();
    }

    public WebElement getSavedButton() {
        return getContainsTextButton("保存");
    }

    public WebElement getDropdownList(String name) {
        WebElement icon = webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div"));
        icon.click();
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div//input"));
    }
}
