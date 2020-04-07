package com.yottabyte.pages.dataset;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import javax.xml.xpath.XPath;

import java.util.List;

import static org.junit.Assert.assertEquals;


/**
 * @author jiangnd
 */
public class ListPage extends ListPageFactory {
    @FindBy(id = "EditDatabase_name")
    private WebElement name; //名称

    @FindBy(id = "EditDatabase_alias")
    private WebElement alias;  //别名


    @FindBy(id = "EditDatabase_queryfilter")
    private WebElement yuju; //约束语句

    @FindBy(xpath = "//*[@id=\"EditDatabase_app_ids\"]/div/div/div")
    private WebElement applist; //所属应用


    @FindBy(xpath = "//*[@id=\"EditDatabase_rt_names\"]/div/div/div")
    private WebElement resourcegroup; //分组


    @FindBy(id = "EditDatabase_queryfilter")
    private WebElement spl;

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div[2]/div[1]/div/span")
    private WebElement appbutton; //选择应用按钮

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div[2]/div[1]/div/div/div[1]")
    private WebElement app_search_list;   //应用列表

   /*
   @FindBy(xpath = "//label[text()='名称']/ancestor::div//following-sibling::div//div[text()='请输入数据集名称']")
    private WebElement tipsname; //提示输入名称

    @FindBy(xpath = "//label[text()='别名']/ancestor::div//following-sibling::div//div[text()='请输入别名']")
    private WebElement tipsalias; //提示输入别名

    @FindBy(xpath = "//label[text()='约束语句']/ancestor::div//following-sibling::div//div[text()='请输入约束语句']")
    private WebElement tipsyuju; // 提示输入语句
    */

    @FindBy(xpath= "//div[text()='请输入数据集名称']")
    private WebElement tipsname;

    @FindBy(xpath= "//div[text()='请输入别名']")
    private WebElement tipsalias;

    @FindBy(xpath= "//div[text()='请输入约束语句']")
    private WebElement tipsyuju;


    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getName() {
        return name;
    }
    public WebElement getAlias() {
        return alias;
    }
    public WebElement getYuju() { return yuju; }

    public WebElement getSpl() {
        return spl;
    }

   /* public WebElement getEditEvent() {
        return super.getButton("编辑根事件");
    }*/

    public WebElement getTipsname(){return tipsname;}
    public WebElement getTipsalias(){return tipsalias;}
    public WebElement getTipsyuju(){return tipsyuju;}



    public WebElement getApplist(){
        applist.click();
        return super.getLastDropdownList();
    }

    public WebElement getResourcegroup()
    {
        resourcegroup.click();
        return super.getLastDropdownList();
    }

    public WebElement getAppbutton()
    {
        return appbutton;
    }

    public WebElement getApp_search_list()
    {
        return super.getLastDropdownList();
    }


    //新建数据集弹窗中的汇聚继承
    @FindBy(xpath = "//*[@id=\"EditDatabase_action\"]/label[2]/span[2]")
    private WebElement huiju;  //父子行为为汇聚
    public WebElement getHuiju(){return huiju;}


    @FindBy(xpath = "//*[@id=\"EditDatabase_action\"]/label[3]/span[2]")
    private WebElement jicheng; //父子行为继承
    public WebElement getJicheng(){return jicheng;}

}
