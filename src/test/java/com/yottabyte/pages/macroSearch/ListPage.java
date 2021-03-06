package com.yottabyte.pages.macroSearch;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);

//        unknown error: Cannot read property 'scrollIntoView' of null
//        driver.manage().window().maximize();
    }

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
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

    @FindBy(xpath = "(//span[contains(text(),'新建')]/parent::button)")
//    @FindBy(className = "_1iMS-rc4SIlJVv6vYm7qsV")
    private WebElement createMacroButton;

    public WebElement getCreateMacroButton() throws InterruptedException {
        Thread.sleep(2000);
        return createMacroButton;
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

}


