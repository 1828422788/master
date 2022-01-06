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

    public WebElement getDropdownList(String name) {
        String xpath = "//label[contains(text(),'" + name + "')]/parent::div/following-sibling::div//span[@class='yotta-select-selection-icon']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("(//div[@class='yotta-select-menu css-ncm03v'])[last()]"));
    }

    public WebElement getIndexName() {
//        return getDropdownList("索引名");
        String xpath = "//div[@yotta-test='indexsetting-index-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return super.getV40LastDropdownList();

//        return webDriver.findElement(By.xpath("//div[contains(@class,'yotta-select-menu')]"));
    }

    public WebElement getTopicName() {
//        return getDropdownList("主题名");
        String xpath = "//div[@yotta-test='indexsetting-topic-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
//        return super.getLastDropdownList();
        return super.getV40LastDropdownList();

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
