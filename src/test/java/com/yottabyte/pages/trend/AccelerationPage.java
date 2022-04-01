package com.yottabyte.pages.trend;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class AccelerationPage extends ListPageFactory {
    public AccelerationPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    public WebElement getDelete() {
        return super.getButton("删除");
    }
}
