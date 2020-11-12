@event @eventSmoke
Feature: 事件操作应用条件

  Scenario: 新建字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for "Create" will be visible
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "1511255129001, bob, hank, query2, 111"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<a>.*)(?<num>\d{3})"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "EventTest"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "eventTest"
    And I set the parameter "Tag" with value "eventTest"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

  @test
  Scenario: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "eventTest"
    And I set the parameter "Tag" with value "eventTest"
    And I upload a file with name "/src/test/resources/testdata/log/autotest.csv"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 新建事件操作
    Given open the "event.ListPage" page for uri "/event/action/"
    When I click the "Create" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "测试应用条件"
    And I set the parameter "ConditionField" with value "appname"
    And I choose the "匹配正则" from the "SelectCondition"
    And I set the parameter "conditionValue" with value "online"
    And I set the parameter "Url" with value "/dashboard/"
    Then I click the "CreateButton" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  Scenario: 验证匹配正则生效
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成"
    When I set the parameter "SearchInput" with value "appname:online"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I wait for "EventOperate" will be visible
    And I click the "EventOperate" button
    Then I wait for "Condition" will be visible

  Scenario: 验证匹配正则生效
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成"
    When I set the parameter "SearchInput" with value "appname:esb"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I wait for "EventOperate" will be visible
    And I click the "EventOperate" button
    Then I will see the "Condition" doesn't exist

