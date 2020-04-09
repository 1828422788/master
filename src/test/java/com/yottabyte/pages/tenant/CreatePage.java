package com.yottabyte.pages.tenant;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.DropdownUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-switch")
    private WebElement switchButton;
    public WebElement getSwitchButton() {
        return switchButton;
    }


    @FindBy(xpath = "//label[contains(text(),'名称:')]/parent::div/div/div/input")
    private WebElement name;
   public WebElement getName(){return name;}

    @FindBy(xpath = "//label[contains(text(),'域名')]/parent::div/div/div/input")
    private WebElement domainName;
    public WebElement getDomainName(){return domainName;}

/*
    public WebElement getSupportFeature() {
        return getDropdownList("支持特性");
    }
    public WebElement getDropdownList(String text) {
        String xpath = "//label[contains(text(),'" + text + "')]/parent::div/div/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();

    }
    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }
*/


    public WebElement getDropdownList(String text) {
        String xpath = "//label[contains(text(),'" + text + "')]/parent::div/div/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }
    public WebElement getSupportFeature() {
        return getDropdownList("支持特性");
    }
    public WebElement getExcessBehavior() {
        return  getDropdownList("超额行为");
    }



    @FindBy(xpath = "//label[contains(text(),'每日限额')]/parent::div/div/div/input")
    private WebElement dailyLimit;
    public WebElement getDailyLimit() {
        return dailyLimit;
    }

    @FindBy(xpath = "//label[contains(text(),'文件上传限制')]/parent::div/div/div/input")
    private WebElement uploadLimit;
    public WebElement getUploadLimit() {
        return uploadLimit;
    }

    @FindBy(xpath = "//label[contains(text(),'超额次数限定')]/parent::div/div/div/input")
    private WebElement excessLimit;
    public WebElement getExcessLimit() {
        return excessLimit;
    }



    @FindBy(xpath = "//label[contains(text(),'管理员名称')]/parent::div/div/div/input")
    private WebElement managerName;
    public WebElement getManagerName() {
        return managerName;
    }

    @FindBy(xpath = "//label[contains(text(),'管理员邮箱')]/parent::div/div/div/input")
    private WebElement managerEmail;
    public WebElement getManagerEmail() {
        return managerEmail;
    }

    @FindBy(xpath = "//label[contains(text(),'管理员密码')]/parent::div/div/div/input")
    private WebElement managerPassword;
    public WebElement getManagerPassword() {
        return managerPassword;
    }
    @FindBy(xpath = "//input[@placeholder='请再次输入']")
    private WebElement inputAgain;
    public WebElement getInputAgain() {
        return inputAgain;
    }



    public WebElement getSaveButton() {
        return super.getButton("保存");
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }



}
