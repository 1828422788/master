@all @smoke @configs @configsSmoke
Feature: 字段提取规则配置页面优化

  Scenario Outline: 创建规则并关联日志（RZY-1880）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I choose the "Json解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "AddField" button
    And I set the parameter "Key" with value "key"
    And I set the parameter "Value" with value "value"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I click the "NextButton" button
    And open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "Tag" with value "<tag>"
    And I set the parameter "AppName" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/json_sdyd_41.log"
    And I click the "UploadButton" button
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the "OtherValue" result will be "value"

    Examples:
      | appName | tag | splQuery          |
      | 108     | 1   | appname:108 tag:1 |

  Scenario: 验证从搜索页跳转到字段提取（RZY-1881）
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "appname:108 tag:1"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I click the "EventOperate" button
    And I click the "ConfigField" button
    And switch to another window
    Then the page's title will be "字段提取"
    And I will see the "configs.CreatePage" page
    Then I will see the input element "AppName" value will be "108"
    Then I will see the input element "HostName" value will be "192.168.3.2"
    Then I will see the input element "Tag" value will be "1"

  @createEssentialData
  Scenario: 创建一个针对sequence的字段提取规则并上传日志（循序图使用）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTestForTrend"
    And I set the parameter "Logtype" with value "sequence"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "1511255129000, fred, bob, query1, 111"
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I drag the scroll bar to the top
    And I set the parameter "Separate" with value ","
    And I drag the scroll bar to the top
    And I set the parameter "FieldList" with value "time,from,to,relatemsg,msgid"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "seq_test"
    And I set the parameter "Tag" with value "seq_test"
    And I click the "NextButton" button
    And open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "seq_test"
    And I set the parameter "Tag" with value "seq_test"
    And I upload a file with name "/src/test/resources/testdata/log/autotest.csv"
    And I click the "UploadButton" button
