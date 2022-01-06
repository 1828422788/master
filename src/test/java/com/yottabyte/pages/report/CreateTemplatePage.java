package com.yottabyte.pages.report;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;


public class CreateTemplatePage extends PageTemplate {

    public CreateTemplatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1600, 900));
    }

    public WebElement getNewTemplate() {
        return getButton("新建");
    }

    public WebElement getNext() {
        return getButton("下一步");
    }

    public WebElement getDelete() {
        return getButton("删除");
    }

    public WebElement getFinish() {
        return getButton("完成");
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement templateName;
    public WebElement getTemplateName() {
        return templateName;
    }

    @FindBy(xpath = "//div[contains(@class,'help')]")
    private WebElement tipText;
    public WebElement getTipText() {
        return tipText;
    }

    @FindBy(xpath = "//span[contains(@class,'upload-tip') and text()='上传中'] ")
    private WebElement uploadingProgress;
    public WebElement getUploadingProgress() {
        return uploadingProgress;
    }

    @FindBy(xpath = "//li[contains(@yotta-test,'report-item')]")
    private WebElement li;

    @FindBy(xpath = "//div[@yotta-test='report-trend_selector-dropdown']//*[text()='添加']")
    private WebElement trendList;  //添加趋势图
    public WebElement getTrendList() {
        ClickEvent.clickUnderneathButton(trendList);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        String className = "yotta-dropdown-menu";
        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    public WebElement getTrendListButton() {
        return trendList;
    }

    @FindBy(xpath = "(//ancestor::div[contains(@class,'accordion-header')]//span[contains(@aria-label,'Add')])[last()]")
    private WebElement selectedTrend;
    public WebElement getSelectedTrend() {
        return selectedTrend;
    }

    @FindBy(xpath = "//div[contains(@class,'accordion')]//*[contains(@aria-label,'Close')]")
    private WebElement deleteTrend;
    public WebElement getDeleteTrend(){
        return deleteTrend;
    }

    @FindBy(className = "yotta-empty-description")
    private WebElement resultMessage;
    public WebElement getResultMessage() {
        return resultMessage;
    }

    @FindBy(xpath = "//div[contains(@class,'file-upload')]")
    private WebElement uploadedFile;
    public WebElement getUploadedFile() {
        return uploadedFile;
    }
}