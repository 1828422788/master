package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;

/**
 * @author jiangnd
 */
public class ListPage extends EditorPage {
    public ListPage(WebDriver driver) {
        super(driver);
//        driver.manage().window().setPosition(new Point(0,0));
//        driver.manage().window().setSize(new Dimension(1915,1045));
        driver.manage().window().fullscreen();
    }

//    @FindBy(className = "yotta-icon yotta-icon-AdditionAlternative")
    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-AdditionAlternative']")
    private WebElement create;

    @FindBy(xpath = "//div[contains(text(),'galaxeeTest')]/preceding-sibling::div//i[@class='iconfont icon-shanchuxuanting_icon']")
    private WebElement deleteGalaxeeTest;

    @FindBy(className = "loading")
    private WebElement loading;

    @FindBy(className = "galaxee-start-mask")
    private WebElement loadingPage;

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

    public WebElement getLoadingPage() {
        return loadingPage;
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

    public WebElement getEdit() { return this.getEveryButton("页面设置","编辑"); }
    //    大屏编辑的按钮
    public WebElement getEveryButton(String dataName,String className){
        String xpath;
        xpath="//input[@value='"+dataName+"']//ancestor::div[@class='_3THzRCdOcKS-tY5zQlLXSL _6f2Nt4huRGMZUgMsUle8F']//span[text()='"+className+"']";
        return webDriver.findElement(By.xpath(xpath));
    }
    //    大屏删除的按钮
    public WebElement getEveryButton1(String dataName,String className){
        String xpath;
        xpath="//input[@value='"+dataName+"']//ancestor::div[@class='_3THzRCdOcKS-tY5zQlLXSL _6f2Nt4huRGMZUgMsUle8F']//span[@aria-label='"+className+"']";
        return webDriver.findElement(By.xpath(xpath));
    }
    //    大屏发布的按钮
    public WebElement getEveryButton2(String dataName,String className){
        String xpath;
        xpath="//input[@value='"+dataName+"']//ancestor::div[@class='_1pngSqPPRgouIB-WH5lx3c']/div[2]//span[@aria-label='"+className+"']";
        return webDriver.findElement(By.xpath(xpath));
    }







}
