package com.yottabyte.pages.remoteIndex;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author li.na
 */
public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    public WebElement getCreateButton() {
        return getButton("新建");
    }

    public WebElement getEnsureButton() {
        return getButton("确定");
    }

    @FindBy(xpath = "//input[@yotta-test='remoteindex-add_cluster_name-textarea'][@name='name']")
    private WebElement clusterName;
    public WebElement getClusterName() {
        return clusterName;
    }

    @FindBy(xpath = "//input[@yotta-test='remoteindex-add_cluster_name-textarea'][@name='remote_domain_name']")
    private WebElement domainName;
    public WebElement getDomainName() {
        return domainName;
    }

    @FindBy(xpath = "//input[@yotta-test='remoteindex-add_cluster_ip-input']")
    private WebElement ipPort;
    public WebElement getIpPort() {
        return ipPort;
    }

    @FindBy(xpath = "//div[@class='yotta-form-field-help-text']")
    private WebElement HelpMessage;
    public WebElement getHelpMessage() {
        return HelpMessage;
    }

    @FindBy(xpath = "//p[@class='yotta-dialog-contenttext']")
    private WebElement HelpFailMessage;
    public WebElement getHelpFailMessage(){
        return HelpFailMessage;
    }

    @FindBy(xpath = "//input[@yotta-test='remoteindex-search_cluster-input']")
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
