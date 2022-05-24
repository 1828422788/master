package com.yottabyte.pages.timedTask;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class DetailPage extends EditorPage {

    public DetailPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[contains(text(),'搜索内容')]/following-sibling::*")
    private WebElement searchContent;

    @FindBy(xpath = "//div[contains(text(),'时间范围')]/following-sibling::*")
    private WebElement timePeriod;

    @FindBy(xpath = "//div[contains(text(),'任务描述')]/following-sibling::*")
    private WebElement description;

    @FindBy(xpath = "//div[contains(text(),'开始时间')]/following-sibling::div")
    private WebElement startTime;

    @FindBy(xpath = "//div[contains(text(),'执行计划')]/following-sibling::div")
    private WebElement executionPeriod;

    @FindBy(xpath = "(//*[contains(text(),'查看')])[1]")
    private WebElement lookUpButton;

    @FindBy(xpath = "//div[contains(text(),'暂无数据')]")
    public WebElement noData;

    @FindBy(xpath = "//div[contains(text(),'数据集')]/following-sibling::*")
    private WebElement detailDataSet;

    public WebElement getDetailDataSet(){return detailDataSet;}

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

    public WebElement getNoData() {
        return noData;
    }

    public WebElement getLookUpButton() {
        return lookUpButton;
    }
}
