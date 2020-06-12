package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author jiangnd
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
//        driver.manage().window().setPosition(new Point(0,0));
//        driver.manage().window().setSize(new Dimension(1915,1045));
//        driver.manage().window().fullscreen();
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

//    public WebElement getEnsure() {
//        return super.getContainsTextButton("确定");
//    }

    public WebElement getLoading() {
        return loading;
    }


//@FindBy(xpath = "//div[@class='el-dialog__footer']/span/button[1]/span[contains(text(),'确定')]")
@FindBy(xpath = "//*[@id=\"big_v_manager\"]/div[2]/div[4]/div/div[3]/span/button[1]/span")
private WebElement ensure;
public WebElement getEnsure(){return ensure;}


    @FindBy(xpath = "//div[@class='el-input']/input[@class='el-input__inner']")
    private WebElement searchInput;
    public WebElement getSearchInput(){return searchInput;}

    @FindBy(xpath = "//div[@class='big-v-search']/i[@class='iconfont icon-search']")
    private WebElement searchName;
    public WebElement getSearchName(){return searchName;}







}
