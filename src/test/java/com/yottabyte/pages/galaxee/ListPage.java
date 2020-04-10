package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author jnd
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "big-v-create-button")
    private WebElement create;

    @FindBy(xpath = "//div[contains(text(),'galaxeeTest')]/preceding-sibling::div//i[@class='iconfont icon-shanchuxuanting_icon']")
    private WebElement deleteGalaxeeTest;

    @FindBy(className = "loading")
    private WebElement loading;

    public WebElement getDeleteGalaxeeTest() {
        return deleteGalaxeeTest;
    }

    public WebElement getCreate() {
        return create;
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getLoading() {
        return loading;
    }






}
