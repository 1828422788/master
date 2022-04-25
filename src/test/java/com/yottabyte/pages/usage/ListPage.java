package com.yottabyte.pages.usage;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends EditorPage {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//a[text()='查看']")
    private WebElement showButton;

    public WebElement getShowButton() {
        return showButton;
    }


}
