package com.yottabyte.pages.agent;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxc, sunxj
 */
public class GroupPage extends PageTemplate {
    @FindBy(xpath = "//span[text()='TestAuth']")
    private WebElement testAuth;

    @FindBy(xpath = "//td//div[contains(text(),'English')]/ancestor::td/following-sibling::td//span[contains(text(),'编辑')]/ancestor::button")
    private WebElement EditButton;

    @FindBy(xpath = "//div/h1")
    private WebElement Title;

    @FindBy(xpath = "//td//div[contains(text(),'English')]/ancestor::td/following-sibling::td//span[contains(text(),'删除')]/ancestor::button")
    private WebElement DeleteAgentGroupButton;

    @FindBy(xpath = "//div[@class='el-message-box__message']/p")
    private WebElement Finalmessage;

    @FindBy(xpath = "//textarea[contains(@placeholder,'请输入描述')]")
    private WebElement Description;

    @FindBy(xpath = "//div[text()='采集配置']")
    private WebElement Addgroupinput;

    public GroupPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAgentName(String name) {
        String xpath = "//span[text()='" + name + "']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getAddDataSource() {
        return super.getContainsTextButton("分组数据源");
    }

    public WebElement getTestAuth() {
        return testAuth;
    }

    @FindBy(xpath = "(//input[contains(@placeholder,'名称')])[2]")
    private WebElement Name;

    public WebElement getName() {
        return Name;
    }

    public WebElement getSearchName() {
        return getelement("搜索");
    }

    public WebElement getDescription() {
        return Description;
    }

    public WebElement getCreateAgentGroupButton() {
        return super.getButton("新建 Agent 分组");
    }

    public WebElement getBack() {
        return super.getYottaButtonByText("返回");
    }

    public WebElement getRole() {
        String xpath = "//div[@class='yotta-select-selection-tags']/span";
        DropdownUtils dropdownUtils = new DropdownUtils();
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getLastDropdownList();
    }

    public WebElement getEditButton() {
        return EditButton;
    }

    public WebElement getTitle() {
        return Title;
    }

    public WebElement getDeleteAgentGroupButton() {
        return DeleteAgentGroupButton;
    }

    public WebElement getSave() {
        return super.getYottaButtonByText("保存");
    }

    public WebElement getUpdate() {
        return super.getYottaButtonByText("更新");
    }

    public WebElement getMore() {
        return More;
    }
    @FindBy(xpath = "//span[@aria-label='Delete']")
    private WebElement More;

    public WebElement getAddgroupinput() {
//        return super.getButton("采集配置");
        return Addgroupinput;
    }

    public WebElement getAddgroupinputbutton() {
//        return super.getButton("添加「sunxctest」分组数据源");
        return super.getButton("添加");
    }

    @FindBy(xpath = "//span[text()='删除']")
    private WebElement Delete;

    public WebElement getDelete() {
        return Delete;
    }

    public WebElement getJump() {
        return Jump;
    }

    @FindBy(xpath = "//span[text()='跳转']")
    private WebElement Jump;

    @Override
    public WebElement getSearchInput() {
        return searchInput;
    }

    @FindBy(xpath = "//p/span[text()='sunxctest']")
    private WebElement OpenGroupButton;

    @FindBy(xpath = "//p/span[text()='中文中文']")
    private WebElement Deleteone;

    @FindBy(xpath = "//p/span[text()='中文角色']")
    private WebElement Deletetwo;

    @FindBy(xpath = "//span[text()='没有相关资源权限']")
    private WebElement notice;

    public WebElement getNotice() {
        return notice;
    }

    public WebElement getDeletetwo() {
        return Deletetwo;
    }

    public WebElement getDeleteone() {

        return Deleteone;
    }

    public WebElement getDeletethree() {

        return Deletethree;
    }

    @FindBy(xpath = "//div[@yotta-test='dialog-content-dom']/p")
    private WebElement errorMessage;

    public WebElement getErrorMessage() { return errorMessage; }

    @FindBy(xpath = "//p/span[text()='sunxc_test']")
    private WebElement Deletethree;

    public WebElement getDeletefour() {
        return Deletefour;
    }

    @FindBy(xpath = "//p/span[text()='sunxctest']")
    private WebElement Deletefour;

    public WebElement getOpenGroupButton() {
        return OpenGroupButton;
    }

    @FindBy(xpath = "//div[text()='请务必输入此条目']")
    private WebElement searchInput;

    public WebElement getSearchRole() {
        return searchRole;
    }

    @FindBy(xpath = "//div/div[@class='yotta-select-selection-content']/div")
    private WebElement searchRole;

    @FindBy(xpath = "//span[@class='yotta-message-content']")
    private WebElement Addsuccessmsg;
    public WebElement getAddsuccessmsg() {
        return Addsuccessmsg;
    }
    @FindBy(xpath = "//p[contains(text(),'API: 操作失败，原因：')]")
    private WebElement Addfailmsg;
    public WebElement getAddfailmsg() {
        return Addfailmsg;
    }
    public WebElement getMessage() {
        return webDriver.findElement(By.xpath("//div[@class='ant-modal-body']//p"));
    }
    public WebElement getFinalmessage() {
        return Finalmessage;
    }

    @FindBy(className = "el-message-box__message")
    private WebElement successMessage;

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getEnsure() {
        return super.getButton("确定");
    }

    public WebElement getelement(String text) {
        return webDriver.findElement(By.xpath("//input[contains(@placeholder,'" + text + "')]"));
    }

}
