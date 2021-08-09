package com.yottabyte.pages.fulllink;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1920, 1080));
    }

    @FindBy(xpath = "//div[contains(@class,'yotta-select-option')]")
    private WebElement li;

    @FindBy(xpath = "//label[contains(@class,yotta-switch-round)]")
    private WebElement switchEdit;

    public WebElement getSwitch() {
        return switchEdit;
    }

    @FindBy(xpath = "//span[text()='保存']/parent::button[contains(@class,'disabled')]")
    private WebElement disabledSave;

    public WebElement getDisabledSave() {
        return disabledSave;
    }

    @FindBy(xpath = "//div[@class='yotta-dropdown-menu']//ul")
    private WebElement dropdownList;

    @FindBy(xpath = "//span[@aria-label='SettingOutlined']/parent::button")
    private WebElement settings;

    public WebElement getSettings() {
        settings.click();
        return dropdownList;
    }

    @FindBy(xpath = "//span[@aria-label='GalaxeeOutlined']/parent::button")
    private WebElement dataConfig;

    public WebElement getDataConfig() {
        return dataConfig;
    }

    @FindBy(xpath = "//span[@aria-label='AddOutlined']/parent::button")
    private WebElement addInputItem;

    public WebElement getAddInputItem() {
        return addInputItem;
    }

    @FindBy(xpath = "//span[@aria-label='FilterOutlined']/parent::button")
    private WebElement filter;

    public WebElement getFilter() {
        return filter;
    }

    @FindBy(xpath = "//div[contains(@class,'yotta-textarea')]//textarea")
    private WebElement timelineSPL;

    public WebElement getTimelineSPL() {
        return timelineSPL;
    }

    public WebElement getSave() {
        return getYottaButtonByText("保存");
    }

    public WebElement getEnsure() {
        return getYottaButtonByText("确定");
    }

    public WebElement getCancel() {
        return getYottaButtonByText("取消");
    }

    public WebElement getUpdate() {
        return getYottaButtonByText("更新");
    }

    public WebElement getSearch() {
        return getYottaButtonByText("搜索");
    }

    public WebElement getRequestData() {
        return getYottaButtonByText("请求数据");
    }

    public WebElement getPreview() {
        return getYottaButtonByText("预览该链路图");
    }

    public WebElement getRender() {
        return getYottaButtonByText("重新渲染");
    }

    public WebElement getFieldName() {
        return getInputElement("名称关联字段");
    }

    public WebElement getTimestamp() {
        return getInputElement("时间戳关联字段");
    }

    public WebElement getStartField() {
        return getInputElement("边起始关联字段");
    }

    public WebElement getEndField() {
        return getInputElement("边结束关联字段");
    }

    public WebElement getNameSeparator() {
        return getInputElement("名称分割符");
    }

    public WebElement getLayerNumber() {
        return getInputElement("名称分割层数");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//div[text()='" + name + "']/following-sibling::div//input"));
    }

    public WebElement getToken() {
        return getYottaInput("fulllink_param-template-标识：-input");
    }

    public WebElement getTitle() {
        return getYottaInput("fulllink_param-template-标题：-input");
    }

    public WebElement getDynamicField() {
        return getYottaInput("fulllink_param-template-动态字段：-input");
    }

    @FindBy(xpath = "//button[@yotta-test='fulllink_param-dynamic-search-button']/following-sibling::div")
    private WebElement searchResultMessage;
    public WebElement getSearchResultMessage(){
        return searchResultMessage;
    }

    @FindBy(xpath = "//div[contains(@class,'yotta-select-menu')]")
    private WebElement dropdownListType;

    @FindBy(xpath = "//div[@yotta-test='fulllink_param-type-select']//span[@class='yotta-select-selection-icon']")
    private WebElement parameterType;
    public WebElement getParameterType() {
        parameterType.click();
        parameterType.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(dropdownListType));
        return dropdownListType;
    }

    @FindBy(xpath = "(//div[@class='_1QKcLCq5ljwLNAWWQDBSOB'])[1]//div[text()]")
    private WebElement firstInput;
    public WebElement getFirstInput() {
        return firstInput;
    }

    @FindBy(xpath = "(//div[@class='_1QKcLCq5ljwLNAWWQDBSOB'])[1]//div[@yotta-test='fulllink_param-list-item-edit-dom']")
    private WebElement firstInputEdit;
    public WebElement getFirstInputEdit() {
        return firstInputEdit;
    }

    @FindBy(xpath = "(//div[@class='_1QKcLCq5ljwLNAWWQDBSOB'])[1]//div[@yotta-test='fulllink_param-list-item-delete-dom']")
    private WebElement firstInputDelete;
    public WebElement getFirstInputDelete() {
        return firstInputDelete;
    }

    @FindBy(xpath = "(//div[@class='_1QKcLCq5ljwLNAWWQDBSOB'])[1]//div[@yotta-test='fulllink_param-item-select']")
    private WebElement firstInputList;
    public WebElement getFirstInputList() {
        firstInputList.click();
        return dropdownListType;
    }

    @FindBy(xpath = "(//div[@class='h5_2m6UeENBHGdeqIoE9r'])[1]")
    private WebElement numLabel_1;
    public WebElement getNumLabel_1() {
        return numLabel_1;
    }

    @FindBy(xpath = "(//div[@class='h5_2m6UeENBHGdeqIoE9r'])[2]")
    private WebElement numLabel_2;
    public WebElement getNumLabel_2() {
        return numLabel_2;
    }

    @FindBy(xpath = "(//div[@class='h5_2m6UeENBHGdeqIoE9r'])[3]")
    private WebElement numLabel_3;
    public WebElement getNumLabel_3() {
        return numLabel_3;
    }

    @FindBy(xpath = "//div[text()='高']/following-sibling::div/span[text()='min']/following-sibling::div//input")
    private WebElement high_Min;
    public WebElement getHigh_Min() {
        return high_Min;
    }

    @FindBy(xpath = "//div[text()='高']/following-sibling::div/span[text()='max']/following-sibling::div//input")
    private WebElement high_Max;
    public WebElement getHigh_Max() {
        return high_Max;
    }

    @FindBy(xpath = "//div[text()='中']/following-sibling::div/span[text()='min']/following-sibling::div//input")
    private WebElement medium_Min;
    public WebElement getMedium_Min() {
        return medium_Min;
    }

    @FindBy(xpath = "//div[text()='中']/following-sibling::div/span[text()='max']/following-sibling::div//input")
    private WebElement medium_Max;
    public WebElement getMedium_Max() {
        return medium_Max;
    }

    @FindBy(xpath = "(//div[@role='tab'])[1]")
    private WebElement tab;
    public WebElement getTab() {
        return tab;
    }

    public WebElement getValue() {
        return getYottaInput("fulllink_param-create-option-value-input");
    }

    public WebElement getLabel() {
        return getYottaInput("fulllink_param-create-option-label-input");
    }

    public WebElement getAdd() {
        return getYottaDiv("fulllink_param-display-option-add-dom");
    }

    public WebElement getDefaultValue() {
        return getYottaDropdownList("fulllink_param-select-value-select");
    }

    public WebElement getSPL() {
        return getYottaTextarea("fulllink_param-dynamic-query-textarea");
    }

    public WebElement getTable() {
        return getYottaTable("table_chart-list-table");
    }

    @FindBy(xpath = "(//div[@class='_26xWyHOlBU1ujfUt9LqAf7']/span[@aria-label='ClockCircleOutlined']) | (//div[@class='_1g2HQ9D3pUyYExRKkZHI9M']/span[@aria-label='PlusDownOutlined'])")
    private WebElement timeAxis;
    public WebElement getTimeAxis() {
        return timeAxis;
    }

    @FindBy(xpath = "//div[@class='_1g2HQ9D3pUyYExRKkZHI9M']/span[@aria-label='SettingOutlined']")
    private WebElement dateSetting;
    public WebElement getDateSetting() {
        return dateSetting;
    }

    @FindBy(xpath = "//div[text()='播放速度']/following-sibling::div//div[@class='yotta-slider-knob']")
    private WebElement speedHandle;
    public WebElement getSpeedHandle() {
        return speedHandle;
    }

    @FindBy(xpath = "//div[text()='时间范围']/following-sibling::div[contains(@class,'yotta-date-picker')]")
    private WebElement dateEditor;
    public WebElement getDateEditor() {
        return dateEditor;
    }

    @FindBy(xpath = "(//tr//td[contains(@class,'next-month')])[last()]")
    private WebElement lastDate;
    public WebElement getLastDate() {
        return lastDate;
    }

    @FindBy(xpath = "//div[contains(@class,'_1g2HQ9D3pUyYExRKkZHI9M')]//span[@aria-label='SlowPlayCircleOutlined']")
    private WebElement liveBroadcast;
    public WebElement getLiveBroadcast() {
        return liveBroadcast;
    }

    @FindBy(xpath = "//div[contains(@class,'_1g2HQ9D3pUyYExRKkZHI9M')]//span[@aria-label='EditOutlined']")
    private WebElement ignoreException;
    public WebElement getIgnoreException() {
        return ignoreException;
    }

    @FindBy(xpath = "//div[@class='_1g2HQ9D3pUyYExRKkZHI9M']//span[@aria-label='PlayCircleOutlined']")
    private WebElement play;
    public WebElement getPlay() {
        return play;
    }

    @FindBy(xpath = "//canvas")
    private WebElement canvas;
    public WebElement getCanvas() {
        return canvas;
    }

    public WebElement getCanvasElement() {
        WebElement header =  webDriver.findElement(By.xpath("//header//li[1]"));
        float x = header.getLocation().getX();
        float y = header.getLocation().getY();
        Actions action = new Actions(webDriver);
        int i=10;
        boolean isPresent;
        do {
            action.moveByOffset((int) x, (int) y * 3).click().build().perform();
            i--;
            isPresent = webDriver.findElements(By.xpath("//div[contains(@class,'yotta-drawer-right')]")).size()>0;
        }
        while (!isPresent && i!=0);
        return canvas;
    }

    @FindBy(xpath = "//div[contains(@class,'yotta-drawer-right')]")
    private WebElement elementDetails;
    public WebElement getElementDetails() {
        return elementDetails;
    }

    public WebElement getMessage() {
        return getSuccessMessage();
    }

    @FindBy(xpath = "(//div[contains(@class,'_1FmmywLM1qOtExZfMYeqLv')][2]//*[name()='text']//following-sibling::*[name()='rect' and @fill!='#48517d'and @fill!='none'])[1]")
    private WebElement firstTick;
    public WebElement getFirstTick() {
        return firstTick;
    }

    @FindBy(xpath = "(//div[contains(@class,'_1FmmywLM1qOtExZfMYeqLv')][2]//*[name()='text']//following-sibling::*[name()='rect' and @fill!='#48517d'and @fill!='none'])[2]")
    private WebElement secondTick;
    public WebElement getSecondTick() {
        return secondTick;
    }

    @FindBy(xpath = "(//div[contains(@class,'_1FmmywLM1qOtExZfMYeqLv')][2]//*[name()='text']//following-sibling::*[name()='rect' and @fill!='#48517d'and @fill!='none'])[3]")
    private WebElement thirdTick;
    public WebElement getThirdTick() {
        return thirdTick;
    }

    @FindBy(xpath = "(//div[contains(@class,'_1FmmywLM1qOtExZfMYeqLv')][2]//*[name()='text']//following-sibling::*[name()='rect' and @fill!='#48517d'and @fill!='none'])[4]")
    private WebElement forthTick;
    public WebElement getForthTick() {
        return forthTick;
    }

    @FindBy(xpath = "//*[name()='text' and text()='0:00']//following-sibling::*[name()='rect']")
    private WebElement tick0000;
    public WebElement getTick0000() {
        return tick0000;
    }

    @FindBy(xpath = "(//div[text()='节点详情']//following-sibling::div[@class='_3ty-idnSV_yEDshRdCXAKx']//*[name()='rect' and @fill='#E6BA6D'])[last()]")
    private WebElement mediumAlarm;
    public WebElement getMediumAlarm() {
        return mediumAlarm;
    }

    @FindBy(xpath = "(//div[text()='节点详情']//following-sibling::div[@class='_3ty-idnSV_yEDshRdCXAKx']//*[name()='rect' and @fill='#CF675E'])[last()]")
    private WebElement highAlarm;
    public WebElement getHighAlarm() {
        return highAlarm;
    }

    @FindBy(xpath = "//span[text()='次要告警']/preceding-sibling::span//input")
    private WebElement minorAlarm;
    public WebElement getMinorAlarm() {
        return minorAlarm;
    }

    @FindBy(xpath = "//div[text()='节点详情']//following-sibling::div[@class='_3ty-idnSV_yEDshRdCXAKx']//*[@class='vx-linepath']")
    private WebElement alarmLine;
    public WebElement getAlarmLine() {
        return alarmLine;
    }

    @FindBy(xpath = "(//div[text()='节点详情']//following-sibling::div[@class='_3ty-idnSV_yEDshRdCXAKx']//*[@class='vx-linepath']/following-sibling::*//*[name()='circle'])[1]")
    private WebElement alarmLineFirst;
    public WebElement getAlarmLineFirst() {
        return alarmLineFirst;
    }

    @FindBy(xpath = "//div[text()='url']//following-sibling::input")
    private WebElement URL;
    public WebElement getURL() {
        return URL;
    }

    @FindBy(xpath = "//span[text()='新窗口']/preceding-sibling::span//input")
    private WebElement newTab;
    public WebElement getNewTab() {
        return newTab;
    }

    @FindBy(xpath = "//div[@class='_2bB7pFw1Yds7dYqu0W7dJ7']//span[@aria-label='AddOutlined']")
    private WebElement magnify;
    public WebElement getMagnify() {
        for (int i=0; i<15; i++)
            magnify.click();
        return magnify;
    }

    @FindBy(xpath = "")
    private WebElement tooltip;
    public WebElement getTooltip() {
        return tooltip;
    }
}