package com.yottabyte.pages.incident;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.*;

import javax.annotation.Nullable;
import java.util.List;

public class UserListPage extends ListPageFactory {

    public UserListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//label[text()='所拥有角色']")
    private WebElement roleText;

    public WebElement getRoleText() {
        return roleText;
    }

    public WebElement getCreateUser() {
        return super.getButton("新建");
    }

}
