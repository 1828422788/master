package com.yottabyte.pages.saas;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.stepDefs.ClickSomeButton;
import com.yottabyte.stepDefs.SetKeyWithValue;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * 登陆页面的页面元素
 * Created by A on 2017/4/5.
 */
public class SaasLoginPage extends EditorPage {
    WebDriver webDriver;

    public SaasLoginPage(WebDriver driver) {
        super(driver);
//
//        webDriver = driver;
//        parentPageName = "";
    }

    @FindBy(xpath = "//input[@yotta-test='domainlogin-username-input']")
    private WebElement username;

    public WebElement getUsername() {
        return username;
    }

    @FindBy(xpath = "//input[@yotta-test='domainlogin-password-input']")
    private WebElement password;

    public WebElement getPassword() {
        return password;
    }

    @FindBy(xpath = "//button[@yotta-test='domainlogin-submit-button']")
    private WebElement loginButton;

    public WebElement getLoginButton() {
        return loginButton;
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

    //登陆信息错时，弹唱中的确定按钮
    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']/span[contains(text(),'确定')]")
    private WebElement ensure;

    public WebElement getEnsure() {
        return ensure;
    }

}
