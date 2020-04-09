package com.yottabyte.pages.SIEM;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxc
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath =  "//li[text()='快速新增']")
    private WebElement Quickadd;


    public WebElement getQuickadd() {
        return Quickadd;
    }

    public WebElement getAddAsset() {

        return AddAsset;
    }

    @FindBy(xpath =  "//div[text()='新增资产']")
    private WebElement AddAsset;

    public WebElement getAssetName() {
        return AssetName;
    }

    @FindBy(xpath = "//label[contains(text(),'资产名称')]/following-sibling::div//input" )
    private WebElement AssetName;

    public WebElement getIpName() {
        return IpName;
    }

    @FindBy(xpath = "//label[contains(text(),'IP地址')]/following-sibling::div//input")
    private WebElement IpName;

    public WebElement getSave() {
        return super.getContainsTextButton("保存");
    }

    public WebElement getMessage() {
        return Message;
    }

    @FindBy(xpath = "//div[@class='el-notification']")
    private WebElement Message;




}
