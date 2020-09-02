@indexSetting @indexSettingSmoke
Feature: 索引信息禁用（RZY-1475）

  Scenario: 禁用索引
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    Then the data name is "{'column':'0','name':'indexerror'}" then i click the "停止入库" button
    Then I will see the success message "停止入库成功"

  Scenario: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "testdisable"
    And I set the parameter "Tag" with value "testdisable"
    And I upload a file with name "/src/test/resources/testdata/log/json_sdyd_41.log"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 验证索引是否成功禁用
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index=indexerror * AND appname:testdisable"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "NoResult" name is "查询无结果。"

  Scenario: 启用索引
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    Then the data name is "{'column':'0','name':'indexerror'}" then i click the "启用入库" button
    Then I will see the success message "启用入库成功"

  Scenario: 上传
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "testdisable"
    And I set the parameter "Tag" with value "testdisable"
    And I upload a file with name "/src/test/resources/testdata/log/json_sdyd_41.log"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 查看索引启用是否成功
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index=indexerror * AND appname:testdisable"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"


