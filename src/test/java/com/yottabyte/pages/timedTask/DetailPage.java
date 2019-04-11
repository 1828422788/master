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
}
