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
    private WebElement yuJu; //约束语句

    public WebElement getName() {
        return name;
    }
    public WebElement getAlias() {
        return alias;
    }
    public WebElement getYuJu() { return yuJu; }


    @FindBy(xpath = "//label[text()='所属应用']/ancestor::div/following-sibling::div")
    private WebElement appList; //所属应用
    public WebElement getAppList(){
       appList.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//label[text()='分组']/ancestor::div/following-sibling::div")
    private WebElement resourceGroup; //分组
    public WebElement getResourceGroup()
    {
        resourceGroup.click();
        return super.getLastDropdownList();
    }

    @FindBy(id = "EditDatabase_queryfilter")
    private WebElement spl;


    @FindBy(xpath = "//div[text()='请选择应用']")
    private WebElement appSearch;
    public WebElement getAppSearch()
    {
        appSearch.click();
        return super.getLastDropdownList();
    }


   /*
   @FindBy(xpath = "//label[text()='名称']/ancestor::div//following-sibling::div//div[text()='请输入数据集名称']")
    private WebElement tipsname; //提示输入名称

    @FindBy(xpath = "//label[text()='别名']/ancestor::div//following-sibling::div//div[text()='请输入别名']")
    private WebElement tipsalias; //提示输入别名

    @FindBy(xpath = "//label[text()='约束语句']/ancestor::div//following-sibling::div//div[text()='请输入约束语句']")
    private WebElement tipsyuju; // 提示输入语句
    */

    @FindBy(xpath= "//div[text()='请输入数据集名称']")
    private WebElement tipsName;

    @FindBy(xpath= "//div[text()='请输入别名']")
    private WebElement tipsAlias;

    @FindBy(xpath= "//div[text()='请输入约束语句']")
    private WebElement tipsYuJu;

    public WebElement getTipsName(){return tipsName;}
    public WebElement getTipsAlias(){return tipsAlias;}
    public WebElement getTipsYuJu(){return tipsYuJu;}


    public ListPage(WebDriver driver) {
        super(driver);
    }



    public WebElement getSpl() {
        return spl;
    }


    //新建数据集弹窗中的汇聚继承
    @FindBy(xpath = "//span[text()='汇聚']")
    private WebElement huiJu;  //父子行为为汇聚
    public WebElement getHuiJu(){return huiJu;}

    @FindBy(xpath = "//span[text()='继承']")
    private WebElement jiCheng;  //父子行为继承
    public WebElement getJiCheng(){return jiCheng;}




    //v3.2   字段右侧的添加按钮
    @FindBy(xpath = "//label[contains(text(),'字段')]/ancestor::div/following-sibling::div")
    private WebElement fieldAdd;
    public WebElement getFieldAdd(){return fieldAdd;}

    //第一个字段名称
   // @FindBy(xpath = "//span[@class='ant-input-wrapper ant-input-group']/input[@class='ant-input']")
    @FindBy(id="EditDatabase_fields[0].name")
    private WebElement firstFieldName;
    public WebElement getFirstFieldName(){return firstFieldName;}
    //第一个字段类型
   // @FindBy(xpath = "//div[text()='请选择']")
    @FindBy(id="EditDatabase_fields[0].type")
    private WebElement FirstFieldType;
    public WebElement getFirstFieldType(){
        FirstFieldType.click();
        return super.getLastDropdownList();
    }

    //第二个字段名称
    @FindBy(id="EditDatabase_fields[1].name")
    private WebElement secondFieldName;
    public WebElement getSecondFieldName(){return secondFieldName;}
    //第二个字段类型
    @FindBy(id="EditDatabase_fields[1].type")
    private WebElement secondFieldType;
    public WebElement getSecondFieldType(){
        secondFieldType.click();
        return super.getLastDropdownList();
    }

    //字段下的添加按钮
    @FindBy(xpath = "//p[text()='添加']")
    private WebElement fieldLowAdd;
    public WebElement getFieldLowAdd() {
        return fieldLowAdd;
    }

}
