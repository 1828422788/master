package com.yottabyte.pages.system;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class TimeShortcutsConfig extends PageTemplate {
    public TimeShortcutsConfig(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1920,1080));
    }

    @FindBy(xpath = "//input[@class='ant-input']")
    private WebElement searchBox;

    public WebElement getSearchBox() { return searchBox; }

    @FindBy(xpath = "//span[text()='所有时间']")
    private WebElement wholeTimeText;

    public WebElement getWholeTimeText() { return wholeTimeText; }

    @FindBy(xpath = "//a[text()='返回']")
    private WebElement backButton;

    public WebElement getBackButton() { return backButton; }

    @FindBy(xpath = "//span[text()='所有时间']/parent::td/following-sibling::td//a[text()='编辑']")
    private WebElement wholeTimeEdit;

    public WebElement getWholeTimeEdit() { return wholeTimeEdit; }

    @FindBy(xpath = "//div[@id='所有时间']/div[@class='ant-table-wrapper']//input[1]")
    private WebElement wholeTimeNameInput;

    public WebElement getWholeTimeNameInput() { return wholeTimeNameInput; }

    @FindBy(xpath = "//a[text()='保存']")
    private WebElement wholeTimeSave;

    public WebElement getWholeTimeSave() { return wholeTimeSave; }

    @FindBy(xpath = "//a[text()='取消']")
    private WebElement wholeTimeCancel;

    public WebElement getWholeTimeCancel() { return wholeTimeCancel; }

    @FindBy(xpath = "//div[text()='相对']/i[1]")
    private WebElement addRelativeTimeShortcut;

    public WebElement getAddRelativeTimeShortcut() { return addRelativeTimeShortcut; }

    @FindBy(xpath = "//div[text()='最近']/i[1]")
    private WebElement addRecentTimeShortcut;

    public WebElement getAddRecentTimeShortcut() { return addRecentTimeShortcut; }

    @FindBy(xpath = "//div[text()='实时']/i[1]")
    private WebElement addActualTimeShortcut;

    public WebElement getAddActualTimeShortcut() { return addActualTimeShortcut; }

    @FindBy(xpath = "//div[text()='其他']/i[1]")
    private WebElement addOtherTimeShortcut;

    public WebElement getAddOtherTimeShortcut() { return addOtherTimeShortcut; }

    @FindBy(xpath = "(//div[text()='相对']/following-sibling::div//input)[1]")
    private WebElement newShowName;

    public WebElement getNewShowName() { return newShowName; }

    @FindBy(xpath = "(//div[text()='相对']/following-sibling::div//input)[2]")
    private WebElement newStartTime;

    public WebElement getNewStartTime() { return newStartTime; }

    @FindBy(xpath = "(//div[text()='相对']/following-sibling::div//input)[3]")
    private WebElement newEndTime;

    public WebElement getNewEndTime() { return newEndTime; }

    @FindBy(xpath = "(//div[text()='最近']/following-sibling::div//input)[1]")
    private WebElement newShowNameRecent;

    public WebElement getNewShowNameRecent() { return newShowNameRecent; }

    @FindBy(xpath = "(//div[text()='最近']/following-sibling::div//input)[2]")
    private WebElement newStartTimeRecent;

    public WebElement getNewStartTimeRecent() { return newStartTimeRecent; }

    @FindBy(xpath = "(//div[text()='最近']/following-sibling::div//input)[3]")
    private WebElement newEndTimeRecent;

    public WebElement getNewEndTimeRecent() { return newEndTimeRecent; }

    @FindBy(xpath = "(//div[text()='实时']/following-sibling::div//input)[1]")
    private WebElement newShowNameActual;

    public WebElement getNewShowNameActual() { return newShowNameActual; }

    @FindBy(xpath = "(//div[text()='实时']/following-sibling::div//input)[2]")
    private WebElement newStartTimeActual;

    public WebElement getNewStartTimeActual() { return newStartTimeActual; }

    @FindBy(xpath = "(//div[text()='实时']/following-sibling::div//input)[3]")
    private WebElement newEndTimeActual;

    public WebElement getNewEndTimeActual() { return newEndTimeActual; }

    @FindBy(xpath = "(//div[text()='其他']/following-sibling::div//input)[1]")
    private WebElement newShowNameOther;

    public WebElement getNewShowNameOther() { return newShowNameOther; }

    @FindBy(xpath = "(//div[text()='其他']/following-sibling::div//input)[2]")
    private WebElement newStartTimeOther;

    public WebElement getNewStartTimeOther() { return newStartTimeOther; }

    @FindBy(xpath = "(//div[text()='其他']/following-sibling::div//input)[3]")
    private WebElement newEndTimeOther;

    public WebElement getNewEndTimeOther() { return newEndTimeOther; }

    @FindBy(xpath = "//p[text()='展示名称不能为空']")
    private WebElement noNameWarn;

    public WebElement getNoNameWarn() { return noNameWarn; }

    @FindBy(xpath = "//p[text()='开始时间不能为空']")
    private WebElement noStartTimeWarn;

    public WebElement getNoStartTimeWarn() { return noStartTimeWarn; }

    @FindBy(xpath = "//p[text()='结束时间不能为空']")
    private WebElement noEndTimeWarn;

    public WebElement getNoEndTimeWarn() { return noEndTimeWarn; }

    @FindBy(xpath = "//p[text()='请先完成编辑或新增操作']")
    private WebElement createConflictWarn;

    public WebElement getCreateConflictWarn() { return createConflictWarn; }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement ensureButton;

    public WebElement getEnsureButton() { return ensureButton; }

    @FindBy(xpath = "//span[text()='上一个月']/parent::td/following-sibling::td//a[text()='删除']")
    private WebElement deleteRelative;

    public WebElement getDeleteRelative() { return deleteRelative; }

    @FindBy(xpath = "//span[text()='最近10天']/parent::td/following-sibling::td//a[text()='删除']")
    private WebElement deleteRecent;

    public WebElement getDeleteRecent() { return deleteRecent; }

    @FindBy(xpath = "//span[text()='35分钟窗口']/parent::td/following-sibling::td//a[text()='删除']")
    private WebElement deleteActual;

    public WebElement getDeleteActual() { return deleteActual; }

    @FindBy(xpath = "//span[text()='前25个交易日']/parent::td/following-sibling::td//a[text()='删除']")
    private WebElement deleteOther;

    public WebElement getDeleteOther() { return deleteOther; }

}
