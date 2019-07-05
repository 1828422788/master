package com.yottabyte.pages.localUpload;

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

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getTag() {
        return super.getInputElement("Tag");
    }

    public WebElement getAppName() {
        return super.getInputElement("Appname");
    }

    public WebElement getUploadButton() {
        return super.getButton("上传");
    }
}
