package com.yottabyte.pages.incident;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.*;

public class IncidentPage extends EditorPage {
    public IncidentPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//main[@yotta-test='navigation-main-dom']")
    private WebElement mainDom;

    public WebElement getMainDom() {
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

    public WebElement getClearButton() {
        return getYottaButton("incident-empty-button");
    }

    @FindBy(xpath = "//table[@yotta-test='incident-list-table']//tr[1]/td[3]")
    private WebElement nameCell13;

    public WebElement getNameCell13() {
        return nameCell13;
    }

    public WebElement getNameCell12() {
        String xpath = "//table[@yotta-test='incident-list-table']//tr[1]/td[2]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    @FindBy(xpath = "//button[@yotta-test='incident-more-button']")
    private WebElement moreButton;

    public WebElement getMoreButton() {
        return moreButton;
    }

    public WebElement getStatusList() {
        return dropdownUtils.getYottaDropdownList("incident-status-select");
    }

    //待分配
    @FindBy(xpath = "//button[@yotta-test='incident-active-option']")
    private WebElement activeOption;
    public WebElement getActiveOption() {
        return activeOption;
    }

    //工作中
    @FindBy(xpath = "//button[@yotta-test='incident-wip-option']")
    private WebElement wipOption;
    public WebElement getWipOption() {
        return wipOption;
    }

    //已解决
    @FindBy(xpath = "//button[@yotta-test='incident-resolved-option']")
    private WebElement resolvedOption;
    public WebElement getResolvedOption() {
        return resolvedOption;
    }

    //已忽略
    @FindBy(xpath = "//button[@yotta-test='incident-closed-option']")
    private WebElement closedOption;
    public WebElement getClosedOption() {
        return closedOption;
    }

    public WebElement getOwnerList() {
        return dropdownUtils.getYottaDropdownList("incident-owner-select");
    }

    @FindBy(xpath = "//span[@aria-label='PlusRight']")
    private WebElement ariaLabelRight;

    public WebElement getAriaLabelRight() {
        return ariaLabelRight;
    }

    @FindBy(xpath = "//div[contains(text(),'前往')]/input")
    private WebElement paginationInput;

    public WebElement getPaginationInput() {
        return paginationInput;
    }

    @FindBy(xpath = "//div[@class='yotta-pagination-elements'][1]")
    private WebElement totalItem;

    public WebElement getTotalItem() {
        return totalItem;
    }

    public WebElement getEveryPageList() {
        return dropdownUtils.getDropdownListbyPath("(//div[@class='yotta-pagination-elements']//*[@class='yotta-select-selection-content'])[last()]");
    }

    public WebElement getNo3page() {
        String xpath = "//table[@yotta-test='incident-list-table']/following::span[text()='3']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    public WebElement getExecuteButton() {
        return super.getButton("执行");
    }

    public WebElement getExecuteRet() {
        String xpath = "//div/p[contains(text(),'执行结果:')]/following-sibling::pre";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    @FindBy(xpath = "//input[@yotta-test='incident-alias-input']")
    private WebElement hostipInput;

    public WebElement getHostipInput() {
        return hostipInput;
    }
}
