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

    @FindBy(xpath = "//input[contains(@class,'yotta-input-search')]")
    private WebElement searchBox;

    public WebElement getSearchBox() { return searchBox; }

    @FindBy(xpath = "//span[text()='所有时间']")
    private WebElement wholeTimeText;

    public WebElement getWholeTimeText() { return wholeTimeText; }

    @FindBy(xpath = "//*[text()='返回']/parent::button")
    private WebElement backButton;

    public WebElement getBackButton() { return backButton; }

    @FindBy(xpath = "//span[text()='所有时间']/parent::div/following-sibling::div/button")
    private WebElement wholeTimeEdit;

    public WebElement getWholeTimeEdit() { return wholeTimeEdit; }

    @FindBy(xpath = "//*[@yotta-test='system-all_time_label-input']")
    private WebElement wholeTimeNameInput;

    public WebElement getWholeTimeNameInput() { return wholeTimeNameInput; }

    @FindBy(xpath = "//span[text()='保存']")
    private WebElement wholeTimeSave;

    public WebElement getWholeTimeSave() { return wholeTimeSave; }

    @FindBy(xpath = "//span[text()='取消']")
    private WebElement wholeTimeCancel;

    public WebElement getWholeTimeCancel() { return wholeTimeCancel; }

    @FindBy(xpath = "(//h4[text()='相对']/following-sibling::div/span)[2]")
    private WebElement addRelativeTimeShortcut;

    public WebElement getAddRelativeTimeShortcut() { return addRelativeTimeShortcut; }

    @FindBy(xpath = "(//h4[text()='最近']/following-sibling::div/span)[2]")
    private WebElement addRecentTimeShortcut;

    public WebElement getAddRecentTimeShortcut() { return addRecentTimeShortcut; }

    @FindBy(xpath = "(//h4[text()='实时窗口']/following-sibling::div/span)[2]")
    private WebElement addActualTimeShortcut;

    public WebElement getAddActualTimeShortcut() { return addActualTimeShortcut; }

    @FindBy(xpath = "(//h4[text()='其他']/following-sibling::div/span)[2]")
    private WebElement addOtherTimeShortcut;

    public WebElement getAddOtherTimeShortcut() { return addOtherTimeShortcut; }

    @FindBy(xpath = "(//h4[text()='相对']/parent::div/following-sibling::div//input)[1]")
    private WebElement newShowName;

    public WebElement getNewShowName() { return newShowName; }

    @FindBy(xpath = "(//h4[text()='相对']/parent::div/following-sibling::div//input)[2]")
    private WebElement newStartTime;

    public WebElement getNewStartTime() { return newStartTime; }

    @FindBy(xpath = "(//h4[text()='相对']/parent::div/following-sibling::div//input)[3]")
    private WebElement newEndTime;

    public WebElement getNewEndTime() { return newEndTime; }

    @FindBy(xpath = "(//h4[text()='最近']/parent::div/following-sibling::div//input)[1]")
    private WebElement newShowNameRecent;

    public WebElement getNewShowNameRecent() { return newShowNameRecent; }

    @FindBy(xpath = "(//h4[text()='最近']/parent::div/following-sibling::div//input)[2]")
    private WebElement newStartTimeRecent;

    public WebElement getNewStartTimeRecent() { return newStartTimeRecent; }

    @FindBy(xpath = "(//h4[text()='最近']/parent::div/following-sibling::div//input)[3]")
    private WebElement newEndTimeRecent;

    public WebElement getNewEndTimeRecent() { return newEndTimeRecent; }

    @FindBy(xpath = "(//h4[text()='实时窗口']/parent::div/following-sibling::div//input)[1]")
    private WebElement newShowNameActual;

    public WebElement getNewShowNameActual() { return newShowNameActual; }

    @FindBy(xpath = "(//h4[text()='实时窗口']/parent::div/following-sibling::div//input)[2]")
    private WebElement newStartTimeActual;

    public WebElement getNewStartTimeActual() { return newStartTimeActual; }

    @FindBy(xpath = "(//h4[text()='实时窗口']/parent::div/following-sibling::div//input)[3]")
    private WebElement newEndTimeActual;

    public WebElement getNewEndTimeActual() { return newEndTimeActual; }

    @FindBy(xpath = "(//h4[text()='其他']/parent::div/following-sibling::div//input)[1]")
    private WebElement newShowNameOther;

    public WebElement getNewShowNameOther() { return newShowNameOther; }

    @FindBy(xpath = "(//h4[text()='其他']/parent::div/following-sibling::div//input)[2]")
    private WebElement newStartTimeOther;

    public WebElement getNewStartTimeOther() { return newStartTimeOther; }

    @FindBy(xpath = "(//h4[text()='其他']/parent::div/following-sibling::div//input)[3]")
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

    @FindBy(xpath = "//span[text()='上一个月']/parent::div/following-sibling::div//span[text()='删除']")
    private WebElement deleteRelative;

    public WebElement getDeleteRelative() { return deleteRelative; }

    @FindBy(xpath = "//span[text()='最近10天']/parent::div/following-sibling::div//span[text()='删除']")
    private WebElement deleteRecent;

    public WebElement getDeleteRecent() { return deleteRecent; }

    @FindBy(xpath = "//span[text()='35分钟窗口']/parent::div/following-sibling::div//span[text()='删除']")
    private WebElement deleteActual;

    public WebElement getDeleteActual() { return deleteActual; }

    @FindBy(xpath = "//span[text()='前25个交易日']/parent::div/following-sibling::div//span[text()='删除']")
    private WebElement deleteOther;

    public WebElement getDeleteOther() { return deleteOther; }

    @FindBy(className = "yotta-message-content")
    private WebElement errorMessage;

    @Override
    public WebElement getErrorMessage() {
        return errorMessage;
    }

}
