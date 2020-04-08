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
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(id = "EditDatabase_name")
    private WebElement name; //名称
    public WebElement getName() {
        return name;
    }

    @FindBy(id = "EditDatabase_alias")
    private WebElement alias;  //别名
    public WebElement getAlias() {
        return alias;
    }

    @FindBy(id = "EditDatabase_queryfilter")
    private WebElement spl;
    public WebElement getSpl() {
        return spl;
    }

   // @FindBy(xpath = "//*[@id=\"EditDatabase_app_ids\"]/div/div/div")
    @FindBy(xpath = "//label[@title='所属应用']/parent::div/following-sibling::div")
    private WebElement appList; //所属应用
    public WebElement getAppList(){
        appList.click();
        return super.getLastDropdownList();
    }

  //  @FindBy(xpath = "//*[@id=\"EditDatabase_rt_names\"]/div/div/div")
    @FindBy(xpath = "//label[@title='分组']/parent::div/following-sibling::div")
    private WebElement resourceGroup; //分组
    public WebElement getResourceGroup()
    {
        resourceGroup.click();
        return super.getLastDropdownList();
    }


    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div[2]/div[1]/div/span")
    private WebElement appButton; //选择应用按钮
    public WebElement getAppButton()
    {
        return appButton;
    }

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div[2]/div[1]/div/div/div[1]")
    private WebElement app_search_list;   //应用列表
    public WebElement getApp_search_list()
    {
        return super.getLastDropdownList();
    }


    @FindBy(xpath= "//div[text()='请输入数据集名称']")
    private WebElement tipsName;

    @FindBy(xpath= "//div[text()='请输入别名']")
    private WebElement tipsAlias;

    @FindBy(xpath= "//div[text()='请输入约束语句']")
    private WebElement tipsYuJu;

    public WebElement getTipsName(){return tipsName;}
    public WebElement getTipsAlias(){return tipsAlias;}
    public WebElement getTipsYuJu(){return tipsYuJu;}


    //新建数据集弹窗中的汇聚继承
   // @FindBy(xpath = "//*[@id=\"EditDatabase_action\"]/label[2]/span[2]")
    @FindBy(xpath = "//label[@title='父子行为']/parent::div/following-sibling::div//span[text()='汇聚']")
    private WebElement huiJu;  //父子行为为汇聚
    public WebElement getHuiJu(){return huiJu;}

   // @FindBy(xpath = "//*[@id=\"EditDatabase_action\"]/label[3]/span[2]")
   @FindBy(xpath = "//label[@title='父子行为']/parent::div/following-sibling::div//span[text()='继承']")
    private WebElement inherit; //父子行为继承
    public WebElement getInherit(){return inherit;}




//数据集预定义字段列表
    //第1个字段名称
    @FindBy(id="EditDatabase_fields[0].name")
    private WebElement firstFieldName;
    public WebElement getFirstFieldName(){return firstFieldName;}
    //第1个字段类型
    @FindBy(id="EditDatabase_fields[0].type")
    private WebElement firstFieldType;
    public WebElement getFirstFieldType(){
        firstFieldType.click();
        return super.getLastDropdownList();
    }
    //第2个字段名称
    @FindBy(id="EditDatabase_fields[1].name")
    private WebElement secondFieldName;
    public WebElement getSecondFieldName(){return secondFieldName;}
    //第2个字段类型
    @FindBy(id="EditDatabase_fields[1].type")
    private WebElement secondFieldType;
    public WebElement getSecondFieldType(){
        secondFieldType.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//label[@title='字段']/parent::div/following-sibling::div//span[text()='添加']")
    private WebElement fieldAdd;
    public WebElement getFieldAdd(){return fieldAdd;}

    @FindBy(xpath = "//p[text()='添加']")
    private WebElement fieldLowAdd;
    public WebElement getFieldLowAdd(){return fieldLowAdd;}






}
