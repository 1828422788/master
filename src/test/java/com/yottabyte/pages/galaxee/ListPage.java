package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "big-v-create-button")
    private WebElement create;

    @FindBy(xpath = "//div[contains(text(),'galaxeeTest')]/preceding-sibling::div//i[@class='iconfont icon-shanchuxuanting_icon']")
    private WebElement deleteGalaxeeTest;


    public WebElement getDeleteGalaxeeTest() {
        return deleteGalaxeeTest;
    }

    public WebElement getCreate() {
        return create;
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }
}
