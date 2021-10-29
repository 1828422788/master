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

    @FindBy(xpath = "(//div[@yotta-test='indexsetting-appname-autocomplete'])//input")
    private WebElement appName;

    @FindBy(xpath = "(//div[@yotta-test='indexsetting-tag-autocomplete'])//input")
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
        return webDriver.findElement(By.xpath("(//div[@class='yotta-select-menu css-ncm03v'])[last()]"));
    }
    public WebElement getIndexName() {
        return getDropdownList("索引名");
    }

    public WebElement getTopicName() {
        return getDropdownList("Topic名");
    }

    @FindBy(xpath = "(//input[@yotta-test='indexsetting-description-input'])" )
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
