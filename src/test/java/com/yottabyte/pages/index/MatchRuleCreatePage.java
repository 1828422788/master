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

    @FindBy(xpath = "//div[text()='appname']/preceding-sibling::div//input")
    private WebElement appName;

    @FindBy(xpath = "//div[text()='tag']/preceding-sibling::div//input")
    private WebElement tag;

    @FindBy(xpath = "//span[text()='匹配规则']/preceding-sibling::input")
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

//    @FindBy(xpath = "//label[text()='索引名']/following-sibling::div//i")
//    private WebElement IndexName;
//
//    public WebElement getIndexName() {
//        IndexName.click();
//        return getLastDropdownList();
//    }

//    public WebElement getDropdowMatchRuleCreatePagenList(String name) {
//        WebElement icon = webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div"));
//        icon.click();
//        return webDriver.findElement(By.xpath("(//ul[@class='ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical'])[last()]"));
//    }

    public WebElement getDropdownList(String text) {
        String xpath = "//label[contains(text(),'" + text + "')]/parent::div/div/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("(//ul[@class='ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical'])[last()]"));
    }
    public WebElement getIndexName() {
        return getDropdownList("索引名");
    }

//    public WebElement getLastDropdownList() {
//        return webDriver.findElement(By.xpath("(//ul[@class='ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical'])[last()]"));
//    }

    public WebElement getTopicName() {
        return getDropdownList("topic名");
    }

    @FindBy(xpath = "//label[text()='描述']/following-sibling::input" )
    private WebElement Desc;

    public WebElement getDesc() {
        return Desc;
    }

    public WebElement getCreateButton() {
        return getContainsTextButton("新建");
    }

    public WebElement getSuccessMessage() {
        return getErrorMessage();
    }


    @FindBy(xpath = "//div[@class='el-message-box__message']")
    private WebElement Message;

    @Override
    public WebElement getMessage() {
        return Message;
    }

    public WebElement getSavedButton() {
        return getContainsTextButton("保存");
    }



    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::div//input"));
    }
}
