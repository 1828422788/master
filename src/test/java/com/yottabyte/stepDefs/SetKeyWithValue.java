package com.yottabyte.stepDefs;

import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.When;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;


public class SetKeyWithValue {
    /**
     * 为指定变量elementName赋值 elementName需要与page中的getElement方法名一致，可以省略get
     * @param elementName 元素名称
     * @param value 输入的值
     */
    @When("^I set the parameter \"([^\"]*)\" with value \"([^割]*)\"$")
    public void iSetTheParameterWithValue1(String  elementName, String value){
        boolean flag = true;
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        while (flag){
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            element.click();
            element.sendKeys(Keys.CONTROL + "a");
            element.sendKeys(Keys.BACK_SPACE);
            if (element.getText().equalsIgnoreCase("")){
                flag = false;
            }
        }
        element.sendKeys(value);
    }
}
