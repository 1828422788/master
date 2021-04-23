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

    @FindBy(xpath = "//span[text()='appname']/preceding-sibling::div//input")
    private WebElement appName;

    @FindBy(xpath = "//span[text()='tag']/preceding-sibling::div//input")
    private WebElement tag;

    @FindBy(xpath = "//span[text()='匹配规则']/parent::span/preceding-sibling::input")
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

    public WebElement getDropdownList(String name) {
        String xpath = "//label[contains(text(),'" + name + "')]/parent::div/following-sibling::div//span[@class='yotta-select-selection-icon']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("(//div[@class='yotta-select-menu'])[last()]"));
    }
    public WebElement getIndexName() {
        return getDropdownList("索引名");
    }

    public WebElement getTopicName() {
        return getDropdownList("Topic名");
    }

    @FindBy(xpath = "//label[text()='描述']/ancestor::div/following-sibling::div[1]//input" )
    private WebElement Desc;

    public WebElement getDesc() {
        return Desc;
    }

    public WebElement getCreateButton() {
        return getButton("新建");
    }

    public WebElement getSuccessMessage() {
        return getErrorMessage();
    }


    @FindBy(xpath = "//p[@class='yotta-dialog-contenttext']")
    private WebElement Message;

    @Override
    public WebElement getMessage() {
        return Message;
    }

    public WebElement getSavedButton() {
        return getButton("保存");
    }

}
