package com.yottabyte.pages.agent;

import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

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

    @FindBy(xpath = "//div[@class='el-message-box__message']/p")
    private WebElement Finalmessage;


    public WebElement getName() {
        return getelement("请输入名称");
    }

    @FindBy(xpath = "//textarea[contains(@placeholder,'请输入描述')]")
    private WebElement Description;

    public WebElement getDescription() {
        return Description;
    }

    public WebElement getCreateAgentGroupButton(){
        String xpath = "//span[text()='新建 Agent 分组']/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getRole(){
        String xpath = "//div[@class='ant-select-selection__placeholder']";
        DropdownUtils dropdownUtils = new DropdownUtils();
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getLastDropdownList();
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

    public WebElement getSave() {
        return super.getButton("保存");
    }

    @Override
    public WebElement getSearchInput() {
        return searchInput;
    }

    @FindBy(xpath = "//div[text()='请输入名称']")
    private WebElement searchInput;

    public WebElement getSearchRole() {
        return searchRole;
    }

    @FindBy(xpath = "//div[text()='请选择角色']")
    private WebElement searchRole;

    public WebElement getAddsuccessmsg() {
        return Addsuccessmsg;
    }

    @FindBy(xpath = "//div[@class='ant-message-custom-content ant-message-success']//span")
    private WebElement Addsuccessmsg;

    public WebElement getMessage() {
        return webDriver.findElement(By.xpath("//div[@class='ant-modal-body']//p"));
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

    public WebElement getelement(String text){
        return webDriver.findElement(By.xpath("//input[contains(@placeholder,'" + text + "')]"));
    }

}
