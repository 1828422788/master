package com.yottabyte.pages.fulllink;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.pages.splSearch.SearchPage;
import com.yottabyte.utils.GetTime;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1600, 900));
    }

    @FindBy(xpath = "//label[contains(@class,yotta-switch-round)]")
    private WebElement switchEdit;
    public WebElement getSwitch() {
        return switchEdit;
    }

    @FindBy(xpath = "//span[text()='保存']/parent::button[contains(@class,'disabled')]")
    private WebElement disabledSave;
    public WebElement getDisabledSave() {
        return disabledSave;
    }

    @FindBy(xpath ="//div[@class='yotta-dropdown-menu']//ul")
    private WebElement dropdownList;

    @FindBy(xpath = "//span[@aria-label='SettingOutlined']/parent::button")
    private WebElement settings;
    public WebElement getSettings(){
        settings.click();
        return dropdownList;
    }

    @FindBy(xpath = "//span[@aria-label='GalaxeeOutlined']/parent::button")
    private WebElement dataConfig;
    public WebElement getDataConfig(){
        return dataConfig;
    }

    @FindBy(xpath = "//div[contains(@class,'yotta-textarea')]//textarea")
    private WebElement timelineSPL;
    public WebElement getTimelineSPL() {
        return timelineSPL;
    }

    public WebElement getSave() {
        return getYottaButtonByText("保存");
    }

    public WebElement getEnsure() {
        return getYottaButtonByText("确定");
    }

    public WebElement getRequestData() {
        return getYottaButtonByText("请求数据");
    }

    public WebElement getPreview() {
        return getYottaButtonByText("预览该链路图");
    }

    public WebElement getFieldName() {
        return getInputElement("名称关联字段");
    }

    public WebElement getTimestamp() {
        return getInputElement("时间戳关联字段");
    }

    public WebElement getStartField() {
        return getInputElement("边起始关联字段");
    }

    public WebElement getEndField() {
        return getInputElement("边结束关联字段");
    }

    public WebElement getNameSeparator() {
        return getInputElement("名称分割符");
    }

    public WebElement getLayerNumber() {
        return getInputElement("名称分割层数");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//div[text()='" + name + "']/following-sibling::div//input"));
    }
}
