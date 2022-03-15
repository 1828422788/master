package com.yottabyte.pages.autoProps;

/**
 * @author L.N
 * @creat 2022-02-14-下午2:43
 */
import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAddButton(){
        return super.getYottaButton("fieldconfigs-create-button");
    }

    public WebElement getEnsure(){
        return super.getButton("保存并配置");
    }

    public WebElement getHelpMessage(){
        return super.getButton("请不要选择重复的应用");
    }

    public WebElement getAppName(){
        return dropdownUtils.getDropdownListbyPath("//label[text()='影响应用']//ancestor::div[2]//div[contains(@class,'yotta-select-selection-content')]");
    }

}
