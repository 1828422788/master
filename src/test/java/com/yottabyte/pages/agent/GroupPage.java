package com.yottabyte.pages.agent;

import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxc
 */
public class GroupPage extends ListPageFactory{
    public GroupPage(WebDriver driver) {super(driver);}

    @FindBy(xpath = "//td//div[contains(text(),'English')]/ancestor::td/following-sibling::td//span[contains(text(),'编辑')]/ancestor::button")
    private WebElement EditButton;

    @FindBy(xpath = "//div/h1")
    private WebElement Title;

    @FindBy(xpath = "//td//div[contains(text(),'English')]/ancestor::td/following-sibling::td//span[contains(text(),'删除')]/ancestor::button")
    private WebElement DeleteAgentGroupButton;

    @FindBy(xpath = "//span[contains(text(),'确定')]/ancestor::button")
    private WebElement Ensurebutton;

    @FindBy(xpath = "//div[@class='el-message-box__message']/p")
    private WebElement Finalmessage;


    public WebElement getCreateAgentGroupButton(){
        String xpath = "//span[text()='新建']/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getEditButton(){
        return EditButton;
    }

    public WebElement getTitle(){
        return Title;
    }

    public WebElement getDeleteAgentGroupButton(){
        return DeleteAgentGroupButton;
    }

    public WebElement getEnsurebutton(){
        return Ensurebutton;
    }

    public WebElement getMessage() {
        return webDriver.findElement(By.xpath("//div[@class='el-message-box__message']/p"));
    }

    public WebElement getFinalmessage(){
        return Finalmessage;
    }



}
