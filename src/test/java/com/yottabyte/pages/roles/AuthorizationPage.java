package com.yottabyte.pages.roles;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.stepDefs.Pagination;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class AuthorizationPage extends PageTemplate {

    public AuthorizationPage(WebDriver driver) {
        super(driver);
    }

    private WebElement webElement;

    @FindBy(className = "ant-spin-spinning")
    private WebElement loading;

    @FindBy(xpath = "//div[not(contains(@style,'display: none;'))][@class='assign-tab']")
    private WebElement tab;

    @FindBy(className = "function-checkbox")
    private List<WebElement> functionCheckboxes;

    @FindBy(className = "url-checkbox")
    private List<WebElement> urlCheckboxes;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(className = "el-input__inner")
    private WebElement maxTime;

    @FindBy(className = "url-checkbox")
    private WebElement checkboxGroup;

    @FindBy(xpath = "//label[contains(text(),'最大搜索时长')]/following-sibling::div//input")
    private WebElement maxLength;

    @FindBy(className = "function-checkbox")
    private WebElement functionCheckbox;

    @FindBy(xpath = "(//span[text()='自定义']/ancestor::label)[last()]")
    private WebElement customize;

    @FindBy(className = "ant-calendar-picker-icon")
    private WebElement dateEditor;

    @FindBy(className = "ant-calendar-input")
    private WebElement timeInput;

    @FindBy(className = "ant-calendar-ok-btn")
    private WebElement ensureTime;

    @FindBy(xpath = "//span[text()='新建用户']/preceding-sibling::span")
    private WebElement createUser;

    @FindBy(xpath = "(//a[text()='定时任务'])[last()]")
    private WebElement schedule;

    @FindBy(xpath = "(//a[text()='趋势图'])[last()]")
    private WebElement trend;

    @FindBy(xpath = "(//a[text()='报表'])[last()]")
    private WebElement report;

    @FindBy(xpath = "(//a[text()='监控'])[last()]")
    private WebElement alert;

    @FindBy(xpath = "(//a[text()='知识'])[last()]")
    private WebElement knowledge;

    public WebElement getIndex() {
        return this.getSubMenuButton("索引");
    }

    public WebElement getAgent() {
        return this.getMenuButton("Agent 管理");
    }

    public WebElement getResourceAuth() {
        return this.getFunctionButton("资源权限");
    }

    public WebElement getData() {
        return this.getFunctionButton("数据");
    }

    public WebElement getResource() {
        return this.getFunctionButton("资源");
    }

    public WebElement getApp() {
        return this.getFunctionButton("应用");
    }

    public WebElement getSearch() {
        return this.getFunctionButton("搜索");
    }

    public WebElement getKnowledge() {
        return knowledge;
    }

    public WebElement getAlert() {
        return alert;
    }

    public WebElement getReport() {
        return report;
    }

    public WebElement getTrend() {
        return trend;
    }

    public WebElement getSchedule() {
        return schedule;
    }

    public WebElement getDashboard() {
        return this.getFunctionButton("仪表盘");
    }

    public WebElement getResourceName(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']/preceding-sibling::label"));
    }

    public WebElement getCreateUser() {
        return createUser;
    }

    public WebElement getEnsureTime() {
        return ensureTime;
    }

    public WebElement getTimeInput() {
        return timeInput;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getCustomize() {
        return customize;
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getFunctionCheckbox() {
        return functionCheckbox;
    }

    public WebElement getMaxLength() {
        return maxLength;
    }

    public WebElement getCheckboxGroup() {
        return checkboxGroup;
    }

    public WebElement getMaxTime() {
        return maxTime;
    }

    public WebElement getSaveButton() {
        return super.getButton("保存");
    }

    public WebElement getRecall() {
        return super.getButton("撤销修改");
    }

    public WebElement getTabButton(String tabName) {
        String xpath = "//div[text()='" + tabName + "']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getCreateGroupButton(String value) {
        return tab.findElement(By.xpath("//span[contains(text(),'" + value + "')]/preceding-sibling::span"));
    }

    public WebElement getCreateUnitButton(String value) {
        return tab.findElement(By.xpath("//span[text()='" + value + "']/preceding-sibling::span"));
    }

    public List<WebElement> getGroupManagement(String targetName) {
        webElement = getElementFromTable(targetName);
        return webElement.findElements(By.tagName("td")).get(2).findElements(By.className("el-checkbox"));
    }

    public List<WebElement> getIntraGroupManagement(String targetName) {
        return getElementFromTable(targetName).findElements(By.tagName("td")).get(3).findElements(By.className("el-checkbox"));
    }

    public WebElement getChooseAllCheckBoxes() {
        return tab.findElement(By.className("el-checkbox__input"));
    }

    public List<WebElement> getFunctionCheckboxes() {
        return functionCheckboxes;
    }

    public List<WebElement> getUrlCheckboxes() {
        return urlCheckboxes;
    }

    public WebElement getSearchTime() {
        return tab.findElement(By.tagName("input"));
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    private WebElement getElementFromTable(String targetName) {
        WebElement tr = Pagination.forEachThePaginationDesc(tab, 2, targetName);
        return tr;
    }

    private WebElement getFunctionButton(String functionName) {
        String xpath = "//div[text()='" + functionName + "']";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement getMenuButton(String menuName) {
        String xpath = "//p[text()='" + menuName + "']";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement getSubMenuButton(String name) {
        String xpath = "//div[text()='" + name + "']";
        return webDriver.findElement(By.xpath(xpath));
    }

    @Override
    protected void load() {
        webDriver.get("http://" + config.get("rizhiyi_server_host") + "/account/roles/");
        LoginBeforeAllTests.login();
        webDriver.get("http://" + config.get("rizhiyi_server_host") + "/account/roles/");
    }

//    @Override
//    protected void isLoaded() throws Error {
//        try {
//            WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loading));
//            assertTrue(webDriver.getCurrentUrl().contains("/account/roles/"));
//        } catch (Exception e) {
//            throw new Error("Cannot locate account roles page");
//        }
//    }

//    public static void main(String[] args) throws InterruptedException {
//        SharedDriver driver = new SharedDriver();
//        ConfigManager c = new ConfigManager();
//        LoginBeforeAllTests login = new LoginBeforeAllTests(driver, c);
//        login.beforeScenario();
//        Thread.sleep(3000);
//        driver.get("http://192.168.1.139/account/roles/assign/1/");
//        LoginBeforeAllTests.setPageFactory("roles.AuthorizationPage");
//        ICheckValuesFromCheckBox checkBox = new ICheckValuesFromCheckBox();
//        List<String> list = new ArrayList<>();
//        list.add("读取");
//        list.add("编辑");
//        checkBox.iCheckFromThe(list, "{'GroupManagement':['AutoTest']}");
//    }

}
