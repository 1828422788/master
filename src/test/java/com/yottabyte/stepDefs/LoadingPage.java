package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.ConstructPageFactoryWithName;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.openqa.selenium.WebDriver;

/**
 * 对页面的操作
 * Created by yang.wei on 2017/4/7.
 */
public class LoadingPage {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    private String baseURL = LoginBeforeAllTests.getBaseURL();

    /**
     * 加载新页面，当产生页面跳转时，用于加载新的page用
     *
     * @param pageName 页面名称
     */
    @Then("^I will see the \"([^\"]*)\" page$")
    public void loadNewPage(String pageName) {
        System.out.println("chsfinduml==============================================[5]");

        ConstructPageFactoryWithName c = new ConstructPageFactoryWithName();
        c.constructPageFactoryWithName(pageName);
    }

    /**
     * 打开指定页面  参数由feature提供
     *
     * @param pageName
     */
    @Given("^open the \"([^\"]*)\" page for uri \"([^\"]*)\"$")
    public void openThePageForURI(String pageName, String uri) {
        System.out.println("chsfinduml==============================================[6]");
        webDriver.get(baseURL + uri);
        int times = 0;
        while (!webDriver.getCurrentUrl().contains(uri) && times < 10) {
            webDriver.get(baseURL + uri);
            times++;
        }
        ConstructPageFactoryWithName c = new ConstructPageFactoryWithName();
        c.constructPageFactoryWithName(pageName);
    }

    /**
     * 打开某页面，且不需要指定URI
     *
     * @param pageName
     */
    @Given("^open the \"([^\"]*)\" page$")
    public void openThePage(String pageName) {
        webDriver.get(baseURL);
        ConstructPageFactoryWithName c = new ConstructPageFactoryWithName();
        c.constructPageFactoryWithName(pageName);
    }
}
