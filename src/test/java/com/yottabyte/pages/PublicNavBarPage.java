package com.yottabyte.pages;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.GetLogger;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * 导航栏页面元素
 */
public class PublicNavBarPage extends PageTemplate {

    public PublicNavBarPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(partialLinkText = "搜索")
    private WebElement locateSearchPage;

    @FindBy(partialLinkText = "监控")
    private WebElement alertsListPage;

    @FindBy(partialLinkText = "知识")
    private WebElement knowledgePage;

    @FindBy(partialLinkText = "定时任务")
    private WebElement timedTaskPage;

    @FindBy(id = "yw-nav-set")
    private WebElement systemSetButton;

    @FindBy(partialLinkText = "资源分组")
    private WebElement resourceGroupsPage;

    @FindBy(partialLinkText = "用户分组")
    private WebElement userGroupsPage;

    @FindBy(partialLinkText = "用户管理")
    private WebElement usersPage;

    @FindBy(partialLinkText = "告警插件")
    private WebElement alertPluginsPage;

    @FindBy(partialLinkText = "角色权限")
    private WebElement rolesPage;

    @FindBy(partialLinkText = "关联搜索")
    private WebElement customApplicationPage;

    @FindBy(partialLinkText = "仪表盘")
    private WebElement dashboard;

    @FindBy(partialLinkText = "报表")
    private WebElement report;

    @FindBy(partialLinkText = "趋势图")
    private WebElement trend;

    @FindBy(className = "el-loading-mask")
    private WebElement loadingElement;

    @FindBy(className = "icon-shezhi_icon")
    private WebElement setting;

    @FindBy(xpath = "//span[text()='资源']/ancestor::p//following-sibling::div/a")
    private List<WebElement> resourceList;

    @FindBy(xpath = "//span[text()='数据']/ancestor::p//following-sibling::div/a")
    private List<WebElement> dataList;

    @FindBy(xpath = "//span[text()='权限']/ancestor::p//following-sibling::div/a")
    private List<WebElement> authorityList;

    @FindBy(xpath = "//span[text()='您暂无设置权限。']")
    private WebElement nonPrivileged;

    public WebElement getNonPrivileged() {
        return nonPrivileged;
    }

    public WebElement getResource1() {
        return resourceList.get(0);
    }

    public WebElement getResource2() {
        return resourceList.get(1);
    }

    public WebElement getResource3() {
        return resourceList.get(2);
    }

    public WebElement getResource4() {
        return resourceList.get(3);
    }

    public WebElement getResource5() {
        return resourceList.get(4);
    }

    public WebElement getResource7() {
        return resourceList.get(6);
    }

    public WebElement getResource8() {
        return resourceList.get(7);
    }

    public WebElement getResource9() {
        return resourceList.get(8);
    }

    public WebElement getResource10() {
        return resourceList.get(9);
    }

    public WebElement getResource11() {
        return resourceList.get(10);
    }

    public WebElement getResource12() {
        return resourceList.get(11);
    }

    public WebElement getData1() {
        return dataList.get(0);
    }

    public WebElement getData2() {
        return dataList.get(1);
    }

    public WebElement getData3() {
        return dataList.get(2);
    }

    public WebElement getData5() {
        return dataList.get(4);
    }

    public WebElement getData6() {
        return dataList.get(5);
    }

    public WebElement getAuthority1() {
        return authorityList.get(0);
    }

    public WebElement getAuthority2() {
        return authorityList.get(1);
    }

    public WebElement getAuthority3() {
        return authorityList.get(2);
    }

    public WebElement getAuthority4() {
        return authorityList.get(3);
    }

    public WebElement getSetting() {
        return setting;
    }

    public WebElement getDashboard() {
        return dashboard;
    }

    public WebElement getReport() {
        return report;
    }

    public WebElement getTrend() {
        return trend;
    }

    public WebElement getTimedTaskPage() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(timedTaskPage));
        return timedTaskPage;
    }

    public WebElement getLocateSearchPage() {
        return locateSearchPage;
    }

    public WebElement getAlertsListPage() {
        return alertsListPage;
    }

    public WebElement getKnowledgePage() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(knowledgePage));
        return knowledgePage;
    }

    public WebElement getResourceGroupsPage() {
        waitElementToBeClickable(resourceGroupsPage);
        return resourceGroupsPage;
    }

    public WebElement getUserGroupsPage() {
        waitElementToBeClickable(userGroupsPage);
        return userGroupsPage;
    }

    public WebElement getUsersPage() {
        waitElementToBeClickable(usersPage);
        return usersPage;
    }

    public WebElement getAlertPluginsPage() {
        waitElementToBeClickable(alertPluginsPage);
        return alertPluginsPage;
    }

    public WebElement getRolesPage() {
        waitElementToBeClickable(rolesPage);
        return rolesPage;
    }

    public WebElement getCustomApplicationPage() {
        waitElementToBeClickable(customApplicationPage);
        return customApplicationPage;
    }

    private void waitElementToBeClickable(WebElement element) {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(systemSetButton);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        systemSetButton.click();
        if (ElementExist.isElementExist(webDriver, loadingElement)) {
            WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loadingElement));
        }
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        expectedCondition = ExpectedConditions.elementToBeClickable(element);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }

    @Override
    protected void load() {
        if (LoginBeforeAllTests.getCookie() != null) {
            webDriver.get("http://alltest.rizhiyi.com/dashboard/");
            webDriver.manage().addCookie(LoginBeforeAllTests.getCookie());
        } else {
            LoginBeforeAllTests.login();
        }
    }

    @Override
    protected void isLoaded() throws Error {
        super.isLoaded();
        try {
            WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(getLocateSearchPage()));
        } catch (Exception e) {
            GetLogger.getLogger().error("can not load % with error %", this.getClass().getSimpleName(), e);
        }

    }
}
