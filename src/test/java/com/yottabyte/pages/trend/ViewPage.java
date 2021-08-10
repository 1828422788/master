package com.yottabyte.pages.trend;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author Kate
 */

public class ViewPage extends ListPageFactory {
    public ViewPage(WebDriver driver) {
        super(driver);
//        driver.manage().window().setPosition(new Point(0, 0));
        driver.manage().window().setSize(new Dimension(1200,900));
    }

    @FindBy(xpath = "//div[@id='spl-chart']/div[1]")
    private WebElement chartName;

    @FindBy(xpath = "//div[@id='spl-chart']/div[2]")
    private WebElement chartView;

    @FindBy(xpath = "//span[text()='无数据']")
    private WebElement noData;

    public WebElement getChartName() {
        return chartName;
    }

    public WebElement getChartView() {
        return chartView;
    }

    public WebElement getNoData() {
        return noData;
    }
}
