package com.yottabyte.pages.agent;

import org.openqa.selenium.By;
import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxc,sunxj
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

    @FindBy(xpath = "//input[contains(@placeholder,'请输入')]")
    private WebElement Name;

    public WebElement getName() {
        return Name;
    }

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

    @FindBy(className = "el-message-box__message")
    private WebElement successMessage;

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }



}
