package com.yottabyte.stepDefs;

import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;

public class RunAFunction {
    @And("^I add a \"([^\"]*)\" with parameter \"([^\"]*)\"$")
    public void iAddAWithParamter(String functionName, String parameters){
        JsonStringPaser paser = new JsonStringPaser();
        Object pars[] = paser.jsonParser(parameters);
        GetElementFromPage.getWebElementWithoutGet(functionName,pars);
    }

    public static void main(String args[]){
        JsonStringPaser paser = new JsonStringPaser();
        String s = "\\{\\{ alert.name \\}\\}|\\{\\{ alert.strategy.trigger.start_time|date\\:\\'Y-m-d H\\:i\\:s\\' \\}\\}|\\{\\{ alert.strategy.trigger.end_time|date:\\'Y-m-d H\\:i\\:s\\' \\}\\}|\\{\\{ alert.search.query \\}\\}";
        String parameters = "{'address':'alltest.rizhiyi.com:514','protocol':['UDP'],'level':['INFO'],'facility':'local0','condision':[''],'content':'{{ alert.name }}|{{ alert.strategy.trigger.start_time|date:\"Y-m-d H:i:s\" }}|{{ alert.strategy.trigger.end_time|date:\"Y-m-d H:i:s\" }}|{{ alert.search.query }}'}";
        Object pars[] = paser.jsonParser(parameters);
        for (Object o:pars){
            System.out.println(o.toString());
        }
    }

    @Given("^I run a method \"([^\"]*)\" for \"([^\"]*)\" times with parameters \"([^\"]*)\"$")
    public void iRunAMethodForTimes(String methodName, int numbers, String parameters) {
        JsonStringPaser paser = new JsonStringPaser();
        Object pars[] = paser.jsonParser(parameters);
        for (int i=0;i<numbers;i++) {
            GetElementFromPage.getWebElementWithName(methodName, pars);
        }
    }
}
