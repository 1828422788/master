package com.yottabyte.pages.ingestPriority;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends EditorPage {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getEnsureButton() {
        return super.getYottaButtonByText("确定");
    }
    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getSearchInput() {
        return SearchInput;
    }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement SearchInput;

    public WebElement getSearch() {
        return Search;
    }

    @FindBy(xpath = "//span[@class='yotta-input-suffix']")
    private WebElement Search;
}
