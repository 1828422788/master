package com.yottabyte.pages.agent;

import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj,sunxc
 */
public class ListPage extends ListPageFactory {
    @FindBy(className = "_2FuqHHfRc-c7BJzf3RvYta")
    private WebElement agentGroup;

    @FindBy(xpath = "//input[contains(@placeholder,'模糊搜索主机名')]")
    private WebElement hostname;


    public WebElement getAgentGroupButton(){
        return super.getButton("分组设置");
    }


    public WebElement getHostname() {
        return hostname;
    }

    public WebElement getRemark() {
        String xpath = "//input[contains(@placeholder,'模糊搜索备注')]";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getVersion() {
        String xpath = "//input[contains(@placeholder,'精确搜索版本号')]";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getEnsureButton() {
        String xpath = "//span[text()='确定']/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getResetButton() {
        String xpath = "//span[text()='清空筛选']";
        return webDriver.findElement(By.xpath(xpath));
    }


    public WebElement getSeniorfilterButton() {
        String xpath = "//span[text()='高级']/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getInputElement(String text) {
        String xpath = "//input[contains(@placeholder,' " + text + "')]";
        return webDriver.findElement(By.xpath(xpath));

    }

    public WebElement getMemo() {
        String xpath = "//input[contains(@placeholder,'请填写备注')]";
        return webDriver.findElement(By.xpath(xpath));

    }

    public WebElement getType(){
        String xpath = "//div/label[contains(@title,'类型')]/following::span/i";
        DropdownUtils dropdownUtils = new DropdownUtils();
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getLastDropdownList();
    }

    public WebElement getIP(){
        String xpath = "//input[contains(@placeholder,'模糊搜索 IP')]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getChangeMemoButton(){
        String xpath = "//span/a[text()='修改备注']";
        return webDriver.findElement(By.xpath(xpath));
    }
//    public WebElement getChangeMemoButton(){
//        String xpath = "//span/a[text()='修改备注']";
//        return webDriver.findElement(By.xpath(xpath));
//    }
    public WebElement getOprationElement(String text) {
        String xpath = "//span[text()='192.168.1.136']/ancestor::td/following-sibling::td/span/a[text()=' " + text + "']";
        return webDriver.findElement(By.xpath(xpath));

    }

    public WebElement getMemoError(){
        String xpath = "//div[@class='ant-form-explain']";
        WebElement element =  webDriver.findElement(By.xpath(xpath));
        return element;
    }


    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAgentGroup() {
        return agentGroup;
    }

    public WebElement getComplete() {
        return super.getButton("完成");
    }
}
