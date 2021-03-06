package com.yottabyte.pages.app;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class InstallPage extends EditorPage {
    public InstallPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='上传完成']")
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

   @FindBy(xpath = "//div[@class='yotta-empty-description']")
    private WebElement importSuccess;

    @FindBy(xpath = "//span[text()='AutoTestApp']")
    private WebElement resultDataset;

    @FindBy(xpath = "//span[text()='app']")
    private WebElement resultAppDataset;

    @FindBy(xpath = "//span[text()='没有相关的功能权限']")
    private WebElement noAuth;

    @FindBy(xpath = "//span[text()='没有相关的资源权限']")
    private WebElement noResourceAuth;

    @FindBy(xpath = "//input[@yotta-test='application-upload-file_upload']")
    private WebElement upload;

    @FindBy(className = "yotta-select-selection-placeholder")
    private WebElement role;

    @FindBy(xpath = "//span[text()='添加数据集']")
    private WebElement addDataset;

    @FindBy(xpath = "//div[@class='yotta-dialog-content']//p")
    private WebElement message;

    @FindBy(xpath = "//button[@yotta-test='step-done-button']/span[@class='yotta-button-content']")
    private WebElement doneMessage;

    @FindBy (xpath = "//button[@yotta-test='step-done-button']")
    private WebElement doneButton;

    public WebElement getResultAppDataset() {
        return resultAppDataset;
    }

    public WebElement getUpload() {
        return upload;
    }

    public WebElement getNoResourceAuth() {
        return noResourceAuth;
    }

    public WebElement getNoAuth() {
        return noAuth;
    }

    public WebElement getEnsure() {
        return super.getButton("确定");
    }

    public WebElement getResultDataset() {
        return resultDataset;
    }

    public WebElement getSearchInput() {
        return super.getInputByPlaceholder("请输入名称");
    }

    public WebElement getAddDataset() {
        return addDataset;
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
        role.click();
        return super.getLastDropdownList();
    }

    public WebElement getResource() {
        return dropdownUtils.getDropdownListByLabel("日志来源");
    }

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }

    public WebElement getDoneButton() {
        return doneButton;
    }

    public WebElement getDoneMessage() {
        return doneMessage;
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
        return message;
    }

    public WebElement getDone() {
        return super.getButton("完成");
    }
}
