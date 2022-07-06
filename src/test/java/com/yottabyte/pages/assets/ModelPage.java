package com.yottabyte.pages.assets;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class ModelPage extends EditorPage {

    public ModelPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAddSquare(){
        return super.getButtonByClassName("yotta-icon yotta-icon-AddSquare");
    }

    //鼠标移动到"+"上时的气泡
    public WebElement getTooltip(){return super.getTooltip();}

    public WebElement getInput(){
        return super.getInputByPlaceholder("请输入");
    }

    public WebElement getGroupList(){
        return dropdownUtils.getDownListByText("请选择");
    }

    //页面左上角的记录数
    public WebElement getRecordNumber() {
        return super.getButtonByClassName("yotta-pageheader-subtitle");
    }

    public WebElement getFieldTypeList(){
        return dropdownUtils.getDropdownListbyPath("//div[@name='type']/div");
    }

    public WebElement getFieldGroupList(){
        return dropdownUtils.getDropdownListbyPath("//div[@name='group_id']/div");
    }

    public WebElement getInputForName(){
        return getInputByName("name");
    }

    public WebElement getInputForIdentifier(){
        return getInputByName("identifier");
    }

    //选择图标页面的确定按钮
    public WebElement getConfirmButtonInChoseIcon(){return super.getButtonsByText("确定").get(1);}

    //选择图标页面的取消按钮
    public WebElement getCancelButtonInChoseIcon(){return super.getButtonsByText("取消").get(1);}

    //模型详情页面的模型关联按钮
    public WebElement getModelContactButton(){return super.findElementByXpath("//div[@role='tab' and contains(text(),'模型关联')]");}

    //模型详情页面的字段分组按钮
    public WebElement getFieldGroupButton(){return super.findElementByXpath("//div[@role='tab' and contains(text(),'字段分组')]");}

    public WebElement getSwitchSlider(){return super.getButtonByClassName("yotta-switch-slider");}

    public WebElement getModelContactDeleteButton(){return super.findElementByXpath("//span[@aria-label='Delete' and @tabindex='-1']");}

}
