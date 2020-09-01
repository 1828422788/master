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
    DropdownUtils utils = new DropdownUtils();

    @FindBy(className = "ant-input")
    private WebElement searchInput;

    @FindBy(className = "ant-select-dropdown-menu")
    private WebElement selectDropdownMenu;

    @FindBy(xpath = "//p[text()='获取角色列表失败: Api 没有权限错误']")
    private WebElement noAuth;

    @FindBy(className = "ant-empty-description")
    private WebElement emptyData;

    @FindBy(className = "ant-input-search-icon")
    private WebElement searchIcon;

    @FindBy(className = "ant-message-success")
    private WebElement successMessage;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement message;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//*[@class='ant-select-selection__clear']")
    private WebElement removeTagIcon;

    @FindBy(xpath = "//div[@class='ant-modal-body']//div[contains(@class,'ant-select-selection--single')]")
    private WebElement authDropdown;

    @FindBy(xpath = "//div[text()='请选择应用']")
    private WebElement app;

    public WebElement getApp() {
        app.click();
        return utils.getLastDropdownList();
    }

    public WebElement getAuthDropdown() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver,ExpectedConditions.visibilityOf(authDropdown));
        authDropdown.click();
        return utils.getLastDropdownList();
    }

    public WebElement getRemoveTagIcon() {
        return removeTagIcon;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getSearchIcon() {
        return searchIcon;
    }

    public WebElement getEmptyData() {
        return emptyData;
    }

    public WebElement getNoAuth() {
        return noAuth;
    }

    public ListPageFactory(WebDriver driver) {
        this.webDriver = driver;
//        this.webDriver.manage().window().fullscreen();
        PageFactory.initElements(driver, this);
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getTag() {
        return getInputElement("标签");
    }

    public WebElement getTagDropdown() {
        return selectDropdownMenu;
    }

    public WebElement getAppDropdown() {
        this.groupDropdownIcon("请选择应用").click();
        return this.lastDropdownMenu();
    }

    public WebElement getResourceDropdown() {
        this.groupDropdownIcon("全部资源").click();
        return this.lastDropdownMenu();
    }

    public WebElement getCreate() {
        return this.getButton("新建");
    }

    public WebElement getEnsure() {
        return this.getButton("确定");
    }

    public WebElement getSave() {
        return this.getButton("保存");
    }

    public WebElement getButton(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']//ancestor::button"));
    }

    public WebElement groupDropdownIcon(String text) {
        return webDriver.findElement(By.xpath("//div[text()='" + text + "']/ancestor::div/following-sibling::span/i"));
    }

    private WebElement lastDropdownMenu() {
        return webDriver.findElement(By.xpath("(//ul[@class='ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical'])[last()]"));
    }

    public WebElement getInputElement(String text) {
        String xpath = "//div[text()='" + text + "']//following-sibling::div//input";
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
        return utils.getLastDropdownList();
    }

    @Override
    protected void load() {
        System.out.println("load方法运行！");
    }

    @Override
    protected void isLoaded() throws Error {
        System.out.println("isloaded方法运行！");
    }

    public WebElement getPlaceholderInput(String placeholder) {
        return webDriver.findElement(By.xpath("(//input[@placeholder='" + placeholder + "'])[last()]"));
    }

    public WebElement getClearIcon(String text){
        String xpath = "//div[contains(text(),'"+ text + "')]/following-sibling::span/i[@aria-label='图标: close']";
        return webDriver.findElement(By.xpath(xpath));
    }
}
