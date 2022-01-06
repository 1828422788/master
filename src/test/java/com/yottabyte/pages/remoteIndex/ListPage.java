package com.yottabyte.pages.remoteIndex;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author li.na
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[contains(text(),'远端集群')]" )
    private WebElement remoteCusterTab;
    public WebElement getRemoteCusterTab() {
        return remoteCusterTab;
    }

    public WebElement getCreateButton() {
        return getButton("新建");
    }

    public WebElement getEnsureButton() {
        return getButton("确定");
    }

    @FindBy(xpath = "//div[@yotta-test='remoteindex-add_index_cluster-select']/div" )
    private WebElement remoteCusterList;
    public WebElement getRemoteCusterList() {
        return remoteCusterList;
    }

    public WebElement getRemoteIndexList() {
        String xpath = "//div[@yotta-test='remoteindex-add_index_index-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
//        ClickEvent.clickUnderneathButton(element);
        return element;
    }

    @FindBy(xpath = "//textarea[@yotta-test='remoteindex-add_index_description-textarea']")
    private WebElement describeTextarea;
    public WebElement getDescribeTextarea() {
        return describeTextarea;
    }
    @FindBy(xpath = "//input[@yotta-test='remoteindex-search_index-input']")
    private WebElement SearchInput;
    public WebElement getSearchInput(){
        return SearchInput;
    }
    @FindBy(xpath = "//tbody[@class='yotta-table-body']")
    private WebElement Tbody;
    public WebElement getTbody(){
        return Tbody;
    }


}
