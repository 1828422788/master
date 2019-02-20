package com.yottabyte.pages.saas;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.stepDefs.ClickSomeButton;
import com.yottabyte.stepDefs.SetKeyWithValue;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * 登陆页面的页面元素
 * Created by A on 2017/4/5.
 */
public class SaasLoginPage extends PageTemplate {
    WebDriver webDriver;

    public SaasLoginPage(WebDriver driver) {
        super(driver);
        webDriver = driver;
        parentPageName = "";
    }

    @FindBy(xpath = "//input[@placeholder='请输入用户名']")
    private WebElement username;

    @FindBy(xpath = "//input[@placeholder='请输入密码']")
    private WebElement password;

    public WebElement getUsername() {
        return username;
    }

    public WebElement getPassword() {
        return password;
    }

    public WebElement getLoginButton() {
        return super.getButton("登录");
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public String getTitle() {
        return webDriver.getTitle();
    }

    public void getLogin(String userName, String password) {
        SetKeyWithValue setKey = new SetKeyWithValue();
        ClickSomeButton click = new ClickSomeButton();
        setKey.iSetTheParameterWithValue(getUsername(), userName);
        setKey.iSetTheParameterWithValue(getPassword(), password);
        click.clickElement(getLoginButton());
        webDriver.navigate().refresh();
    }

}
