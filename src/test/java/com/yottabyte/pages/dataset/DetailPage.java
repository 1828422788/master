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

    public WebElement getEditEvent() {
        return super.getButton("编辑根事件");
    }

    public WebElement getName() {
        return getYottaInput("dataset-name-input");
    }

    public WebElement getAlias() {
        return getYottaInput("dataset-alia-input");
    }

    public WebElement getSpl() {
        return getYottaInput("dataset-queryfilter-input");
    }

    public WebElement getAppList() {
        return dropdownUtils.getYottaDropdownList("dataset-apps-select");
    }

    public WebElement getTagList() {
        return dropdownUtils.getYottaDropdownList("resource_tag-change_resource_tag-select");
    }

    @FindBy(className = "yotta-pageheader-title")
    private WebElement pageTitle;
    public WebElement getPageTitle() {
        return pageTitle;
    }

    @FindBy(className = "yotta-pageheader-subtitle")
    private WebElement pageSubtitle;
    public WebElement getPageSubtitle() {
        return pageSubtitle;
    }

    @FindBy(xpath = "//span[contains(text(),'约束语句')]/following-sibling::span")
    private WebElement splDetail;
    public WebElement getSplDetail() {
        return splDetail;
    }

    @FindBy(xpath = "//span[text()='父子行为：']/following-sibling::span")
    private WebElement behaviourDetail;
    public WebElement getBehaviourDetail() {
        return behaviourDetail;
    }

    @FindBy(xpath = "//span[contains(text(),'字段列表')]/parent::*")
    private WebElement fieldsDetail;
    public WebElement getFieldsDetail() {
        return fieldsDetail;
    }

    @FindBy(xpath = "//span[@yotta-test='dataset-edit-icon']")
    private WebElement pencil;  //铅笔头
    public WebElement getPencil() {
        return pencil;
    }

    public WebElement getNodeName() {
        return getYottaInput("dataset-name_right-input");
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
    @FindBy(xpath = "//span[@yotta-test='dataset-node-dom']")
    private WebElement root;
    public WebElement getRoot() {
        return root;
    }

    @FindBy(xpath = "//span[@yotta-test='dataset-add-icon']")
    private WebElement addNode;
    public WebElement getAddNode() {
        return addNode;
    }

    @FindBy(xpath = "(//span[@yotta-test='dataset-add-icon'])[2]")
    private WebElement addNodeThirdLayer;
    public WebElement getAddNodeThirdLayer() {
        return addNodeThirdLayer;
    }

    @FindBy(xpath = "//span[@yotta-test='dataset-delete-icon']")
    private WebElement deleteNode;
    public WebElement getDeleteNode() {
        return deleteNode;
    }

    public WebElement getNodeNameInTheTree() {
        return getYottaInput("dataset-name_left-input");
    }

    @FindBy(xpath = "//span[contains(@yotta-test,'dataset-check')]")
    private WebElement check;
    public WebElement getCheck() {
        return check;
    }

    @FindBy(xpath = "//span[@yotta-test='dataset-node-dom']/following::span[@yotta-test='dataset-node-dom']")
    private WebElement topChild;
    public WebElement getTopChild() {
        return topChild;
    }

    public WebElement getQuery() {
        return getYottaTextarea("dataset-query_filter-textarea");
    }

    @FindBy(xpath = "//button[@yotta-test='dataset-add_field-button']")
    private WebElement fieldAdd;
    public WebElement getFieldAdd()
    {
        return fieldAdd;
    }

    @FindBy(xpath = "(//input[@yotta-test='dataset-item-input'])[last()]")
    private WebElement fieldName;
    public WebElement getFieldName() {
        return fieldName;
    }

    @FindBy(xpath = "(//div[@yotta-test='dataset-item-select'])[last()]")
    private WebElement fieldType;
    public WebElement getFieldType() {
        fieldType.click();
        return dropdownUtils.getLastDropdownList();
    }

    @FindBy(xpath = "//span[@yotta-test='dataset-batch_delete-dom']")
    private WebElement batchDelete;

    public WebElement getBatchDelete() {
        return batchDelete;
    }

    //编辑根事件中最后个字段的删除按钮
    @FindBy(xpath = "(//input[@yotta-test]//ancestor::div[2]//span[@yotta-test='dataset-delete-icon'])[last()]")
    private WebElement deleteField;
    public WebElement getDeleteField() {
        return deleteField;
    }
}