package com.yottabyte.pages.searchMacro;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "(//span[contains(text(),'确定')])[last()]")
    private WebElement ensureDelete;

    public WebElement getEnsureDelete() {
        return ensureDelete;
    }

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getGroup() {
        return super.getDropdownList("分组");
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getMessage() {
        return super.getErrorMessage();
    }

    public WebElement getDisabledLi() {
        return super.getDisabledLi();
    }

}
