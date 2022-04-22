@trend @acceleration @accelerationDelete
Feature: 趋势图加速_6删除加速任务

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible

  @trendSmoke @accelerationSmoke
  Scenario: 创建趋势图
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count() by appname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "3000" millsecond
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "趋势图-1"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible

  @trendSmoke @accelerationSmoke
  Scenario: 趋势图加速
    When I set the parameter "SearchInput" with value "趋势图-1"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'趋势图-1'}" then i click the "趋势图加速" button in more menu
    And I switch the "AccelerationSwitch" button to "enable"
    And I choose the "1 天" from the "TimeRange"
    Then I click the "EnsureButton" button
    And I will see the success message contains "开启加速成功"

  Scenario: 取消删除加速任务
    And I click the "AccelerationManagement" button
    Then I will see the "trend.AccelerationPage" page
    And I wait for loading invisible
    And I open the acceleration task which contains the "趋势图-1" trend
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "暂没有资源访问过此加速"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Delete" button
    Then I will see the message contains "确定要删除["
    And I will see the message contains "]?"
    When I click the "Cancel" button

  @trendSmoke @accelerationSmoke
  Scenario: 删除加速任务_管理页面
    And I click the "AccelerationManagement" button
    Then I will see the "trend.AccelerationPage" page
    And I wait for loading invisible
    When the acceleration task contains the "趋势图-1" trend then i click the "删除" button
    Then I will see the message contains "确定要删除["
    And I will see the message contains "]?"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除加速成功"

  Scenario: 删除趋势图
    When I set the parameter "SearchInput" with value "趋势图-1"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'趋势图-1'}" then i click the "趋势图加速" button in more menu
    And I wait for "AccelerationSwitch" will be visible
    And I will see the text "加速时间范围" is not existed in page

  Scenario: 删除趋势图
    When I set the parameter "SearchInput" with value "趋势图-1"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'趋势图-1'}" then i click the "删除" button in more menu
    Then I will see the message "确认删除 [趋势图-1] ?"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"