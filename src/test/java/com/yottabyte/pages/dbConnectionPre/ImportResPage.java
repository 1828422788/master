package com.yottabyte.pages.dbConnectionPre;

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
public class ImportResPage extends PageTemplate {
    public ImportResPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[text()='上传完成']")
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

    @FindBy(xpath = "//span[text()='AutoTestApp']")
    private WebElement resultDataset;

    @FindBy(xpath = "//span[text()='app']")
    private WebElement resultAppDataset;

    @FindBy(xpath = "//span[text()='没有相关的功能权限']")
    private WebElement noAuth;

    @FindBy(xpath = "//span[text()='没有相关的资源权限']")
    private WebElement noResourceAuth;

    @FindBy(xpath = "//div[@yotta-test='resource-assign_role-select']/div")
    private WebElement roleList;

    public WebElement getRoleList() {
        roleList.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//label[text()='分配角色']/following::div[@yotta-test='resource-assign_role-select']/div")
    private WebElement role;

    public WebElement getRole() {
        role.click();
        return super.getLastDropdownList();
    }

    //@FindBy(id = "register_upload")
    @FindBy(xpath = "//span[@class='yotta-filepicker-input']/input[@type='file']")
    private WebElement upload;

    public WebElement getUpload() {
        return upload;
    }

    @FindBy(xpath = "//a[@yotta-test='resource-pointer-link'][text()='添加数据集']")
    private WebElement addDataset;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement message;

    @FindBy(xpath = "//p[text()='资源包导入完成！']")
    private WebElement addSuccMessage;

    public WebElement getAddSuccMessage() {
        return addSuccMessage;
    }

    public WebElement getResultAppDataset() {
        return resultAppDataset;
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
        return super.findInputByPlaceholder("请输入");
    }

    public WebElement getAddDataset() {
        return addDataset;
    }

    @FindBy(xpath = "//div[@class='ant-spin-container']/p")
    private WebElement importSuccess;

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

    public WebElement getResource() {
        return dropdownUtils.getDropdownListByLabel("日志来源");
    }

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }

    @FindBy(xpath = "//span[text()='完成']/parent::button")
    private WebElement completeButton;
    public WebElement getCompleteButton() {
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(super.getButton("完成")));
//        return super.getButton("完成");
        return completeButton;
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
}
