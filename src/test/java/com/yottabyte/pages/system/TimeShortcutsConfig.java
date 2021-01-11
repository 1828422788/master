package com.yottabyte.pages.system;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class TimeShortcutsConfig extends PageTemplate {
    public TimeShortcutsConfig(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='/knowledge/']")
    private WebElement liButton;

}
