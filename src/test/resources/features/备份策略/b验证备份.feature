@backup  @backupSmoke
Feature: 备份数据验证

  Background:
    Given open the "backup.ListPage" page for uri "/backup/"

  Scenario Outline: 上传要备份的数据
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<name>"
    And I set the parameter "Tag" with value "<name>"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      |  name       |
      |  testln        |
      |  testbackup    |
      |  lnn           |

  Scenario Outline: 建立非yotta索引数据
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible
    And switch to another window
    And I close all tabs except main tab
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "小时" from the "DivideTimeDropDown"
    And I set the parameter "DivideNumber" with value "1"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"
    Examples: 新建成功
      | name      | desc                              | savedTime | divideTime |
      | testnyt   | 为测试非yotta索引恢复情况           | 1         | 12         |

  Scenario: 新建非yotta索引路由
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I wait for "2000" millsecond
    When I choose the "testnyt" from the "IndexName"
    And I wait for "Desc" will be visible
    And I set the parameter "Desc" with value "为测试非yotta索引恢复情况"
    And I set the parameter "Tag" with value "testnyt"
    And I set the parameter "AppName" with value "testnyt"
    And I click the "CreateButton" button
    And I wait for "1000" millsecond
    And I will see the success message "保存成功"

  Scenario: 上传非yotta索引数据
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "testnyt"
    And I set the parameter "Tag" with value "testnyt"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    And I wait for "1000" millsecond
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 验证数据列表
    And I click the "DataList" button
    And I wait for element "DataListNum" change text to "数据列表(4)"


  Scenario: 恢复数据列表
    When I click the "DataList" button
    And I wait for element "DataListNum" change text to "数据列表(4)"
    And I click the "Restore" button
    And I wait for "Dialog" will be visible
    And I click the "LogEnsure" button

  Scenario: 验证备份恢复数据
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index:ops-yotta-*-restored"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for element "EventNumbers" change text to "事件(10)"

  Scenario: 验证非yotta索引的数据
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index=testnyt * AND appname:testnyt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for element "EventNumbers" change text to "事件(10)"

  Scenario: 恢复非yotta数据
    When I click the "DataList" button
    And I wait for element "DataListNum" change text to "数据列表(4)"
    And I click the "Restore1" button
    And I wait for "Dialog" will be visible
    And I click the "LogEnsure" button

  Scenario: 验证非yotta备份恢复数据
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "index:ops-yotta-*-restored"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for element "EventNumbers" change text to "事件(20)"