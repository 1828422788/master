@event @eventSmoke
Feature: 事件操作应用条件

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
