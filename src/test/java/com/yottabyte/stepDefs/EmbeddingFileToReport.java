package com.yottabyte.stepDefs;

import com.yottabyte.utils.EmbeddingFile;
import com.yottabyte.utils.SFTPUtil;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.Scenario;
import cucumber.api.java.en.Then;

import java.io.*;

/**
 * @author sunxj
 */
public class EmbeddingFileToReport {

    /**
     * 绑定下载过的文本类型文件至报告中，会到target/download-files下去寻找文件
     *
     * @param fileName 文件名称
     */
    @Then("^I embedding text file \"([^\"]*)\" into report$")
    public void embeddingTextFile(String fileName) {
        InputStream in = EmbeddingFile.getInputStream(fileName);
        Scenario scenario = SharedDriver.getScenario();
        try {
            scenario.embed(EmbeddingFile.readContent(in), "text/plain");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Then("^I download file \"([^\"]*)\" to local$")
    public void downloadFileToLocal(String fileName) {
        FileOutputStream outputStream = null;
        try {
            File file = new File("downloadFile/" + fileName);
            file.createNewFile();
            SFTPUtil util = new SFTPUtil();
            byte[] bytes = util.download("target/download-files/", fileName);
            outputStream = new FileOutputStream(file);
            outputStream.write(bytes);
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
