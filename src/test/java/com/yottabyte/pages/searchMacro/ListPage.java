package com.yottabyte.pages.searchMacro;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "yotta-dialog-contenttext")
    private WebElement successMessage;

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    // 搜索输入框
    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement macroListSearchInput;
    public WebElement getMacroListSearchInput() {
        return macroListSearchInput;
    }

    @FindBy(xpath = "(//a[contains(text(),'删除')])")
    private WebElement macroListDeleteButton;
    public WebElement getMacroListDeleteButton() throws InterruptedException {
        Thread.sleep(2000);
        return macroListDeleteButton;
    }

    @FindBy(className = "ant-btn-primary")
    private WebElement confirmDelMacroButton;
    public WebElement getConfirmDelMacroButton() throws InterruptedException {
        Thread.sleep(2000);
        return confirmDelMacroButton;
    }

    @FindBy(xpath = "//li[@yotta-test='macro-delete-button']/span")
    private WebElement delete;

    @FindBy(xpath = "//li[@yotta-test='macro-tag-button']/span")
    private WebElement label;

    @FindBy(xpath = "//li[@yotta-test='macro-authorize-button']/span[text()='授权']")
    private WebElement auth;

   @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tagToInput;

    public WebElement getAuth() { return auth; }

    public WebElement getLabel() { return label; }

    public WebElement getDelete() { return delete; }

    public WebElement getTagToInput() {
        return tagToInput;
    }
}
