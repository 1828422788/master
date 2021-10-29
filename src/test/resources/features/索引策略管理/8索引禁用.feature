@indexSetting @indexSettingSmoke
Feature: 索引信息禁用（RZY-1475）

  Scenario: 禁用索引
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'indexerror'}" then i click the "停止入库" button in more menu

  Scenario: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "testdisable"
    And I set the parameter "Tag" with value "testdisable"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 验证索引是否成功禁用
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index=indexerror * AND appname:testdisable"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I will see the element "NoResult" name is "搜索无数据"
#    And I wait for "2000" millsecond

  Scenario: 启用索引
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'indexerror'}" then i click the "启动入库" button in more menu

  Scenario: 上传
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "testdisable"
    And I set the parameter "Tag" with value "testdisable"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 查看索引启用是否成功
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index=indexerror * AND appname:testdisable"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "5000" millsecond


