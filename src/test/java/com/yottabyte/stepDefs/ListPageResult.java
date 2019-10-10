package com.yottabyte.stepDefs;

import com.yottabyte.utils.ListPageUtils;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.WebElement;

/**
 * 验证列表页下的结果是否符合预期
 *
 * @author sunxj
 */
public class ListPageResult {
    ListPageUtils listPageUtils = new ListPageUtils();

    /**
     * 验证搜索列表包含某一字段
     *
     * @param searchResult 格式：{'column':'列数-1','name':'关键字名称'}
     */
    @Then("^I will see the search result contains \"([^\"]*)\"$")
    public void validateSearchResultContainsValue(String searchResult) {
        WebElement tr = listPageUtils.getTr(searchResult);
        Assert.assertNotNull("列表下不包含该字段！", tr);
    }
}
