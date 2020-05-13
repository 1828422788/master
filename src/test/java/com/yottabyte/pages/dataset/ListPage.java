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


    @FindBy(xpath = "//label[@title='所属应用']/parent::div/following-sibling::div")
    private WebElement appList; //所属应用
    public WebElement getAppList(){
        appList.click();
        return super.getLastDropdownList();
    }


    @FindBy(xpath = "//label[@title='分组']/parent::div/following-sibling::div")
    private WebElement resourceGroup; //分组
    public WebElement getResourceGroup()
    {
        resourceGroup.click();
        return super.getLastDropdownList();
    }


   //利用应用查询
   @FindBy(xpath = "//div[text()='请选择应用']/parent::div")
   private WebElement appSearch;
   public WebElement getAppSearch(){
       appSearch.click();
       return super.getLastDropdownList();
   }





    @FindBy(xpath = "//label[text()='名称']/ancestor::div//following-sibling::div//div[text()='请输入数据集名称']")
    //@FindBy(xpath= "//div[text()='请输入数据集名称']")
    private WebElement tipsName;

    //@FindBy(xpath= "//div[text()='请输入别名']")
    @FindBy(xpath = "//label[text()='别名']/ancestor::div//following-sibling::div//div[text()='请输入别名']")
    private WebElement tipsAlias;

    @FindBy(xpath = "//label[text()='约束语句']/ancestor::div//following-sibling::div//div[text()='请输入约束语句']")
   // @FindBy(xpath= "//div[text()='请输入约束语句']")
    private WebElement tipsYuJu;

    public WebElement getTipsName(){return tipsName;}
    public WebElement getTipsAlias(){return tipsAlias;}
    public WebElement getTipsYuJu(){return tipsYuJu;}


    //新建数据集弹窗中的汇聚继承
    @FindBy(xpath = "//label[@title='父子行为']/parent::div/following-sibling::div//span[text()='汇聚']")
    private WebElement huiJu;  //父子行为为汇聚
    public WebElement getHuiJu(){return huiJu;}


   @FindBy(xpath = "//label[@title='父子行为']/parent::div/following-sibling::div//span[text()='继承']")
    private WebElement inherit; //父子行为继承
    public WebElement getInherit(){return inherit;}




//数据集预定义字段列表
    //第1个字段名称
  //  @FindBy(id="EditDatabase_fields[0].name")
    @FindBy(xpath = "//span[@class='css-pcxrzr ant-input-group-wrapper']/span/input[@id='EditDatabase_fields[0].name']")
    private WebElement firstFieldName;
    public WebElement getFirstFieldName(){return firstFieldName;}
    //第1个字段类型
   // @FindBy(id="EditDatabase_fields[0].type")
    @FindBy(xpath = "//span[@class='css-pcxrzr ant-input-group-wrapper']/span/span/div[@id='EditDatabase_fields[0].type']")
    private WebElement firstFieldType;
    public WebElement getFirstFieldType(){
       // firstFieldType.click();
       // return super.getLastDropdownList();
        return firstFieldType;
    }
    @FindBy(xpath = "//li[contains(text(),'数值')]")
    private WebElement number;
    public WebElement getNumber(){return number;}



    //第2个字段名称
    @FindBy(id="EditDatabase_fields[1].name")
    private WebElement secondFieldName;
    public WebElement getSecondFieldName(){return secondFieldName;}
    //第2个字段类型
    @FindBy(id="EditDatabase_fields[1].type")
    private WebElement secondFieldType;
    public WebElement getSecondFieldType(){
      //  secondFieldType.click();
      //  return super.getLastDropdownList();
        return secondFieldType;
    }
    @FindBy(xpath = "//li[contains(text(),'字符串')]")
    private WebElement strStr;
    public WebElement getStrStr(){return strStr;}



    @FindBy(xpath = "//label[@title='字段']/parent::div/following-sibling::div//span[text()='添加']")
    private WebElement fieldAdd;
    public WebElement getFieldAdd(){return fieldAdd;}

    @FindBy(xpath = "//p[text()='添加']")
    private WebElement fieldLowAdd;
    public WebElement getFieldLowAdd(){return fieldLowAdd;}






}
