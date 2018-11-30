package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.EmbeddingFile;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class DownLoadFiles {

    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 点击列表页第一行第一列的链接进行下载
     */
    @Then("^I download the file$")
    public void downLoadFiles() {
        WebElement table = webDriver.findElement(By.className("el-table__body"));
        try {
            WebElement element = webDriver.findElement(By.xpath("(//span[contains(text(),'下载')])[last()]"));
            element.click();
            WebElement fileElement = element.findElement(By.xpath(".//ancestor::td/preceding-sibling::td[@class='el-table_1_column_1']"));
            EmbeddingFile.embeddingPdfToscenario(fileElement.getText());
        } catch (NoSuchElementException e) {
            return;
        }
    }
}
