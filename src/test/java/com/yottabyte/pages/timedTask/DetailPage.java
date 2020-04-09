package com.yottabyte.pages.timedTask;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class DetailPage extends PageTemplate {

    public DetailPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[text()='搜索内容:']/following-sibling::div")
    private WebElement searchContent;

    @FindBy(xpath = "//div[text()='时间范围:']/following-sibling::div")
    private WebElement timePeriod;

    @FindBy(xpath = "//div[text()='任务描述:']/following-sibling::div")
    private WebElement description;

    @FindBy(xpath = "//div[text()='开始时间:']/following-sibling::div")
    private WebElement startTime;

    @FindBy(xpath = "//div[text()='执行计划:']/following-sibling::div")
    private WebElement executionPeriod;

    @FindBy(className = "el-button--text")
    private List<WebElement> show;

    @FindBy(className = "number")
    private List<WebElement> numberList;

    @FindBy(xpath = "(//span[contains(text(),'查看')][not(@class)])[last()]")
    private WebElement lookUpButton;

    @FindBy(className = "chart")
    private WebElement chart;

    @FindBy(className = "yw-content")
    private WebElement content;

    public WebElement getTimePeriod(){
        return timePeriod;
    }

    public WebElement getSearchContent() {
        return searchContent;
    }

    public WebElement getDescription() {
        return description;
    }

    public WebElement getStartTime() {
        return startTime;
    }

    public WebElement getExecutionPeriod() {
        return executionPeriod;
    }

    public WebElement getContent() {
        return content;
    }

    public WebElement getChart() {
        return chart;
    }

    public WebElement getShow() {
        return show.get(0);
    }

    public WebElement getNoData() {
        return super.getButton("无可展示数据～");
    }

    public WebElement getLookUpButton() {
        WebElement number = numberList.get(numberList.size() - 1);
        number.click();
        return lookUpButton;
    }



    //author_jnd
    //定时任务详情页的数据集
    @FindBy(xpath = "//div[text()='数据集:']/following-sibling::div")
    private WebElement detailDataSet;
    public WebElement getDetailDataSet(){return detailDataSet;}



}
