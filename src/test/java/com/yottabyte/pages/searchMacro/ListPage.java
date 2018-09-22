package com.yottabyte.pages.searchMacro;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

}
