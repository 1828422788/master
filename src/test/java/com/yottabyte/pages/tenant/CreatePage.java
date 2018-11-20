package com.yottabyte.pages.tenant;

import com.yottabyte.pages.PageTemplate;
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

    @FindBy(xpath = "//input[@placeholder='请再次输入']")
    private WebElement inputAgain;

    @FindBy(className = "el-switch")
    private WebElement switchButton;

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getName() {
        return super.getInputElement("名称");
    }

    public WebElement getDomainName() {
        return super.getInputElement("域名");
    }

    public WebElement getSupportFeature() {
        return super.getDropdownList("支持特性");
    }

    public WebElement getDailyLimit() {
        return super.getInputElement("每日限额");
    }

    public WebElement getUploadLimit() {
        return super.getInputElement("文件上传限制");
    }

    public WebElement getExcessLimit() {
        return super.getInputElement("超额次数限定");
    }

    public WebElement getExcessBehavior() {
        return super.getDropdownList("超额行为");
    }

    public WebElement getManagerName() {
        return super.getInputElement("管理员名称");
    }

    public WebElement getManagerEmail() {
        return super.getInputElement("管理员邮箱");
    }

    public WebElement getManagerPassword() {
        return super.getInputElement("管理员密码");
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

    public WebElement getInputAgain() {
        return inputAgain;
    }
}
