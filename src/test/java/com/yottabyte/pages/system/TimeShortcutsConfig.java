package com.yottabyte.pages.system;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class TimeShortcutsConfig extends PageTemplate {
    public TimeShortcutsConfig(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1920,1080));
    }

    @FindBy(xpath = "//input[@class='ant-input']")
    private WebElement searchBox;

    public WebElement getSearchBox() { return searchBox; }

    @FindBy(xpath = "//span[text()='所有时间']")
    private WebElement wholeTimeText;

    public WebElement getWholeTimeText() { return wholeTimeText; }

    @FindBy(xpath = "//a[text()='返回']")
    private WebElement backButton;

    public WebElement getBackButton() { return backButton; }

    @FindBy(xpath = "//span[text()='所有时间']/parent::td/following-sibling::td//a[text()='编辑']")
    private WebElement wholeTimeEdit;

    public WebElement getWholeTimeEdit() { return wholeTimeEdit; }

}
