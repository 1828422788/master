package com.yottabyte.pages.incident;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.*;

public class StatisticPage extends EditorPage {
    public StatisticPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//main[@yotta-test='navigation-main-dom']")
    private WebElement mainDom;
    public WebElement getMainDom(){
        return mainDom;
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
        return super.getLastDropdownList();
    }

    public WebElement getOwnerList(){
        String xpath = "//div[@yotta-test='incident-owner-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//span[@aria-label='PlusRight']")
    private WebElement ariaLabelRight;
    public WebElement getAriaLabelRight(){
        return ariaLabelRight;
    }

    @FindBy(xpath = "//div[contains(text(),'??????')]/input")
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
        String xpath = "//div[contains(text(),'??????')][@class='yotta-pagination-elements']/div/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }

    public WebElement getNo3page()
    {
        String xpath = "//table[@yotta-test='incident-list-table']/following::span[text()='3']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement searchNameInput;

    public WebElement getSearchNameInput() { return searchNameInput; }

}
