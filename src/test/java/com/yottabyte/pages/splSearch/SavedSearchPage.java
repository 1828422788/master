package com.yottabyte.pages.splSearch;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class SavedSearchPage extends ListPageFactory {
    public SavedSearchPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[text()='全部资源']/preceding-sibling::i")
    private WebElement groupList;

    @FindBy(xpath = "(//*[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]")
    private WebElement dropdownMenu;

    @FindBy(xpath = "//label[contains(text(),'分组')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement changeGroup;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//tr/td/span[@class='yotta-icon yotta-icon-StarFilled -a7jW7PsHfBciH91EH6mc _1Q8PROrCT52i-ZiD2NEVOL']")
    private WebElement star;

    public WebElement getStar() {
        return star;
    }

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='标签']")
    private WebElement label;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='授权']")
    private WebElement auth;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='删除']")
    private WebElement delete;

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getLabel() { return label;}

    public WebElement getAuth() {
        return auth;
    }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//span[@class='yotta-select-selection-placeholder']")
    private WebElement tagToInput;

    public WebElement getTagToInput() {
        return tagToInput;
    }

    @FindBy(xpath = "//div[@class='el-message-box__btns']//span[contains(text(),'确定')]")
//    @FindBy(xpath = "//span[contains(text(),'确定')]/parent::button")
    private WebElement ensureDelete;

    public WebElement getEnsureDelete() {
        return ensureDelete;
    }

    public WebElement getChangeGroup() {
        changeGroup.click();
        return dropdownList.get(dropdownList.size() - 1);
    }

    public WebElement getGroupList() {
        groupList.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(dropdownMenu));
        return dropdownMenu;
    }

    public WebElement getSearchInput() {
        return super.getSearchInput();
    }

    public WebElement getSearchIcon() {
        return super.getSearchIcon();
    }
}
