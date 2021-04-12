package com.yottabyte.pages.dataset;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.assertj.core.internal.cglib.asm.$ClassReader;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import javax.security.auth.x500.X500Principal;
import javax.swing.*;
import java.security.cert.X509Certificate;

/**
 * @author jiangnd
 */

public class DetailPage extends PageTemplate {

    public DetailPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    //    @FindBy(xpath = "//button[@class='ant-btn _3aTYSyOZTloazTQBYnBoxo css-hz5ttt _21LKt7HF-If1PyLtDxaI77']/span[text()='返回列表']")
//    @FindBy(xpath = "//button[@class='ant-btn _3aTYSyOZTloazTQBYnBoxo css-hz5ttt _21LKt7HF-If1PyLtDxaI77']/span[text()='返回']")
    @FindBy(xpath = "//button[@yotta-test='dataset-return-button']")
    private WebElement backList;  //返回列表按钮

    public WebElement getBackList() {
        return backList;
//        return super.getButton("返回");
    }

    //@FindBy(xpath = "//button[@class='ant-btn _3aTYSyOZTloazTQBYnBoxo css-hz5ttt _21LKt7HF-If1PyLtDxaI77']/span[text()='编辑根事件']")
    @FindBy(xpath = "//button[@yotta-test='dataset-root_event-button']")
    private WebElement editEvent; //编辑根事件按钮

    public WebElement getEditEvent() {
        return super.getButton("编辑根事件");
    }

    @FindBy(xpath = "//input[@yotta-test='dataset-name-input']")
    private WebElement editName; //编辑名称

    public WebElement getEditName() {
        return editName;
    }

//    @FindBy(xpath = "//span[@class='_3Ca-L6mVhcOwLwY6O0gts4']")
    @FindBy(xpath = "//span[@class='yotta-pageheader-title']")
    private WebElement afterName;  //名称修改之后的变化

    public WebElement getAfterName() {
        return afterName;
    }

//  @FindBy(id = "EditDatabase_alias")
    @FindBy(xpath = "//input[@yotta-test='dataset-alia-input']")
    private WebElement editAlias; //编辑别名
    public WebElement getEditAlias() {
        return editAlias;
    }

//  @FindBy(xpath = "//span[@class='_2Q2z_nP9Z2ujNlYOQro5iL']")
    @FindBy(xpath = "//span[@class='yotta-pageheader-subtitle']")
    private WebElement afterAlias;  //别名修改之后的变化
    public WebElement getAfterAlias() {
        return afterAlias;
    }

//  @FindBy(id = "EditDatabase_queryfilter")
    @FindBy(xpath = "//input[@yotta-test='dataset-queryfilter-input']")
    private WebElement editYuJu;  //编辑约束语句

    public WebElement getEditYuJu() {
        return editYuJu;
    }

    //@FindBy(xpath = "//span[text()='约束语句']/following-sibling::span")
    @FindBy(xpath = "//span[contains(text(),'约束语句')]/following-sibling::span")
    private WebElement afterYuJu; //约束语句修改后的变化

    public WebElement getAfterYuJu() {
        return afterYuJu;
    }

    @FindBy(xpath = "//span[text()='汇聚']")
    private WebElement editHuiJu; //修改父子行为为汇聚

    public WebElement getEditHuiJu() {
        return editHuiJu;
    }

    @FindBy(xpath = "//span[text()='继承']")
    private WebElement editJiCheng; //修改父子行为为继承

    public WebElement getEditJiCheng() {
        return editJiCheng;
    }

    @FindBy(xpath = "//span[text()='父子行为：']/following-sibling::span")
    private WebElement afterFatherChild;  //修改父子行为之后的变化

    public WebElement getAfterFatherChild() {
        return afterFatherChild;
    }

    @FindBy(xpath = "//span[text()='无']")
    private WebElement editWu; //修改父子行为为无

    public WebElement getEditWu() {
        return editWu;
    }

    public WebElement getRootSave() {
        return super.getButton("确定");
    }

    //编辑根事件的所属应用
    @FindBy(xpath = "//label[text()='所属应用']/ancestor::div/following-sibling::div")
    private WebElement rootAppList;

    public WebElement getRootAppList() {
        rootAppList.click();
        return super.getLastDropdownList();
    }

    //编辑根事件的分组
    @FindBy(xpath = "//label[text()='资源标签']/ancestor::div/following-sibling::div")
    private WebElement rootResourceGroup;

    public WebElement getRootResourceGroup() {
        rootResourceGroup.click();
        return super.getLastDropdownList();
    }


//  @FindBy(xpath = "//p[@class='ZCeC8SpdlkeuifyWkLOfA']/i")
    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-EditOutlined OfJ6FYy2hbp-IAuGnUxzJ']")
    private WebElement pencil;  //铅笔头

    public WebElement getPencil() {
        return pencil;
    }

//    @FindBy(xpath = "//p[@class='ZCeC8SpdlkeuifyWkLOfA']/input")
    @FindBy(xpath = "//input[@yotta-test='dataset-name_right-input']")
    private WebElement modifyNode; //修改节点的框

    public WebElement getModifyNode() {
        modifyNode.clear();
        return modifyNode;
    }

//    @FindBy(xpath = "//p[@class='ZCeC8SpdlkeuifyWkLOfA']/i")
    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-CheckOutlined']")
    private WebElement duiHao; //修改后的对号

    public WebElement getDuiHao() {
        return duiHao;
    }


    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement save; //修改节点时候的保存按钮

    public WebElement getSave() {
        return save;
//        return super.getButton("确定");
    }

    @FindBy(xpath = "//span[text()='保存']/parent::button")
    private WebElement saveDetail;

    public WebElement getSaveDetail() {
        return saveDetail;
    }

//    @FindBy(xpath = "//div[@class='_2y0AmGvGcO9kpim1Jp_I0G']/button[1]")
//    private WebElement save; //修改节点时候的保存按钮
//    public WebElement getSave(){return super.getButton("保存");}

//  @FindBy(xpath = "//div[@class='_2y0AmGvGcO9kpim1Jp_I0G']/button[2]")
    @FindBy(xpath = "//span[text()='删除']/button")
    private WebElement delete;  //删除节点的按钮
    public WebElement getDelete() {
        return super.getButton("删除");
    }

    @FindBy(xpath = "//span[text()='确定']")
    private WebElement ensure; //删除节点弹窗中的确定按钮

    public WebElement getEnsure() {
        return super.getButton("确定");
    }

    //修改节点的约束语句
//    @FindBy(id = "queryText")
    @FindBy(xpath = "//textarea[@yotta-test='dataset-query_filter-textarea']")
    private WebElement modifyNodeSentence;

    public WebElement getModifyNodeSentence() {
        modifyNodeSentence.clear();
        modifyNodeSentence.sendKeys("appname:apache");
        return modifyNodeSentence;
    }

    //删除数据集节点成功的提示
    @FindBy(xpath = "//span[text()='删除数据集节点成功']")
    private WebElement successMessage;

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }


//构建树开始
    /*
比如：
在根节点下添加节点【无1】，约束语句 tag:heka

在节点【无1】下添加节点【无2】，约束语句：tag:top_info

在节点【无1】下添加节点【无11】，约束语句：appname:apache
树形如下图：
A（root）
|
——B
  |
  ——C
  |
  ——D

     */

    //构建第二层节点（B）所需要的元素，root直接创建好了，从第二层开始写，但是需要根节点的元素
    //根节点本身
//  @FindBy(xpath = "//div[@class='_1KryJcLeSypo0Qh_wW6fOw']/p/span[1]")
    @FindBy(xpath = "//span[@yotta-test='dataset-node-dom']")
    private WebElement root;

    public WebElement getRoot() {
        return root;
    }

    //根节点右侧的加号
//  @FindBy(xpath = "//div[@class='_1KryJcLeSypo0Qh_wW6fOw']/p/span[2]")
//    @FindBy(xpath = "//span[@yotta-test='dataset-node-dom']/following-sibling::span/span/span")
    @FindBy(xpath = "//span[@yotta-test='dataset-add-icon']")
    private WebElement rootAdd;

    public WebElement getRootAdd() {
        return rootAdd;
    }

    //B节点的输入框【B节点的节点名称】
//  @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/input")
    @FindBy(xpath = "//input[@yotta-test='dataset-name_left-input'][@placeholder='请输入']")
    private WebElement BInputName;

    public WebElement getBInputName() {
        return BInputName;
    }

    //B节点右侧的 对号
//    @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/span[1]")
    @FindBy(xpath = "//span[@yotta-test='dataset-check-icon']")
    private WebElement BRightDuiHao;

    public WebElement getBRightDuiHao() {
        return BRightDuiHao;
    }

    //构建第三层节点所需要的元素
    //节点B本身
    @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/p/span[1]")
    private WebElement B;

    public WebElement getB() {
        return B;
    }

//  @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/p/span[1]")
//  @FindBy(xpath = "//div[@yotta-test='dataset-data-tree']//div[@class='yotta-collapse-panel-content']/div")
//    @FindBy(xpath = "//div[@yotta-test='dataset-data-tree']//div[@class='yotta-collapse-panel-content']//span[@class='yotta-tree-node-label']")
    @FindBy(xpath = "//span[@yotta-test='dataset-node-dom']/following::span[@yotta-test='dataset-node-dom']")
    private WebElement topChild;
    public WebElement getTopChild() {
        return topChild;
    }

    //节点B右侧的加号
//    @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/p/span[2]")
    @FindBy(xpath = "//span[@yotta-test='dataset-add-icon']/following::span[@yotta-test='dataset-add-icon']")
//    yotta-test="dataset-delete-icon"
    private WebElement BAdd;

    public WebElement getBAdd() {
        return BAdd;
    }

    //节点C的输入框[C节点的名称]
//    @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/input")
    @FindBy(xpath = "//input[@yotta-test='dataset-name_left-input']")
    private WebElement CInputName;

    public WebElement getCInputName() {
        return CInputName;
    }

    //节点C输入框右侧的对号
//    @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/span[1]")
    @FindBy(xpath = "//span[@yotta-test='dataset-check-icon']")
    private WebElement CRightDuiHao;

    public WebElement getCRightDuiHao() {
        return CRightDuiHao;
    }

    //构建D所需要的元素  1、点击B节点  2、点击B右侧的加号
    //3、D的输入框输入名称
//    @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/input")
    @FindBy(xpath = "//input[@yotta-test='dataset-name_left-input']")
    private WebElement DInputName;

    public WebElement getDInputName() {
        return DInputName;
    }

    //4、D右侧的对号
//    @FindBy(xpath = "//div[@class='_1qhK4xM9izBCoLcrDw_sF9']/span[1]")
    @FindBy(xpath = "//span[@yotta-test='dataset-check-icon']")
    private WebElement DRightDuiHao;

    public WebElement getDRightDuiHao() {
        return DRightDuiHao;
    }

    //构建树时，输入约束语句框
//    @FindBy(id = "queryText")
    @FindBy(xpath = "//textarea[@yotta-test='dataset-query_filter-textarea']")
    private WebElement sentenceInput;

    public WebElement getSentenceInput() {
        return sentenceInput;
    }
//构建树结束


    //v3.2
    //字段列表
    @FindBy(xpath = "//span[contains(text(),'字段列表')]/following-sibling::span")
    private WebElement firstName;

    public WebElement getFirstName() {
        return firstName;
    }

    @FindBy(xpath = "//span[contains(text(),'字段列表')]/following-sibling::span/following-sibling::span")
    private WebElement secondName;

    public WebElement getSecondName() {
        return secondName;
    }

    @FindBy(xpath = "//span[contains(text(),'字段列表')]/following-sibling::span/following-sibling::span/following-sibling::span")
    private WebElement thirdName;

    public WebElement getThirdName() {
        return thirdName;
    }

    //子节点添加按钮
    @FindBy(xpath = "//span[text()='添加字段']/parent::button")
    private WebElement childFieldAdd;

    public WebElement getChildFieldAdd() {
        return childFieldAdd;
    }

    @FindBy(xpath = "//button[@yotta-test='dataset-add_field-button']")
    private WebElement fieldAdd;
    public WebElement getFieldAdd()
    {
        return fieldAdd;
    }

    //第一个字段名称
//  @FindBy(id = "DatasetDetail_fields[0].name")
    @FindBy(xpath = "//input[@yotta-test='dataset-item-input']")
    private WebElement child_first_name;

    public WebElement getChild_first_name() {
        return child_first_name;
    }

    public WebElement getChild_first_typeList() {
        String xpath = "//div[@yotta-test='dataset-item-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
//        return child_first_type;
    }

    @FindBy(xpath = "//li[contains(text(),'时间')]")
    private WebElement time;

    public WebElement getTime() {
        return time;
    }

    @FindBy(xpath = "//li[contains(text(),'数值')]")
    private WebElement number;

    public WebElement getNumber() {
        return number;
    }

    @FindBy(xpath = "//li[contains(text(),'字符串')]")
    private WebElement strType;

    public WebElement getStrType() {
        return strType;
    }


    //第二个字段名称
//    @FindBy(id = "DatasetDetail_fields[1].name")
    @FindBy(xpath = "//input[@yotta-test='dataset-item-input']/following::input[@yotta-test='dataset-item-input']")
    private WebElement child_second_name;

    public WebElement getChild_second_name() {
        return child_second_name;
    }

    //第二个字段类型
//    @FindBy(id = "DatasetDetail_fields[1].type")
//    private WebElement child_second_type;

    public WebElement getChild_second_typeList() {
        String xpath = "//div[@yotta-test='dataset-item-select']/following::div[@yotta-test='dataset-item-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    //第三个字段名称
//    @FindBy(id = "DatasetDetail_fields[2].name")
    @FindBy(xpath = "//input[@yotta-test='dataset-item-input']/following::input[@yotta-test='dataset-item-input']/following::input[@yotta-test='dataset-item-input']")
    private WebElement child_third_name;

    public WebElement getChild_third_name() {
        return child_third_name;
    }

    //第三个字段类型
//    @FindBy(id = "DatasetDetail_fields[2].type")
//    private WebElement child_third_type;

    public WebElement getChild_third_typeList() {
        String xpath = "//div[@yotta-test='dataset-item-select']/following::div[@yotta-test='dataset-item-select']/following::div[@yotta-test='dataset-item-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    //子节点的第三个删除按钮
    @FindBy(xpath = "//span[text()='批量操作']/following::span[@yotta-test='dataset-delete-icon']/following::span[@yotta-test='dataset-delete-icon']/following::span[@yotta-test='dataset-delete-icon']")
    //class="yotta-icon yotta-icon-DeleteOutlined _2aFIGPPFEgQQarQcN4dhOe"
    private WebElement childThirdDeleteField;

    public WebElement getChildThirdDeleteField() {
        return childThirdDeleteField;
    }

    //批量操作子节点
    @FindBy(xpath = "//span[text()='批量操作']")
    private WebElement batchOperation;

    public WebElement getBatchOperation() {
        return batchOperation;
    }
    @FindBy(xpath = "//input[@yotta-test='dataset-all-checkbox']")
    private WebElement allCheck;

    public WebElement getAllCheck() {
        return allCheck;
    }

    //删除按钮
    @FindBy(xpath = "//span[@yotta-test='dataset-batch_delete-dom']")
    private WebElement allDelete;

    public WebElement getAllDelete() {
        return allDelete;
    }


    //编辑根事件，添加第三个字段
//    @FindBy(id = "EditDatabase_fields[2].name")
    @FindBy(xpath = "//label[contains(text(),'字段')]/following::input[@placeholder='请输入']/following::input[@placeholder='请输入']/following::input[@placeholder='请输入']")
    private WebElement thirdFieldName;

    public WebElement getThirdFieldName() {
        return thirdFieldName;
    }

    //第三个字段类型
//    @FindBy(id = "EditDatabase_fields[2].type")
    @FindBy(xpath = "//label[contains(text(),'字段')]/following::input[@placeholder='请输入']/following::input[@placeholder='请输入']/following::span[@class='yotta-input-append']/div/div")
    private WebElement thirdFieldType;

    public WebElement getThirdFieldType() {
        //  thirdFieldType.click();
        //  return super.getLastDropdownList();
        return thirdFieldType;
    }

    public WebElement getThirdFieldTypeList() {
        String xpath = "//label[contains(text(),'字段')]/following::span[@class='yotta-input-append']/following::span[@class='yotta-input-append']/following::span[@class='yotta-input-append']/div/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    //编辑根事件中第三个字段的删除按钮
    @FindBy(xpath = "//input[@yotta-test='dataset-item-input'][@value='ip']/following::span[@yotta-test='dataset-delete-icon']")
    private WebElement deleteField;

    public WebElement getDeleteField() {
        return deleteField;
    }

}