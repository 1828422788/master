package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

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

    @FindBy(xpath = "//input[@yotta-test='indexsetting-raw_message_regex-input']")
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
        return dropdownUtils.getYottaDropdownList("indexsetting-index-select");
    }

    public WebElement getTopicName() {
        return dropdownUtils.getYottaDropdownList("indexsetting-topic-select");
    }

    @FindBy(xpath = "(//input[@yotta-test='indexsetting-description-input'])")
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
