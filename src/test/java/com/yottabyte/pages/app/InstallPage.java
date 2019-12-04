package com.yottabyte.pages.app;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class InstallPage extends PageTemplate {
    public InstallPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(xpath = "//span[text()='分组预览']/ancestor::div[@class='yw-one-step active']")
    private WebElement groupPreview;

    @FindBy(xpath = "(//td[@class='el-table_1_column_2'])[1]")
    private WebElement repeatResource;

    @FindBy(className = "icon-bianji")
    private WebElement editButton;

    @FindBy(className = "confirm_icon")
    private WebElement confirm;

    @FindBy(xpath = "//span[@class='confirm_icon']/preceding-sibling::input")
    private WebElement renameInput;

    @FindBy(xpath = "//span[contains(text(),'AutoTestSourceForApp')]")
    private WebElement editText;

    @FindBy(xpath = "//i[@class='el-icon-circle-check']/following-sibling::span")
    private WebElement importSuccess;

    @FindBy(xpath = "(//span[contains(@style,'background-color: yellow;')])[last()]")
    private WebElement resultDataset;

    @FindBy(className = "el-icon-search")
    private WebElement searchIcon;

    @FindBy(xpath = "//span[text()='读取资源包异常！']")
    private WebElement errorInfo;

    @FindBy(xpath = "//span[text()='没有相关的功能权限']")
    private WebElement noAuth;

    public WebElement getNoAuth() {
        return noAuth;
    }

    public WebElement getEnsure() {
        return super.getButton("确定");
    }

    public WebElement getResultDataset() {
        return resultDataset;
    }

    @Override
    public WebElement getSearchIcon() {
        return searchIcon;
    }

    public WebElement getSearchInput() {
        return super.findInputByPlaceholder("请输入关键字");
    }

    public WebElement getAddDataset() {
        return super.getButton("添加数据集");
    }

    public WebElement getImportSuccess() {
        return importSuccess;
    }

    public WebElement getEditText() {
        return editText;
    }

    public WebElement getRenameInput() {
        return renameInput;
    }

    public WebElement getConfirm() {
        return confirm;
    }

    public WebElement getEditButton() {
        return editButton;
    }

    public WebElement getRepeatResource() {
        return repeatResource;
    }

    public WebElement getRole() {
        return getDropdownList("分配角色");
    }

    public WebElement getResource() {
        return super.getDropdownList("日志来源");
    }

    public WebElement getDropdownList(String text) {
        String xpath = "//label[contains(text(),'" + text + "')]/following-sibling::div//i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }

    public WebElement getErrorInfo() {
        return errorInfo;
    }

    public WebElement getCompleteButton() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(super.getButton("下一步")));
        return super.getButton("完成");
    }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getGroupPreview() {
        return groupPreview;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }
}
