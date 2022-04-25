package com.yottabyte.pages.alert;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class DetailPage extends EditorPage {
    public DetailPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(className = "el-icon-arrow-up")
    private WebElement degreeDropdown;

    @FindBy(xpath = "//*[@placeholder='开始日期']")
    private WebElement startDate;

    @FindBy(className = "el-icon-time")
    private WebElement timeIcon;

    public WebElement getApply() {
        return super.getButton("应用");
    }

    public WebElement getTimeIcon() {
        return timeIcon;
    }

    public WebElement getStartDate() {
        return startDate;
    }

    public WebElement getDegreeDropdown() {
        degreeDropdown.click();
        return super.getLastDropdownList();
    }


}
