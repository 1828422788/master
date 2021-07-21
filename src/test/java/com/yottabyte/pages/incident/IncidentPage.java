package com.yottabyte.pages.incident;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
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

    @FindBy(xpath = "//button[@yotta-test='incident-more-button']")
    private WebElement moreButton;
    public WebElement getMoreButton(){
        return moreButton;
    }

    public WebElement getStatusList(){
        String xpath = "//div[@yotta-test='incident-status-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getIncidentStatusMenuList();
    }

    public WebElement getOwnerList(){
        String xpath = "//div[@yotta-test='incident-owner-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getIncidentStatusMenuList();
    }

    @FindBy(xpath = "//span[@aria-label='RightOutlined']")
    private WebElement ariaLabelRight;
    public WebElement getAriaLabelRight(){
        return ariaLabelRight;
    }

    @FindBy(xpath = "//div[contains(text(),'前往')]/input")
    private WebElement paginationInput;
    public WebElement getPaginationInput(){
        return paginationInput;
    }

    @FindBy(xpath = "//div[@class='yotta-pagination-elements'][1]")
    private WebElement totalItem;
    public WebElement getTotalItem()
    {
        return totalItem;
    }

    public WebElement getEveryPageList()
    {
        String xpath = "//div[contains(text(),'每页')][@class='yotta-pagination-elements']/div/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getIncidentStatusMenuList();
    }


}
