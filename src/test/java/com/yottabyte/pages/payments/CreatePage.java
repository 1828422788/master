package com.yottabyte.pages.payments;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-message-box__message")
    private WebElement successMessage;

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getPaymentsName() {
        return super.getInputElement("受益人名称");
    }

    public WebElement getDescribe() {
        return super.getInputElement("描述");
    }

    public WebElement getAppName() {
        return dropdownUtils.getDropdownListByLabel("Appname");
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getEditButton() {
        return super.getButton("更新");
    }
}
