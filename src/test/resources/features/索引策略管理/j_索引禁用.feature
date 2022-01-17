@indexSetting @indexSettingSmoke
Feature: 索引信息禁用（RZY-1475）

  Scenario: 禁用索引
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'indexerror'}" then i click the "停止入库" button in more menu
    And I will see the element "Helpmessage" name is "停止入库成功"

  Scenario: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "testda"
    And I set the parameter "Tag" with value "testda"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 验证索引是否成功禁用
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index=indexerror * AND appname:testda"
    And I wait for "2000" millsecond
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for "2000" millsecond
    And I wait for element "EventNumbers" change text to "事件(0)"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "appname:testda"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for "2000" millsecond
    And I wait for element "EventNumbers" change text to "事件(10)"

  Scenario: 启用索引
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'indexerror'}" then i click the "启用入库" button in more menu
    And I will see the element "Helpmessage" name is "启用入库成功"

  Scenario: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "testda"
    And I set the parameter "Tag" with value "testda"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 验证索引是否成功启用
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index=indexerror * AND appname:testda"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for "2000" millsecond
    And I wait for element "EventNumbers" change text to "事件(10)"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "appname:testda"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for "2000" millsecond
    And I wait for element "EventNumbers" change text to "事件(10)"


