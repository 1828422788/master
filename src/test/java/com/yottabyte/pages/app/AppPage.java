package com.yottabyte.pages.app;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class AppPage extends PageTemplate {
    public AppPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "yw-subnav-item")
    private List<WebElement> subNavList;

    public WebElement getFirstSubNav() {
        return subNavList.get(0);
    }

    public WebElement getSecondSubNav() {
        return subNavList.get(1);
    }
}
