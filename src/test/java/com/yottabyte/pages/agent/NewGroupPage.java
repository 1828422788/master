package com.yottabyte.pages.agent;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxc
 */
public class NewGroupPage extends EditorPage {
    public NewGroupPage(WebDriver driver) {super(driver);}

    @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::div//input")
    private WebElement Name;

    @FindBy(xpath = "//label[contains(text(),'描述')]/following-sibling::div//input")
    private WebElement Description;

    @FindBy(xpath = "//span[text()='新建']/ancestor::button")
    private WebElement BuildButton;

    @FindBy(xpath = "//span[contains(text(),'确定')]/ancestor::button")
    private WebElement EnsureButton;

    @FindBy(xpath = "//span[text()='返回列表']/ancestor::button")
    private WebElement ReturnButton;

    public WebElement getMessage() {
        return webDriver.findElement(By.xpath("//div[@class='el-message-box__message']/p"));
    }

    @FindBy(className = "el-message__group")
    private WebElement Updatemsg;

    public WebElement getUpdatemsg(){
        return Updatemsg;
    }

    public WebElement getName() {
        return Name;
    }

    public WebElement getDescription(){
        return Description;
    }

    public WebElement getBuildButton(){
        return BuildButton;
    }

    public WebElement getEnsureButton() {
        return EnsureButton;
    }

    public WebElement getRole(){
        String xpath = "//div[@class='ant-select-selection__placeholder']";
        DropdownUtils dropdownUtils = new DropdownUtils();
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getLastDropdownList();
    }

    public WebElement getReturnButton(){
        return ReturnButton;
    }
}
