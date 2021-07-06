package com.yottabyte.pages.incident;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.*;

import javax.annotation.Nullable;
import java.util.List;

public class IncidentPage extends PageTemplate {
    public IncidentPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//main[@yotta-test='navigation-main-dom']")
    private WebElement mainDom;
    public WebElement getMainDom(){
        return mainDom;
    }

//    @FindBy(className = "CodeMirror-code")
    @FindBy(xpath = "//input[@yotta-test='incident-query-input']")
    private WebElement searchInput;

    public WebElement getSearchInput() {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(searchInput);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchInput;
    }

    public WebElement getSearchButton() {
        return super.getButton("搜索");
    }

    public WebElement getClearButton(){
        return getYottaButton("incident-empty-button");
    }

    @FindBy(xpath = "//table[@yotta-test='incident-list-table']//tr[1]/td[3]")
    private WebElement nameCell13;
    public WebElement getNameCell13(){
        return nameCell13;
    }

}
