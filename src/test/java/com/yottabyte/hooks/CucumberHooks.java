/**
 * @author ouyang kui
 */
package com.yottabyte.hooks;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import org.junit.Assume;

public class CucumberHooks {
    /**
     * 使用方法参考 https://jira.rizhiyi.com:8443/confluence/pages/viewpage.action?pageId=449839108
     */
    private static boolean skipFlag = false;

    @Before
    public void beforeSkipCount() {
        System.out.println("before skip count");
        if(skipFlag)
            Assume.assumeTrue(false);
    }

    @After
    public void afterSkipCount(Scenario scen) {
        System.out.println("after skip count");
        if(scen.getSourceTagNames().contains("@SkipCheck") && scen.isFailed())
            skipFlag = true;
    }
}
