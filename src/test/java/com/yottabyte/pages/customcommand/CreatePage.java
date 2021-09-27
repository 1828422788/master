package com.yottabyte.pages.customcommand;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;

public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1200, 900));
    }
}
