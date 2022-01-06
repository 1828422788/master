package com.yottabyte.pages.ingestPriority;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import com.yottabyte.utils.DropdownUtils;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAppName(){
        return this.getInputElement("appname");
    }

    public WebElement getTag() {
        return this.getInputElement("tag");
    }

    @FindBy(xpath = "//div[@class='yotta-select-selection yotta-select-selection-active']/span/span")
    private WebElement PriorityDropdownIcon;
    @FindBy(xpath = "//div[@class='yotta-form-field-help-text']")
    private WebElement helpmessage;
    public WebElement getHelpmessage(){
        return helpmessage;
    }

    public WebElement getPriority(){
        String xpath = "//label[contains(text(),'')]/parent::div/parent::div/following-sibling::div[1]//span[@class='yotta-select-selection-icon']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("//div[contains(@class,'yotta-select-menu')]"));
    }

    public WebElement getSaveButton() {
        return super.getYottaButtonByText("新建");
    }

    public WebElement getSuccessMessage() {
        return webDriver.findElement(By.xpath("//p[@class='yotta-dialog-contenttext']"));
    }


    public WebElement getErrorMessage() {
        return webDriver.findElement(By.className("ant-message-notice-content"));
    }

    public WebElement getEnsureButton() {
        return super.getYottaButtonByText("保存");
    }

    public WebElement getEnsure() {
        return super.getYottaButtonByText("确定");
    }

    public WebElement getInputElement(String text) {
        String xpath = "//label[text()='" + text + "']/parent::div/following-sibling::div//input";
        return webDriver.findElement(By.xpath(xpath));
    }
}
