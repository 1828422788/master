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
    @FindBy(xpath = "//*[@id=\"schedule\"]/div[3]/div/div[2]/div[2]/div[2]")
    private WebElement detailDataSet;
    public WebElement getDetailDataSet(){return detailDataSet;}



}
