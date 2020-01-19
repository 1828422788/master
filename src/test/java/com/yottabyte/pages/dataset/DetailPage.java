package com.yottabyte.pages.dataset;

import com.yottabyte.pages.PageTemplate;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;

import javax.swing.*;
import java.security.cert.X509Certificate;

/**
 * @author jiangnd
 */

public class DetailPage extends PageTemplate {

    public DetailPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "ant-btn _3aTYSyOZTloazTQBYnBoxo css-hz5ttt _21LKt7HF-If1PyLtDxaI77")
    private WebElement backlist;  //返回列表按钮

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/header/div[2]/button[1]")
    private WebElement editevent; //编辑根事件按钮


    @FindBy(id = "EditDatabase_name")
    private WebElement editname; //编辑名称

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/header/div[1]/p[1]/span[1]")
    private WebElement aftername;  //名称修改之后的变化


    @FindBy(id = "EditDatabase_alias")
    private WebElement editalias; //编辑别名

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/header/div[1]/p[1]/span[2]")
    private WebElement afteralias;  //别名修改之后的变化

    @FindBy(id = "EditDatabase_queryfilter")
    private WebElement edityuju;  //编辑约束语句

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/header/div[1]/p[3]/span[2]")
    private WebElement afteryuju; //约束语句修改后的变化


    @FindBy(xpath = "//*[@id=\"EditDatabase_action\"]/label[2]/span[2]")
    private WebElement edithuiju; //修改父子行为为汇聚



    @FindBy(xpath = "//*[@id=\"EditDatabase_action\"]/label[3]/span[2]")
    private WebElement editjicheng; //修改父子行为为继承



    @FindBy(xpath = "//span[text()='父子行为']/following-sibling::span")
    private WebElement afterFatherChild;  //修改父子行为之后的变化


    @FindBy(xpath = "/html/body/div[2]/div/div[2]/div/div[2]/div[3]/div/button[1]")
    private WebElement rootsave;  //编辑根事件的保存按钮

    @FindBy(xpath = "//*[@id=\"EditDatabase_action\"]/label[1]/span[2]")
    private WebElement editwu; //修改父子行为为无


    //编辑根事件的所属应用
    @FindBy(xpath = "//div[text()='请选择应用']")
    private WebElement rootAppList;
    public WebElement getRootAppList(){
        rootAppList.click();
        return super.getLastDropdownList();
    }

    //编辑根事件的分组
    @FindBy(xpath = "//div[text()='请选择资源标签']")
    private WebElement rootResourceGroup;
    public WebElement getRootResourceGroup()
    {
        rootResourceGroup.click();
        return super.getLastDropdownList();
    }





    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/div/p/span[1]")
    private WebElement node; // 节点
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[2]/p[1]/i")
    private WebElement pencil;  //铅笔头
    @FindBy(xpath = "/html/body/div/section/section/main/div/div/main/section[2]/p[1]/input")
    private WebElement modifyNode; //修改节点的框
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[2]/p[1]/i")
    private WebElement duiHao; //修改后的对号

    public WebElement getNode(){return node;}
    public WebElement getPencil(){return pencil;}
    public WebElement getModifyNode(){
        modifyNode.clear();
        return modifyNode;
    }
    public WebElement getDuiHao(){return duiHao;}

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[2]/div/button[1]")
    private WebElement save; //修改节点时候的保存按钮
    public WebElement getSave(){return super.getButton("保存");}

    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[2]/div/button[2]")
    private WebElement delete;  //删除节点的按钮
    public WebElement getDelete(){return super.getButton("删除");}

    @FindBy(xpath = "/html/body/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/button[1]")
    private WebElement ensure; //删除节点弹窗中的确定按钮
    public WebElement getEnsure(){return super.getButton("确定");}




    //修改节点的约束语句
    @FindBy(id = "queryText")
    private WebElement modifyNodeSentence;
    public WebElement getModifyNodeSentence(){
        modifyNodeSentence.clear();
        return modifyNodeSentence; }



    public WebElement getBacklist() {
        return super.getButton("返回列表");
    }

    public WebElement getEditevent() {
        return super.getButton("编辑根事件");
    }

    public WebElement getRootsave() {
        return super.getButton("保存");
    } //编辑根事件弹窗中的保存按钮

    public WebElement getEditname() {
        editname.clear();
        return editname;
    }

    public WebElement getEditalias() {
        editalias.clear();
        return editalias;
    }

    public WebElement getEdityuju() {
        edityuju.clear();
        return edityuju;
    }

    public WebElement getAfteryuju() {
        return afteryuju;
    }

    public WebElement getAftername() {
        return aftername;
    }

    public WebElement getAfteralias() {
        return afteralias;
    }


    public WebElement getAfterFatherChild()
    {
        return afterFatherChild;
    }

    public WebElement getEdithuiju() {
        return edithuiju;
    }

    public WebElement getEditjicheng() {
        return editjicheng;
    }
    public WebElement getEditwu()
    {
        return editwu;
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
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/div/p/span[1]")
    private WebElement root;
    public WebElement getRoot(){return root;}
    //根节点右侧的加号
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/div/p/span[2]")
    private WebElement rootAdd;
    public WebElement getRootAdd(){return rootAdd;}

    //B节点的输入框【B节点的节点名称】
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/div/input")
    private WebElement BInputName;
    public WebElement getBInputName(){return BInputName;}
    //B节点右侧的 对号
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/div/span[1]")
    private WebElement BRightDuiHao;
    public WebElement  getBRightDuiHao(){return BRightDuiHao;}


    //构建第三层节点所需要的元素
    //节点B本身
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/div/p/span[1]")
    private WebElement B;
    public WebElement getB(){return B;}
    //节点B右侧的加号
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/div/p/span[2]")
    private WebElement BAdd;
    public WebElement getBAdd(){return BAdd;}

    //节点C的输入框[C节点的名称]
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/ul/li/div/input")
    private WebElement CInputName;
    public WebElement getCInputName(){return CInputName;}
    //节点C输入框右侧的对号
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/ul/li/div/span[1]")
    private WebElement CRightDuiHao;
    public WebElement getCRightDuiHao(){return CRightDuiHao;}

    //构建D所需要的元素  1、点击B节点  2、点击B右侧的加号
    //3、D的输入框输入名称
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/ul/li[2]/div/input")
    private WebElement DInputName;
    public WebElement getDInputName(){return DInputName;}
    //4、D右侧的对号
    @FindBy(xpath = "//*[@id=\"app\"]/section/section/main/div/div/main/section[1]/div/ul/li/ul/li/ul/li[2]/div/span[1]")
    private WebElement DRightDuiHao;
    public WebElement getDRightDuiHao(){return DRightDuiHao;}
//构建树结束






}