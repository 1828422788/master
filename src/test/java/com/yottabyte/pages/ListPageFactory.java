package com.yottabyte.pages;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.LoadableComponent;

/**
 * @author sunxj
 */
public class ListPageFactory extends LoadableComponent<ListPageFactory> {
    public static ConfigManager config = new ConfigManager();
    public WebDriver webDriver;
    public DropdownUtils dropdownUtils = new DropdownUtils();

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement searchInput;

    @FindBy(className = "yotta-select-menu")
    private WebElement selectDropdownMenu;

    @FindBy(xpath = "//p[text()='获取角色列表失败: Api 没有权限错误']")
    private WebElement noAuth;

    @FindBy(className = "ant-empty-description")
    private WebElement emptyData;

    @FindBy(xpath = "//span[@aria-label='Search']")
    private WebElement search;

    @FindBy(className = "yotta-message-content")
    private WebElement successMessage;

    @FindBy(xpath = "//div[@class='yotta-dialog-content']/p")
    private WebElement message;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//*[@class='ant-select-selection__clear']")
    private WebElement removeTagIcon;

    @FindBy(xpath = "//div[@class='yotta-modal-body']//div[contains(@class,'yotta-dropdown')]")
    private WebElement authDropdown;

    @FindBy(xpath = "//*[text()='请选择应用']")
    private WebElement app;

    @FindBy(xpath = "//span[@class='ant-badge']/i")
    private WebElement userIcon;

    @FindBy(xpath = "//div[@class='ant-popover-inner-content']//p")
    private WebElement loginUserName;

    public WebElement getUserIcon() {
        return userIcon;
    }

    public WebElement getLoginUserName() {
        return loginUserName;
    }

    @FindBy(xpath = "//span[contains(text(),'请选择')]/ancestor::span[contains(@class,'button')]")
    private WebElement selectBatchOperation;

    @FindBy(xpath = "//span[contains(text(),'启动')]/ancestor::li")
    private WebElement enableResources;

    @FindBy(xpath = "//span[contains(text(),'停止')]/ancestor::li")
    private WebElement disableResources;

    @FindBy(xpath = "//span[contains(text(),'添加资源标签')]/ancestor::li")
    private WebElement addResourceTags;

    @FindBy(xpath = "//span[contains(text(),'删除')]/ancestor::li")
    private WebElement deleteResources;

    @FindBy(xpath = "//span[contains(text(),'下载')]/ancestor::li")
    private WebElement downloadResources;

    @FindBy(xpath = "//div[@class='ant-modal-root']//*[contains(@class, \"ant-modal\")]")
    private WebElement modal;

    @FindBy(xpath = "//thead//span[@class='yotta-checkbox-check']")
    private WebElement selectAll;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement tag;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']")
    private WebElement tagField;

    @FindBy(xpath = "//div[contains(@class,'spinner')]")
    private WebElement loading;

    @FindBy(xpath = "//*[contains(text(),'暂无数据')]")
    private WebElement noData;

    public WebElement getNoData() {
        return noData;
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getTagField() {
        tagField.click();
        return this.getLastDropdownList();
    }

    public WebElement getSelectAll() {
        return selectAll;
    }

    public WebElement getApp() {
        app.click();
        return dropdownUtils.getLastDropdownList();
    }


    public WebElement getAuthDropdown() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(authDropdown));
        authDropdown.click();
        return dropdownUtils.getParentElementOfMenuList();
    }

    public WebElement getRemoveTagIcon() {
        return removeTagIcon;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getSearch() {
        return search;
    }

    public WebElement getSearchIcon() {
        return search;
    }

    public WebElement getEmptyData() {
        return emptyData;
    }

    public WebElement getNoAuth() {
        return noAuth;
    }

    public ListPageFactory(WebDriver driver) {
        this.webDriver = driver;
        PageFactory.initElements(driver, this);
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getTag() {
        return tag;
    }

    public WebElement getTagDropdown() {
        return selectDropdownMenu;
    }

    public WebElement getAppDropdown() {
        this.groupDropdownIcon("请选择应用").click();
        return selectDropdownMenu;
    }

    public WebElement getResourceDropdown() {
        this.groupDropdownIcon("请选择标签").click();
        return selectDropdownMenu;
    }

    public WebElement getCreate() {
        return this.getButton("新建");
    }

    public WebElement getEnsure() {
        return this.getButton("确定");
    }

    public WebElement getCancel() {
        return this.getButton("取消");
    }

    public WebElement getSave() {
        return this.getButton("保存");
    }

    public WebElement getApply() {
        return this.getButton("应用");
    }

    public WebElement getButton(String name) {
        return webDriver.findElement(By.xpath("(//span[text()='" + name + "']//ancestor::button)[last()]"));
    }

    public WebElement groupDropdownIcon(String text) {
        return webDriver.findElement(By.xpath("//*[text()='" + text + "']/ancestor::div[2]"));
    }

    public WebElement getInputElement(String text) {
        String xpath = "//label[text()='" + text + "']/ancestor::div/following-sibling::div//input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getContainsTextButton(String text) {
        String xpath = "//span[contains(text(),'" + text + "')][not(@class)]//ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getLastDropdownList() {
        return dropdownUtils.getLastDropdownList();
    }

    public WebElement getClearIcon(String text) {
        String xpath = "//div[contains(text(),'" + text + "')]/following-sibling::span/i[@aria-label='图标: close']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getBatchControl() {
        return this.getButton("批量操作");
    }

    public WebElement getSelectBatchOperation() {
        return selectBatchOperation;
    }

    public WebElement getCompleteBatchControl() {
        return this.getButton("完成");
    }

    public WebElement getEnableResources() {
        return enableResources;
    }

    public WebElement getDisableResources() {
        return disableResources;
    }

    public WebElement getAddResourceTags() {
        return addResourceTags;
    }

    public WebElement getDeleteResources() {
        return deleteResources;
    }

    public WebElement getDownloadResources() {
        return downloadResources;
    }

    public WebElement getModal() {
        return modal;
    }

    @FindBy(xpath = "//div[@yotta-test='table-filter_tag-select']//input")
    private WebElement globalTagInput;
    public WebElement getGlobalTagInput() {
        webDriver.findElement(By.xpath("//div[@yotta-test='table-filter_tag-select']")).click();
        return globalTagInput;
    }

    @Override
    protected void load() {

    }

    @Override
    protected void isLoaded() throws Error {

    }
}
