package com.yottabyte.pages.incident;

import com.yottabyte.pages.DateEditorPage;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class AlertSearch extends PageTemplate {
    public AlertSearch(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//main[@yotta-test='navigation-main-dom']")
    private WebElement mainDom;
    public WebElement getMainDom(){
        return mainDom;
    }

    @FindBy(xpath = "//button[@yotta-test='incident-custom-button']")
    private WebElement customButton;
    public WebElement getCustomButton()
    {
        return customButton;
    }

    @FindBy(className = "CodeMirror-code")
    private WebElement searchInput;

    public WebElement getSearchInput() {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(searchInput);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        return searchInput;
    }

    public WebElement getSearchButton() {
        return super.getButton("搜索");
    }

    @FindBy(xpath = "//span[@yotta-test='search_control-time_cost-text']")
    private WebElement searchStatus;
    public WebElement getSearchStatus() {
        return searchStatus;
    }


    @FindBy(xpath = "//div[@yotta-test='search_bar-time-date_time_picker']")
    private WebElement dateEditor;

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getToday() {
        return GetTime.getTime(webDriver, "Today");
    }

    @FindBy(xpath = "//table[@yotta-test='incident-list-table']")
    private WebElement alertTable;
    public WebElement getAlertTable() {
        return alertTable;
    }

    @FindBy(xpath = "//table[@yotta-test='incident-list-table']//tr[2]/td[2]")
    private WebElement nameCell21;
    public WebElement getNameCell21(){
        return nameCell21;
    }

    @FindBy(xpath = "//table[@yotta-test='incident-list-table']//tr[2]/td[2]")
    private WebElement nameCell22;
    public WebElement getNameCell22(){
        return nameCell22;
    }




}